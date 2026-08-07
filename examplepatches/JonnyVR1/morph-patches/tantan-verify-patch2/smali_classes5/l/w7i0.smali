.class public Ll/w7i0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/m8i0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

.field public b:Z

.field public c:Ll/kcg0;

.field public d:J

.field public e:I

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field

.field public g:Landroid/view/View$OnClickListener;

.field public h:Landroid/view/View$OnClickListener;

.field public i:Landroid/view/View$OnClickListener;

.field public j:Landroid/view/View$OnClickListener;

.field public k:Landroid/view/View$OnClickListener;

.field public l:Landroid/view/View$OnClickListener;

.field public m:Landroid/view/View$OnClickListener;

.field public n:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;)V
    .locals 8

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->c()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Ll/w7i0;->b:Z

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 21
    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets_extra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->see_greet_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 27
    .line 28
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 29
    .line 30
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 31
    .line 32
    filled-new-array/range {v0 .. v6}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/w6i0;

    .line 52
    .line 53
    invoke-direct {v1, v0}, Ll/w6i0;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 62
    .line 63
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 64
    .line 65
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 66
    .line 67
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->see_greet_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 68
    .line 69
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->vip_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 70
    .line 71
    sget-object v5, Lcom/p1/mobile/putong/core/data/Privilege;->see_letter_gp:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 72
    .line 73
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 74
    .line 75
    sget-object v7, Lcom/p1/mobile/putong/core/data/Privilege;->compliment:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 76
    .line 77
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    new-instance v1, Ll/w6i0;

    .line 97
    .line 98
    invoke-direct {v1, v0}, Ll/w6i0;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    :goto_0
    iput-object p1, p0, Ll/w7i0;->f:Ljava/util/List;

    .line 106
    .line 107
    new-instance p1, Ll/x6i0;

    .line 108
    .line 109
    invoke-direct {p1, p0}, Ll/x6i0;-><init>(Ll/w7i0;)V

    .line 110
    .line 111
    .line 112
    iput-object p1, p0, Ll/w7i0;->g:Landroid/view/View$OnClickListener;

    .line 113
    .line 114
    new-instance p1, Ll/y6i0;

    .line 115
    .line 116
    invoke-direct {p1, p0}, Ll/y6i0;-><init>(Ll/w7i0;)V

    .line 117
    .line 118
    .line 119
    iput-object p1, p0, Ll/w7i0;->h:Landroid/view/View$OnClickListener;

    .line 120
    .line 121
    new-instance p1, Ll/z6i0;

    .line 122
    .line 123
    invoke-direct {p1, p0}, Ll/z6i0;-><init>(Ll/w7i0;)V

    .line 124
    .line 125
    .line 126
    iput-object p1, p0, Ll/w7i0;->i:Landroid/view/View$OnClickListener;

    .line 127
    .line 128
    new-instance p1, Ll/a7i0;

    .line 129
    .line 130
    invoke-direct {p1, p0}, Ll/a7i0;-><init>(Ll/w7i0;)V

    .line 131
    .line 132
    .line 133
    iput-object p1, p0, Ll/w7i0;->j:Landroid/view/View$OnClickListener;

    .line 134
    .line 135
    new-instance p1, Ll/b7i0;

    .line 136
    .line 137
    invoke-direct {p1, p0}, Ll/b7i0;-><init>(Ll/w7i0;)V

    .line 138
    .line 139
    .line 140
    iput-object p1, p0, Ll/w7i0;->k:Landroid/view/View$OnClickListener;

    .line 141
    .line 142
    new-instance p1, Ll/c7i0;

    .line 143
    .line 144
    invoke-direct {p1, p0}, Ll/c7i0;-><init>(Ll/w7i0;)V

    .line 145
    .line 146
    .line 147
    iput-object p1, p0, Ll/w7i0;->l:Landroid/view/View$OnClickListener;

    .line 148
    .line 149
    new-instance p1, Ll/d7i0;

    .line 150
    .line 151
    invoke-direct {p1, p0}, Ll/d7i0;-><init>(Ll/w7i0;)V

    .line 152
    .line 153
    .line 154
    iput-object p1, p0, Ll/w7i0;->m:Landroid/view/View$OnClickListener;

    .line 155
    .line 156
    new-instance p1, Ll/e7i0;

    .line 157
    .line 158
    invoke-direct {p1, p0}, Ll/e7i0;-><init>(Ll/w7i0;)V

    .line 159
    .line 160
    .line 161
    iput-object p1, p0, Ll/w7i0;->n:Landroid/view/View$OnClickListener;

    .line 162
    .line 163
    iput-object p2, p0, Ll/w7i0;->a:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 164
    .line 165
    return-void
.end method

.method public static synthetic A0(Ll/w7i0;Lcom/p1/mobile/putong/data/PaymentData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->r1(Lcom/p1/mobile/putong/data/PaymentData;)V

    return-void
.end method

.method public static synthetic C0(Ll/w7i0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->V0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic D0(Ll/w7i0;Lcom/p1/mobile/putong/data/PaymentData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->z1(Lcom/p1/mobile/putong/data/PaymentData;)V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic F0(Ll/w7i0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->h1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic G0(Ll/w7i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->v1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)Ljava/lang/Long;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic I0(Ll/w7i0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->m1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic J0(Ll/w7i0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->b1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic L0(Ll/w7i0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->e1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O0(Ll/w7i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->o1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P0(Ll/w7i0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->B1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Q0(Ll/w7i0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->l1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R0(Ll/w7i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->t1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S0(Ll/w7i0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->d1(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic d1(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/m8i0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/m8i0;->f0()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    check-cast p0, Ll/m8i0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/m8i0;->Q()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic e0(Ll/w7i0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->j1(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic e1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8i0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m8i0;->Q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f0(Ll/w7i0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->Y0(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic g0(Ll/w7i0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->c1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/w7i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->u1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Ll/w7i0;Lcom/p1/mobile/putong/core/data/Coin;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->f1(Lcom/p1/mobile/putong/core/data/Coin;)V

    return-void
.end method

.method public static synthetic j0(Ll/w7i0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->s1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/w7i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->x1(Landroid/view/View;)V

    return-void
.end method

.method private synthetic k1(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8i0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m8i0;->e0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l0(Ll/w7i0;Lcom/p1/mobile/putong/core/data/Coin;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->X0(Lcom/p1/mobile/putong/core/data/Coin;)V

    return-void
.end method

.method private synthetic l1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8i0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m8i0;->P()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic m0(Ll/w7i0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->a1(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic n0(Ll/uxj0;)Ljava/lang/Long;
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jan;->K3()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic n1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getH5PageApi()Ll/xwk;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p0}, Ll/xwk;->d(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "e_live_income_button"

    .line 17
    .line 18
    const-string p1, "p_wallet"

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic o0(Ll/w7i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->p1(Landroid/view/View;)V

    return-void
.end method

.method private synthetic o1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getH5PageApi()Ll/xwk;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p0}, Ll/xwk;->c(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "e_bill_record"

    .line 17
    .line 18
    const-string p1, "p_wallet"

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic p0(Ll/w7i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->n1(Landroid/view/View;)V

    return-void
.end method

.method private synthetic p1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getH5PageApi()Ll/xwk;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p0}, Ll/xwk;->a(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "e_live_my_level"

    .line 17
    .line 18
    const-string p1, "p_wallet"

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic q0(Ll/w7i0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->k1(Ll/uxj0;)V

    return-void
.end method

.method private synthetic q1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/w7i0;->a:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Ll/otp0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->X7:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic s0(Ll/w7i0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w7i0;->q1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Ll/w7i0;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->i1(Lcom/google/common/base/Optional;)V

    return-void
.end method

.method private synthetic t1(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T1:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/k;->w3()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Ll/l7i0;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/l7i0;-><init>(Ll/w7i0;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/m7i0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/m7i0;-><init>(Ll/w7i0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic u0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private synthetic u1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getH5PageApi()Ll/xwk;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p1, p0}, Ll/xwk;->b(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic v1(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_bill_red_packet"

    .line 2
    .line 3
    const-string v0, "p_wallet"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/commerce/red_package/index.html?speed=true&_bid=1005143#/red_package"

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/core/api/a;->Z(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "\u7ea2\u5305\u8bb0\u5f55"

    .line 23
    .line 24
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic x0(Ll/w7i0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->g1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic y0(Ll/w7i0;Lcom/p1/mobile/putong/data/IsCurrencyMerchantData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w7i0;->W0(Lcom/p1/mobile/putong/data/IsCurrencyMerchantData;)V

    return-void
.end method

.method public static synthetic z0(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v0, 0xc8

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->Y7:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->X7:I

    .line 13
    .line 14
    :goto_0
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 15
    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/jan;->N3()Lrx/c;

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public final synthetic B1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public C1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lqb;->B5()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/n7i0;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/n7i0;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/o7i0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/o7i0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public D1(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T1:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 11
    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/k;->w3()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/g7i0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/g7i0;-><init>(Ll/w7i0;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/h7i0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/h7i0;-><init>(Ll/w7i0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public E1(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getH5PageApi()Ll/xwk;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0, p1}, Ll/xwk;->e(Landroid/content/Context;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public U0(Z)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/m8i0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/m8i0;->r()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-static {}, Ll/joa;->M3()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    invoke-static {}, Ll/joa;->n4()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    invoke-static {}, Ll/joa;->i4()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {}, Ll/t7a;->g()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/k;->s3()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/k;->t3()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/i7i0;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/i7i0;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {p1, v0, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance v0, Ll/j7i0;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/j7i0;-><init>(Ll/w7i0;)V

    .line 79
    .line 80
    .line 81
    new-instance v1, Ll/k7i0;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/k7i0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Ll/w7i0;->c:Ll/kcg0;

    .line 95
    .line 96
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic V0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/w7i0;->a:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinFrag;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->setHasOptionsMenu(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->ga:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic W0(Lcom/p1/mobile/putong/data/IsCurrencyMerchantData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/m8i0;

    .line 4
    .line 5
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/IsCurrencyMerchantData;->isCoiner:Z

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/m8i0;->c0(Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/m8i0;

    .line 13
    .line 14
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/IsCurrencyMerchantData;->isDiamondCoiner:Z

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/m8i0;->d0(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic X0(Lcom/p1/mobile/putong/core/data/Coin;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/m8i0;

    .line 4
    .line 5
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Coin;->available:J

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/a5i0;->U(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/m8i0;->M(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/m8i0;

    .line 17
    .line 18
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coin;->merchantAvailable:J

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/a5i0;->U(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/m8i0;->L(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic Y0(Ljava/lang/Long;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/m8i0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ll/m8i0;->N(J)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/m8i0;

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/jan;->C3()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    invoke-virtual {p0, v0, v1}, Ll/m8i0;->a0(J)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lqb;->k5()Lrx/c;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/jan;->P3()Lrx/c;

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/lqb;->m5()Lrx/c;

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Co()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Ll/w7i0;->f:Ljava/util/List;

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 62
    .line 63
    invoke-interface {p0, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public a0()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/j6i0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/j6i0;-><init>(Ll/w7i0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/jan;->D3()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/l6i0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/l6i0;-><init>(Ll/w7i0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    new-instance v3, Ll/u6i0;

    .line 41
    .line 42
    invoke-direct {v3, v2}, Ll/u6i0;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/lqb;->x4()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/q6i0;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/q6i0;-><init>(Ll/w7i0;)V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    new-instance v3, Ll/u6i0;

    .line 81
    .line 82
    invoke-direct {v3, v2}, Ll/u6i0;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_0

    .line 101
    .line 102
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/jan;->N3()Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/r6i0;

    .line 115
    .line 116
    invoke-direct {v1}, Ll/r6i0;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/s6i0;

    .line 124
    .line 125
    invoke-direct {v1, p0}, Ll/s6i0;-><init>(Ll/w7i0;)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    new-instance v3, Ll/u6i0;

    .line 140
    .line 141
    invoke-direct {v3, v2}, Ll/u6i0;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v1, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 149
    .line 150
    .line 151
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/jan;->M3()Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    new-instance v1, Ll/t6i0;

    .line 164
    .line 165
    invoke-direct {v1}, Ll/t6i0;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    new-instance v1, Ll/v6i0;

    .line 173
    .line 174
    invoke-direct {v1, p0}, Ll/v6i0;-><init>(Ll/w7i0;)V

    .line 175
    .line 176
    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    new-instance v3, Ll/u6i0;

    .line 189
    .line 190
    invoke-direct {v3, v2}, Ll/u6i0;-><init>(Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;)V

    .line 191
    .line 192
    .line 193
    invoke-static {v1, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 198
    .line 199
    .line 200
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 201
    .line 202
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 203
    .line 204
    invoke-virtual {v0}, Ll/lqb;->v5()Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    new-instance v1, Ll/f7i0;

    .line 213
    .line 214
    invoke-direct {v1, p0}, Ll/f7i0;-><init>(Ll/w7i0;)V

    .line 215
    .line 216
    .line 217
    new-instance v2, Ll/p7i0;

    .line 218
    .line 219
    invoke-direct {v2, p0}, Ll/p7i0;-><init>(Ll/w7i0;)V

    .line 220
    .line 221
    .line 222
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 227
    .line 228
    .line 229
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 230
    .line 231
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 232
    .line 233
    invoke-virtual {v0}, Ll/lqb;->u5()Lrx/c;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    new-instance v1, Ll/q7i0;

    .line 242
    .line 243
    invoke-direct {v1, p0}, Ll/q7i0;-><init>(Ll/w7i0;)V

    .line 244
    .line 245
    .line 246
    new-instance v2, Ll/r7i0;

    .line 247
    .line 248
    invoke-direct {v2, p0}, Ll/r7i0;-><init>(Ll/w7i0;)V

    .line 249
    .line 250
    .line 251
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 256
    .line 257
    .line 258
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 259
    .line 260
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 261
    .line 262
    invoke-virtual {v0}, Ll/lqb;->a5()Lrx/c;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    new-instance v1, Ll/s7i0;

    .line 271
    .line 272
    invoke-direct {v1, p0}, Ll/s7i0;-><init>(Ll/w7i0;)V

    .line 273
    .line 274
    .line 275
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 280
    .line 281
    .line 282
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    new-instance v1, Ll/t7i0;

    .line 287
    .line 288
    invoke-direct {v1}, Ll/t7i0;-><init>()V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    new-instance v1, Ll/u7i0;

    .line 296
    .line 297
    invoke-direct {v1, p0}, Ll/u7i0;-><init>(Ll/w7i0;)V

    .line 298
    .line 299
    .line 300
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 305
    .line 306
    .line 307
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    new-instance v1, Ll/v7i0;

    .line 312
    .line 313
    invoke-direct {v1}, Ll/v7i0;-><init>()V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    new-instance v1, Ll/k6i0;

    .line 321
    .line 322
    invoke-direct {v1, p0}, Ll/k6i0;-><init>(Ll/w7i0;)V

    .line 323
    .line 324
    .line 325
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 330
    .line 331
    .line 332
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    if-eqz v0, :cond_1

    .line 345
    .line 346
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 347
    .line 348
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 349
    .line 350
    invoke-virtual {v0}, Ll/lqb;->E5()Lrx/c;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    new-instance v1, Ll/m6i0;

    .line 359
    .line 360
    invoke-direct {v1, p0}, Ll/m6i0;-><init>(Ll/w7i0;)V

    .line 361
    .line 362
    .line 363
    new-instance v2, Ll/n6i0;

    .line 364
    .line 365
    invoke-direct {v2, p0}, Ll/n6i0;-><init>(Ll/w7i0;)V

    .line 366
    .line 367
    .line 368
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 373
    .line 374
    .line 375
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    invoke-interface {v0}, Ll/hbs;->b()Z

    .line 384
    .line 385
    .line 386
    move-result v0

    .line 387
    if-eqz v0, :cond_2

    .line 388
    .line 389
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 390
    .line 391
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 392
    .line 393
    invoke-virtual {v0}, Ll/lqb;->w5()Lrx/c;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    new-instance v1, Ll/o6i0;

    .line 402
    .line 403
    invoke-direct {v1, p0}, Ll/o6i0;-><init>(Ll/w7i0;)V

    .line 404
    .line 405
    .line 406
    new-instance v2, Ll/p6i0;

    .line 407
    .line 408
    invoke-direct {v2, p0}, Ll/p6i0;-><init>(Ll/w7i0;)V

    .line 409
    .line 410
    .line 411
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 412
    .line 413
    .line 414
    move-result-object p0

    .line 415
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 416
    .line 417
    .line 418
    :cond_2
    return-void
.end method

.method public final synthetic a1(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8i0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0, v0, v1}, Ll/m8i0;->N(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic b1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/w7i0;->e:I

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/m8i0;

    .line 14
    .line 15
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {p0, p1}, Ll/m8i0;->h0(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic c1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8i0;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/m8i0;->h0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w7i0;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f1(Lcom/p1/mobile/putong/core/data/Coin;)V
    .locals 3

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coin;->available:J

    .line 2
    .line 3
    iput-wide v0, p0, Ll/w7i0;->d:J

    .line 4
    .line 5
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v2, Ll/m8i0;

    .line 8
    .line 9
    invoke-virtual {v2, v0, v1}, Ll/m8i0;->b0(J)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/m8i0;

    .line 15
    .line 16
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coin;->available:J

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/a5i0;->U(J)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/m8i0;->M(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic g1(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/w7i0;->f:Ljava/util/List;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/a5i0;->W()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-lez p1, :cond_0

    .line 18
    .line 19
    move p1, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p1, v0

    .line 22
    :goto_0
    invoke-static {v1, p1}, Ll/a5i0;->P1(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p1, p0, Ll/w7i0;->f:Ljava/util/List;

    .line 26
    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    invoke-static {}, Ll/a5i0;->x0()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-lez p1, :cond_2

    .line 40
    .line 41
    move p1, v1

    .line 42
    goto :goto_1

    .line 43
    :cond_2
    move p1, v0

    .line 44
    :goto_1
    const/4 v2, 0x2

    .line 45
    invoke-static {v2, p1}, Ll/a5i0;->P1(IZ)V

    .line 46
    .line 47
    .line 48
    :cond_3
    iget-object p1, p0, Ll/w7i0;->f:Ljava/util/List;

    .line 49
    .line 50
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets_extra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 51
    .line 52
    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_5

    .line 57
    .line 58
    invoke-static {}, Ll/a5i0;->s0()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-lez p1, :cond_4

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_4
    move v1, v0

    .line 66
    :goto_2
    const/4 p1, 0x3

    .line 67
    invoke-static {p1, v1}, Ll/a5i0;->P1(IZ)V

    .line 68
    .line 69
    .line 70
    :cond_5
    iget-object p0, p0, Ll/w7i0;->f:Ljava/util/List;

    .line 71
    .line 72
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 73
    .line 74
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    const-string p1, "p_wallet"

    .line 79
    .line 80
    if-eqz p0, :cond_6

    .line 81
    .line 82
    const-string p0, "e_wallet_instantmatch_btn"

    .line 83
    .line 84
    new-array v0, v0, [Ll/sfj0$a;

    .line 85
    .line 86
    invoke-static {p0, p1, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 87
    .line 88
    .line 89
    :cond_6
    const-string p0, "module"

    .line 90
    .line 91
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    filled-new-array {p0}, [Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string v0, "e_recharge"

    .line 100
    .line 101
    invoke-static {v0, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final synthetic h1(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/lqb;->k5()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/jan;->P3()Lrx/c;

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Ll/w7i0;->c:Ll/kcg0;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/m8i0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/m8i0;->Y()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final synthetic i1(Lcom/google/common/base/Optional;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/WalletAccount;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WalletAccount;->balance:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/WalletAccount;->balance:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    cmpl-double v0, v0, v2

    .line 30
    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p0, Ll/m8i0;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/WalletAccount;->balance:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/m8i0;->g0(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast p0, Ll/m8i0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/m8i0;->R()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p0, Ll/m8i0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/m8i0;->R()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic j1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8i0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m8i0;->R()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8i0;

    .line 4
    .line 5
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/H5MerchandiseData;

    .line 8
    .line 9
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Ll/m8i0;->S(Lcom/p1/mobile/putong/core/data/H5MerchandiseData;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic r1(Lcom/p1/mobile/putong/data/PaymentData;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentData;->getCOutName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "wallet"

    .line 13
    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/data/PaymentData;->isCanUse(Ljava/lang/String;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/core/api/k;->z3(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentData;->getCodaName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/data/PaymentData;->isCanUse(Ljava/lang/String;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v0, 0x0

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/core/api/k;->z3(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    new-instance p1, Ll/fe5$e;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-direct {p1, p0}, Ll/fe5$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 66
    .line 67
    invoke-static {p0}, Ll/wci0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Ll/fe5$e;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/fe5$e;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0, v0}, Ll/fe5$e;->c(I)Ll/fe5$e;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string p1, "p_wallet,charge"

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ll/fe5$e;->d(Ljava/lang/String;)Ll/fe5$e;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/fe5$e;->l()Ll/fe5;

    .line 86
    .line 87
    .line 88
    const-string p0, "module"

    .line 89
    .line 90
    const-string p1, "p_wallet"

    .line 91
    .line 92
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    filled-new-array {p0}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string v0, "e_recharge"

    .line 101
    .line 102
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final synthetic s1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic x1(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Hk(Lcom/p1/mobile/android/app/Act;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/data/PaymentData;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentData;->getCodaName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "wallet"

    .line 13
    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/data/PaymentData;->isCanUse(Ljava/lang/String;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/core/api/k;->z3(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PaymentData;->getCodaName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/data/PaymentData;->isCanUse(Ljava/lang/String;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v0, 0x0

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/putong/core/api/k;->z3(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    new-instance p1, Ll/fe5$e;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-direct {p1, p0}, Ll/fe5$e;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ll/fe5$e;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/fe5$e;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0, v0}, Ll/fe5$e;->c(I)Ll/fe5$e;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "p_wallet,charge"

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ll/fe5$e;->d(Ljava/lang/String;)Ll/fe5$e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ll/fe5$e;->l()Ll/fe5;

    .line 82
    .line 83
    .line 84
    const-string p0, "module"

    .line 85
    .line 86
    const-string p1, "p_wallet"

    .line 87
    .line 88
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    filled-new-array {p0}, [Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string v0, "e_recharge"

    .line 97
    .line 98
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

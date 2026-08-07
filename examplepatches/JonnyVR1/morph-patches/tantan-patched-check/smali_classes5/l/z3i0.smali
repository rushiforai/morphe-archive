.class public Ll/z3i0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/a4i0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/z3i0;->a:Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinCheckstandFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/z3i0;Lcom/p1/mobile/putong/core/data/Coin;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z3i0;->n0(Lcom/p1/mobile/putong/core/data/Coin;)V

    return-void
.end method

.method public static synthetic f0(Ll/z3i0;Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z3i0;->m0(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic h0(Ll/z3i0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z3i0;->l0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ll/bkj0;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p0, Ljava/lang/Integer;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INTL_TTT_COIN:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 15
    .line 16
    const-string v0, "coin"

    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/fp60;->K(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jan;->P3()Lrx/c;

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic l0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->ga:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/lqb;->k5()Lrx/c;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t3i0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/t3i0;-><init>(Ll/z3i0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/jan;->M3()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/u3i0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/u3i0;-><init>(Ll/z3i0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/lqb;->a5()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/v3i0;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/v3i0;-><init>(Ll/z3i0;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/w3i0;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/w3i0;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/x3i0;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/x3i0;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S0:Lcom/p1/mobile/putong/core/api/k;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/k;->v3()Lrx/subjects/b;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance v0, Ll/y3i0;

    .line 109
    .line 110
    invoke-direct {v0}, Ll/y3i0;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public k0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/a4i0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/a4i0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 2
    .line 3
    const-wide/16 v2, 0x3e7

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    check-cast v1, Ll/a4i0;

    .line 12
    .line 13
    const/16 v0, 0x28

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/a4i0;->j(I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    check-cast v1, Ll/a4i0;

    .line 20
    .line 21
    const/16 v0, 0x30

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ll/a4i0;->j(I)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/a4i0;

    .line 29
    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;->available:J

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/a5i0;->U(J)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/a4i0;->i(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/core/data/Coin;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coin;->available:J

    .line 2
    .line 3
    const-wide/16 v2, 0x3e7

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    check-cast v1, Ll/a4i0;

    .line 12
    .line 13
    const/16 v0, 0x28

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ll/a4i0;->j(I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    check-cast v1, Ll/a4i0;

    .line 20
    .line 21
    const/16 v0, 0x30

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ll/a4i0;->j(I)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/a4i0;

    .line 29
    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Coin;->available:J

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/a5i0;->U(J)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/a4i0;->i(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

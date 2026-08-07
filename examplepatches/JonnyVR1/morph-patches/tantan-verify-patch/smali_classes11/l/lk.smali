.class public Ll/lk;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/rk;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/lk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lk;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/lk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lk;->y0()V

    return-void
.end method

.method public static synthetic h0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Ll/lk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lk;->z0()V

    return-void
.end method

.method public static synthetic j0(Ll/lk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lk;->C0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Ll/lk;Z)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lk;->x0(Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(Ll/lk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lk;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n0(Ll/lk;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lk;->A0()V

    return-void
.end method

.method public static synthetic o0(Ll/lk;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/lk;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rk;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic A0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/lk;->p0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic C0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/lk;->r0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public D0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/dk;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dk;-><init>(Ll/lk;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/ak;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ak;-><init>(Ll/lk;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final p0(Z)V
    .locals 3

    .line 1
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 2
    .line 3
    const-string v1, "Delete account"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/rk;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/rk;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Lcom/p1/mobile/putong/core/profile/R$string;->R0:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 20
    .line 21
    .line 22
    const-string v0, ""

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->K7()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {v0, p1}, Ll/sw6;->A3(Ljava/lang/String;Ljava/lang/Class;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-static {v0}, Ll/sw6;->s3(Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :goto_0
    new-instance v0, Ll/kk;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/kk;-><init>()V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/bk;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/bk;-><init>(Ll/lk;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public q0()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/ck;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ck;-><init>(Ll/lk;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final r0(Z)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/lqb;->Y4()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    cmp-long v0, v0, v2

    .line 38
    .line 39
    if-gtz v0, :cond_2

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/jan;->K3()J

    .line 56
    .line 57
    .line 58
    move-result-wide v0

    .line 59
    cmp-long v0, v0, v2

    .line 60
    .line 61
    if-lez v0, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 65
    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    check-cast v0, Ll/rk;

    .line 69
    .line 70
    new-instance p1, Ll/fk;

    .line 71
    .line 72
    invoke-direct {p1, p0}, Ll/fk;-><init>(Ll/lk;)V

    .line 73
    .line 74
    .line 75
    new-instance p0, Ll/gk;

    .line 76
    .line 77
    invoke-direct {p0}, Ll/gk;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p1, p0}, Ll/rk;->l(Ll/x20;Ll/x20;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    check-cast v0, Ll/rk;

    .line 85
    .line 86
    new-instance p1, Ll/hk;

    .line 87
    .line 88
    invoke-direct {p1, p0}, Ll/hk;-><init>(Ll/lk;)V

    .line 89
    .line 90
    .line 91
    new-instance v1, Ll/ik;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/ik;-><init>(Ll/lk;)V

    .line 94
    .line 95
    .line 96
    new-instance p0, Ll/jk;

    .line 97
    .line 98
    invoke-direct {p0}, Ll/jk;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p1, v1, p0}, Ll/rk;->k(Ll/x20;Ll/x20;Ll/x20;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    :goto_0
    sget-object v0, Ll/xk;->Companion:Ll/xk$a;

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    new-instance v2, Ll/ek;

    .line 112
    .line 113
    invoke-direct {v2, p0, p1}, Ll/ek;-><init>(Ll/lk;Z)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, p1, v1, v2}, Ll/xk$a;->f(ZLcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rk;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rk;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/lk;->r0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic x0(Z)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lk;->p0(Z)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic y0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/lk;->p0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic z0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/lk;->p0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

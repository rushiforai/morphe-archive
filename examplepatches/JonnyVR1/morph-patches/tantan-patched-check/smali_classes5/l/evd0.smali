.class public Ll/evd0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/jvd0;",
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

.method public static synthetic e0(Ll/evd0;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/evd0;->x0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "recharge"

    .line 2
    .line 3
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic h0(Ll/evd0;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/evd0;->s0(Lcom/google/common/base/Optional;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ll/evd0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/evd0;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Ll/evd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/evd0;->t0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/evd0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/evd0;->q0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic m0(Ll/evd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/evd0;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n0(Ll/evd0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/evd0;->y0(Ll/pf60;)V

    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jvd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jvd0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic x0(Landroid/util/Pair;)V
    .locals 6

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/google/common/base/Optional;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/putong/core/data/WalletAccount;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/WalletAccount;->balance:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/core/data/WalletAccount;

    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/WalletAccount;->balance:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v3, Ll/jvd0;

    .line 40
    .line 41
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/WalletAccount;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/WalletAccount;->balance:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v3, v4, v5}, Ll/jvd0;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WalletAccount;->id:Ljava/lang/String;

    .line 53
    .line 54
    const-string v4, "recharge"

    .line 55
    .line 56
    invoke-virtual {v3, v0, v4}, Ll/lqb;->n5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const-wide/16 v1, 0x0

    .line 61
    .line 62
    :goto_0
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast p1, Lcom/p1/mobile/putong/core/data/Wallet;

    .line 65
    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 67
    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 75
    .line 76
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_1

    .line 81
    .line 82
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 83
    .line 84
    check-cast v0, Ll/jvd0;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Wallet;->withdrawAccounts:Ljava/util/List;

    .line 87
    .line 88
    const/4 v3, 0x0

    .line 89
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/data/WithdrawAccount;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/data/WithdrawAccount;->name:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0, p1}, Ll/jvd0;->u(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 102
    .line 103
    check-cast p1, Ll/jvd0;

    .line 104
    .line 105
    invoke-virtual {p1}, Ll/jvd0;->m()V

    .line 106
    .line 107
    .line 108
    :goto_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 109
    .line 110
    check-cast p0, Ll/jvd0;

    .line 111
    .line 112
    invoke-virtual {p0, v1, v2}, Ll/jvd0;->n(D)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private synthetic y0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/jvd0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/jvd0;->v(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    :cond_0
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
    invoke-virtual {p0}, Ll/lqb;->m5()Lrx/c;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lqb;->j5()Lrx/c;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/tud0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/tud0;-><init>(Ll/evd0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/lqb;->D5()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/lqb;->E5()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/vud0;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/vud0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/wud0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/wud0;-><init>(Ll/evd0;)V

    .line 51
    .line 52
    .line 53
    new-instance v2, Ll/xud0;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/xud0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/lqb;->o5()Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/yud0;

    .line 78
    .line 79
    invoke-direct {v1}, Ll/yud0;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/zud0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/zud0;-><init>(Ll/evd0;)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Ll/avd0;

    .line 92
    .line 93
    invoke-direct {p0}, Ll/avd0;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    new-instance v1, Lcom/alipay/sdk/app/AuthTask;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v1, v2}, Lcom/alipay/sdk/app/AuthTask;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/lqb;->j4(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/dvd0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/dvd0;-><init>(Ll/evd0;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/uud0;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/uud0;-><init>(Ll/evd0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public p0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ll/lqb;->A5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/bvd0;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/bvd0;-><init>(Ll/evd0;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/cvd0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/cvd0;-><init>(Ll/evd0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic q0(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jvd0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jvd0;->i(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jvd0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jvd0;->f(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s0(Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

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
    check-cast p0, Ll/jvd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/jvd0;->y()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    check-cast p0, Ll/jvd0;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Ll/jvd0;->x(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/lqb;->m5()Lrx/c;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic t0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jvd0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/jvd0;->x(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

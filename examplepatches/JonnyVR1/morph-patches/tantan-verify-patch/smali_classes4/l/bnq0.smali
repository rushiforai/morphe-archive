.class public Ll/bnq0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/gnq0;",
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

.method public static synthetic e0(Ll/bnq0;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bnq0;->l0(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V

    return-void
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g0(Ll/bnq0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bnq0;->k0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->T:Ll/jxd0;

    .line 16
    .line 17
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic i0(Ll/bnq0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bnq0;->j0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic j0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/gnq0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/gnq0;->n()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p1}, Ll/ftn0;->b()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wmq0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/wmq0;-><init>(Ll/bnq0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/xmq0;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/xmq0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/ymq0;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/ymq0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/zmq0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/zmq0;-><init>(Ll/bnq0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

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
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

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
    new-instance v1, Ll/anq0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/anq0;-><init>(Ll/bnq0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic k0(Ljava/util/List;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isYoungRisk()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 23
    .line 24
    const-string v0, "verified"

    .line 25
    .line 26
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    const-string v0, "pending"

    .line 41
    .line 42
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    const-string v0, "prePending"

    .line 49
    .line 50
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Ll/gnq0;

    .line 60
    .line 61
    invoke-virtual {p0, v1}, Ll/gnq0;->p(Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 66
    .line 67
    check-cast p0, Ll/gnq0;

    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    invoke-virtual {p0, p1}, Ll/gnq0;->p(Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 75
    .line 76
    check-cast p0, Ll/gnq0;

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Ll/gnq0;->p(Z)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

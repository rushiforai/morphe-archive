.class public Ll/l8o0;
.super Ll/h7o0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h7o0<",
        "Ll/rwn0;",
        "Ll/p8o0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/h7o0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/p8o0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/p8o0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic W3(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X3(Ll/l8o0;Ll/p7o0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8o0;->c4(Ll/p7o0;)V

    return-void
.end method

.method public static synthetic Y3(Ll/p7o0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/p7o0;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic Z3(Ll/l8o0;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8o0;->b4(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Ll/l8o0;Ll/p7o0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l8o0;->d4(Ll/p7o0;)V

    return-void
.end method

.method private synthetic b4(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->S3()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic c4(Ll/p7o0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p8o0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/p7o0;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Ll/p8o0;->l(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic d4(Ll/p7o0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p8o0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/p8o0;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private e4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ll/rwn0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/oo2;->n2()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/rwn0;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/rwn0;->N1(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private init()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/p8o0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p8o0;->init()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/oo2;->m2()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/g8o0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/g8o0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/h8o0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/h8o0;-><init>(Ll/l8o0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/i8o0;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/i8o0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/j8o0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/j8o0;-><init>(Ll/l8o0;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/rwn0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/rwn0;->S3()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/k8o0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/k8o0;-><init>(Ll/l8o0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    return-void
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/l8o0;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/u8o0;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/u8o0;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->fa:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/p8o0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/p8o0;->f()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-direct {v0, v1, p0, v2}, Ll/u8o0;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public U3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/h7o0;->U3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/rwn0;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/rwn0;->D3(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l8o0;->e4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

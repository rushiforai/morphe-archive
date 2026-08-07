.class public Ll/b83;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/m27;->a4(Z)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p0}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b(Ll/x20;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->K0:Ll/cza;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Cl()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    xor-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    invoke-virtual {v0, p0, v1, p1}, Ll/cza;->O3(Ll/x20;ZZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->g(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic d()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/m27;->a4(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/m27;->e4(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->to()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v1, p1, p2}, Ll/ma3;->e(Lcom/p1/mobile/android/app/Act;ZLl/x20;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic f()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/m27;->a4(Z)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 12
    .line 13
    iget-object v0, v0, Ll/m27;->W:Ll/jxd0;

    .line 14
    .line 15
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    iget-boolean v0, v0, Ll/m27;->S:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/b83;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;Ll/pcj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    iget-object v0, v0, Ll/m27;->W:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 22
    .line 23
    iget-object v0, v0, Ll/m27;->W:Ll/jxd0;

    .line 24
    .line 25
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/v73;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ll/v73;-><init>(Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p0, v0, p2}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->e(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g1n;->b(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;FLl/x20;Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/u73;->A(Lcom/p1/mobile/android/app/Act;FLl/x20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/b83;->l(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/m27;->F3()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p1, Ll/m27;->S:Z

    .line 17
    .line 18
    invoke-static {p0}, Ll/u73;->B(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Ll/b83;->n(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)V
    .locals 1

    .line 1
    new-instance v0, Ll/x73;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p3}, Ll/x73;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0, p2, p3, p4}, Ll/u73;->D(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static o(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/w73;

    .line 2
    .line 3
    invoke-direct {v0, p1, p4}, Ll/w73;-><init>(Ll/x20;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0, p2, p3, p4}, Ll/u73;->E(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static p(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 22
    .line 23
    iget-object p0, p0, Ll/m27;->W:Ll/jxd0;

    .line 24
    .line 25
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const-class p2, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 32
    .line 33
    invoke-static {p0, p2}, Ll/oa3;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/Class;)V

    .line 34
    .line 35
    .line 36
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 39
    .line 40
    invoke-virtual {p2}, Ll/m27;->H3()Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-static {}, Ll/pa3;->b()F

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    invoke-virtual {v0, v1}, Ll/m27;->a4(Z)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ll/y73;

    .line 60
    .line 61
    invoke-direct {v0}, Ll/y73;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v1, Ll/z73;

    .line 65
    .line 66
    invoke-direct {v1, p1}, Ll/z73;-><init>(Ll/x20;)V

    .line 67
    .line 68
    .line 69
    new-instance p1, Ll/a83;

    .line 70
    .line 71
    invoke-direct {p1}, Ll/a83;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {p0, p2, v0, v1, p1}, Ll/b83;->j(Lcom/p1/mobile/android/app/Act;FLl/x20;Ll/x20;Ll/x20;)V

    .line 75
    .line 76
    .line 77
    sget-object p1, Lcom/p1/mobile/android/app/c;->f:Lcom/p1/mobile/android/app/c;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    if-eq p1, p0, :cond_2

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    if-nez p0, :cond_2

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->in(F)V

    .line 100
    .line 101
    .line 102
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 105
    .line 106
    const/4 p1, 0x0

    .line 107
    invoke-virtual {p0, p1}, Ll/m27;->Z3(Z)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

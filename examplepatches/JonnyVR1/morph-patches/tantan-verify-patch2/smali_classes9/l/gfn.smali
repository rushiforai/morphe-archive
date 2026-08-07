.class public Ll/gfn;
.super Ll/xl2;
.source "SourceFile"


# instance fields
.field public final s:Ll/jxd0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/xl2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "intl_live_first_charge_"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 14
    .line 15
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 16
    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/gfn;->s:Ll/jxd0;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic B4(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic C4(Ll/gfn;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gfn;->M4(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D4(Ll/gfn;Ll/uoe0;ILjava/lang/String;Ll/bkg;Lcom/p1/mobile/putong/data/PaymentData;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/gfn;->O4(Ll/uoe0;ILjava/lang/String;Ll/bkg;Lcom/p1/mobile/putong/data/PaymentData;)V

    return-void
.end method

.method public static synthetic E4(Ll/gfn;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gfn;->N4(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic F4(Ll/gfn;ILcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gfn;->L4(ILcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V

    return-void
.end method

.method public static synthetic G4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ob:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic H4(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p0, v1}, Ll/wrv;->e0(Ljava/lang/String;Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static synthetic I4(Ll/gfn;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gfn;->P4(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public J4(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;I)V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/cfn;

    .line 8
    .line 9
    invoke-direct {v2, p0, p2, p1}, Ll/cfn;-><init>(Ll/gfn;ILcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V

    .line 10
    .line 11
    .line 12
    new-instance p2, Ll/dfn;

    .line 13
    .line 14
    invoke-direct {p2, p0}, Ll/dfn;-><init>(Ll/gfn;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1, p1, v2, p2}, Ll/wrv;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/x20;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public K4()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->getTPayResultBs()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/xen;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/xen;-><init>(Ll/gfn;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/yen;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/yen;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic L4(ILcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/xl2;->o4(IZ)V

    .line 3
    .line 4
    .line 5
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 6
    .line 7
    invoke-static {p0}, Ll/mjj;->m(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic M4(Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0, p1}, Ll/wrv;->U(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic N4(Ll/bkj0;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ljava/lang/Integer;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, p1, v0}, Ll/xl2;->o4(IZ)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic O4(Ll/uoe0;ILjava/lang/String;Ll/bkg;Lcom/p1/mobile/putong/data/PaymentData;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/PaymentData;->getCOutName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "live_recharge"

    .line 13
    .line 14
    invoke-virtual {p5, v1, v0}, Lcom/p1/mobile/putong/data/PaymentData;->isCanUse(Ljava/lang/String;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/PaymentData;->getCodaName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p5, v1, v0}, Lcom/p1/mobile/putong/data/PaymentData;->isCanUse(Ljava/lang/String;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0, p4}, Ll/xl2;->x4(Ll/bkg;)V

    .line 32
    .line 33
    .line 34
    const-string p1, "0"

    .line 35
    .line 36
    invoke-virtual {p0, p4, p1}, Ll/xl2;->A4(Ll/bkg;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    :goto_0
    if-eqz p1, :cond_3

    .line 41
    .line 42
    sget-object p4, Ll/zrv;->e:Landroid/app/Application;

    .line 43
    .line 44
    invoke-static {}, Ll/u8n;->a()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Nb:I

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->B0:I

    .line 54
    .line 55
    :goto_1
    invoke-virtual {p4, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    invoke-static {p4}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/PaymentData;->getCOutName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    invoke-virtual {p5, v1, p4}, Lcom/p1/mobile/putong/data/PaymentData;->isCanUse(Ljava/lang/String;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p4

    .line 70
    invoke-virtual {p0, p2, p1, p3, p4}, Ll/gfn;->Q4(ILl/uoe0;Ljava/lang/String;Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic P4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

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

.method public final Q4(ILl/uoe0;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/xl2;->m:Ll/uoe0;

    .line 13
    .line 14
    iput p1, p0, Ll/xl2;->o:I

    .line 15
    .line 16
    iput-object p3, p0, Ll/xl2;->p:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 25
    .line 26
    .line 27
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 28
    .line 29
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-interface {p1, p2, p3, p4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->skipH5PayActivityFromLive(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xl2;->a4()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-static {p3, p2}, Ll/gpc0;->b(Ljava/lang/String;Z)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iput-object p2, p0, Ll/xl2;->q:Ljava/lang/String;

    .line 51
    .line 52
    iget-boolean p0, p0, Ll/xl2;->i:Z

    .line 53
    .line 54
    const-string p3, "0"

    .line 55
    .line 56
    invoke-static {p2, p1, p0, p3}, Ll/gpc0;->i(Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/xl2;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/gfn;->K4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public V3(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x7

    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Ll/gfn;->s:Ll/jxd0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/wrv;->G()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    invoke-interface {p1, p0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    return-object p1

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    invoke-interface {p1, p0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    :cond_1
    return-object p1
.end method

.method public W3()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->j()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/zen;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/zen;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/afn;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/afn;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/bfn;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/bfn;-><init>(Ll/gfn;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public X3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public Y3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public l4(Ll/xl2$b;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/xl2$b;->e:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v1, "tantancoin_purchase_click"

    .line 9
    .line 10
    invoke-static {v1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p1, Ll/xl2$b;->e:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 14
    .line 15
    iget v1, p1, Ll/xl2$b;->d:I

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/gfn;->J4(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p1, Ll/xl2$b;->a:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Ll/gpc0;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public p4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gfn;->s:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/gfn;->s:Ll/jxd0;

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/il2;

    .line 25
    .line 26
    iget-object v1, p0, Ll/xl2;->k:Ljava/util/List;

    .line 27
    .line 28
    iget-object v2, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 29
    .line 30
    iget-object v3, p0, Ll/xl2;->n:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 31
    .line 32
    invoke-virtual {p0, v1, v2, v3}, Ll/xl2;->U3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Ll/il2;->V(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public u4()V
    .locals 1

    .line 1
    new-instance v0, Ll/ven;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ven;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v4(Ll/bkg;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0, p1}, Ll/otp0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget v3, p1, Ll/bkg;->a:I

    .line 18
    .line 19
    iget-object v2, p1, Ll/bkg;->b:Ll/uoe0;

    .line 20
    .line 21
    iget-object v4, p1, Ll/bkg;->c:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->q:I

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    invoke-virtual {v0, v1, v5}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 31
    .line 32
    .line 33
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 34
    .line 35
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 36
    .line 37
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->h5PayCanUseForLive()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    new-instance v0, Ll/efn;

    .line 46
    .line 47
    move-object v1, p0

    .line 48
    move-object v5, p1

    .line 49
    invoke-direct/range {v0 .. v5}, Ll/efn;-><init>(Ll/gfn;Ll/uoe0;ILjava/lang/String;Ll/bkg;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Ll/ffn;

    .line 53
    .line 54
    invoke-direct {p0, v1}, Ll/ffn;-><init>(Ll/gfn;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v6, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public z4()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.class public Ll/mvv;
.super Ll/xl2;
.source "SourceFile"


# instance fields
.field public A:Z

.field public B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

.field public s:Z

.field public t:Ljava/lang/String;

.field public u:Z

.field public v:Z

.field public w:Ll/kcg0;

.field public x:Ll/kcg0;

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xl2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/mvv;->s:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/mvv;->v:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/mvv;->y:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/mvv;->z:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/mvv;->A:Z

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic B4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u5f02\u5e38\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic C4(Ll/mvv;Ll/myk;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mvv;->T4(Ll/myk;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D4(Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 7
    .line 8
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic E4(Ll/mvv;ILjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mvv;->Y4(ILjava/lang/Long;)V

    return-void
.end method

.method public static synthetic F4(Ll/mvv;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mvv;->Z4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic G4(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x5

    .line 6
    if-le v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-interface {p0, v0, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    return-object p0
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

.method public static synthetic I4(Ll/mvv;Ll/bkg;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mvv;->W4(Ll/bkg;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V

    return-void
.end method

.method public static synthetic J4(Ljava/util/List;)Ljava/lang/Boolean;
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

.method public static synthetic K4(Ll/mvv;ZLcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mvv;->V4(ZLcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V

    return-void
.end method

.method public static synthetic L4(Ll/mvv;Ll/bkg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mvv;->X4(Ll/bkg;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M4(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/base/data/BLiveData;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic N4(Ljava/util/List;)Ljava/lang/Boolean;
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

.method public static synthetic O4(Ll/mvv;Ll/xl2$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mvv;->U4(Ll/xl2$b;)V

    return-void
.end method

.method public static synthetic P4(Ll/mvv;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mvv;->a5(Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;)V

    return-void
.end method


# virtual methods
.method public Q4()Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mvv;->B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 2
    .line 3
    return-object p0
.end method

.method public R4(Ll/xl2$b;)Lcom/p1/mobile/putong/data/PurchasePaymentParam;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->new_()Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-boolean p0, p0, Ll/mvv;->s:Z

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, v0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 26
    .line 27
    const-string v1, "live_recharge"

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParamExtra;->purchaseEnv:Ljava/lang/String;

    .line 30
    .line 31
    :cond_0
    iget-object p0, p1, Ll/xl2$b;->a:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p0, v0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 34
    .line 35
    iget p0, p1, Ll/xl2$b;->c:I

    .line 36
    .line 37
    if-lez p0, :cond_1

    .line 38
    .line 39
    iput p0, v0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 40
    .line 41
    :cond_1
    return-object v0
.end method

.method public final S4(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/xl2$b;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/xl2$b;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->id:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, v0, Ll/xl2$b;->a:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    iput v1, v0, Ll/xl2$b;->b:I

    .line 21
    .line 22
    const/16 v1, 0xa

    .line 23
    .line 24
    iput v1, v0, Ll/xl2$b;->c:I

    .line 25
    .line 26
    iput v1, v0, Ll/xl2$b;->d:I

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/wrv;->i()Lcom/p1/mobile/putong/data/PayMethod;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/wrv;->k()Lcom/p1/mobile/putong/data/PayMethod;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :goto_0
    iput-object p1, v0, Ll/xl2$b;->f:Lcom/p1/mobile/putong/data/PayMethod;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/mvv;->l4(Ll/xl2$b;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/xl2;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vuv;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/vuv;-><init>(Ll/mvv;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/myk;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic T4(Ll/myk;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mvv;->v:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic U4(Ll/xl2$b;)V
    .locals 1

    .line 1
    iget p1, p1, Ll/xl2$b;->d:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/mvv;->o4(IZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public V3(Ljava/util/List;)Ljava/util/List;
    .locals 5
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
    iget-object v0, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xl2;->b4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/mvv;->B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->hasAdditionalCheckout:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 23
    .line 24
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 29
    .line 30
    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    .line 31
    .line 32
    iput-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->price:D

    .line 33
    .line 34
    iput v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 35
    .line 36
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRechargeInput:Z

    .line 37
    .line 38
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-object p1

    .line 42
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 43
    .line 44
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 45
    .line 46
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isOneRMBRecharge:Z

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 51
    .line 52
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 53
    .line 54
    iput-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->price:D

    .line 55
    .line 56
    const/16 v0, 0xa

    .line 57
    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRechargeInput:Z

    .line 61
    .line 62
    invoke-interface {p1, v2, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-object p1
.end method

.method public final synthetic V4(ZLcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V
    .locals 4

    .line 1
    iput-object p2, p0, Ll/mvv;->B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->isActive:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    move v3, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v3, v1

    .line 16
    :goto_0
    iput-boolean v3, p0, Ll/mvv;->u:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 21
    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    move v1, v2

    .line 25
    :cond_1
    iput-boolean v1, p0, Ll/mvv;->s:Z

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/mvv;->S4(Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    const-string p1, "\u6d3b\u52a8\u8d44\u683c\u5df2\u7528\u5b8c"

    .line 34
    .line 35
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->closeLiveCampaignDialog()Ll/v3f$c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public W3()Lrx/c;
    .locals 1
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
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wrv;->j()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/kvv;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/kvv;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/lvv;

    .line 21
    .line 22
    invoke-direct {v0}, Ll/lvv;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ll/wuv;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/wuv;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final synthetic W4(Ll/bkg;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V
    .locals 4

    .line 1
    iput-object p2, p0, Ll/mvv;->B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 2
    .line 3
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->isActive:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    move v3, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v3, v1

    .line 16
    :goto_0
    iput-boolean v3, p0, Ll/mvv;->u:Z

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->showDialogBonus:Z

    .line 21
    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    move v1, v2

    .line 25
    :cond_1
    iput-boolean v1, p0, Ll/mvv;->s:Z

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xl2;->q4()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/xl2;->x4(Ll/bkg;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Ll/mvv;->t:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1, p2}, Ll/xl2;->A4(Ll/bkg;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public X3()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    const-string v0, "customCoin"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Ll/wrv;->e0(Ljava/lang/String;Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/hvv;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/hvv;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/ivv;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/ivv;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic X4(Ll/bkg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xl2;->x4(Ll/bkg;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/mvv;->t:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/xl2;->A4(Ll/bkg;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Y3()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->z1()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/jvv;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/jvv;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic Y4(ILjava/lang/Long;)V
    .locals 2

    .line 1
    int-to-long v0, p1

    .line 2
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 3
    .line 4
    .line 5
    move-result-wide p1

    .line 6
    sub-long/2addr v0, p1

    .line 7
    long-to-int p1, v0

    .line 8
    invoke-virtual {p0, p1}, Ll/mvv;->g5(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;

    .line 15
    .line 16
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->P0(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    if-gtz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/il2;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/il2;->v()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic Z4(Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3

    .line 6
    .line 7
    cmp-long p1, v0, v2

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;->Q0(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic a5(Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;->abGroup:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/mvv;->t:Ljava/lang/String;

    .line 4
    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeStatus;->showNotice:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/mvv;->v:Z

    .line 8
    .line 9
    return-void
.end method

.method public b5(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0x384

    .line 12
    .line 13
    invoke-static {v0}, Ll/px50;->c(I)Ll/px50$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/16 v0, 0x50

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 28
    .line 29
    const-wide v2, 0x3fe75c28f5c28f5cL    # 0.73

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0, v1, v2, v3}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/high16 v0, 0x41400000    # 12.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p1, v0}, Ll/px50$a;->s(I)Ll/px50$a;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public c5(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/mvv;->A:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/i6t;->j3()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Q4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/xuv;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Ll/xuv;-><init>(Ll/mvv;Z)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/yuv;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/yuv;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public d5(I)V
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    if-lt p1, v0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/bvv;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/bvv;-><init>(Ll/mvv;I)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Ll/mvv;->w:Ll/kcg0;

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public e5()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mvv;->x:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/cvv;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/cvv;-><init>(Ll/mvv;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/mvv;->x:Ll/kcg0;

    .line 39
    .line 40
    return-void
.end method

.method public f5(Ljava/lang/String;ILcom/p1/mobile/putong/data/PayMethod;)V
    .locals 4

    .line 1
    const-string v0, "alipay"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object p3, p0, Ll/xl2;->p:Ljava/lang/String;

    .line 12
    .line 13
    iget-boolean v0, p0, Ll/xl2;->i:Z

    .line 14
    .line 15
    iget-boolean v3, p0, Ll/mvv;->s:Z

    .line 16
    .line 17
    if-nez v3, :cond_1

    .line 18
    .line 19
    iget-boolean p0, p0, Ll/mvv;->u:Z

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v1, v2

    .line 25
    :cond_1
    :goto_0
    invoke-static {p1, p2, p3, v0, v1}, Ll/gpc0;->c(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    const-string v0, "wechat"

    .line 30
    .line 31
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-eqz p3, :cond_5

    .line 36
    .line 37
    iget-object p3, p0, Ll/xl2;->p:Ljava/lang/String;

    .line 38
    .line 39
    iget-boolean v0, p0, Ll/xl2;->i:Z

    .line 40
    .line 41
    iget-boolean v3, p0, Ll/mvv;->s:Z

    .line 42
    .line 43
    if-nez v3, :cond_4

    .line 44
    .line 45
    iget-boolean p0, p0, Ll/mvv;->u:Z

    .line 46
    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    move v1, v2

    .line 51
    :cond_4
    :goto_1
    invoke-static {p1, p2, p3, v0, v1}, Ll/gpc0;->k(Ljava/lang/String;ILjava/lang/String;ZZ)V

    .line 52
    .line 53
    .line 54
    :cond_5
    return-void
.end method

.method public final g5(I)Ljava/lang/String;
    .locals 3

    .line 1
    const p0, 0x15180

    .line 2
    .line 3
    .line 4
    div-int p0, p1, p0

    .line 5
    .line 6
    div-int/lit16 v0, p1, 0xe10

    .line 7
    .line 8
    div-int/lit8 v1, p1, 0x3c

    .line 9
    .line 10
    rem-int/lit8 p1, p1, 0x3c

    .line 11
    .line 12
    if-ltz p0, :cond_3

    .line 13
    .line 14
    if-ltz v0, :cond_3

    .line 15
    .line 16
    if-ltz v1, :cond_3

    .line 17
    .line 18
    if-gez p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v2, "\u5c0f\u65f6"

    .line 22
    .line 23
    if-lez p0, :cond_1

    .line 24
    .line 25
    rem-int/lit8 v0, v0, 0x18

    .line 26
    .line 27
    new-instance p1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p0, "\u5929"

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    const-string p0, "\u5206"

    .line 52
    .line 53
    if-lez v0, :cond_2

    .line 54
    .line 55
    rem-int/lit8 v1, v1, 0x3c

    .line 56
    .line 57
    new-instance p1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p0, "\u79d2"

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_3
    :goto_0
    const-string p0, ""

    .line 104
    .line 105
    return-object p0
.end method

.method public h5()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mvv;->w:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/mvv;->x:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l4(Ll/xl2$b;)V
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Ll/mvv;->R4(Ll/xl2$b;)Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v3, Ll/zuv;

    .line 12
    .line 13
    invoke-direct {v3, p0, p1}, Ll/zuv;-><init>(Ll/mvv;Ll/xl2$b;)V

    .line 14
    .line 15
    .line 16
    new-instance v4, Ll/avv;

    .line 17
    .line 18
    invoke-direct {v4, p0}, Ll/avv;-><init>(Ll/mvv;)V

    .line 19
    .line 20
    .line 21
    iget-object v5, p1, Ll/xl2$b;->f:Lcom/p1/mobile/putong/data/PayMethod;

    .line 22
    .line 23
    invoke-virtual/range {v0 .. v5}, Ll/wrv;->Z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PurchasePaymentParam;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p1, Ll/xl2$b;->a:Ljava/lang/String;

    .line 27
    .line 28
    iget v1, p1, Ll/xl2$b;->b:I

    .line 29
    .line 30
    iget-object p1, p1, Ll/xl2$b;->f:Lcom/p1/mobile/putong/data/PayMethod;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1, p1}, Ll/mvv;->f5(Ljava/lang/String;ILcom/p1/mobile/putong/data/PayMethod;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public o4(IZ)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    iget-object v2, p0, Ll/mvv;->B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 6
    .line 7
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->trialGiftId:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ll/oo2;->w0(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-boolean v1, p0, Ll/mvv;->u:Z

    .line 14
    .line 15
    const/4 v8, 0x0

    .line 16
    const/4 v9, 0x1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iput-boolean v8, p0, Ll/mvv;->v:Z

    .line 20
    .line 21
    iput-boolean v9, p0, Ll/mvv;->y:Z

    .line 22
    .line 23
    iget-object v1, p0, Ll/mvv;->B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 24
    .line 25
    invoke-static {p0, v1}, Ll/lpc0;->f(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V

    .line 26
    .line 27
    .line 28
    invoke-super {p0, p1, v9}, Ll/xl2;->o4(IZ)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-boolean v1, p0, Ll/mvv;->s:Z

    .line 33
    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    iput-boolean v8, p0, Ll/mvv;->v:Z

    .line 37
    .line 38
    iput-boolean v9, p0, Ll/mvv;->y:Z

    .line 39
    .line 40
    iget-boolean v1, p0, Ll/mvv;->A:Z

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    iput-boolean v8, p0, Ll/mvv;->A:Z

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->closeLiveCampaignDialog()Ll/v3f$c;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ll/v3f$c;->p()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;->closeFastRechargeDialog()Ll/v3f$c;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Ll/v3f$c;->p()V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget v1, p0, Ll/xl2;->o:I

    .line 73
    .line 74
    const/4 v3, 0x2

    .line 75
    if-ne v1, v3, :cond_2

    .line 76
    .line 77
    iget-object v4, p0, Ll/xl2;->m:Ll/uoe0;

    .line 78
    .line 79
    if-eqz v4, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Ll/mvv;->B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 82
    .line 83
    iget-object v2, v4, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 84
    .line 85
    iget-object v3, p0, Ll/mvv;->t:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    const/4 v6, 0x1

    .line 92
    iget-boolean v7, p0, Ll/mvv;->z:Z

    .line 93
    .line 94
    move-object v0, p0

    .line 95
    invoke-static/range {v0 .. v7}, Ll/lpc0;->e(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ll/uoe0;Ljava/lang/String;ZZ)V

    .line 96
    .line 97
    .line 98
    invoke-super {p0, p1, v8}, Ll/xl2;->o4(IZ)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    if-eqz v2, :cond_3

    .line 103
    .line 104
    iget-object v1, p0, Ll/mvv;->B:Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;

    .line 105
    .line 106
    iget-object v3, p0, Ll/mvv;->t:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v4, p0, Ll/xl2;->m:Ll/uoe0;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    const/4 v6, 0x0

    .line 115
    iget-boolean v7, p0, Ll/mvv;->z:Z

    .line 116
    .line 117
    move-object v0, p0

    .line 118
    invoke-static/range {v0 .. v7}, Ll/lpc0;->e(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ll/uoe0;Ljava/lang/String;ZZ)V

    .line 119
    .line 120
    .line 121
    :cond_3
    invoke-super {p0, p1, v9}, Ll/xl2;->o4(IZ)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_4
    invoke-super {p0, p1, v9}, Ll/xl2;->o4(IZ)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/i6t;->j3()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->a4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/dvv;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/dvv;-><init>(Ll/mvv;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->payFirstRecharge()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/evv;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/evv;-><init>(Ll/mvv;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public u4()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/a;-><init>()V

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
    .locals 3

    .line 1
    const-string v0, "liveSchema"

    .line 2
    .line 3
    iget-object v1, p1, Ll/bkg;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-boolean v0, p0, Ll/mvv;->z:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/i6t;->j3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Q4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/fvv;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1}, Ll/fvv;-><init>(Ll/mvv;Ll/bkg;)V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/gvv;

    .line 37
    .line 38
    invoke-direct {v2, p0, p1}, Ll/gvv;-><init>(Ll/mvv;Ll/bkg;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public z4()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/mvv;->y:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/mvv;->y:Z

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-boolean v0, p0, Ll/mvv;->z:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iput-boolean v1, p0, Ll/mvv;->z:Z

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0
.end method

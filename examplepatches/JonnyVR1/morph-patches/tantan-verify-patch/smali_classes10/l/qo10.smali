.class public Ll/qo10;
.super Ll/hj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hj2<",
        "Ll/oo2;",
        "Ll/sm10;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hj2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hj2;->L3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic O3(Ll/qo10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qo10;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;)V

    return-void
.end method

.method public static synthetic P3(Ll/qo10;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qo10;->W3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic R3(Ll/qo10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qo10;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;)V

    return-void
.end method

.method private synthetic W3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qo10;->S3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hj2;->N3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic K3()Ll/isl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qo10;->T3()Ll/sm10;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final S3()V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->t5(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/po10;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/po10;-><init>(Ll/qo10;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public T3()Ll/sm10;
    .locals 0

    .line 1
    new-instance p0, Ll/sm10;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/sm10;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sm10;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sm10;->G(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkAsset;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->clickPkSettingChange()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public X3(ZI)V
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->G7(Ljava/lang/String;ZI)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/oo10;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/oo10;-><init>(Ll/qo10;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->clickPkCreateSetting()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/no10;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/no10;-><init>(Ll/qo10;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

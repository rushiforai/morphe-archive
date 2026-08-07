.class public Ll/p260;
.super Ll/cz50;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cz50<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public k:Ljava/lang/String;

.field public l:Ll/kcg0;

.field public m:Ll/ve4;

.field public n:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cz50;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic W3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getSubscription()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getPosition()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->H5Drawer:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic X3(Ll/p260;Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p260;->g4(Ll/bcg0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getSubscription()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getData()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;->setData(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getSubscription()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getUpdateType()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;->setUpdateType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    .line 34
    .line 35
    return-object p0
.end method

.method public static synthetic Z3(Ll/p260;Ll/bcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p260;->h4(Ll/bcg0;)V

    return-void
.end method

.method public static synthetic a4(Ll/p260;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p260;->m4(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    return-void
.end method

.method public static synthetic b4(Ll/p260;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p260;->i4(Ll/q260;)V

    return-void
.end method

.method public static synthetic c4(Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q260;->g()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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


# virtual methods
.method public L3()I
    .locals 0

    .line 1
    const/high16 p0, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->F()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/i260;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/i260;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/j260;

    .line 30
    .line 31
    invoke-direct {v1}, Ll/j260;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/k260;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/k260;-><init>(Ll/p260;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public T3(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->I0(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d4()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showOperationsRoot()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/q260$a;

    .line 12
    .line 13
    const/16 v2, 0x1fa4

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ll/q260$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    invoke-virtual {v1, v3}, Ll/q260$a;->i(Z)Ll/q260$a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/q260$a;->a()Ll/q260;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/p260;->l:Ll/kcg0;

    .line 31
    .line 32
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->H0()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->refreshOperationMessage()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v0, Ll/q260$a;

    .line 53
    .line 54
    invoke-direct {v0, v2}, Ll/q260$a;-><init>(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ll/q260$a;->a()Ll/q260;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public e4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p260;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)V
    .locals 2

    .line 1
    iput-object p2, p0, Ll/p260;->n:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 2
    .line 3
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/hiv;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, v0, Ll/hiv;->i:Z

    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->loading:Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/cz50;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 22
    .line 23
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->J0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/p260;->k4()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic g4(Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->v0(Ll/bcg0;)Z

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

.method public final synthetic h4(Ll/bcg0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bcg0;->c:Ll/ve4;

    .line 2
    .line 3
    iput-object v0, p0, Ll/p260;->m:Ll/ve4;

    .line 4
    .line 5
    iget-object p0, p1, Ll/bcg0;->d:Ll/y20;

    .line 6
    .line 7
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic i4(Ll/q260;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/q260;->f()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/q260;->g()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/p260;->f4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j4(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/p260;->m:Ll/ve4;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-interface {p0, p1}, Ll/ve4;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public k4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p260;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->subscribeCampaign()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lrx/c;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/n260;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/n260;-><init>(Ll/p260;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/o260;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/o260;-><init>(Ll/p260;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/p260;->l:Ll/kcg0;

    .line 57
    .line 58
    return-void
.end method

.method public l4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p260;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public m1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->o0()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/p260;->m:Ll/ve4;

    .line 10
    .line 11
    return-void
.end method

.method public final m4(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p260;->j4(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/p260;->l:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/p260;->m:Ll/ve4;

    .line 11
    .line 12
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->H0()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/p260;->k:Ljava/lang/String;

    .line 20
    .line 21
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->openH5Drawer()Ll/v3f$d;

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
    new-instance v1, Ll/l260;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/l260;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/m260;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/m260;-><init>(Ll/p260;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

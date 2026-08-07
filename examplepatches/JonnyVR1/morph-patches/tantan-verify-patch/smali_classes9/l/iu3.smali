.class public Ll/iu3;
.super Ll/tz0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Ll/tz0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic o4(Ll/iu3;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iu3;->q4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic p4(Ll/iu3;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iu3;->r4(Ll/vxj0;)V

    return-void
.end method

.method private synthetic q4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iu3;->s4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic r4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/iu3;->t4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t4()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    const-string v2, "anchor_id"

    .line 17
    .line 18
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "live_id"

    .line 32
    .line 33
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    const-string p0, "e_live_sign_tips_button"

    .line 37
    .line 38
    const-string v1, "p_user_live_room"

    .line 39
    .line 40
    invoke-static {p0, v1, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/kf2;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->clearSignRedPoint()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Ll/v3f$b;->i(Z)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lrx/c;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/gu3;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/gu3;-><init>(Ll/iu3;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onSettingDialogShow()Ll/v3f$c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lrx/c;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/hu3;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/hu3;-><init>(Ll/iu3;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public V3(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/e80;->V3(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->SignInEvent:Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$SignInEvent;->showSignDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "tips_button"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;->MAIN:Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;->b(Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;)Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;->a()Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    new-instance p1, Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, "anchor_id"

    .line 54
    .line 55
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 67
    .line 68
    const-string v0, "live_id"

    .line 69
    .line 70
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    const-string p0, "e_live_sign_tips_button"

    .line 74
    .line 75
    const-string v0, "p_user_live_room"

    .line 76
    .line 77
    invoke-static {p0, v0, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "signIn"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final s4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->g0(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onClearSignRedDot()Ll/v3f$c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->refreshSettingButtonRedDot()Ll/v3f$c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.class public Ll/fs3;
.super Ll/tz0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    sget v6, Ll/obc0;->L8:I

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move-object v7, p6

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/tz0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic o4(Ll/fs3;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fs3;->p4(I)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->updateCallNum()Ll/v3f$d;

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
    new-instance v1, Ll/es3;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/es3;-><init>(Ll/fs3;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public V3(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/e80;->V3(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/adx;

    .line 5
    .line 6
    const/16 v0, 0x320

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/adx;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->p1:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 30
    .line 31
    iget-object p1, p1, Ll/dum;->j:Ll/x6t;

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ll/x6t;->L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z7:I

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCallManageDialog()Ll/v3f$c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "callButton"

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

.method public bridge synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fs3;->n4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/tz0;->n4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ym3;

    .line 5
    .line 6
    const/16 v0, 0x320

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/ym3;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e80;->j4()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ll/ym3;->e(Ljava/lang/String;)Ll/ym3;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/lang/Boolean;

    .line 24
    .line 25
    iget v0, p0, Ll/e80;->v:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/fs3;->p4(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L3(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/hq1;

    .line 53
    .line 54
    invoke-direct {v0}, Ll/hq1;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Ll/es3;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/es3;-><init>(Ll/fs3;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public final p4(I)V
    .locals 1

    .line 1
    iput p1, p0, Ll/e80;->v:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->d(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->refreshSettingButtonRedDot()Ll/v3f$c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

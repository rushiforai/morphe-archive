.class public Ll/nb2;
.super Ll/fq1;
.source "SourceFile"


# instance fields
.field public final s:Ll/zb2;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1

    .line 1
    sget v0, Ll/obc0;->j6:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p2}, Ll/fq1;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ll/zb2;

    .line 7
    .line 8
    invoke-direct {p2, p1}, Ll/zb2;-><init>(Ll/dum;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/zb2;

    .line 16
    .line 17
    iput-object p1, p0, Ll/nb2;->s:Ll/zb2;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->V3(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nb2;->s:Ll/zb2;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/zb2;->g4()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "settingButton"

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

.method public j4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/RedDotButton;->g0(Z)V

    .line 6
    .line 7
    .line 8
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->setSettingButtonRedDot()Ll/v3f$d;

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
    new-instance v1, Ll/mb2;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/mb2;-><init>(Ll/nb2;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

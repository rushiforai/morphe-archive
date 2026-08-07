.class public Ll/ic10;
.super Ll/kf2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kf2<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/MultiCallBottomMenuView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->f4:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p2}, Ll/kf2;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i4(Ll/ic10;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ic10;->j4(Ljava/util/List;)V

    return-void
.end method

.method private synthetic j4(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p1}, Ll/ic10;->l4(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private l4(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/MultiCallBottomMenuView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/MultiCallBottomMenuView;->b(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->V3(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/jr10;->h()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    const/4 v1, 0x1

    .line 11
    const/4 v2, -0x1

    .line 12
    invoke-static {p0, p1, v2, v0, v1}, Ll/bf10;->b0(Ll/i6t;Ll/dum;IIZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "multiCallButton"

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
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/MultiCallBottomMenuView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ic10;->k4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/MultiCallBottomMenuView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/MultiCallBottomMenuView;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->d4(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 5
    .line 6
    sget v1, Ll/kf2;->o:I

    .line 7
    .line 8
    sget v2, Ll/kf2;->p:I

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/kf2;->Z3()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/kf2;->Z3()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/MultiCallBottomMenuView;->setIcon(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    sget p0, Ll/obc0;->f6:I

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/MultiCallBottomMenuView;->setIcon(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Ll/ic10;->l4(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->applyData()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lrx/c;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/hc10;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/hc10;-><init>(Ll/ic10;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

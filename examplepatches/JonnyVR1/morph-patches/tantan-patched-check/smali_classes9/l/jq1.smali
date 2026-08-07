.class public Ll/jq1;
.super Ll/kf2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kf2<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomCallButton;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->u:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p2}, Ll/kf2;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j4(Ll/jq1;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jq1;->m4(I)V

    return-void
.end method

.method private m4(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomCallButton;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomCallButton;->b(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->V3(Landroid/view/View;)V

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
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomCallButton;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jq1;->l4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomCallButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final k4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 2

    .line 1
    new-instance v0, Ll/ym3;

    .line 2
    .line 3
    const/16 v1, 0x320

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/ym3;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/ym3;->e(Ljava/lang/String;)Ll/ym3;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/lang/Boolean;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, v0}, Ll/jq1;->m4(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L3(Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance v0, Ll/hq1;

    .line 47
    .line 48
    invoke-direct {v0}, Ll/hq1;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance v0, Ll/gq1;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Ll/gq1;-><init>(Ll/jq1;)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/iq1;

    .line 61
    .line 62
    invoke-direct {p0}, Ll/iq1;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public l4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomCallButton;)V
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
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomCallButton;->setIcon(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    sget p0, Ll/obc0;->e6:I

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomCallButton;->setIcon(I)V

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
    iget-object v0, p0, Ll/kf2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/jq1;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->updateCallNum()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, v1}, Ll/v3f$b;->i(Z)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lrx/c;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/gq1;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/gq1;-><init>(Ll/jq1;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

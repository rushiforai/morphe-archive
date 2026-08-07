.class public Ll/rq1;
.super Ll/kf2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kf2<",
        "Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;",
        ">;"
    }
.end annotation


# instance fields
.field public q:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->W0:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p2}, Ll/kf2;-><init>(Ll/dum;ILcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private A4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/hne0$a;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v3, Ll/oq1;

    .line 17
    .line 18
    invoke-direct {v3, p0, p1}, Ll/oq1;-><init>(Ll/rq1;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 19
    .line 20
    .line 21
    new-instance v4, Ll/pq1;

    .line 22
    .line 23
    invoke-direct {v4}, Ll/pq1;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v5, Ll/qq1;

    .line 27
    .line 28
    invoke-direct {v5}, Ll/qq1;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string p0, "quickgift"

    .line 32
    .line 33
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v2, ""

    .line 38
    .line 39
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    const/4 v6, 0x1

    .line 44
    const/4 v7, 0x1

    .line 45
    move-object v2, p1

    .line 46
    invoke-virtual/range {v1 .. v8}, Ll/hne0$a;->w(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic i4(Ll/rq1;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rq1;->s4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic j4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k4(Ll/rq1;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rq1;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic l4(Ll/rq1;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rq1;->r4(Ll/xxj;)V

    return-void
.end method

.method public static synthetic m4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method private n4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic s4(Ll/vxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/rq1;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private x4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rq1;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/rq1;->v4()V

    .line 8
    .line 9
    .line 10
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
    invoke-virtual {p0}, Ll/rq1;->z4()V

    .line 5
    .line 6
    .line 7
    const-string p1, "fastGiftButtonBubble"

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ll/rq1;->n4(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "fastGiftButton"

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

.method public a4()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;->g:Lv/VDraweeView;

    .line 10
    .line 11
    return-object p0
.end method

.method public bridge synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rq1;->y4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final o4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0, p1}, Ll/rq1;->A4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p4(D)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/xpj;

    .line 2
    .line 3
    const/16 v1, 0x320

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/xpj;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ll/xpj;->e(D)Ll/xpj;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 2

    .line 1
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/rq1;->t4(I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/q4f;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "e_quickgift"

    .line 12
    .line 13
    iput-object v1, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 22
    .line 23
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-static {p1, p2, v0, v1, p0}, Ll/qzj;->q(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic r4(Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/xxj;->d()Ll/zxj;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/zxj;->f()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/cpj;->t(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/rq1;->q:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/rq1;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->z1()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/lq1;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/lq1;-><init>(Ll/rq1;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/oo2;->p1()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/mq1;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/mq1;-><init>(Ll/rq1;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->hideFastGiftPrice()Ll/v3f$c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lrx/c;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/nq1;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/nq1;-><init>(Ll/rq1;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public t4(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;->k0(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;->m0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kf2;->k:Landroid/view/View;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public y4(Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/kf2;->d4(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 5
    .line 6
    const/high16 v0, 0x42300000    # 44.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sget v1, Ll/bnl0;->f:I

    .line 13
    .line 14
    invoke-direct {p0, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/FastGiftView;->m0()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public z4()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/rq1;->q:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    long-to-double v1, v1

    .line 11
    invoke-virtual {p0, v1, v2}, Ll/rq1;->p4(D)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    invoke-static {v0, v1, v2, v4, v3}, Ll/qzj;->i(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/rq1;->q:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/rq1;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.class public Ll/nln;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TT;",
        "Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;

.field public j:J


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/ib0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ib0;->c()Ll/jjs;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ib0;->c()Ll/jjs;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/jjs;->d()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic K3(Ll/nln;Ll/jne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nln;->P3(Ll/jne0;)V

    return-void
.end method

.method public static synthetic L3(Ll/nln;Ll/ib0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nln;->T3(Ll/ib0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/nln;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nln;->U3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic N3(Ll/nln;Ljava/util/concurrent/atomic/AtomicInteger;Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/nln;->S3(Ljava/util/concurrent/atomic/AtomicInteger;Ll/x20;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic O3(Ll/nln;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nln;->R3(Ljava/util/concurrent/atomic/AtomicInteger;)V

    return-void
.end method

.method private synthetic U3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->setAvailableCoin(Ljava/lang/Long;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic P3(Ll/jne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->onSengGiftFromMultipleGift()Ll/v3f$d;

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

.method public final synthetic R3(Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->q0(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->K0(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic S3(Ljava/util/concurrent/atomic/AtomicInteger;Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    if-lez p3, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->K0(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    if-eqz p2, :cond_1

    .line 23
    .line 24
    invoke-interface {p2}, Ll/x20;->call()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->q0(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/nln;->i:Ll/kcg0;

    .line 36
    .line 37
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T3(Ll/ib0;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/nln;->j:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0xbb8

    .line 9
    .line 10
    cmp-long p1, v0, v2

    .line 11
    .line 12
    if-ltz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 15
    .line 16
    iget-object p0, p0, Ll/dum;->j:Ll/x6t;

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/x6t;->L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public V3(Ll/ib0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/nln;->W3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 7
    .line 8
    new-instance v1, Ll/kln;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/kln;-><init>(Ll/nln;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->G0(Ll/ib0;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlGiftComboEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;->newComboVisible()Ll/v3f$d;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public W3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nln;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X3(ILl/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nln;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    div-int/lit16 p1, p1, 0x3e8

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v1, 0x1

    .line 23
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 24
    .line 25
    invoke-virtual {p1, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v1, Ll/lln;

    .line 34
    .line 35
    invoke-direct {v1, p0, v0}, Ll/lln;-><init>(Ll/nln;Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v1, Ll/mln;

    .line 43
    .line 44
    invoke-direct {v1, p0, v0, p2}, Ll/mln;-><init>(Ll/nln;Ljava/util/concurrent/atomic/AtomicInteger;Ll/x20;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Ll/nln;->i:Ll/kcg0;

    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public Y3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/nln;->j:J

    .line 6
    .line 7
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nln;->W3()V

    .line 5
    .line 6
    .line 7
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlGiftComboEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;->comboEvent()Ll/v3f$d;

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
    new-instance v1, Ll/gln;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/gln;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/hln;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/hln;-><init>(Ll/nln;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/iln;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/iln;-><init>(Ll/nln;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/oo2;->t1()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/jln;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/jln;-><init>(Ll/nln;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

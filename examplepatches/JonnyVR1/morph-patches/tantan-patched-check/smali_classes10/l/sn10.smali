.class public Ll/sn10;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/ou40;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

.field public final j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

.field public final k:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/ou40;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/on10;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/on10;-><init>(Ll/sn10;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/sn10;->k:Ljava/lang/Runnable;

    .line 10
    .line 11
    iput-object p2, p0, Ll/sn10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 12
    .line 13
    iput-object p3, p0, Ll/sn10;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic J3(Ll/sn10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/sn10;->W3()V

    return-void
.end method

.method public static synthetic K3(Ll/sn10;Ll/fyb;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sn10;->U3(Ll/fyb;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M3(Ll/sn10;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sn10;->X3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic N3(Ll/sn10;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sn10;->S3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/sn10;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sn10;->Y3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic P3(Ll/fyb;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/fyb;->a:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic R3(Ll/fyb;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ctyp signal:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Ll/fyb;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic W3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->r()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 14
    .line 15
    invoke-static {v0}, Ll/fn10;->i(Ll/dum;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->r8:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method private synthetic X3(Ll/vxj0;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, v0}, Ll/sn10;->Z3(ZLl/fyb;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final S3()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/fyb;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/sn10;->V3()Ll/fyb;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->ctypChanged()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lrx/c;

    .line 24
    .line 25
    new-instance v1, Ll/pn10;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/pn10;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v1, Ll/qn10;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/qn10;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v0, p0}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final T3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sn10;->k:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/i6t;->E3(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x9c4

    .line 7
    .line 8
    iget-object v2, p0, Ll/sn10;->k:Ljava/lang/Runnable;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1, v2}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final U3(Ll/fyb;)V
    .locals 2

    .line 1
    iget v0, p1, Ll/fyb;->a:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-virtual {p0, v0, p1}, Ll/sn10;->Z3(ZLl/fyb;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final V3()Ll/fyb;
    .locals 2

    .line 1
    new-instance v0, Ll/iu70;

    .line 2
    .line 3
    const/16 v1, 0x1770

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/iu70;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/fyb;

    .line 13
    .line 14
    return-object p0
.end method

.method public final Y3(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->selfLeaveCall()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, p1, v0}, Ll/sn10;->Z3(ZLl/fyb;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final Z3(ZLl/fyb;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "audience setCallSwitch enable:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/t610;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 21
    .line 22
    invoke-direct {v0, p1, v1}, Ll/t610;-><init>(ZLcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/rn10;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/rn10;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/t610;->a(Ll/z20;)Ll/t610;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    if-eqz p1, :cond_1

    .line 44
    .line 45
    new-instance p1, Ll/dj10;

    .line 46
    .line 47
    iget-object v1, p0, Ll/sn10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 48
    .line 49
    iget-object v2, p0, Ll/sn10;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 50
    .line 51
    iget p2, p2, Ll/fyb;->d:I

    .line 52
    .line 53
    invoke-static {p2}, Ll/tm10;->a(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-direct {p1, v1, v2, p2}, Ll/dj10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ll/t610;->b(Ll/g0m;)Ll/t610;

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->prepareCloseMultiCall()Ll/v3f$d;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;->motionSwitch()Ll/v3f$d;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/sn10;->T3()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/sn10;->k:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/i6t;->E3(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
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
    check-cast v0, Ll/ou40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/kn10;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/kn10;-><init>(Ll/sn10;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/ln10;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/ln10;-><init>(Ll/sn10;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Ll/pcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/mn10;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/mn10;-><init>(Ll/sn10;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->closeMultiCallMotion()Ll/v3f$c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lrx/c;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/nn10;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/nn10;-><init>(Ll/sn10;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void
.end method

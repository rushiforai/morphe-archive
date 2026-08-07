.class public Ll/jo10;
.super Ll/ar10;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar10<",
        "Ll/ou40;",
        ">;"
    }
.end annotation


# instance fields
.field public final n:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Ll/jn10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/ou40;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;",
            "Ll/jn10;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ar10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Ll/td10;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/jo10;->n:Ljava/util/HashSet;

    .line 10
    .line 11
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;

    .line 12
    .line 13
    invoke-direct {p2, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/presenter/MultiCallApplyDlgPresenter;-><init>(Ll/dum;Ll/jn10;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic J4(Ll/jo10;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jo10;->P4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic K4(Ll/jo10;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jo10;->Q4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic L4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic M4(Ll/jo10;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jo10;->R4(Ljava/lang/Object;)V

    return-void
.end method

.method private O4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/fp10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Ll/gyb;

    .line 15
    .line 16
    const/16 v1, 0x1770

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ll/gyb;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/fyb;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v2, "checkCtypChanged newCtyp is  "

    .line 33
    .line 34
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget v2, v0, Ll/fyb;->a:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v1}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget v0, v0, Ll/fyb;->a:I

    .line 50
    .line 51
    iget-object p0, p0, Ll/ar10;->i:Lrx/subjects/a;

    .line 52
    .line 53
    const/4 v1, 0x3

    .line 54
    if-ne v0, v1, :cond_2

    .line 55
    .line 56
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private P4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p1, v0, :cond_2

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p0}, Ll/bf10;->P(Ll/i6t;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->A()V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void

    .line 26
    :cond_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->l()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic R4(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jo10;->O4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B4(Landroid/util/Pair;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ll/le10;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/le10;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/le10;->v()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ho10;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/ho10;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    xor-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 28
    .line 29
    move-object v1, v0

    .line 30
    check-cast v1, Ll/le10;

    .line 31
    .line 32
    iget v1, v1, Ll/le10;->d:I

    .line 33
    .line 34
    const/4 v2, 0x3

    .line 35
    if-ne v1, v2, :cond_0

    .line 36
    .line 37
    check-cast v0, Ll/le10;

    .line 38
    .line 39
    iget-object v0, v0, Ll/le10;->c:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/jo10;->N4()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-super {p0, p1}, Ll/ar10;->B4(Landroid/util/Pair;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final N4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jo10;->o:Ll/kcg0;

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->onReceiveStreamMembers()Ll/v3f$d;

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
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/io10;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/io10;-><init>(Ll/jo10;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Ll/jo10;->o:Ll/kcg0;

    .line 41
    .line 42
    return-void
.end method

.method public final Q4(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handle stream members size : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/jo10;->n:Ljava/util/HashSet;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/jo10;->n:Ljava/util/HashSet;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/jo10;->n:Ljava/util/HashSet;

    .line 33
    .line 34
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->selfLeaveCall()Ll/v3f$d;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Landroid/util/Pair;

    .line 62
    .line 63
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Ll/ar10;->i:Lrx/subjects/a;

    .line 70
    .line 71
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-direct {p1, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    invoke-super {p0, p1}, Ll/ar10;->B4(Landroid/util/Pair;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Ll/jo10;->o:Ll/kcg0;

    .line 84
    .line 85
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 86
    .line 87
    .line 88
    :cond_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar10;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/jo10;->o:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar10;->t()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/jo10;->O4()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->ctypChanged()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lrx/c;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->videoSizeChanged()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lrx/c;

    .line 38
    .line 39
    invoke-static {v0, v1}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/fo10;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/fo10;-><init>(Ll/jo10;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/go10;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/go10;-><init>(Ll/jo10;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

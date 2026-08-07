.class public Ll/rll;
.super Ll/qhl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qhl<",
        "TD;",
        "Ll/wkl;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qhl;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wkl;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/wkl;-><init>(Lcom/p1/mobile/android/app/Act;Ll/rll;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic W3(Ll/tll;Ll/tll;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tll;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Ll/tll;->a()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public static synthetic X3(ILl/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/qhl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/qhl;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/qhl;->T3()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne v0, p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/qhl;->V3()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic Y3(Ljava/util/List;Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/qhl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p1, Ll/qhl;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/qhl;->S3()Ll/tll;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic Z3(Ll/rll;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rll;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    return-void
.end method

.method public static synthetic a4(Ll/rll;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rll;->c4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic c4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/wkl;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/wkl;->M()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private e4(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/qll;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ll/qll;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public R3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->R3()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ell;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ell;-><init>(Ll/dum;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/d2c;

    .line 15
    .line 16
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ll/d2c;-><init>(Ll/dum;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/mwp0;

    .line 25
    .line 26
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ll/mwp0;-><init>(Ll/dum;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->HourLeaderBoardEvent:Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;->show()Ll/v3f$d;

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
    new-instance v1, Ll/pll;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/pll;-><init>(Ll/rll;)V

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

.method public b4()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/tll;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v1, Ll/mll;

    .line 21
    .line 22
    invoke-direct {v1, v0}, Ll/mll;-><init>(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/nll;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/nll;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-object v0
.end method

.method public final synthetic d4(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/wkl;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wkl;->K(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f4(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rll;->e4(I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/qhl;->U3(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/oo2;->y1(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/oo2;->g0()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/oll;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/oll;-><init>(Ll/rll;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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

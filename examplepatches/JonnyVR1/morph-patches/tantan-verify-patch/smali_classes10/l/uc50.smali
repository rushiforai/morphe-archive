.class public Ll/uc50;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/mc50;",
        "Ll/pc50;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/mc50;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/pc50;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/pc50;-><init>(Ll/uc50;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x5

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic T3(Ll/uc50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uc50;->a4()V

    return-void
.end method

.method public static synthetic U3(Ll/uc50;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uc50;->X3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic V3(Ll/uc50;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uc50;->b4(Ljava/lang/Long;)V

    return-void
.end method

.method private X3(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Ll/uc50;->c4()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/uc50;->d4()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic b4(Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x5

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/pc50;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/uc50;->Z3()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast v0, Ll/pc50;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p0, Ll/pc50;

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    rsub-int/lit8 p1, p1, 0x5

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/pc50;->L(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private c4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pc50;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/mc50;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ll/mc50;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/oo2;->u0()Lcom/p1/mobile/putong/data/Followship;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/mc50;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, v1, v2, p0}, Ll/pc50;->M(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private d4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mc50;

    .line 6
    .line 7
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/rc50;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/rc50;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/sc50;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/sc50;-><init>(Ll/uc50;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/mc50;

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
    new-instance v1, Ll/qc50;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/qc50;-><init>(Ll/uc50;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public W3()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    new-instance v2, Ll/tc50;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/tc50;-><init>(Ll/uc50;)V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    const-string v4, "OfficialShowCardDialog"

    .line 18
    .line 19
    invoke-virtual {v0, v3, v1, v4, v2}, Ll/oo2;->e0(ZLjava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, p0, v1}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "LiveEnd"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/tfs$a;->a()Ll/tfs;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "p_user_live_end"

    .line 46
    .line 47
    invoke-static {v0, p0}, Ll/afu;->c(Ljava/lang/String;Ll/tfs;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public Y3(Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/mc50;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ll/mc50;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ll/mc50;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ll/mc50;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorLiveId:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->anchorRoomId:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_NO_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public Z3()V
    .locals 2

    .line 1
    new-instance v0, Ll/t35;

    .line 2
    .line 3
    const/16 v1, 0xd48

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/t35;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ca:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->switchNextLive()Ll/v3f$c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic a4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/pc50;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pc50;->K()V

    .line 6
    .line 7
    .line 8
    const-string p0, "\u8ba2\u9605\u6210\u529f"

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

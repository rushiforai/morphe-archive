.class public Ll/a3n0;
.super Ll/ixm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ixm0<",
        "Ll/jqm0;",
        ">;"
    }
.end annotation


# instance fields
.field public l:J


# direct methods
.method public constructor <init>(Ll/dum;Ll/sam;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ixm0;-><init>(Ll/dum;Ll/sam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J4(Ll/a3n0;Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a3n0;->T4(Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;)V

    return-void
.end method

.method public static synthetic K4(Ll/a3n0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a3n0;->S4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic L4(Ll/a3n0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a3n0;->U4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic M4(Ljava/util/List;Ll/hrk0$a;)Ljava/util/List;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic N4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic O4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P4(Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/hrk0$a;->b:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private S4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    const/4 v0, 0x4

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Ll/sam;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-interface {p0, p1}, Ll/sam;->setVisible(Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    check-cast p0, Ll/sam;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-interface {p0, p1}, Ll/sam;->setVisible(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public A4(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/a3n0;->Q4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->xj:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Ll/a3n0;->l:J

    .line 22
    .line 23
    invoke-static {}, Ll/v1n0;->d()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/jqm0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 37
    .line 38
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    new-instance v0, Ll/bzm0;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-virtual {v0, p1}, Ll/bzm0;->g(I)Ll/bzm0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-virtual {p0, v0, p1}, Ll/a3n0;->R4(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final Q4()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/a3n0;->l:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x1f4

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-gez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public final R4(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->requestChangeCallPosition(Ljava/lang/String;I)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/y2n0;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/y2n0;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/z2n0;

    .line 15
    .line 16
    invoke-direct {p2}, Ll/z2n0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic T4(Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarConfig;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarConfig;->connectorImage:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Ll/ixm0;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final U4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserRightResource;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/x2n0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/x2n0;-><init>(Ll/a3n0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m4(Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ixm0;->m4(Ll/hrk0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ixm0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/jqm0;

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
    new-instance v1, Ll/t2n0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/t2n0;-><init>(Ll/a3n0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/jqm0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ll/jqm0;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->getEnterRoomEffect(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Ll/jqm0;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/rwn0;->Q2()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/u2n0;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/u2n0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    new-instance v2, Ll/v2n0;

    .line 74
    .line 75
    invoke-direct {v2}, Ll/v2n0;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/4 v1, 0x1

    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/w2n0;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/w2n0;-><init>(Ll/a3n0;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public z4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p2, p2, Ll/nsv;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p2, Ll/h64;

    .line 16
    .line 17
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p2, p2, Ll/h64;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, p1, p2}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

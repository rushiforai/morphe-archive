.class public Ll/wl10;
.super Ll/uh10;
.source "SourceFile"


# instance fields
.field public final k:I

.field public final l:Ll/t7g0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/td10;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/mu40;",
            ">;",
            "Ll/td10<",
            "Ll/mu40;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/uh10;-><init>(Ll/dum;Ll/td10;)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Ll/wl10;->k:I

    .line 5
    .line 6
    new-instance p3, Ll/bd10;

    .line 7
    .line 8
    invoke-direct {p3, p1, p2}, Ll/bd10;-><init>(Ll/dum;Ll/td10;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Ll/sc10;

    .line 16
    .line 17
    iput-object p2, p0, Ll/en10;->j:Ll/sc10;

    .line 18
    .line 19
    new-instance p2, Ll/t7g0;

    .line 20
    .line 21
    invoke-direct {p2, p1}, Ll/t7g0;-><init>(Ll/dum;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ll/t7g0;

    .line 29
    .line 30
    iput-object p1, p0, Ll/wl10;->l:Ll/t7g0;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic A4(Ll/wl10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl10;->G4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method private L4(Ll/r610;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ul10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ul10;-><init>(Ll/wl10;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/r610;->n(Ll/x84$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic s4(Ll/wl10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl10;->F4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic t4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "request multi cal push params failed"

    .line 2
    .line 3
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic u4(Ll/wl10;Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl10;->I4(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w4(Ll/wl10;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl10;->C4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Ll/pf60;
    .locals 1

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic y4(Ll/wl10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl10;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static synthetic z4(Ll/wl10;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl10;->E4(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final B4()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "friends"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "start-live"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "multi-call-button"

    .line 23
    .line 24
    return-object p0
.end method

.method public final C4(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ql10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ql10;-><init>(Ll/wl10;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final D4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleOwnerComeBack callId"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "multiCallOwner"

    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/ve10;->i(Ll/i6t;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/wl10;->j4()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/en10;->j:Ll/sc10;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ll/sc10;->K3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/en10;->j:Ll/sc10;

    .line 34
    .line 35
    check-cast p0, Ll/bd10;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/bd10;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final E4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->c4(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/en10;->i:Ll/td10;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/td10;->a4(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic F4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/wl10;->D4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v0, "handleOldData hangup"

    .line 16
    .line 17
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 33
    .line 34
    const-string p1, "recover hangup"

    .line 35
    .line 36
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic G4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->addWatchList()Ll/v3f$d;

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

.method public final synthetic H4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 1

    .line 1
    const-string v0, "owner apply"

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/bf10;->i0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "multiCallOwner"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/ve10;->i(Ll/i6t;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ll/td10;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/en10;->j:Ll/sc10;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/sc10;->K3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/en10;->j:Ll/sc10;

    .line 22
    .line 23
    check-cast v0, Ll/bd10;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ll/bd10;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 37
    .line 38
    const-string v0, "friends"

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openManageDialog()Ll/v3f$d;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget p0, p0, Ll/wl10;->k:I

    .line 57
    .line 58
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public final synthetic I4(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->provider:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ll/en10;->U3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/vl10;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/vl10;-><init>(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final J4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "friends"

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/w7g0;

    .line 20
    .line 21
    const/16 v1, 0x1770

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/w7g0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Ll/wl10;->l:Ll/t7g0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/t7g0;->P3()V

    .line 41
    .line 42
    .line 43
    const-string p0, "multi call owner onPushStarting"

    .line 44
    .line 45
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final K4()V
    .locals 10

    .line 1
    const-string v0, "ownerApplyCall"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/le10;->w()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    sget-object v5, Ll/cd10;->i:Ljava/lang/String;

    .line 29
    .line 30
    sget-object v6, Ll/cd10;->l:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/oo2;->D0()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v8

    .line 40
    invoke-virtual {p0}, Ll/wl10;->B4()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v9

    .line 44
    const-string v4, ""

    .line 45
    .line 46
    const/4 v7, 0x1

    .line 47
    invoke-static/range {v1 .. v9}, Ll/bf10;->n(Ll/oo2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/MultiCallApplyRequestData;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->E3(Lcom/p1/mobile/putong/live/base/data/MultiCallApplyRequestData;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/nl10;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/nl10;-><init>(Ll/wl10;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/ol10;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/ol10;-><init>(Ll/wl10;)V

    .line 71
    .line 72
    .line 73
    new-instance v2, Ll/pl10;

    .line 74
    .line 75
    invoke-direct {v2, p0}, Ll/pl10;-><init>(Ll/wl10;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public M4(Ll/pf60;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0x1770

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/r610;

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ll/wl10;->L4(Ll/r610;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/h910;

    .line 18
    .line 19
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 20
    .line 21
    move-object v3, v2

    .line 22
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 23
    .line 24
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 25
    .line 26
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 27
    .line 28
    move-object v4, v2

    .line 29
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 30
    .line 31
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 32
    .line 33
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 34
    .line 35
    move-object v5, v2

    .line 36
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 37
    .line 38
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 39
    .line 40
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 41
    .line 42
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 45
    .line 46
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 47
    .line 48
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v6, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 55
    .line 56
    iget-object v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 57
    .line 58
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 59
    .line 60
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    iget-object v7, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v7, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 67
    .line 68
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 69
    .line 70
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    move-object v8, p1

    .line 73
    check-cast v8, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    .line 74
    .line 75
    iget-object p1, p0, Ll/en10;->i:Ll/td10;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/td10;->b4()Ll/le10;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p1}, Ll/le10;->u()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    const/4 v10, 0x1

    .line 86
    move-object v11, v5

    .line 87
    move-object v5, v2

    .line 88
    move-object v2, v3

    .line 89
    move-object v3, v4

    .line 90
    move-object v4, v11

    .line 91
    invoke-direct/range {v1 .. v10}, Ll/h910;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;Ljava/lang/String;Z)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Ll/r610;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->callBottomButtonApiDiffRefresh()Ll/v3f$c;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public Y3(Ll/x84;)Ll/x84;
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/uh10;->Y3(Ll/x84;)Ll/x84;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/x84;->b()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_3

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/4 v1, 0x6

    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    const/4 v1, 0x7

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    const/16 v1, 0xb

    .line 21
    .line 22
    if-eq v0, v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/wl10;->J4()V

    .line 26
    .line 27
    .line 28
    return-object p1

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->stopLive()Ll/v3f$d;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-object p1

    .line 51
    :cond_2
    iget-object p0, p0, Ll/en10;->j:Ll/sc10;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/x84;->g()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/sc10;->O3(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-object p1

    .line 61
    :cond_3
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p1}, Ll/x84;->g()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Ll/le10;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 82
    .line 83
    const-string v1, "anchor-sdk-leave"

    .line 84
    .line 85
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    new-instance v0, Ll/ml10;

    .line 94
    .line 95
    invoke-direct {v0}, Ll/ml10;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    :cond_4
    :goto_0
    return-object p1
.end method

.method public j4()V
    .locals 3

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0x1770

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/h0m;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string v0, "owner request call token and refresh Stream Url"

    .line 28
    .line 29
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget-object v1, Ll/cd10;->W:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->P6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/rl10;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/rl10;-><init>(Ll/wl10;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/sl10;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/sl10;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/tl10;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/tl10;-><init>(Ll/wl10;)V

    .line 71
    .line 72
    .line 73
    new-instance v2, Ll/pl10;

    .line 74
    .line 75
    invoke-direct {v2, p0}, Ll/pl10;-><init>(Ll/wl10;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public k4()V
    .locals 2

    .line 1
    const-string v0, "real stop multi call push"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "friends"

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    new-instance v0, Ll/z310;

    .line 25
    .line 26
    const/16 v1, 0x1770

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/h0m;

    .line 36
    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 56
    .line 57
    const-string v1, "close live"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/td10;->a4(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->stopLive()Ll/v3f$d;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_0
    return-void

    .line 84
    :cond_3
    invoke-super {p0}, Ll/uh10;->k4()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/en10;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, "friends"

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/wl10;->K4()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->onGoing:Z

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->B5(Ljava/lang/String;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/ll10;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/ll10;-><init>(Ll/wl10;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    const-string p0, "friends live  getOnGoingCallList"

    .line 89
    .line 90
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    invoke-virtual {p0}, Ll/wl10;->K4()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.class public Ll/jn10;
.super Ll/td10;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/td10<",
        "Ll/ou40;",
        ">;"
    }
.end annotation


# instance fields
.field public m:Z

.field public n:Z

.field public o:Z


# direct methods
.method public constructor <init>(Ll/dum;Ll/dj10;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/ou40;",
            ">;",
            "Ll/dj10;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/td10;-><init>(Ll/dum;Ll/dj10;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/jn10;->n:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/jn10;->o:Z

    .line 9
    .line 10
    new-instance v0, Ll/eo10;

    .line 11
    .line 12
    iget-object v1, p2, Ll/dj10;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 13
    .line 14
    invoke-direct {v0, p1, v1, p0}, Ll/eo10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;Ll/jn10;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/en10;

    .line 22
    .line 23
    iput-object v0, p0, Ll/td10;->l:Ll/en10;

    .line 24
    .line 25
    new-instance v0, Ll/hcs;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/hcs;-><init>(Ll/dum;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/jo10;

    .line 34
    .line 35
    iget-object p2, p2, Ll/dj10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 36
    .line 37
    invoke-direct {v0, p1, p2, p0}, Ll/jo10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Ll/jn10;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 41
    .line 42
    .line 43
    new-instance p2, Ll/nv2;

    .line 44
    .line 45
    invoke-direct {p2, p1}, Ll/nv2;-><init>(Ll/dum;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 49
    .line 50
    .line 51
    new-instance p2, Ll/cq10;

    .line 52
    .line 53
    invoke-direct {p2, p1}, Ll/cq10;-><init>(Ll/dum;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 57
    .line 58
    .line 59
    new-instance p2, Ll/dc10;

    .line 60
    .line 61
    invoke-direct {p2, p1}, Ll/dc10;-><init>(Ll/dum;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic A4(Ll/jn10;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jn10;->B4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic y4(Ll/jn10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jn10;->C4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V

    return-void
.end method

.method public static synthetic z4(Ll/jn10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jn10;->D4(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final B4(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/td10;->w4(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/jn10;->o:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/jn10;->o:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->hasGetMultiCallList()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->callBottomButtonApiDiffRefresh()Ll/v3f$c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->showAudienceApplyIcon()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerMultiCallOrder:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/le10;->n(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/jn10;->E4()V

    .line 77
    .line 78
    .line 79
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerUserId:Ljava/lang/String;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->A4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance v0, Ll/in10;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Ll/in10;-><init>(Ll/jn10;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    :cond_1
    return-void
.end method

.method public final synthetic C4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->freeCall:Z

    .line 6
    .line 7
    iput-boolean p1, v0, Ll/le10;->b:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->refreshCallView()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic D4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jn10;->F4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final E4()V
    .locals 2

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
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/bf10;->E(Ll/i6t;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Ll/ve10;->g(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string v0, "live"

    .line 29
    .line 30
    :goto_0
    invoke-static {p0, v0}, Ll/ve10;->i(Ll/i6t;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public F4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/td10;->l:Ll/en10;

    .line 2
    .line 3
    instance-of v0, p0, Ll/eo10;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/eo10;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/eo10;->L4()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/td10;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->callBottomButtonApiDiffRefresh()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/td10;->t()V

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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->B5(Ljava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/gn10;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/gn10;-><init>(Ll/jn10;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/r5k;

    .line 28
    .line 29
    invoke-direct {v2}, Ll/r5k;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->switchToVideo()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/hn10;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/hn10;-><init>(Ll/jn10;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

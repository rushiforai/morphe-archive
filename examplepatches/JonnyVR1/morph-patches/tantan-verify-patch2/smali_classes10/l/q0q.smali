.class public Ll/q0q;
.super Ll/uh10;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;Ll/i0q;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/mu40;",
            ">;",
            "Ll/i0q;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/uh10;-><init>(Ll/dum;Ll/td10;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ll/sc10;

    .line 5
    .line 6
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 7
    .line 8
    invoke-direct {p2, p1, v0}, Ll/sc10;-><init>(Ll/dum;Ll/td10;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/sc10;

    .line 16
    .line 17
    iput-object p1, p0, Ll/en10;->j:Ll/sc10;

    .line 18
    .line 19
    return-void
.end method

.method private C4(Ll/r610;)V
    .locals 1

    .line 1
    new-instance v0, Ll/p0q;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/p0q;-><init>(Ll/q0q;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/r610;->n(Ll/x84$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic s4(Ll/q0q;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q0q;->z4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic t4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Ll/pf60;
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

.method public static synthetic u4(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLive;)Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 0

    .line 1
    return-object p1
.end method

.method public static synthetic v4(Ll/q0q;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q0q;->B4(Ll/pf60;)V

    return-void
.end method

.method public static synthetic w4(Ll/q0q;Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q0q;->A4(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x4(Ll/q0q;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q0q;->y4(Ljava/lang/Throwable;)V

    return-void
.end method

.method private y4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F8:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic A4(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerRoomId:Ljava/lang/String;

    .line 8
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
    new-instance v0, Ll/o0q;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/o0q;-><init>(Lcom/p1/mobile/putong/live/base/data/BLive;)V

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

.method public final synthetic B4(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/q0q;->D4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public D4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 11

    .line 1
    const-string v0, "multiCallAnchor"

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/ve10;->i(Ll/i6t;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/z310;

    .line 7
    .line 8
    const/16 v1, 0x1770

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/r610;

    .line 18
    .line 19
    invoke-direct {p0, v0}, Ll/q0q;->C4(Ll/r610;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/h910;

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 25
    .line 26
    move-object v3, v2

    .line 27
    iget-object v2, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v4, p0, Ll/en10;->i:Ll/td10;

    .line 32
    .line 33
    invoke-virtual {v4}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->roomId:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 40
    .line 41
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 42
    .line 43
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 48
    .line 49
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 50
    .line 51
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 56
    .line 57
    iget-object p1, p0, Ll/en10;->i:Ll/td10;

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/td10;->b4()Ll/le10;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ll/le10;->u()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v9

    .line 67
    iget-object p1, p0, Ll/en10;->i:Ll/td10;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1}, Ll/fp10;->e(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 74
    .line 75
    .line 76
    move-result v10

    .line 77
    move-object v8, p2

    .line 78
    invoke-direct/range {v1 .. v10}, Ll/h910;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ll/r610;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->callBottomButtonApiDiffRefresh()Ll/v3f$c;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public Y3(Ll/x84;)Ll/x84;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/x84;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/x84;->g()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/en10;->i:Ll/td10;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerUserId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/uh10;->k4()V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-super {p0, p1}, Ll/uh10;->Y3(Ll/x84;)Ll/x84;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public j4()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/en10;->j4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/z310;

    .line 5
    .line 6
    const/16 v1, 0x1770

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/h0m;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const-string v0, "owner request call token and refresh Stream Url"

    .line 31
    .line 32
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerLiveId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->B5(Ljava/lang/String;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/j0q;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/j0q;-><init>(Ll/q0q;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget-object v2, Ll/cd10;->W:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->P6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v2, Ll/k0q;

    .line 71
    .line 72
    invoke-direct {v2}, Ll/k0q;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/l0q;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/l0q;-><init>(Ll/q0q;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/m0q;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/m0q;-><init>(Ll/q0q;)V

    .line 95
    .line 96
    .line 97
    new-instance v2, Ll/n0q;

    .line 98
    .line 99
    invoke-direct {v2, p0}, Ll/n0q;-><init>(Ll/q0q;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public r4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    const-string v1, "start normal push"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/td10;->a4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->switchPushToNormal()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    new-instance v0, Ll/z310;

    .line 30
    .line 31
    const/16 v1, 0x1770

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/h0m;

    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 43
    .line 44
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 49
    .line 50
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 53
    .line 54
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 61
    .line 62
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 63
    .line 64
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 69
    .line 70
    invoke-static/range {v1 .. v6}, Ll/nw40;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Ll/nw40;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-interface {p0, p1}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic z4(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/td10;->w4(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

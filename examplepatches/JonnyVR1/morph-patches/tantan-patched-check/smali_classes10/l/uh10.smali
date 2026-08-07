.class public Ll/uh10;
.super Ll/en10;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/en10<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Ll/td10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/mu40;",
            ">;",
            "Ll/td10<",
            "Ll/mu40;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/en10;-><init>(Ll/dum;Ll/td10;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "refreshStreamUrl to normal failed"

    .line 2
    .line 3
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n4(Ll/uh10;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uh10;->q4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic o4(Ll/uh10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uh10;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method


# virtual methods
.method public W3(Ll/le10;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/le10;->v()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/ph10;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/ph10;-><init>(Ll/uh10;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public Y3(Ll/x84;)Ll/x84;
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/en10;->Y3(Ll/x84;)Ll/x84;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/x84;->b()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x6

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ll/vyr;

    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    invoke-direct {v0, v1}, Ll/vyr;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-object p1

    .line 31
    :cond_0
    invoke-virtual {p1}, Ll/x84;->b()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v1, 0x4

    .line 36
    if-ne v0, v1, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Ll/en10;->i:Ll/td10;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1}, Ll/x84;->g()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/le10;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ll/fn10;->b(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    invoke-static {p0}, Ll/fn10;->j(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->mutedByUserIds:Ljava/util/List;

    .line 65
    .line 66
    new-instance v0, Ll/th10;

    .line 67
    .line 68
    invoke-direct {v0}, Ll/th10;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    invoke-virtual {p1, p0}, Ll/x84;->m(Z)Ll/x84;

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v1, "live handleSDKCallback mute:"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-object p1
.end method

.method public f4()V
    .locals 2

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
    move-result-object p0

    .line 12
    check-cast p0, Ll/h0m;

    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-interface {p0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

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
    if-nez v0, :cond_1

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_1
    invoke-interface {p0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-class v0, Ll/p910;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->T0(Ljava/lang/Class;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/p910;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/p910;->K1()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public i4(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/cd10;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setRestartWithURL:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/z310;

    .line 21
    .line 22
    const/16 v1, 0x1770

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ll/h0m;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    check-cast p0, Ll/p910;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/p910;->H1(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public k4()V
    .locals 3

    .line 1
    const-string v0, "real stop multi call push"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

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
    check-cast v0, Ll/h0m;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v1, Ll/cd10;->X:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->P6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/qh10;

    .line 56
    .line 57
    invoke-direct {v1}, Ll/qh10;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/rh10;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/rh10;-><init>(Ll/uh10;)V

    .line 67
    .line 68
    .line 69
    new-instance v2, Ll/sh10;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/sh10;-><init>(Ll/uh10;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    :cond_2
    :goto_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/vyr;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-direct {v0, v1}, Ll/vyr;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic p4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 2

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
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Ll/fn10;->b(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/r410;

    .line 16
    .line 17
    const/16 v1, 0x1770

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/xzl;

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {p1}, Ll/bf10;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-interface {p0, v0, p1}, Ll/xzl;->Y(IZ)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final synthetic q4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/en10;->i:Ll/td10;

    .line 2
    .line 3
    const-string p1, "refreshStreamUrl to normal failed"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/td10;->a4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
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
    const/16 v1, 0x1770

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/data/BLive;->setFrom(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->switchPushToNormal()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    new-instance v0, Ll/z310;

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/h0m;

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 46
    .line 47
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 52
    .line 53
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 56
    .line 57
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 58
    .line 59
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 64
    .line 65
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 66
    .line 67
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 72
    .line 73
    invoke-static/range {v1 .. v6}, Ll/nw40;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Ll/nw40;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-interface {p0, p1}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 78
    .line 79
    .line 80
    return-void
.end method

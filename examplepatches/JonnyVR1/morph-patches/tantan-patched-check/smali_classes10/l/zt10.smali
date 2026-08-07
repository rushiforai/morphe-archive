.class public Ll/zt10;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/zt10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/zt10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zt10;->O3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    return-void
.end method

.method public static synthetic K3(Ll/zt10;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zt10;->M3(Ll/vxj0;)V

    return-void
.end method

.method private synthetic M3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zt10;->N3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final L3()V
    .locals 3

    .line 1
    new-instance v0, Ll/ts10;

    .line 2
    .line 3
    const/16 v1, 0x1770

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/ts10;-><init>(I)V

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
    new-instance v2, Ll/z310;

    .line 15
    .line 16
    invoke-direct {v2, v1}, Ll/z310;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/h0m;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    check-cast p0, Ll/p910;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVYQ1ZRSEJPNUtDTEw1STRDWjUzVjRCU1NINEFNNDEzIiwidyI6NzUwLCJoIjo3NTAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjIwODcxOTk3NjUzMTU1NDU0NH0.png"

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpUQVIzWDRFWFhLUTRXQVdaSDI3QldDS0JWVlhMUTEyIiwidyI6Mzc1LCJoIjozNzUsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5MTg0ODg4NjEwMzA5NDc0MDU1fQ.png"

    .line 51
    .line 52
    :goto_0
    iput-object v0, p0, Ll/p910;->q:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/p910;->K1()V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public final N3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zt10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/zt10;->L3()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/vyr;

    .line 21
    .line 22
    const/4 v1, 0x3

    .line 23
    invoke-direct {v0, v1}, Ll/vyr;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final O3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/zt10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/zt10;->L3()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Ll/vyr;

    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    invoke-direct {p1, v0}, Ll/vyr;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public P3(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zt10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;->l0(IZ)V

    .line 4
    .line 5
    .line 6
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnStart()Ll/v3f$d;

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
    new-instance v1, Ll/xt10;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/xt10;-><init>(Ll/zt10;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnPunishing()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/xt10;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/xt10;-><init>(Ll/zt10;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnEnd()Ll/v3f$c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/yt10;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/yt10;-><init>(Ll/zt10;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/zt10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

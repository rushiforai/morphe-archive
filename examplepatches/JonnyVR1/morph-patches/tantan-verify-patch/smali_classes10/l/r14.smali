.class public Ll/r14;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

.field public final j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

.field public final k:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/r14;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 5
    .line 6
    iput-object p3, p0, Ll/r14;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 7
    .line 8
    iput-object p4, p0, Ll/r14;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/r14;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r14;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    return-void
.end method

.method public static synthetic L3(Ll/r14;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r14;->P3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    return-void
.end method

.method public static synthetic M3(Ll/r14;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r14;->O3(Ll/jsv;)V

    return-void
.end method

.method private O3(Ll/jsv;)V
    .locals 0

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
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Ll/r14;->R3(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public final N3(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;->on:Z

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/dw40;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "obs"

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    xor-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    and-int/2addr p1, v0

    .line 26
    invoke-virtual {p0, p1}, Ll/r14;->R3(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final P3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Ll/r14;->R3(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/r14;->R3(Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final R3(Z)V
    .locals 4

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
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/t610;

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_connect:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 21
    .line 22
    invoke-direct {v0, p1, v1}, Ll/t610;-><init>(ZLcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    new-instance p1, Ll/z34;

    .line 28
    .line 29
    iget-object v1, p0, Ll/r14;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 30
    .line 31
    iget-object v2, p0, Ll/r14;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 32
    .line 33
    iget-object v3, p0, Ll/r14;->k:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 34
    .line 35
    invoke-direct {p1, v1, v2, v3}, Ll/z34;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ll/t610;->b(Ll/g0m;)Ll/t610;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v1, Ll/q14;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/q14;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v1}, Ll/t610;->a(Ll/z20;)Ll/t610;

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->roomCall()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p1, v1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;->motionSwitch()Ll/v3f$d;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
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
    check-cast v0, Ll/dw40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->f()Lrx/c;

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
    new-instance v1, Ll/n14;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/n14;-><init>(Ll/r14;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/dw40;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/ew40;->f()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/o14;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/o14;-><init>(Ll/r14;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ll/dw40;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/p14;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/p14;-><init>(Ll/r14;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    return-void
.end method

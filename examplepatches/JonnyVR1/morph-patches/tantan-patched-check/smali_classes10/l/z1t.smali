.class public Ll/z1t;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic K3(Ll/z1t;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z1t;->O3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic L3(Ll/z1t;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z1t;->N3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic M3(Ll/z1t;Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowJump;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z1t;->P3(Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowJump;)V

    return-void
.end method


# virtual methods
.method public final N3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "official-show-refresh-stream-address"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {p1, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->N6(Ljava/lang/String;ILjava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/x1t;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/x1t;-><init>(Ll/z1t;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/y1t;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/y1t;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 41
    .line 42
    const-string p1, "officialShow"

    .line 43
    .line 44
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 45
    .line 46
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 47
    .line 48
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 49
    .line 50
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0}, Ll/i6t;->n3()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_NO_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->jumpRoom()Ll/v3f$d;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final O3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "officialShow"

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->I(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->H(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->u2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->finish()Ll/v3f$c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowJump;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowJump;->getOfficialShowLiveId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/z1t;->N3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

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
    check-cast v0, Ll/dw40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->S()Lrx/c;

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
    new-instance v1, Ll/v1t;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/v1t;-><init>(Ll/z1t;)V

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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;->recoverOfficialShow()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lrx/c;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/w1t;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/w1t;-><init>(Ll/z1t;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

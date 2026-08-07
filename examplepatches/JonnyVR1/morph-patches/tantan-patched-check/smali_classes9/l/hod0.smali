.class public Ll/hod0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/ou40;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

.field public final j:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

.field public k:I

.field public final l:Ljava/lang/Runnable;

.field public final m:Lcom/google/gson/Gson;

.field public n:Ll/fyb;

.field public o:Ll/xnd0;

.field public p:Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

.field public q:Ll/e510;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;Lcom/p1/mobile/putong/live/livingroom/base/player/LiveRtcPlayErrorView;Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/ou40;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;",
            "Lcom/p1/mobile/putong/live/livingroom/base/player/LiveRtcPlayErrorView;",
            "Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/hod0;->k:I

    .line 6
    .line 7
    new-instance v1, Ll/aod0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/aod0;-><init>(Ll/hod0;)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/hod0;->l:Ljava/lang/Runnable;

    .line 13
    .line 14
    new-instance v1, Ll/fyb;

    .line 15
    .line 16
    const/4 v2, -0x1

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-direct {v1, v2, v2, v3}, Ll/fyb;-><init>(IIF)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/hod0;->n:Ll/fyb;

    .line 22
    .line 23
    iput-object p2, p0, Ll/hod0;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 24
    .line 25
    iput-object p4, p0, Ll/hod0;->j:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 26
    .line 27
    new-instance p2, Lcom/google/gson/Gson;

    .line 28
    .line 29
    invoke-direct {p2}, Lcom/google/gson/Gson;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Ll/hod0;->m:Lcom/google/gson/Gson;

    .line 33
    .line 34
    new-instance p2, Ll/e510;

    .line 35
    .line 36
    invoke-direct {p2, p1}, Ll/e510;-><init>(Ll/dum;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    check-cast p2, Ll/e510;

    .line 44
    .line 45
    iput-object p2, p0, Ll/hod0;->q:Ll/e510;

    .line 46
    .line 47
    new-instance p2, Ll/xnd0;

    .line 48
    .line 49
    invoke-direct {p2, p1, p3, p0}, Ll/xnd0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/player/LiveRtcPlayErrorView;Ll/hod0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ll/xnd0;

    .line 57
    .line 58
    iput-object p1, p0, Ll/hod0;->o:Ll/xnd0;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ll/ou40;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/ou40;->P2(Z)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Ll/ou40;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/ou40;->N2(Z)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static synthetic J3(Ll/hod0;ZLcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hod0;->c4(ZLcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic K3(Ll/hod0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hod0;->e4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic L3(Ll/hod0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hod0;->V3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic M3(Ll/hod0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hod0;->d4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ll/hod0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hod0;->b4()V

    return-void
.end method

.method public static synthetic O3(Ll/hod0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hod0;->a4()V

    return-void
.end method

.method public static synthetic P3(Ll/hod0;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hod0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic R3(Ll/hod0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hod0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method private synthetic b4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/hod0;->g4(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private f4()V
    .locals 1

    .line 1
    const-string v0, "rtc\u62c9\u6d41\u6210\u529f \u505c\u6b62\u64ad\u653e\u5668pausePlayer"

    .line 2
    .line 3
    invoke-static {v0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->pausePlay()Ll/v3f$c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->playerVisible()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final S3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hod0;->j:Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/player/LivePlayerView;->j()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showLoading()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->reqRtcToken()Ll/v3f$d;

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
    new-instance v1, Ll/ynd0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ynd0;-><init>(Ll/hod0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/ou40;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

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
    new-instance v1, Ll/znd0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/znd0;-><init>(Ll/hod0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final T3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    const-string v0, "audience"

    .line 4
    .line 5
    invoke-static {p1, p2, p3, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->p7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final U3(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/hod0;->m:Lcom/google/gson/Gson;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 12
    .line 13
    iget v2, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 14
    .line 15
    iget-object v1, p0, Ll/hod0;->n:Ll/fyb;

    .line 16
    .line 17
    iget v3, v1, Ll/fyb;->a:I

    .line 18
    .line 19
    if-eq v2, v3, :cond_1

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    :goto_0
    move v6, v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->mode:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :goto_1
    new-instance v1, Ll/fyb;

    .line 30
    .line 31
    iget-wide v4, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ts:J

    .line 32
    .line 33
    invoke-direct/range {v1 .. v6}, Ll/fyb;-><init>(IIJI)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/hod0;->n:Ll/fyb;

    .line 37
    .line 38
    new-instance p1, Ll/god0;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ll/god0;-><init>(Ll/hod0;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public final V3(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x4

    .line 6
    if-eq p1, v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p1, Ll/z310;

    .line 10
    .line 11
    const/16 v0, 0xd48

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ll/z310;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Ll/r610;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/r610;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/r610;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    instance-of v0, v0, Ll/bpd0;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/r610;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ll/bpd0;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/bpd0;->p1()V

    .line 45
    .line 46
    .line 47
    :cond_1
    new-instance p1, Ll/fyb;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    const/4 v1, -0x1

    .line 51
    invoke-direct {p1, v1, v1, v0}, Ll/fyb;-><init>(IIF)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Ll/hod0;->n:Ll/fyb;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->audienceCtypData()Ll/v3f$d;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object p0, p0, Ll/hod0;->n:Ll/fyb;

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public W3(Ll/x84;)Ll/x84;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/x84;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x6

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/16 v1, 0x10

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    packed-switch v0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :pswitch_0
    invoke-virtual {p1}, Ll/x84;->e()Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/hod0;->U3(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/hod0;->o:Ll/xnd0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/xnd0;->K3()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/hod0;->S3()V

    .line 32
    .line 33
    .line 34
    return-object p1

    .line 35
    :pswitch_1
    invoke-direct {p0}, Ll/hod0;->f4()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/hod0;->l:Ljava/lang/Runnable;

    .line 39
    .line 40
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 44
    .line 45
    const-string v1, "live_enter_room_rtc"

    .line 46
    .line 47
    const-string v2, "get first video frame"

    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const-string v1, "live_swipe_in_room_rtc"

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p0}, Ll/wg80;->e(Ll/i6t;)V

    .line 58
    .line 59
    .line 60
    return-object p1

    .line 61
    :pswitch_2
    invoke-virtual {p0}, Ll/hod0;->i4()V

    .line 62
    .line 63
    .line 64
    return-object p1

    .line 65
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ll/ou40;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/vp20;->r()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_1

    .line 76
    .line 77
    :goto_0
    return-object p1

    .line 78
    :cond_1
    iget-object p0, p0, Ll/hod0;->o:Ll/xnd0;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/xnd0;->M3()V

    .line 81
    .line 82
    .line 83
    return-object p1

    .line 84
    :cond_2
    const/4 v0, 0x0

    .line 85
    iput v0, p0, Ll/hod0;->k:I

    .line 86
    .line 87
    iget-object v0, p0, Ll/hod0;->o:Ll/xnd0;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/xnd0;->K3()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/hod0;->S3()V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/hod0;->l:Ljava/lang/Runnable;

    .line 96
    .line 97
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 98
    .line 99
    .line 100
    return-object p1

    .line 101
    :cond_3
    invoke-virtual {p1}, Ll/x84;->j()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    invoke-virtual {p0, v0}, Ll/hod0;->g4(Z)V

    .line 106
    .line 107
    .line 108
    return-object p1

    .line 109
    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final X3()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v1, 0x2

    .line 32
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "rtc"

    .line 43
    .line 44
    invoke-static {p0, v1}, Ll/sjt;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_1
    :goto_0
    return v0
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hod0;->p:Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    .line 2
    .line 3
    const-string p0, "\u63d0\u524d\u83b7\u53d6\u5230token"

    .line 4
    .line 5
    invoke-static {p0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->provider:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "live"

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, p1}, Ll/hod0;->T3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ll/cod0;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/cod0;-><init>(Ll/hod0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic a4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->audienceCtypData()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/hod0;->n:Ll/fyb;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic c4(ZLcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/hod0;->q:Ll/e510;

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Ll/e510;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0, p2}, Ll/hod0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic d4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hod0;->i4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e4(Ljava/lang/Boolean;)V
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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/ou40;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/ou40;->L2()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    const-string p1, "\u6536\u5230\u64ad\u653eevent"

    .line 20
    .line 21
    invoke-static {p1}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Ll/hod0;->g4(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Ll/ou40;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/ou40;->L2()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const-string p1, "\u6536\u5230\u505c\u6b62\u64ad\u653eevent"

    .line 42
    .line 43
    invoke-static {p1}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/hod0;->h4()V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public final g4(Z)V
    .locals 3

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
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Ll/ou40;->P2(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/ou40;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "reqRtcTokenAndStartPlay pkinfo:"

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ll/ou40;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->provider:Ljava/lang/String;

    .line 57
    .line 58
    const-string v2, "live"

    .line 59
    .line 60
    invoke-virtual {p0, v1, v2, v0}, Ll/hod0;->T3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/dod0;

    .line 70
    .line 71
    invoke-direct {v1, p0, p1}, Ll/dod0;-><init>(Ll/hod0;Z)V

    .line 72
    .line 73
    .line 74
    new-instance p1, Ll/eod0;

    .line 75
    .line 76
    invoke-direct {p1, p0}, Ll/eod0;-><init>(Ll/hod0;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final h4()V
    .locals 2

    .line 1
    const-string v0, "\u89c2\u4f17\u9000\u51fartc"

    .line 2
    .line 3
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/hod0;->l4()V

    .line 7
    .line 8
    .line 9
    const-string v0, "stopMotion restartPlayer \u964d\u7ea7\u5230\u64ad\u653e\u5668\u62c9\u6d41"

    .line 10
    .line 11
    invoke-static {v0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restorePlayerView()Ll/v3f$c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restartPlay()Ll/v3f$c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->playerVisible()Ll/v3f$d;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/hod0;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;->setVisible(Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/hod0;->o:Ll/xnd0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/xnd0;->K3()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ll/ou40;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/ou40;->P2(Z)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/hod0;->l:Ljava/lang/Runnable;

    .line 76
    .line 77
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    iput v1, p0, Ll/hod0;->k:I

    .line 81
    .line 82
    return-void
.end method

.method public i4()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\u91cd\u8bd5  \u91cd\u8bd5\u6b21\u6570\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/hod0;->k:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/hod0;->k:I

    .line 21
    .line 22
    add-int/lit8 v1, v0, 0x1

    .line 23
    .line 24
    iput v1, p0, Ll/hod0;->k:I

    .line 25
    .line 26
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ll/p6s;->J0()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-ge v0, v1, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/hod0;->l:Ljava/lang/Runnable;

    .line 37
    .line 38
    invoke-static {v0}, Ll/l51;->o(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p0, p0, Ll/hod0;->l:Ljava/lang/Runnable;

    .line 49
    .line 50
    const-wide/16 v1, 0x7d0

    .line 51
    .line 52
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void

    .line 56
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ll/ou40;

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-virtual {v0, v1}, Ll/ou40;->N2(Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/hod0;->h4()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final j4(Ll/r610;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fod0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fod0;-><init>(Ll/hod0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ll/r610;->n(Ll/x84$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final k4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/hod0;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;->setVisible(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/ou40;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/ou40;->P2(Z)V

    .line 14
    .line 15
    .line 16
    const-string v0, " startMotion"

    .line 17
    .line 18
    invoke-static {v0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 22
    .line 23
    const-string v1, "live_enter_room_rtc"

    .line 24
    .line 25
    const-string v2, "startMotion"

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string v1, "live_swipe_in_room_rtc"

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/z310;

    .line 36
    .line 37
    const/16 v1, 0xd48

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/r610;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/hod0;->j4(Ll/r610;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/cpd0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Ll/ou40;

    .line 58
    .line 59
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Ll/ou40;

    .line 68
    .line 69
    invoke-virtual {v3}, Ll/oo2;->j0()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->appId:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    check-cast v5, Ll/ou40;

    .line 80
    .line 81
    invoke-virtual {v5}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 86
    .line 87
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 88
    .line 89
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channel:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v8, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v9, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->userSig:Ljava/lang/String;

    .line 100
    .line 101
    iget-object p1, p0, Ll/hod0;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 102
    .line 103
    iget-object v10, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;->a:Landroid/widget/FrameLayout;

    .line 104
    .line 105
    iget-object v11, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;->b:Landroid/widget/FrameLayout;

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Ll/ou40;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    iget-object v12, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 122
    .line 123
    invoke-direct/range {v1 .. v12}, Ll/cpd0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ll/r610;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public final l4()V
    .locals 2

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0xd48

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
    check-cast p0, Ll/r610;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/r610;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/r610;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    instance-of v0, v0, Ll/bpd0;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/r610;->b()V

    .line 31
    .line 32
    .line 33
    const-string p0, " stopMotion"

    .line 34
    .line 35
    invoke-static {p0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hod0;->l:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hod0;->o:Ll/xnd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/xnd0;->K3()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 10
    .line 11
    const-string v1, "live_enter_room_rtc"

    .line 12
    .line 13
    const-string v2, "validState"

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v1, "live_swipe_in_room_rtc"

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->audienceRtcPull()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lrx/c;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/bod0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/bod0;-><init>(Ll/hod0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v1, "audience rtc\u5f00\u5173\uff1a"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/hod0;->X3()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v1, "  isPlaying:"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Ll/ou40;

    .line 79
    .line 80
    invoke-virtual {v1}, Ll/ou40;->L2()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v0}, Ll/iod0;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ll/hod0;->X3()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_1

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ll/ou40;

    .line 105
    .line 106
    invoke-virtual {v0}, Ll/ou40;->L2()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_1

    .line 111
    .line 112
    iget-object v0, p0, Ll/hod0;->p:Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    .line 113
    .line 114
    if-eqz v0, :cond_0

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Ll/hod0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_0
    const/4 v0, 0x0

    .line 121
    invoke-virtual {p0, v0}, Ll/hod0;->g4(Z)V

    .line 122
    .line 123
    .line 124
    :cond_1
    return-void
.end method

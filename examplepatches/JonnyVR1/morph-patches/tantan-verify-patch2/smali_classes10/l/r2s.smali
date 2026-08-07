.class public Ll/r2s;
.super Ll/n54;
.source "SourceFile"


# instance fields
.field public final l:Ll/hz3;

.field public m:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/z34;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Ll/n54;-><init>(Ll/dum;Ll/z34;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/n54;->k:Lrx/subjects/a;

    .line 5
    .line 6
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/r410;

    .line 12
    .line 13
    const/16 v1, 0x1130

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/xzl;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-interface {v0, v1}, Ll/xzl;->N(Z)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/rzp;

    .line 29
    .line 30
    invoke-direct {v0, p1, p0}, Ll/rzp;-><init>(Ll/dum;Ll/r2s;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/z74;

    .line 37
    .line 38
    iget-object v1, p2, Ll/z34;->a:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    invoke-direct {v0, p1, v1, p0}, Ll/z74;-><init>(Ll/dum;Landroid/widget/FrameLayout;Ll/r2s;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/o04;

    .line 47
    .line 48
    iget-object p2, p2, Ll/z34;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 49
    .line 50
    invoke-direct {v0, p1, p2, p0}, Ll/o04;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Ll/r2s;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 54
    .line 55
    .line 56
    new-instance p2, Ll/hz3;

    .line 57
    .line 58
    invoke-direct {p2, p1, p0}, Ll/hz3;-><init>(Ll/dum;Ll/r2s;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    check-cast p2, Ll/hz3;

    .line 66
    .line 67
    iput-object p2, p0, Ll/r2s;->l:Ll/hz3;

    .line 68
    .line 69
    new-instance p2, Ll/a04;

    .line 70
    .line 71
    invoke-direct {p2, p1, p0}, Ll/a04;-><init>(Ll/dum;Ll/n54;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private A4(Ll/pf60;)V
    .locals 11
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
    const/16 v1, 0x1130

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
    new-instance v1, Ll/i04;

    .line 15
    .line 16
    iget-object v2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 17
    .line 18
    move-object v3, v2

    .line 19
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 24
    .line 25
    move-object v4, v2

    .line 26
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 27
    .line 28
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 29
    .line 30
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 31
    .line 32
    move-object v5, v2

    .line 33
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 34
    .line 35
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 36
    .line 37
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 38
    .line 39
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 42
    .line 43
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 44
    .line 45
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v6, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 52
    .line 53
    iget-object v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 54
    .line 55
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 56
    .line 57
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    iget-object v7, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v7, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 64
    .line 65
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 66
    .line 67
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 68
    .line 69
    move-object v8, p1

    .line 70
    check-cast v8, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    .line 71
    .line 72
    new-instance v9, Ll/q2s;

    .line 73
    .line 74
    invoke-direct {v9, p0}, Ll/q2s;-><init>(Ll/r2s;)V

    .line 75
    .line 76
    .line 77
    move-object v10, v5

    .line 78
    move-object v5, v2

    .line 79
    move-object v2, v3

    .line 80
    move-object v3, v4

    .line 81
    move-object v4, v10

    .line 82
    invoke-direct/range {v1 .. v9}, Ll/i04;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;Ll/z20;)V

    .line 83
    .line 84
    .line 85
    invoke-interface {v0, v1}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private C4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n54;->j:Ll/qvd;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/qvd;->s()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->callBottomButtonApiDiffRefresh()Ll/v3f$c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 17
    .line 18
    .line 19
    const-string v0, "real stop call push"

    .line 20
    .line 21
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/z310;

    .line 25
    .line 26
    const/16 v1, 0xa28

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
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ll/dw40;

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;->CALL_TO_NORMAL:Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;

    .line 66
    .line 67
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->O6(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/k2s;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/k2s;-><init>(Ll/r2s;)V

    .line 78
    .line 79
    .line 80
    new-instance v2, Ll/l2s;

    .line 81
    .line 82
    invoke-direct {v2, p0}, Ll/l2s;-><init>(Ll/r2s;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Ll/pf60;
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

.method public static synthetic p4(Ll/r2s;Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r2s;->w4(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q4(Ll/r2s;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r2s;->x4(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic r4(Ll/r2s;Ljava/lang/Integer;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/r2s;->y4(Ljava/lang/Integer;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic s4(Ll/r2s;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r2s;->A4(Ll/pf60;)V

    return-void
.end method

.method public static synthetic t4(Ll/r2s;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r2s;->v4(Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public final B4()V
    .locals 3

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0xa28

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
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

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
    const-string v0, "request call token and refresh Stream Url"

    .line 28
    .line 29
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/dw40;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;->NORMAL_TO_CALL:Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;

    .line 43
    .line 44
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->O6(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider$SwitchType;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/n2s;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/n2s;-><init>(Ll/r2s;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/o2s;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/o2s;-><init>(Ll/r2s;)V

    .line 64
    .line 65
    .line 66
    new-instance v2, Ll/l2s;

    .line 67
    .line 68
    invoke-direct {v2, p0}, Ll/l2s;-><init>(Ll/r2s;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/n54;->i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xf

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->A1:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 25
    .line 26
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ll/qvd;->w(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/16 v0, 0x1a

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->z1:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 68
    .line 69
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/n54;->j:Ll/qvd;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0, p1}, Ll/qvd;->w(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    const/16 v0, 0xe

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->is(I)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->y1:I

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 107
    .line 108
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/r2s;->C4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public u4(ZZ)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/n54;->Z3()Ll/qvd;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, p2, v0}, Ll/g64;->g(ZZLl/qvd;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/n54;->Z3()Ll/qvd;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/qvd;->m()Ll/j2s;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/j2s;->m()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    const-string p1, "start call push"

    .line 29
    .line 30
    invoke-static {p1}, Ll/g64;->d(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/r2s;->m:Ll/kcg0;

    .line 34
    .line 35
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/r2s;->B4()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    if-nez p2, :cond_1

    .line 43
    .line 44
    const-string p1, "stop call push"

    .line 45
    .line 46
    invoke-static {p1}, Ll/g64;->d(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/r2s;->m:Ll/kcg0;

    .line 50
    .line 51
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Ll/dw40;

    .line 59
    .line 60
    const/16 p2, 0xa

    .line 61
    .line 62
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 63
    .line 64
    invoke-virtual {p1, p2, v0}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const/4 p2, 0x1

    .line 73
    invoke-virtual {p1, p2}, Lrx/c;->take(I)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance p2, Ll/m2s;

    .line 78
    .line 79
    invoke-direct {p2, p0}, Ll/m2s;-><init>(Ll/r2s;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Ll/r2s;->m:Ll/kcg0;

    .line 91
    .line 92
    :cond_1
    return-void
.end method

.method public final synthetic v4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/r2s;->C4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w4(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->provider:Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "call"

    .line 20
    .line 21
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Ll/p2s;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/p2s;-><init>(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->switchPushToNormal()Ll/v3f$d;

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

.method public final y4(Ljava/lang/Integer;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/n54;->Z3()Ll/qvd;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, p2, v0}, Ll/g64;->e(Ljava/lang/Integer;Ljava/lang/Object;Ll/qvd;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p1, v0, :cond_4

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    if-eq p1, v0, :cond_3

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p1, v0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p1, v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x6

    .line 25
    if-eq p1, v0, :cond_0

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :cond_0
    new-instance p1, Ll/f510;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/dw40;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "call"

    .line 46
    .line 47
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-direct {p1, v0, v1, p2}, Ll/f510;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->renewRtcToken()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->memberVolume()Ll/v3f$d;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 79
    .line 80
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    iget-object p1, p0, Ll/n54;->j:Ll/qvd;

    .line 85
    .line 86
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p1, p2}, Ll/qvd;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    if-eqz p1, :cond_6

    .line 95
    .line 96
    iget-object p0, p0, Ll/r2s;->l:Ll/hz3;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Ll/hz3;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    iget-object p1, p0, Ll/n54;->j:Ll/qvd;

    .line 103
    .line 104
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {p1, p2}, Ll/qvd;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    if-eqz p1, :cond_6

    .line 113
    .line 114
    sget-object p2, Ll/q24;->a:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p0, p1, p2}, Ll/n54;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_4
    iget-object p1, p0, Ll/r2s;->l:Ll/hz3;

    .line 121
    .line 122
    move-object v0, p2

    .line 123
    check-cast v0, Ljava/lang/Long;

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Ll/hz3;->W3(Ljava/lang/Long;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_5

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_5
    invoke-virtual {p0}, Ll/n54;->Z3()Ll/qvd;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0}, Ll/qvd;->m()Ll/j2s;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p0, p1}, Ll/j2s;->j(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    if-eqz p0, :cond_7

    .line 149
    .line 150
    :cond_6
    :goto_0
    return-void

    .line 151
    :cond_7
    const-string p0, "there is a illegal person enter room"

    .line 152
    .line 153
    invoke-static {p0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public z4(Ll/y34;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r2s;->l:Ll/hz3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hz3;->g4(Ll/y34;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

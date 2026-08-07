.class public Ll/ggl0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/cpb0;

.field public final j:Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

.field public k:I


# direct methods
.method public constructor <init>(Ll/dum;Ll/cpb0;Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/mu40;",
            ">;",
            "Ll/cpb0;",
            "Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/ggl0;->k:I

    .line 6
    .line 7
    iput-object p3, p0, Ll/ggl0;->j:Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

    .line 8
    .line 9
    iput-object p2, p0, Ll/ggl0;->i:Ll/cpb0;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J3(Ll/ggl0;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggl0;->U3(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic K3(Ll/ggl0;Lcom/p1/mobile/putong/live/base/data/BLive;Ljava/lang/Integer;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ggl0;->V3(Lcom/p1/mobile/putong/live/base/data/BLive;Ljava/lang/Integer;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic L3(Ll/ggl0;Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ggl0;->R3(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic M3(Ll/ggl0;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggl0;->P3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic N3(Ll/ggl0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggl0;->S3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O3(Ll/ggl0;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ggl0;->T3(Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public final P3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->provider:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/ggl0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 15
    .line 16
    const-string p1, "live_anchor_call"

    .line 17
    .line 18
    const-string v0, "RtmpNormalPush"

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLive;->getFrom()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/16 v1, 0x1770

    .line 29
    .line 30
    if-eq v0, v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLive;->getFrom()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/16 v1, 0x258

    .line 37
    .line 38
    if-ne v0, v1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const-string v0, ""

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    :goto_0
    const-string v0, "pk-mutilcall-end"

    .line 45
    .line 46
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->provider:Ljava/lang/String;

    .line 53
    .line 54
    const-string v3, "anchor"

    .line 55
    .line 56
    const-string v4, "live"

    .line 57
    .line 58
    invoke-static {v1, v4, v2, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->p7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/dgl0;

    .line 67
    .line 68
    invoke-direct {v1, p0, p1}, Ll/dgl0;-><init>(Ll/ggl0;Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 69
    .line 70
    .line 71
    new-instance p1, Ll/egl0;

    .line 72
    .line 73
    invoke-direct {p1, p0}, Ll/egl0;-><init>(Ll/ggl0;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ggl0;->X3(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 5
    .line 6
    const-string p1, "live_anchor_call"

    .line 7
    .line 8
    const-string p2, "RtcNormalPus"

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic S3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/ggl0;->i:Ll/cpb0;

    .line 2
    .line 3
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ad:I

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    const-string v1, "rtc start pusher error"

    .line 7
    .line 8
    invoke-virtual {p0, v1, p1, v0}, Ll/cpb0;->r0(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/c210;

    .line 5
    .line 6
    const/16 v1, 0xa28

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/c210;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/szl;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v0, v2}, Ll/szl;->m0(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/s510;

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ll/s510;-><init>(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/d0m;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Ll/ggl0;->j:Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;->b:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-interface {v0, v1}, Ll/d0m;->b(Landroid/widget/FrameLayout;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/ggl0;->j:Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/base/pusher/LivePusherView;->c:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-interface {v0, v1}, Ll/d0m;->c(Landroid/widget/FrameLayout;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0}, Ll/d0m;->a()V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->switchPushToNormal()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lrx/c;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/bgl0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/bgl0;-><init>(Ll/ggl0;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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

.method public final synthetic T3(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget p0, p0, Ll/ggl0;->k:I

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
    const-string v0, "is_first_try"

    .line 13
    .line 14
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic U3(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget p0, p0, Ll/ggl0;->k:I

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
    const-string v0, "is_first_try"

    .line 13
    .line 14
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLive;Ljava/lang/Integer;Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    if-ne v0, p2, :cond_0

    .line 7
    .line 8
    new-instance p2, Ll/f510;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "live"

    .line 15
    .line 16
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-direct {p2, p1, v0, p3}, Ll/f510;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->renewRtcToken()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public W3()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mu40;->O2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 22
    .line 23
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->i6:I

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-static {v0, v2, v1}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/mu40;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v2, Ll/z310;

    .line 48
    .line 49
    const/16 v3, 0xa28

    .line 50
    .line 51
    invoke-direct {v2, v3}, Ll/z310;-><init>(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Ll/h0m;

    .line 59
    .line 60
    invoke-interface {v2}, Ll/h0m;->b()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ll/ggl0;->P3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 64
    .line 65
    .line 66
    iget v0, p0, Ll/ggl0;->k:I

    .line 67
    .line 68
    add-int/2addr v0, v1

    .line 69
    iput v0, p0, Ll/ggl0;->k:I

    .line 70
    .line 71
    new-instance v0, Ll/agl0;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/agl0;-><init>(Ll/ggl0;)V

    .line 74
    .line 75
    .line 76
    const-string v1, "anchor_pusher_start"

    .line 77
    .line 78
    invoke-static {p0, v1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final X3(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 10

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
    new-instance v1, Ll/fpd0;

    .line 15
    .line 16
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 17
    .line 18
    move-object v3, v2

    .line 19
    iget-object v2, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 28
    .line 29
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 30
    .line 31
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 36
    .line 37
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 38
    .line 39
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 44
    .line 45
    new-instance v9, Ll/fgl0;

    .line 46
    .line 47
    invoke-direct {v9, p0, p1}, Ll/fgl0;-><init>(Ll/ggl0;Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 48
    .line 49
    .line 50
    move-object v8, p2

    .line 51
    invoke-direct/range {v1 .. v9}, Ll/fpd0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;Ll/z20;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v1}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final Y3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 8
    .line 9
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 12
    .line 13
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 20
    .line 21
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 28
    .line 29
    invoke-static/range {v1 .. v6}, Ll/nw40;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Ll/nw40;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :try_start_0
    new-instance v0, Ll/z310;

    .line 34
    .line 35
    const/16 v1, 0xa28

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ll/h0m;

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 51
    .line 52
    const-string v1, "call sdk push done"

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    .line 59
    move-object p1, v0

    .line 60
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    const/4 p1, -0x1

    .line 64
    :goto_0
    if-eqz p1, :cond_0

    .line 65
    .line 66
    iget-object p0, p0, Ll/ggl0;->i:Ll/cpb0;

    .line 67
    .line 68
    const-string v0, "start pusher error"

    .line 69
    .line 70
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ad:I

    .line 71
    .line 72
    invoke-virtual {p0, v0, v1, p1}, Ll/cpb0;->r0(Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    new-instance v0, Ll/cgl0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cgl0;-><init>(Ll/ggl0;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "anchor_pusher_success"

    .line 7
    .line 8
    invoke-static {p0, v1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 12
    .line 13
    const-string v0, "live_anchor_call"

    .line 14
    .line 15
    const-string v1, "onPushBegin"

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

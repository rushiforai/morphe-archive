.class public Ll/qf50;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/a4m;
.implements Ll/b4m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/mc50;",
        "Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;",
        ">;",
        "Ll/a4m;",
        "Ll/b4m;"
    }
.end annotation


# instance fields
.field public final i:Ll/iob0;

.field public final j:Ll/imb0;

.field public final k:Ll/t7g0;

.field public final l:Ll/cg50;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    new-instance p2, Ll/iob0;

    .line 8
    .line 9
    invoke-direct {p2, p1, p0}, Ll/iob0;-><init>(Ll/dum;Ll/a4m;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Ll/iob0;

    .line 17
    .line 18
    iput-object p2, p0, Ll/qf50;->i:Ll/iob0;

    .line 19
    .line 20
    new-instance p2, Ll/imb0;

    .line 21
    .line 22
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/d4m;

    .line 25
    .line 26
    invoke-direct {p2, p1, p0, v0}, Ll/imb0;-><init>(Ll/dum;Ll/a4m;Ll/d4m;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Ll/imb0;

    .line 34
    .line 35
    iput-object p2, p0, Ll/qf50;->j:Ll/imb0;

    .line 36
    .line 37
    new-instance p2, Ll/t7g0;

    .line 38
    .line 39
    invoke-direct {p2, p1}, Ll/t7g0;-><init>(Ll/dum;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Ll/t7g0;

    .line 47
    .line 48
    iput-object p2, p0, Ll/qf50;->k:Ll/t7g0;

    .line 49
    .line 50
    new-instance p2, Ll/cg50;

    .line 51
    .line 52
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 53
    .line 54
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 55
    .line 56
    invoke-direct {p2, p1, p0, v0}, Ll/cg50;-><init>(Ll/dum;Ll/a4m;Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Ll/cg50;

    .line 64
    .line 65
    iput-object p1, p0, Ll/qf50;->l:Ll/cg50;

    .line 66
    .line 67
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast p1, Landroid/view/View;

    .line 70
    .line 71
    const/4 p2, 0x1

    .line 72
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 78
    .line 79
    const/4 p1, 0x0

    .line 80
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->setWaterMarkVisible(Z)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic J3(Ll/qf50;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qf50;->X3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic K3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    sget-object p1, Ll/v2t;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic L3(Ll/qf50;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qf50;->V3(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic M3(Ll/qf50;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qf50;->Z3()Z

    move-result p0

    return p0
.end method

.method public static synthetic N3(Ll/qf50;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/qf50;->b4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic O3(Ll/qf50;ILjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/qf50;->c4(ILjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic P3(Ll/qf50;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qf50;->Y3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic R3(Ll/qf50;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qf50;->W3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic S3(Landroid/net/NetworkInfo;)Ljava/lang/Object;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Ll/vxj0;->a:Ll/vxj0;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic T3(Ll/qf50;Ll/jsv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qf50;->a4(Ll/jsv;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U3(ILjava/util/Map;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "errorCode:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "error_msg"

    .line 16
    .line 17
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private V3(Landroid/net/NetworkInfo;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/qf50;->j:Ll/imb0;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/imb0;->L3()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;->NetworkStateChange:Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;

    .line 18
    .line 19
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->getErrorCode()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p0, p1, v0}, Ll/qf50;->q1(Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Ll/qf50;->j:Ll/imb0;

    .line 32
    .line 33
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 34
    .line 35
    const/16 v0, 0xa

    .line 36
    .line 37
    const-string v1, "no network connection"

    .line 38
    .line 39
    invoke-virtual {p0, v1, p1, v0}, Ll/imb0;->r0(Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private W3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, "live_update_video_quality"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;->UpdateQuality:Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p1, v0}, Ll/qf50;->q1(Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private X3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 3

    .line 1
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "refreshStreamAddress success, new address:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ",ipv6: "

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/mc50;

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ll/vp20;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {p0, v1}, Ll/qf50;->d(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLive;->isLiving()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_0

    .line 54
    .line 55
    iget-object p0, p0, Ll/qf50;->l:Ll/cg50;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/cg50;->O3()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 62
    .line 63
    const-string v1, "suspended"

    .line 64
    .line 65
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    const-string p1, "send recover event"

    .line 72
    .line 73
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->recoverLive()Ll/v3f$c;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method private Y3(Ll/jsv;)V
    .locals 1

    .line 1
    sget-object p1, Ll/v2t;->b:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "start push by living state changed"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 9
    .line 10
    const-string v0, "live_anchor_call"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/qf50;->l:Ll/cg50;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/cg50;->O3()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private Z3()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/cyr;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cyr;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Lcom/p1/mobile/android/app/c$a;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/mc50;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/jsv;->d()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    :goto_0
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "check push enable: "

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return p0
.end method

.method private synthetic a4(Ll/jsv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qf50;->Z3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic b4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qf50;->e4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c4(ILjava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qf50;->j:Ll/imb0;

    .line 2
    .line 3
    const-string p2, "refresh StreamAddress error"

    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 6
    .line 7
    invoke-virtual {p0, p2, v0, p1}, Ll/imb0;->r0(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private d4(I)V
    .locals 1

    .line 1
    new-instance v0, Ll/gf50;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/gf50;-><init>(I)V

    .line 4
    .line 5
    .line 6
    const-string p1, "anchor_pusher_error"

    .line 7
    .line 8
    invoke-static {p0, p1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private e4()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/mc50;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/oo2;->j0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/mc50;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v3, "reportStreamingHeartBeat :"

    .line 34
    .line 35
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, ":"

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->d7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance v0, Ll/pf50;

    .line 64
    .line 65
    invoke-direct {v0, v2}, Ll/pf50;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public J()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qf50;->i:Ll/iob0;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Ll/iob0;->R3(I)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v1}, Ll/qf50;->d4(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qf50;->j:Ll/imb0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/imb0;->J3(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/qf50;->i:Ll/iob0;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/iob0;->R3(I)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/qf50;->d4(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public T()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/w1f;

    .line 5
    .line 6
    const/16 v1, 0xa28

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/w1f;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/wsl;

    .line 16
    .line 17
    new-instance v2, Ll/qdt;

    .line 18
    .line 19
    new-instance v3, Ll/jf50;

    .line 20
    .line 21
    invoke-direct {v3, p0}, Ll/jf50;-><init>(Ll/qf50;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v2, p0, v3}, Ll/qdt;-><init>(Ll/b4m;Ll/pcj;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v2}, Ll/wsl;->b(Ll/w6m;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/mc50;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v2, Ll/kf50;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/kf50;-><init>(Ll/qf50;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v2, Ll/lf50;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/lf50;-><init>(Ll/qf50;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    new-instance v0, Ll/c210;

    .line 66
    .line 67
    invoke-direct {v0, v1}, Ll/c210;-><init>(I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ll/szl;

    .line 75
    .line 76
    new-instance v1, Ll/mf50;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/mf50;-><init>(Ll/qf50;)V

    .line 79
    .line 80
    .line 81
    invoke-interface {v0, v1}, Ll/szl;->y0(Ll/z20;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->i(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qf50;->i:Ll/iob0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/iob0;->T3()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qf50;->j:Ll/imb0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/imb0;->K3()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Ll/qf50;->d(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/qf50;->k:Ll/t7g0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/t7g0;->P3()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/qf50;->l:Ll/cg50;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/cg50;->l()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public q1(Lcom/p1/mobile/putong/live/livingroom/base/pusher/RefreshCause;I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qf50;->j:Ll/imb0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/imb0;->K3()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Ll/qf50;->d(Z)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "officialshow retryPushStream cause: "

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, " extraCode: "

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Ll/mc50;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, "official-show-refresh-stream-address"

    .line 52
    .line 53
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->N6(Ljava/lang/String;ILjava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Ll/nf50;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/nf50;-><init>(Ll/qf50;)V

    .line 64
    .line 65
    .line 66
    new-instance v1, Ll/of50;

    .line 67
    .line 68
    invoke-direct {v1, p0, p2}, Ll/of50;-><init>(Ll/qf50;I)V

    .line 69
    .line 70
    .line 71
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public r0(Ljava/lang/String;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qf50;->j:Ll/imb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/imb0;->r0(Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->setWaterMarkVisible(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ll/mc50;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->setWaterMarkUserId(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/mc50;

    .line 36
    .line 37
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ll/oo2;->o1(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v2, Ll/ff50;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/ff50;-><init>(Ll/qf50;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/hf50;

    .line 72
    .line 73
    invoke-direct {v1}, Ll/hf50;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/if50;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/if50;-><init>(Ll/qf50;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public y(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qf50;->j:Ll/imb0;

    .line 2
    .line 3
    const-string v1, "onSysError"

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ad:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, p1}, Ll/imb0;->r0(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Ll/qf50;->d4(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.class public Ll/cg50;
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


# instance fields
.field public final i:Ll/a4m;

.field public final j:Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

.field public k:I


# direct methods
.method public constructor <init>(Ll/dum;Ll/a4m;Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/mu40;",
            ">;",
            "Ll/a4m;",
            "Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;",
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
    iput p1, p0, Ll/cg50;->k:I

    .line 6
    .line 7
    iput-object p3, p0, Ll/cg50;->j:Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 8
    .line 9
    iput-object p2, p0, Ll/cg50;->i:Ll/a4m;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J3(Ll/cg50;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cg50;->M3(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic K3(Ll/cg50;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cg50;->N3(Ljava/util/Map;)V

    return-void
.end method

.method private L3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cg50;->P3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N3(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget p0, p0, Ll/cg50;->k:I

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

.method private P3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
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
    iget-object p0, p0, Ll/cg50;->i:Ll/a4m;

    .line 67
    .line 68
    const-string v0, "start pusher error"

    .line 69
    .line 70
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ad:I

    .line 71
    .line 72
    invoke-interface {p0, v0, v1, p1}, Ll/a4m;->r0(Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method


# virtual methods
.method public final synthetic M3(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget p0, p0, Ll/cg50;->k:I

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

.method public O3()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 9
    .line 10
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->i6:I

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {v0, v2, v1}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/dw40;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v2, Ll/z310;

    .line 35
    .line 36
    const/16 v3, 0xa28

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ll/z310;-><init>(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Ll/h0m;

    .line 46
    .line 47
    invoke-interface {v2}, Ll/h0m;->b()V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v0}, Ll/cg50;->L3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 51
    .line 52
    .line 53
    iget v0, p0, Ll/cg50;->k:I

    .line 54
    .line 55
    add-int/2addr v0, v1

    .line 56
    iput v0, p0, Ll/cg50;->k:I

    .line 57
    .line 58
    new-instance v0, Ll/ag50;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/ag50;-><init>(Ll/cg50;)V

    .line 61
    .line 62
    .line 63
    const-string v1, "anchor_pusher_start"

    .line 64
    .line 65
    invoke-static {p0, v1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 66
    .line 67
    .line 68
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
    iget-object v1, p0, Ll/cg50;->j:Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->d:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-interface {v0, v1}, Ll/d0m;->b(Landroid/widget/FrameLayout;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/cg50;->j:Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/officialshow/pusher/OfficialShowPusherView;->e:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-interface {v0, p0}, Ll/d0m;->c(Landroid/widget/FrameLayout;)V

    .line 49
    .line 50
    .line 51
    invoke-interface {v0}, Ll/d0m;->a()V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    new-instance v0, Ll/bg50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bg50;-><init>(Ll/cg50;)V

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

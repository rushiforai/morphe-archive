.class public Ll/j080;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/u2m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;",
        "Ll/u2m;"
    }
.end annotation


# instance fields
.field public i:Ll/ha80;

.field public j:Ll/a980;

.field public k:Ll/lc80;

.field public l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;",
            ">;"
        }
    .end annotation
.end field

.field public m:Z

.field public n:Ll/kcg0;

.field public o:Ll/kcg0;

.field public p:Lcom/p1/mobile/putong/live/base/data/BLive;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/a980;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/a980;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/j080;->j:Ll/a980;

    .line 10
    .line 11
    new-instance v0, Ll/lc80;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/lc80;-><init>(Ll/dum;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/j080;->k:Ll/lc80;

    .line 17
    .line 18
    return-void
.end method

.method private A4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    new-instance v4, Ll/z310;

    .line 10
    .line 11
    const/16 v5, 0xa28

    .line 12
    .line 13
    invoke-direct {v4, v5}, Ll/z310;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v4}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    check-cast v4, Ll/h0m;

    .line 21
    .line 22
    new-instance v5, Ll/q880;

    .line 23
    .line 24
    iget-object v6, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 25
    .line 26
    iget-object v7, v6, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pushIpv6:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v8, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 31
    .line 32
    iget-object v8, v8, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 35
    .line 36
    iget v9, v9, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 37
    .line 38
    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v9

    .line 42
    iget-object v10, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 43
    .line 44
    iget v10, v10, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 45
    .line 46
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v10

    .line 50
    iget-object v11, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->videoQualityConf:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 51
    .line 52
    move-object/from16 v1, p3

    .line 53
    .line 54
    iget-object v12, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 55
    .line 56
    iget-object v13, v12, Lcom/p1/mobile/putong/live/base/data/BLivePk;->otherChannel:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v14, v12, Lcom/p1/mobile/putong/live/base/data/BLivePk;->peerChannelKey:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v15

    .line 72
    new-instance v1, Ll/wz70;

    .line 73
    .line 74
    invoke-direct {v1, v0, v2, v3}, Ll/wz70;-><init>(Ll/j080;J)V

    .line 75
    .line 76
    .line 77
    move-object v12, v7

    .line 78
    move-object v7, v6

    .line 79
    move-object v6, v12

    .line 80
    move-object/from16 v12, p2

    .line 81
    .line 82
    move-object/from16 v16, v1

    .line 83
    .line 84
    invoke-direct/range {v5 .. v16}, Ll/q880;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;Ljava/lang/String;Ljava/lang/String;ILl/z20;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {v4, v5}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public static synthetic J3(Ll/j080;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j080;->m4()V

    return-void
.end method

.method public static synthetic K3(Ll/j080;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j080;->p4()V

    return-void
.end method

.method public static synthetic L3(Ll/j080;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j080;->u4()V

    return-void
.end method

.method public static synthetic M3(Ll/j080;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/j080;->s4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic N3(Ll/j080;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j080;->t4(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic O3(Ll/j080;Lcom/p1/mobile/putong/live/base/data/BLivePk;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j080;->x4(Lcom/p1/mobile/putong/live/base/data/BLivePk;)V

    return-void
.end method

.method public static synthetic P3(Ll/j080;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j080;->j4()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(JLjava/util/Map;)V
    .locals 1

    .line 1
    const-string v0, "watch_duration"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic S3(ZLl/x20;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "change stream error "

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic T3(Ll/j080;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/j080;->q4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic U3(Ll/j080;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/j080;->n4(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V3(Ll/j080;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j080;->o4()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/j080;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j080;->l4()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X3(Ll/j080;JLjava/lang/Integer;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/j080;->r4(JLjava/lang/Integer;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLivePk;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z3()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a4(Ll/j080;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j080;->k4()V

    return-void
.end method

.method private c4(ZLl/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Y3(Ljava/lang/String;Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/yz70;

    .line 18
    .line 19
    invoke-direct {v0, p1, p3}, Ll/yz70;-><init>(ZLl/x20;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j080;->i:Ll/ha80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private synthetic j4()Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/j080;->f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "preparing"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isTargetState(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private synthetic k4()V
    .locals 2

    .line 1
    const-string v0, "quit"

    .line 2
    .line 3
    const-string v1, "prepare 30s timeout"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/j080;->h4(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic l4()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/j080;->m:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private synthetic m4()V
    .locals 2

    .line 1
    const-string v0, "quit"

    .line 2
    .line 3
    const-string v1, "other add timeout"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/j080;->h4(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic n4(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/ab80;->a(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    const-string p2, "leave"

    .line 5
    .line 6
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-direct {p0, p1}, Ll/j080;->x4(Lcom/p1/mobile/putong/live/base/data/BLivePk;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic o4()Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/j080;->f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "playing"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isTargetState(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private synthetic p4()V
    .locals 2

    .line 1
    const-string v0, "quit"

    .line 2
    .line 3
    const-string v1, "playing countdown timeout"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/j080;->h4(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic q4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Ll/j080;->w4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic r4(JLjava/lang/Integer;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    const/4 v0, 0x1

    .line 6
    const-string v1, "pk_anchor_start_trace"

    .line 7
    .line 8
    if-eq p3, v0, :cond_3

    .line 9
    .line 10
    const/4 p1, 0x2

    .line 11
    if-eq p3, p1, :cond_2

    .line 12
    .line 13
    const/4 p1, 0x3

    .line 14
    if-eq p3, p1, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x4

    .line 17
    if-eq p3, p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance p1, Ll/f510;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 31
    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 33
    .line 34
    const-string p3, "pk"

    .line 35
    .line 36
    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p4

    .line 40
    invoke-direct {p1, p2, p3, p4}, Ll/f510;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->renewRtcToken()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 58
    .line 59
    const-string p1, "local_add"

    .line 60
    .line 61
    invoke-virtual {p0, v1, p1}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    const-string p1, "other-leave"

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ll/j080;->g4(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    invoke-virtual {p0}, Ll/j080;->y4()V

    .line 72
    .line 73
    .line 74
    iget-object p3, p0, Ll/j080;->i:Ll/ha80;

    .line 75
    .line 76
    invoke-virtual {p3}, Ll/ha80;->Z3()V

    .line 77
    .line 78
    .line 79
    sget-object p3, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 80
    .line 81
    const-string p4, "other_add"

    .line 82
    .line 83
    invoke-virtual {p3, v1, p4}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/pzi0;->o()J

    .line 87
    .line 88
    .line 89
    move-result-wide p3

    .line 90
    sub-long/2addr p3, p1

    .line 91
    new-instance p1, Ll/zz70;

    .line 92
    .line 93
    invoke-direct {p1, p3, p4}, Ll/zz70;-><init>(J)V

    .line 94
    .line 95
    .line 96
    const-string p2, "anchor_pk_other_enter"

    .line 97
    .line 98
    invoke-static {p0, p2, p1}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private synthetic s4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j080;->p:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-direct {p0, v0, p2, p1}, Ll/j080;->A4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic t4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 1

    .line 1
    const/16 v0, 0x258

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/data/BLive;->setFrom(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->switchPushToNormal()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic u4()V
    .locals 2

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
    move-result-object p0

    .line 12
    check-cast p0, Ll/h0m;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/h0m;->b()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private w4(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j080;->p:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j080;->d4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private x4(Lcom/p1/mobile/putong/live/base/data/BLivePk;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/j080;->f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->currentStageInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;

    .line 10
    .line 11
    const-string v2, "ended"

    .line 12
    .line 13
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->stage:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 18
    .line 19
    iget-object p0, p0, Ll/j080;->l:Ll/y20;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->updatePk(Lcom/p1/mobile/putong/live/base/data/BLivePk;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public B4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/j080;->p:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Ll/j080;->p:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->provider:Ljava/lang/String;

    .line 23
    .line 24
    const-string v2, "pk"

    .line 25
    .line 26
    invoke-static {v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/h080;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/h080;-><init>(Ll/j080;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Ll/ga80;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/ga80;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public C4()V
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
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_PK:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    const-class v1, Ll/p880;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->T0(Ljava/lang/Class;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/p880;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/p880;->D1()V

    .line 35
    .line 36
    .line 37
    :cond_0
    new-instance v0, Ll/d080;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/d080;-><init>(Ll/j080;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/e080;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/e080;-><init>(Ll/j080;)V

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-direct {p0, v2, v0, v1}, Ll/j080;->c4(ZLl/y20;Ll/x20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public G(Ll/ha80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j080;->i:Ll/ha80;

    .line 2
    .line 3
    return-void
.end method

.method public b4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "pkId"

    .line 14
    .line 15
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    sget-object v1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 19
    .line 20
    const-string v2, "pk_anchor_start_trace"

    .line 21
    .line 22
    invoke-static {v0}, Ll/euk;->d(Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v1, v2, v0}, Ll/lej0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/j080;->z4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j080;->i:Ll/ha80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isOnceMore()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/j080;->i:Ll/ha80;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_1
    iget-object v0, p0, Ll/j080;->i:Ll/ha80;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->l6(Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance v0, Ll/xz70;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/xz70;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v1, Ll/ga80;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/ga80;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public e4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->n6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/f080;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/f080;-><init>(Ll/j080;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/g080;

    .line 15
    .line 16
    invoke-direct {v1, p0, p2}, Ll/g080;-><init>(Ll/j080;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPreparing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/j080;->j:Ll/a980;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "preparing"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Ll/j080;->l:Ll/y20;

    .line 20
    .line 21
    new-instance v3, Ll/ga80;

    .line 22
    .line 23
    invoke-direct {v3}, Ll/ga80;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1, v1, v2, v3}, Ll/a980;->i(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkStage;Ll/y20;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/j080;->k:Ll/lc80;

    .line 30
    .line 31
    new-instance v0, Ll/i080;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/i080;-><init>(Ll/j080;)V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/tz70;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/tz70;-><init>(Ll/j080;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0, v1}, Ll/lc80;->e(Ll/pcj;Ll/x20;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Ll/j080;->k:Ll/lc80;

    .line 52
    .line 53
    new-instance v0, Ll/uz70;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/uz70;-><init>(Ll/j080;)V

    .line 56
    .line 57
    .line 58
    new-instance v1, Ll/vz70;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/vz70;-><init>(Ll/j080;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0, v1}, Ll/lc80;->e(Ll/pcj;Ll/x20;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isEnded()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    invoke-direct {p0}, Ll/j080;->f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lastState:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkStateEvent()Ll/v3f$d;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const/4 v1, -0x1

    .line 90
    invoke-static {v1, p1}, Ll/jct;->b(ILcom/p1/mobile/putong/live/base/data/BLivePkStage;)Ll/jct;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/j080;->j:Ll/a980;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/a980;->j()V

    .line 100
    .line 101
    .line 102
    :cond_2
    return-void
.end method

.method public g4(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/j080;->h4(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0}, Ll/j080;->f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isEnded()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_3

    .line 17
    .line 18
    invoke-direct {p0}, Ll/j080;->f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isUnknown()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gb:I

    .line 36
    .line 37
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 38
    .line 39
    .line 40
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v1, "handle exit "

    .line 43
    .line 44
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, " reason = "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-static {p2}, Ll/n180;->j(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0}, Ll/j080;->f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 70
    .line 71
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, p2, p1}, Ll/j080;->e4(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_3
    :goto_0
    return-void
.end method

.method public i4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "pk_cdn_fail"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/j080;->f4()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const-string p1, "quit"

    .line 28
    .line 29
    const-string v0, "cdn fail"

    .line 30
    .line 31
    invoke-virtual {p0, p1, v0}, Ll/j080;->h4(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public k(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/j080;->l:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j080;->j:Ll/a980;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/a980;->j()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/j080;->k:Ll/lc80;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lc80;->d()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/j080;->m:Z

    .line 13
    .line 14
    iget-object v0, p0, Ll/j080;->n:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/j080;->o:Ll/kcg0;

    .line 20
    .line 21
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public v4(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V
    .locals 4

    .line 1
    const-string v0, "punishing"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p1, "end-leave"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/j080;->g4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v0, "playing"

    .line 16
    .line 17
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/j080;->j:Ll/a980;

    .line 24
    .line 25
    iget-object v1, p0, Ll/j080;->i:Ll/ha80;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v2, p0, Ll/j080;->l:Ll/y20;

    .line 40
    .line 41
    new-instance v3, Ll/ga80;

    .line 42
    .line 43
    invoke-direct {v3}, Ll/ga80;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1, v0, v2, v3}, Ll/a980;->i(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkStage;Ll/y20;Ll/y20;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/j080;->k:Ll/lc80;

    .line 50
    .line 51
    new-instance v0, Ll/sz70;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/sz70;-><init>(Ll/j080;)V

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/a080;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/a080;-><init>(Ll/j080;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v0, v1}, Ll/lc80;->e(Ll/pcj;Ll/x20;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public y4()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/j080;->m:Z

    .line 3
    .line 4
    return-void
.end method

.method public z4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 2

    .line 1
    new-instance v0, Ll/b080;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/b080;-><init>(Ll/j080;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/c080;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/c080;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {p0, v1, v0, p1}, Ll/j080;->c4(ZLl/y20;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

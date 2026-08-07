.class public Ll/m14;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/zed0;

.field public j:Ll/y34;

.field public k:Ll/kcg0;

.field public l:Ll/kcg0;

.field public m:Ljava/lang/String;

.field public n:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/zed0;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/m14;->i:Ll/zed0;

    .line 5
    .line 6
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    const/4 p3, 0x2

    .line 10
    invoke-static {p3}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    new-instance p3, Ll/e510;

    .line 17
    .line 18
    invoke-direct {p3, p1}, Ll/e510;-><init>(Ll/dum;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance p3, Ll/wkd0;

    .line 25
    .line 26
    invoke-direct {p3, p1, p2}, Ll/wkd0;-><init>(Ll/dum;Ll/zed0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private A4(Ll/y34;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/16 v2, 0x1e

    .line 10
    .line 11
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 12
    .line 13
    invoke-virtual {v1, v2, v3}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, v1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    new-instance v2, Ll/j14;

    .line 27
    .line 28
    invoke-direct {v2, v0}, Ll/j14;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/k14;

    .line 36
    .line 37
    invoke-direct {v2, p0, v0}, Ll/k14;-><init>(Ll/m14;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ll/l14;

    .line 45
    .line 46
    invoke-direct {v2, p0, v0}, Ll/l14;-><init>(Ll/m14;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/q04;

    .line 54
    .line 55
    invoke-direct {v1, p0, p1}, Ll/q04;-><init>(Ll/m14;Ll/y34;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/m14;->i:Ll/zed0;

    .line 59
    .line 60
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/r04;

    .line 64
    .line 65
    invoke-direct {v2, p1}, Ll/r04;-><init>(Ll/zed0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Ll/m14;->k:Ll/kcg0;

    .line 77
    .line 78
    return-void
.end method

.method private E4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m14;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/m14;Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m14;->r4(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/m14;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m14;->y4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic L3(Ll/m14;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m14;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method

.method public static synthetic M3(Ll/m14;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m14;->B4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Ll/m14;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m14;->p4(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ljava/lang/Object;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic R3(Ll/m14;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m14;->w4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic S3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

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

.method public static synthetic T3(Ll/m14;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m14;->h4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V

    return-void
.end method

.method public static synthetic U3(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "audience control 30s timeout,callId "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0, p1}, Ll/g64;->c(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Long;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic V3(Ll/m14;Ll/y34;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m14;->t4(Ll/y34;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic W3(Ll/m14;Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m14;->s4(Ljava/lang/String;Ljava/lang/Long;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X3(Ll/m14;Ljava/lang/Integer;Ljava/lang/Object;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m14;->j4(Ljava/lang/Integer;Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public static synthetic Y3(Ll/m14;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m14;->q4(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic Z3(Ll/m14;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m14;->v4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic a4(Ll/m14;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m14;->u4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic b4(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic c4(Ll/m14;Ll/j2s;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m14;->m4(Ll/j2s;)V

    return-void
.end method

.method public static synthetic d4(Ll/m14;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m14;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic e4(Ll/m14;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m14;->n4(Ljava/lang/Long;)V

    return-void
.end method

.method private f4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m14;->i:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zed0;->L4()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/m14;->i:Ll/zed0;

    .line 7
    .line 8
    new-instance v1, Ll/s04;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/s04;-><init>(Ll/m14;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/n54;->Y3(Ll/y20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/u54;->f(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

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
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Ll/m14;->l4(Z)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ll/m14;->E4()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private synthetic u4(Ll/jsv;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m14;->i:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Ll/q24;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/n54;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic v4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m14;->f4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m14;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private x4(Ll/y34;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H1:I

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "audience onConnectFailed"

    .line 19
    .line 20
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/m14;->i:Ll/zed0;

    .line 24
    .line 25
    iget-object p1, p1, Ll/y34;->a:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/zed0;->j5(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private y4(Ll/jsv;)V
    .locals 2

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
    iget-object p1, p0, Ll/m14;->i:Ll/zed0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v1, Ll/q24;->d:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Ll/n54;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Ll/m14;->l4(Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method


# virtual methods
.method public final B4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;->setVisible(Z)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/z310;

    .line 10
    .line 11
    const/16 v1, 0x1130

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/h0m;

    .line 21
    .line 22
    new-instance v1, Ll/x14;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->appId:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channel:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->userSig:Ljava/lang/String;

    .line 45
    .line 46
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 49
    .line 50
    iget-object v8, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;->b:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    new-instance v9, Ll/b14;

    .line 53
    .line 54
    invoke-direct {v9, p0}, Ll/b14;-><init>(Ll/m14;)V

    .line 55
    .line 56
    .line 57
    invoke-direct/range {v1 .. v9}, Ll/x14;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/FrameLayout;Ll/rcj;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v0, v1}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public C4()V
    .locals 4

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
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

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
    const-class v1, Ll/v14;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->T0(Ljava/lang/Class;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/v14;

    .line 33
    .line 34
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;->a:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    invoke-virtual {v0, v1, v3, v2}, Ll/v14;->s1(Lcom/p1/mobile/android/app/Act;ZLandroid/widget/FrameLayout;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v0, Ll/vyr;

    .line 57
    .line 58
    const/4 v1, 0x2

    .line 59
    invoke-direct {v0, v1}, Ll/vyr;-><init>(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public final D4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "call"

    .line 14
    .line 15
    const-string v2, ""

    .line 16
    .line 17
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/z04;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/z04;-><init>(Ll/m14;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/m14;->i:Ll/zed0;

    .line 31
    .line 32
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/r04;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/r04;-><init>(Ll/zed0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final g4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/m14;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x5

    .line 11
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/t04;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/t04;-><init>(Ll/m14;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/m14;->l:Ll/kcg0;

    .line 40
    .line 41
    return-void
.end method

.method public final h4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;)V
    .locals 3

    .line 1
    new-instance v0, Ll/y34;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getCallUser()Ll/h64;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v0, v1, v2}, Ll/y34;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/m14;->j:Ll/y34;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->getType()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v0, 0x5

    .line 21
    if-eq p1, v0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x6

    .line 24
    if-eq p1, v0, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x1e

    .line 27
    .line 28
    if-eq p1, v0, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    const/16 v1, 0x1130

    .line 32
    .line 33
    packed-switch p1, :pswitch_data_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :pswitch_0
    iget-object p1, p0, Ll/m14;->j:Ll/y34;

    .line 38
    .line 39
    iget-object p1, p1, Ll/y34;->b:Ll/h64;

    .line 40
    .line 41
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 42
    .line 43
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 44
    .line 45
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    new-instance p1, Ll/r410;

    .line 56
    .line 57
    invoke-direct {p1, v1}, Ll/r410;-><init>(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Ll/xzl;

    .line 65
    .line 66
    invoke-interface {p0, v0}, Ll/xzl;->n(Z)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :pswitch_1
    iget-object p1, p0, Ll/m14;->j:Ll/y34;

    .line 71
    .line 72
    iget-object p1, p1, Ll/y34;->b:Ll/h64;

    .line 73
    .line 74
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 75
    .line 76
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_0

    .line 87
    .line 88
    new-instance p1, Ll/r410;

    .line 89
    .line 90
    invoke-direct {p1, v1}, Ll/r410;-><init>(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    check-cast p0, Ll/xzl;

    .line 98
    .line 99
    const/4 p1, 0x1

    .line 100
    invoke-interface {p0, p1}, Ll/xzl;->n(Z)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :pswitch_2
    new-instance p1, Ll/z310;

    .line 105
    .line 106
    invoke-direct {p1, v1}, Ll/z310;-><init>(I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Ll/h0m;

    .line 114
    .line 115
    invoke-interface {p1}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 120
    .line 121
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_0

    .line 126
    .line 127
    const-class v1, Ll/v14;

    .line 128
    .line 129
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->T0(Ljava/lang/Class;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    check-cast p1, Ll/v14;

    .line 134
    .line 135
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 136
    .line 137
    const/4 v1, 0x0

    .line 138
    invoke-virtual {p1, p0, v0, v1}, Ll/v14;->s1(Lcom/p1/mobile/android/app/Act;ZLandroid/widget/FrameLayout;)V

    .line 139
    .line 140
    .line 141
    :cond_0
    :goto_0
    return-void

    .line 142
    :cond_1
    invoke-direct {p0}, Ll/m14;->E4()V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_2
    iget-object p1, p0, Ll/m14;->j:Ll/y34;

    .line 147
    .line 148
    invoke-direct {p0, p1}, Ll/m14;->A4(Ll/y34;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Ll/m14;->D4()V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final i4(Ll/j2s;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m14;->m:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/m14;->m:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/j2s;->j(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Ll/z310;

    .line 17
    .line 18
    const/16 v1, 0x1130

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/h0m;

    .line 28
    .line 29
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p1}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_CALL_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    const-class p1, Ll/v14;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->T0(Ljava/lang/Class;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ll/v14;

    .line 54
    .line 55
    iget-object v0, p0, Ll/m14;->m:Ljava/lang/String;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-virtual {p1, v0, v1}, Ll/v14;->u1(Ljava/lang/String;Z)V

    .line 59
    .line 60
    .line 61
    const-string p1, ""

    .line 62
    .line 63
    iput-object p1, p0, Ll/m14;->m:Ljava/lang/String;

    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public final j4(Ljava/lang/Integer;Ljava/lang/Object;)I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/m14;->i:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, p2, v0}, Ll/g64;->f(Ljava/lang/Integer;Ljava/lang/Object;Ll/qvd;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x2

    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eq p1, v2, :cond_4

    .line 18
    .line 19
    if-eq p1, v0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    if-eq p1, v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x4

    .line 25
    if-eq p1, v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/m14;->i:Ll/zed0;

    .line 28
    .line 29
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 30
    .line 31
    const-string p2, "wrong user in video"

    .line 32
    .line 33
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    return v1

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 51
    .line 52
    const-string v0, "call"

    .line 53
    .line 54
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {p1, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Ll/d14;

    .line 67
    .line 68
    invoke-direct {p2, p0}, Ll/d14;-><init>(Ll/m14;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    return v1

    .line 79
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->memberVolume()Ll/v3f$d;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 90
    .line 91
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return v1

    .line 95
    :cond_2
    const/4 p1, 0x0

    .line 96
    iput-object p1, p0, Ll/m14;->m:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_3

    .line 119
    .line 120
    iget-object p0, p0, Ll/m14;->i:Ll/zed0;

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/zed0;->N4()Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    sget-object p2, Ll/q24;->e:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p0, p1, p2}, Ll/n54;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return v2

    .line 132
    :cond_3
    return v0

    .line 133
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->pausePlay()Ll/v3f$c;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 151
    .line 152
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->playerVisible()Ll/v3f$d;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 157
    .line 158
    invoke-virtual {p1, v3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 170
    .line 171
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-eqz p1, :cond_5

    .line 182
    .line 183
    return v2

    .line 184
    :cond_5
    iget-object p1, p0, Ll/m14;->i:Ll/zed0;

    .line 185
    .line 186
    invoke-virtual {p1}, Ll/n54;->Z3()Ll/qvd;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-virtual {p1}, Ll/qvd;->m()Ll/j2s;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {p1}, Ll/j2s;->m()Ljava/util/List;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    new-instance v2, Ll/c14;

    .line 199
    .line 200
    invoke-direct {v2, p2}, Ll/c14;-><init>(Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    invoke-static {p1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    if-eqz p1, :cond_6

    .line 208
    .line 209
    return v0

    .line 210
    :cond_6
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iput-object p1, p0, Ll/m14;->m:Ljava/lang/String;

    .line 215
    .line 216
    return v1
.end method

.method public final l4(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "hangUpCallAndRestartPlayer,isEndLive: "

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
    iget-object v0, p0, Ll/m14;->l:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/z310;

    .line 24
    .line 25
    const/16 v1, 0x1130

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/h0m;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-interface {v0}, Ll/h0m;->b()V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;->setVisible(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->playerVisible()Ll/v3f$d;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    if-nez p1, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restartPlay()Ll/v3f$c;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method

.method public final synthetic m4(Ll/j2s;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m14;->i:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/zed0;->n4(Ll/j2s;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/m14;->i4(Ll/j2s;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/jsv;->c()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0, v0}, Ll/m14;->l4(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/m14;->l:Ll/kcg0;

    .line 20
    .line 21
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/m14;->n:Ll/kcg0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Ll/m14;->m:Ljava/lang/String;

    .line 31
    .line 32
    return-void
.end method

.method public final synthetic n4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m14;->C4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 2

    .line 1
    new-instance v0, Ll/r410;

    .line 2
    .line 3
    const/16 v1, 0x1130

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/xzl;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/xzl;->o(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic p4(Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/cyr;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-ne p0, p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic q4(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m14;->f4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r4(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m14;->i:Ll/zed0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n54;->Z3()Ll/qvd;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/qvd;->m()Ll/j2s;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/j2s;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic s4(Ljava/lang/String;Ljava/lang/Long;)Lrx/c;
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    sget-object v0, Ll/q24;->f:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->f6(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public t()V
    .locals 3

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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->f()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/p04;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/p04;-><init>(Ll/m14;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/m14;->i:Ll/zed0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/zed0;->O4()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/a14;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/a14;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/e14;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/e14;-><init>(Ll/m14;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

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
    new-instance v1, Ll/f14;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/f14;-><init>(Ll/m14;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/vp20;->u()Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/g14;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/g14;-><init>(Ll/m14;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/16 v1, 0x14

    .line 116
    .line 117
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 118
    .line 119
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v1, Ll/h14;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/h14;-><init>(Ll/m14;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->delayStartVideoPreview()Ll/v3f$c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Lrx/c;

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    new-instance v1, Ll/i14;

    .line 160
    .line 161
    invoke-direct {v1, p0}, Ll/i14;-><init>(Ll/m14;)V

    .line 162
    .line 163
    .line 164
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0}, Ll/m14;->z4()V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public final synthetic t4(Ll/y34;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m14;->x4(Ll/y34;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final z4()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/u04;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/u04;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/v04;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/v04;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/w04;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/w04;-><init>(Ll/m14;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/x04;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/x04;-><init>(Ll/m14;)V

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/y04;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/y04;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Ll/m14;->n:Ll/kcg0;

    .line 64
    .line 65
    return-void
.end method

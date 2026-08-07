.class public Ll/dc10;
.super Ll/hj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hj2<",
        "Ll/oo2;",
        "Ll/gm10;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Ll/cm0;

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hj2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hj2;->L3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic O3(Ll/dc10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dc10;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/dc10;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dc10;->b4(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic R3(Ll/dc10;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dc10;->a4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic S3(Ll/dc10;Ll/cm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dc10;->Z3(Ll/cm0;)V

    return-void
.end method

.method public static synthetic T3(Ll/dc10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;Ll/cm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dc10;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;Ll/cm0;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic K3()Ll/isl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dc10;->V3()Ll/gm10;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final U3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->r5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/yb10;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/yb10;-><init>(Ll/dc10;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/zb10;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/zb10;-><init>(Ll/dc10;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/ac10;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/ac10;-><init>(Ll/dc10;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public V3()Ll/gm10;
    .locals 0

    .line 1
    new-instance p0, Ll/gm10;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gm10;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public W3(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/16 v1, 0x2c0

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "liveLeaderboard"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    const/16 v3, 0x44c

    .line 38
    .line 39
    invoke-static {p0, v2, p1, v3}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p0, v2, p1, v3}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "live"

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "liveOnlineUser"

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;Ll/cm0;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/cm0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/dc10;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    .line 8
    .line 9
    iput-object p2, p0, Ll/dc10;->k:Ll/cm0;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;->fanbaseId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->N4(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/r7g;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/r7g;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/cc10;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Ll/cc10;-><init>(Ll/dc10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final synthetic Z3(Ll/cm0;)V
    .locals 2

    .line 1
    new-instance p1, Ll/em10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/bc10;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/bc10;-><init>(Ll/dc10;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p1, v0, v1}, Ll/em10;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/gm10;

    .line 18
    .line 19
    iget-object v1, p0, Ll/dc10;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    .line 20
    .line 21
    iget-object p0, p0, Ll/dc10;->k:Ll/cm0;

    .line 22
    .line 23
    invoke-virtual {v0, v1, p0, p1}, Ll/gm10;->x(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;Ll/cm0;Ll/em10;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gm10;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gm10;->y()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic b4(Landroid/util/Pair;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hj2;->N3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Ljava/lang/String;

    .line 7
    .line 8
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p1, Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Ll/dc10;->U3(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->clickPkBoard()Ll/v3f$d;

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
    new-instance v1, Ll/xb10;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/xb10;-><init>(Ll/dc10;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

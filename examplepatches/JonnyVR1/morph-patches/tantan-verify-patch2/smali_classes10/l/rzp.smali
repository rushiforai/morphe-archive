.class public Ll/rzp;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/tzp;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/r2s;


# direct methods
.method public constructor <init>(Ll/dum;Ll/r2s;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/rzp;->i:Ll/r2s;

    .line 5
    .line 6
    new-instance p1, Ll/tzp;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/tzp;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic J3(Ll/rzp;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzp;->b4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic K3(Ll/rzp;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzp;->Z3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic L3(Ll/rzp;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rzp;->Y3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)V

    return-void
.end method

.method public static synthetic M3(Ll/rzp;Ll/wzp;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)Ll/d3q;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rzp;->X3(Ll/wzp;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)Ll/d3q;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/rzp;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rzp;->c4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic O3(Ll/rzp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rzp;->f4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic P3(Ll/rzp;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzp;->U3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic R3(Ljava/lang/String;Ll/d3q;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p1, Ll/hzp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/hzp;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/hzp;->K()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    return-object p0
.end method

.method public static synthetic S3(Ll/rzp;Ll/wzp;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzp;->a4(Ll/wzp;)V

    return-void
.end method

.method private synthetic c4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rzp;->e4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/tzp;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/tzp;->j()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/rzp;->V3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private f4(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/tzp;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/tzp;->d()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/16 v1, 0x1130

    .line 19
    .line 20
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "live"

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p0, v3, p1, v1}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p0, v3, p1, v1}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string p1, "call"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "liveRoom"

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method


# virtual methods
.method public final T3(Ll/wzp;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wzp;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/wzp;->c()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/lzp;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/lzp;-><init>(Ll/rzp;Ll/wzp;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final U3(Ljava/lang/String;)V
    .locals 2

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
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->O3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/ozp;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/ozp;-><init>(Ll/rzp;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ll/pzp;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Ll/pzp;-><init>(Ll/rzp;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final V3()V
    .locals 3

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
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Q3(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/jzp;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/jzp;-><init>(Ll/rzp;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/kzp;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/kzp;-><init>(Ll/rzp;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final W3(Ljava/lang/String;)Ll/hzp;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/tzp;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tzp;->e()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/qzp;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/qzp;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/d3q;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    check-cast p0, Ll/hzp;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final synthetic X3(Ll/wzp;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)Ll/d3q;
    .locals 2

    .line 1
    new-instance v0, Ll/hzp;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;->to:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Ll/wzp;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {v0, p2, p1}, Ll/hzp;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ll/mzp;

    .line 13
    .line 14
    invoke-direct {p1, p0}, Ll/mzp;-><init>(Ll/rzp;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/hzp;->Q(Ll/y20;)Ll/hzp;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Ll/nzp;

    .line 22
    .line 23
    invoke-direct {p2, p0}, Ll/nzp;-><init>(Ll/rzp;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ll/hzp;->R(Ll/y20;)Ll/hzp;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic Y3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rzp;->g4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Z3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rzp;->i:Ll/r2s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic a4(Ll/wzp;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzp;->d4(Ll/wzp;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic b4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rzp;->i:Ll/r2s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->V3(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d4(Ll/wzp;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzp;->T3(Ll/wzp;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/tzp;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/tzp;->i(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final g4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzp;->W3(Ljava/lang/String;)Ll/hzp;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ll/hzp;->S(Lcom/p1/mobile/putong/live/base/data/BLiveCallInvite;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/tzp;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/tzp;->k(Ll/hzp;)V

    .line 15
    .line 16
    .line 17
    :cond_0
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorInviteAudience()Ll/v3f$c;

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
    new-instance v1, Ll/izp;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/izp;-><init>(Ll/rzp;)V

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

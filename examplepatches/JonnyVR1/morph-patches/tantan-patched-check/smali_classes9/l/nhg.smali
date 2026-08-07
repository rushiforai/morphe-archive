.class public Ll/nhg;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TD;",
        "Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/lang/String;

.field public j:Ll/dhg;

.field public k:J


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/nhg;->i:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Ll/nhg;->j:Ll/dhg;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/nhg;->k:J

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ll/nhg;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nhg;->X3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic K3(Ll/nhg;Ll/hcr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nhg;->Y3(Ll/hcr;)V

    return-void
.end method

.method public static synthetic L3(Ll/nhg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nhg;->U3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/nhg;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nhg;->W3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V

    return-void
.end method

.method public static synthetic N3(Ll/nhg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nhg;->V3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V

    return-void
.end method

.method public static synthetic O3(Ll/nhg;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nhg;->T3(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method

.method public static synthetic P3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic R3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic T3(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->j(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public S3()V
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/nhg;->i:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/nhg;->j:Ll/dhg;

    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->f()V

    .line 13
    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Ll/nhg;->k:J

    .line 18
    .line 19
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->j(Z)V

    .line 25
    .line 26
    .line 27
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

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
    new-instance v1, Ll/mhg;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/mhg;-><init>(Ll/nhg;)V

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

.method public final synthetic U3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRoomId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankingType;->live:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankingType;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getType()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankingType;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final synthetic V3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRankingTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/nhg;->k:J

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRankingTime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Ll/nhg;->k:J

    .line 16
    .line 17
    new-instance v0, Ll/dhg;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/dhg;-><init>(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/nhg;->j:Ll/dhg;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/nhg;->Z3()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic W3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;)V
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
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->memberCount:D

    .line 20
    .line 21
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 26
    .line 27
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveInfoMessage;->memberCount:D

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->k(D)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 2

    .line 1
    const-string v0, "liveinfo"

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, v0, p0}, Ll/oo2;->M1(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string v0, "breaking_leader_board"

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 50
    .line 51
    iput-object p1, p0, Ll/nhg;->i:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/nhg;->Z3()V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final synthetic Y3(Ll/hcr;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->setFansDataByLeaderBoardData(Ll/hcr;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Z3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nhg;->j:Ll/dhg;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/dhg;->b()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/nhg;->j:Ll/dhg;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/dhg;->b()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/nsv;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v2, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v2, Ll/w5g;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/w5g;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, ",breakingLeaderBoardUserId="

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Ll/nhg;->i:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "FansBoardTAG-FansPresenter-notifyViewModel,first="

    .line 60
    .line 61
    invoke-static {v2, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v0, Ll/w5g;

    .line 67
    .line 68
    iget-object v0, v0, Ll/w5g;->a:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Ll/nhg;->i:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_1

    .line 77
    .line 78
    const-string v0, ""

    .line 79
    .line 80
    iput-object v0, p0, Ll/nhg;->i:Ljava/lang/String;

    .line 81
    .line 82
    :cond_1
    iget-object v0, p0, Ll/nhg;->j:Ll/dhg;

    .line 83
    .line 84
    iget-object v1, p0, Ll/nhg;->i:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/dhg;->c(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 92
    .line 93
    iget-object p0, p0, Ll/nhg;->j:Ll/dhg;

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->setFansData(Ll/dhg;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public a4(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b4(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c4(Ljava/lang/String;)V
    .locals 4

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/jsv;->h()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/16 v1, 0x578

    .line 33
    .line 34
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p0, v3, p1, v1}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {p0, v3, p1, v1}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const-string p1, "live"

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "liveLeaderboard"

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "liveOnlineUser"

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public init()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->j(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/oo2;->M1(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/aj1;->Z()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/fhg;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/fhg;-><init>(Ll/nhg;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/ghg;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/ghg;-><init>(Ll/nhg;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Ll/hhg;

    .line 63
    .line 64
    invoke-direct {v2}, Ll/hhg;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 75
    .line 76
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-wide v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->k(D)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Ll/aj1;->C()Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-wide/16 v1, 0x1

    .line 104
    .line 105
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 106
    .line 107
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->sample(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    new-instance v1, Ll/ihg;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/ihg;-><init>(Ll/nhg;)V

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Ll/oo2;->n1()Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    new-instance v1, Ll/jhg;

    .line 152
    .line 153
    invoke-direct {v1, p0}, Ll/jhg;-><init>(Ll/nhg;)V

    .line 154
    .line 155
    .line 156
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0}, Ll/oo2;->m1()Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    new-instance v1, Ll/khg;

    .line 176
    .line 177
    invoke-direct {v1, p0}, Ll/khg;-><init>(Ll/nhg;)V

    .line 178
    .line 179
    .line 180
    new-instance p0, Ll/lhg;

    .line 181
    .line 182
    invoke-direct {p0}, Ll/lhg;-><init>()V

    .line 183
    .line 184
    .line 185
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nhg;->S3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/nhg;->i:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/nhg;->j:Ll/dhg;

    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->f()V

    .line 13
    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Ll/nhg;->k:J

    .line 18
    .line 19
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->j(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;->k(D)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nhg;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

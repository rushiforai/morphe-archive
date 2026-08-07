.class public Ll/ten0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/rwn0;",
        ">",
        "Ll/i6t<",
        "TT;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/lang/String;

.field public j:Ll/hen0;

.field public k:J


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;",
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
    iput-object p1, p0, Ll/ten0;->i:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Ll/ten0;->j:Ll/hen0;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/ten0;->k:J

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/ten0;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ten0;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M3(Ll/ten0;Ll/rsn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ten0;->Z3(Ll/rsn0;)V

    return-void
.end method

.method public static synthetic N3(Ll/ten0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ten0;->Y3(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic O3(Ll/ten0;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ten0;->W3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic R3(Ll/ten0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ten0;->V3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V

    return-void
.end method

.method public static synthetic S3(Ll/ten0;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ten0;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic T3(Ll/ten0;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ten0;->X3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V

    return-void
.end method

.method private V3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;->Count:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getTotal()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 20
    .line 21
    long-to-double v0, v0

    .line 22
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->j(D)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public U3()V
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/ten0;->i:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/ten0;->j:Ll/hen0;

    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->e()V

    .line 13
    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Ll/ten0;->k:J

    .line 18
    .line 19
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->i(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic W3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Ljava/lang/Boolean;
    .locals 2

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
    move-result-object v1

    .line 9
    check-cast v1, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankingType;->live:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankingType;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getType()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankingType;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRankingTime()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iget-wide p0, p0, Ll/ten0;->k:J

    .line 38
    .line 39
    cmp-long p0, v0, p0

    .line 40
    .line 41
    if-ltz p0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public final synthetic X3(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRankingTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/ten0;->k:J

    .line 6
    .line 7
    new-instance v0, Ll/hen0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/hen0;-><init>(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ten0;->j:Ll/hen0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ten0;->c4()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic Y3(Ll/hrk0$a;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/hrk0;->r()Ll/ado0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/ado0;->J()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    long-to-double v0, v0

    .line 24
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->j(D)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic Z3(Ll/rsn0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->setFansDataByLeaderBoardData(Ll/rsn0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic a4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p2, p0, p1}, Ll/oo2;->Q1(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 15
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->setFansViewVisible(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ten0;->j:Ll/hen0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/hen0;->b()Ljava/util/List;

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
    iget-object v0, p0, Ll/ten0;->j:Ll/hen0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/hen0;->b()Ljava/util/List;

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
    check-cast v2, Ll/cen0;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/cen0;->toString()Ljava/lang/String;

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
    iget-object v2, p0, Ll/ten0;->i:Ljava/lang/String;

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
    check-cast v0, Ll/cen0;

    .line 67
    .line 68
    iget-object v0, v0, Ll/cen0;->a:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Ll/ten0;->i:Ljava/lang/String;

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
    iput-object v0, p0, Ll/ten0;->i:Ljava/lang/String;

    .line 81
    .line 82
    :cond_1
    iget-object v0, p0, Ll/ten0;->j:Ll/hen0;

    .line 83
    .line 84
    iget-object v1, p0, Ll/ten0;->i:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/hen0;->c(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 90
    .line 91
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 92
    .line 93
    iget-object p0, p0, Ll/ten0;->j:Ll/hen0;

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->setFansData(Ll/hen0;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public d4(I)V
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

.method public e4(Ljava/lang/String;)V
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
    check-cast v0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/jsv;->h()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v1, 0x578

    .line 35
    .line 36
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Ll/rwn0;

    .line 49
    .line 50
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p0, v3, p1, v1}, Ll/csq;->b(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Ll/rwn0;

    .line 69
    .line 70
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p0, v3, p1, v1}, Ll/csq;->e(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "live"

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "liveLeaderboard"

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string p1, "liveOnlineUser"

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public init()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->i(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 36
    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, v2, v3}, Ll/oo2;->Q1(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ll/rwn0;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/oo2;->q1()Ll/aj1;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ll/aj1;->S0()Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    new-instance v2, Ll/ken0;

    .line 61
    .line 62
    invoke-direct {v2, p0}, Ll/ken0;-><init>(Ll/ten0;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    new-instance v2, Ll/len0;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/len0;-><init>(Ll/ten0;)V

    .line 72
    .line 73
    .line 74
    new-instance v3, Ll/men0;

    .line 75
    .line 76
    invoke-direct {v3}, Ll/men0;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 87
    .line 88
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Ll/rwn0;

    .line 95
    .line 96
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2}, Ll/hrk0;->r()Ll/ado0;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v2}, Ll/ado0;->J()J

    .line 105
    .line 106
    .line 107
    move-result-wide v2

    .line 108
    long-to-double v2, v2

    .line 109
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->j(D)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Ll/rwn0;

    .line 117
    .line 118
    invoke-virtual {v1}, Ll/rwn0;->Q2()Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-wide/16 v2, 0x1

    .line 127
    .line 128
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 129
    .line 130
    invoke-virtual {v1, v2, v3, v4}, Lrx/c;->throttleFirst(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    new-instance v2, Ll/nen0;

    .line 135
    .line 136
    invoke-direct {v2, p0}, Ll/nen0;-><init>(Ll/ten0;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, Ll/rwn0;

    .line 151
    .line 152
    invoke-virtual {v1}, Ll/oo2;->N0()Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    new-instance v2, Ll/oen0;

    .line 161
    .line 162
    invoke-direct {v2, p0}, Ll/oen0;-><init>(Ll/ten0;)V

    .line 163
    .line 164
    .line 165
    new-instance v3, Ll/pen0;

    .line 166
    .line 167
    invoke-direct {v3}, Ll/pen0;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    check-cast v1, Ll/rwn0;

    .line 182
    .line 183
    invoke-virtual {v1}, Ll/oo2;->q1()Ll/aj1;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v1}, Ll/aj1;->c1()Lrx/c;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    const-wide/16 v2, 0x2

    .line 196
    .line 197
    invoke-virtual {v1, v2, v3, v4}, Lrx/c;->throttleFirst(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    new-instance v2, Ll/qen0;

    .line 202
    .line 203
    invoke-direct {v2, p0}, Ll/qen0;-><init>(Ll/ten0;)V

    .line 204
    .line 205
    .line 206
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 211
    .line 212
    .line 213
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v1}, Ll/vwt;->M6()Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-virtual {v2}, Ll/vwt;->b6()I

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    if-eqz v1, :cond_0

    .line 230
    .line 231
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    check-cast v1, Ll/rwn0;

    .line 236
    .line 237
    invoke-virtual {v1, v2, v4}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-virtual {p0, v1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    new-instance v2, Ll/ren0;

    .line 246
    .line 247
    invoke-direct {v2, p0, v0}, Ll/ren0;-><init>(Ll/ten0;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 248
    .line 249
    .line 250
    new-instance p0, Ll/sen0;

    .line 251
    .line 252
    invoke-direct {p0}, Ll/sen0;-><init>()V

    .line 253
    .line 254
    .line 255
    invoke-static {v2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 260
    .line 261
    .line 262
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
    invoke-virtual {p0}, Ll/ten0;->U3()V

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
    iput-object v0, p0, Ll/ten0;->i:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/ten0;->j:Ll/hen0;

    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->e()V

    .line 13
    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Ll/ten0;->k:J

    .line 18
    .line 19
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->i(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/rwn0;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;->j(D)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ten0;->init()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoicePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;->onVoicePkChange()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/jen0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/jen0;-><init>(Ll/ten0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

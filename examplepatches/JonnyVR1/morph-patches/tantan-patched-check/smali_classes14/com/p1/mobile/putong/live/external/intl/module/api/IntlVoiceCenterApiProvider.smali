.class public Lcom/p1/mobile/putong/live/external/intl/module/api/IntlVoiceCenterApiProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;Ll/kfn0;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-static {p2, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlVoiceCenterApiProvider;->stoppedTopicVoiceIdList(Ll/kfn0;Ljava/lang/String;Ljava/lang/String;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ll/bkj0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/bkj0;
    .locals 3

    .line 1
    new-instance v0, Ll/bkj0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/util/List;

    .line 6
    .line 7
    new-instance v2, Ll/kfn0;

    .line 8
    .line 9
    invoke-direct {v2, p1}, Ll/kfn0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, p0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public static synthetic c(Ll/bkj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlVoiceCenterApiProvider;->refreshStoppedTopicVoiceRoom(Ll/bkj0;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/y6u;->q(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceTabs:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public static getVoiceActivitiesChatData()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/feed/voice-live-activities-cell"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    new-array v1, v1, [Ll/st0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-class v1, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;

    .line 15
    .line 16
    const-string v2, "intlVoiceLiveActivitiesCell"

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/h9t;->c(Ljava/lang/Class;Ljava/lang/String;)Ll/d9t;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "getVoiceActivitiesChatData"

    .line 23
    .line 24
    invoke-static {v0, v2, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveRead(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    return-object v0
.end method

.method public static getVoiceLiveTabs()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/txp;->Companion:Ll/txp$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/txp$a;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "/feed/voice-live-tabs"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "/voice-live-tabs"

    .line 13
    .line 14
    :goto_0
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    new-array v1, v1, [Ll/st0;

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "getVoiceLiveTabs"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/asp;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/asp;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    return-object v0
.end method

.method public static getVoiceSquareCampaignData(I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceSquareCampaignBean;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-recommend-page-campaign"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, ""

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v1, "staySeconds"

    .line 35
    .line 36
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 37
    .line 38
    .line 39
    :cond_0
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-class v0, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceSquareCampaignBean;

    .line 44
    .line 45
    invoke-static {v0}, Ll/h9t;->b(Ljava/lang/Class;)Ll/d9t;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "getVoiceSquareCampaignData"

    .line 50
    .line 51
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveRead(Ll/rnl;Ljava/lang/String;Ll/wxr;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method private static refreshStoppedTopicVoiceRoom(Ll/bkj0;)Lrx/c;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/c<",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/kfn0;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    const-string v0, "/feed/recommend/voice-lives"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "with"

    .line 8
    .line 9
    const-string v2, "voice-rooms"

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const-string v1, "search"

    .line 16
    .line 17
    const-string v2, "suggested"

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget-object v1, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v1, Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "source"

    .line 28
    .line 29
    invoke-static {v2, v1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v1, "action"

    .line 34
    .line 35
    const-string v2, "refresh-stopped"

    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string v1, ","

    .line 42
    .line 43
    invoke-static {v1}, Ll/upq;->h(Ljava/lang/String;)Ll/upq;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v2, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v2, Ljava/lang/Iterable;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ll/upq;->d(Ljava/lang/Iterable;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "ids"

    .line 56
    .line 57
    invoke-static {v2, v1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 58
    .line 59
    .line 60
    move-result-object v7

    .line 61
    iget-object v1, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v1, Ljava/lang/String;

    .line 64
    .line 65
    const-string v2, "voice-room-topic"

    .line 66
    .line 67
    invoke-static {v2, v1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 68
    .line 69
    .line 70
    move-result-object v8

    .line 71
    filled-new-array/range {v3 .. v8}, [Ll/st0;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v1, "refreshStoppedTopicVoiceRoom"

    .line 80
    .line 81
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/zrp;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/zrp;-><init>(Ll/bkj0;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method public static refreshSwipTopicRooms(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ll/kfn0;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlVoiceCenterApiProvider;->requestTopicVoiceRooms(Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/xrp;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2}, Ll/xrp;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/yrp;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/yrp;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method private static requestTopicVoiceRooms(Ljava/util/List;Ljava/lang/String;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/kfn0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/feed/recommend/voice-lives"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "search"

    .line 8
    .line 9
    const-string v2, "given"

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "with"

    .line 16
    .line 17
    const-string v3, "voice-rooms"

    .line 18
    .line 19
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "source"

    .line 24
    .line 25
    invoke-static {v3, p1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v3, ","

    .line 30
    .line 31
    invoke-static {v3}, Ll/upq;->h(Ljava/lang/String;)Ll/upq;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3, p0}, Ll/upq;->d(Ljava/lang/Iterable;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v3, "ids"

    .line 40
    .line 41
    invoke-static {v3, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {v1, v2, p1, p0}, [Ll/st0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, "requestTopicVoiceRooms"

    .line 54
    .line 55
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance p1, Ll/s2v;

    .line 60
    .line 61
    invoke-direct {p1}, Ll/s2v;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method private static stoppedTopicVoiceIdList(Ll/kfn0;Ljava/lang/String;Ljava/lang/String;)Ll/bkj0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kfn0;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/kfn0;->a:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Ll/bsp;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ll/bsp;-><init>(Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/bkj0;

    .line 17
    .line 18
    invoke-direct {p0, v0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

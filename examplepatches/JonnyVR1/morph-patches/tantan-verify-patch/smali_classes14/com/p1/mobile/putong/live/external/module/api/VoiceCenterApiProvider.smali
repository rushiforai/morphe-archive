.class public Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;
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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    sget-object p0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/gm3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/gm3;->l:Lrx/subjects/b;

    .line 10
    .line 11
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
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

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static cancelRelationships(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "otherId"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p0, "status"

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string p0, "operate"

    .line 17
    .line 18
    const-string p1, "remove"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception p0

    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    const-string p0, ""

    .line 33
    .line 34
    :goto_0
    sget-object p1, Ll/txp;->Companion:Ll/txp$a;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/txp$a;->d()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    const-string p1, "/feed/voice-live-activity-moment/relation-status"

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    const-string p1, "/voice-live-activity-moment/relation-status"

    .line 46
    .line 47
    :goto_1
    invoke-static {p1}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/4 v0, 0x0

    .line 52
    new-array v0, v0, [Ll/st0;

    .line 53
    .line 54
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string v0, "cancelRelationships: "

    .line 59
    .line 60
    invoke-static {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePostNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p1, Ll/b5n0;

    .line 65
    .line 66
    invoke-direct {p1}, Ll/b5n0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveActivityMoment:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->memberActivityList:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic g(ZLl/bkj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;->refreshStoppedTopicVoiceRoom(Ll/bkj0;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static getDrawSuggestTopRoom(Ljava/lang/String;)Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-lives"

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
    const-string v2, "suggested"

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "source"

    .line 16
    .line 17
    const-string v3, "hot-room-shortcut"

    .line 18
    .line 19
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "action"

    .line 24
    .line 25
    invoke-static {v3, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v3, "with"

    .line 30
    .line 31
    const-string v4, "voice-rooms,users"

    .line 32
    .line 33
    invoke-static {v3, v4}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    filled-new-array {v1, v2, p0, v3}, [Ll/st0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "getDrawSuggestTopRoom"

    .line 46
    .line 47
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance v0, Ll/e5n0;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/e5n0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public static getVoiceNoticeList()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;",
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
    const-string v0, "/feed/voice-live-activity-moment/list"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "/voice-live-activity-moment/list"

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
    const-string v1, "getVoiceNoticeList"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/j5n0;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/j5n0;-><init>()V

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

.method public static getVoiceNoticeLivingList()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveActivityMoment;",
            ">;"
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
    const-string v0, "/feed/voice-live-activity-moment/previews"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "/voice-live-activity-moment/previews"

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
    const-string v1, "getVoiceLiveActivityMomentPreviews"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/h5n0;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/h5n0;-><init>()V

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

.method public static synthetic h(Ljava/lang/String;Ljava/lang/String;Ll/kfn0;)Ll/bkj0;
    .locals 0

    .line 1
    invoke-static {p2, p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;->stoppedTopicVoiceIdList(Ll/kfn0;Ljava/lang/String;Ljava/lang/String;)Ll/bkj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
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

.method public static postVoiceActivitiesToZero()V
    .locals 3

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
    const-string v0, "/feed/voice-live-activity-moment/clear"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "/voice-live-activity-moment/clear"

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
    const-string v1, "voiceActivitiesClear"

    .line 26
    .line 27
    const-string v2, ""

    .line 28
    .line 29
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePostNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/c5n0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/c5n0;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ll/d5n0;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/d5n0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private static refreshStoppedTopicVoiceRoom(Ll/bkj0;Z)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
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
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "/feed/recommend/voice-lives"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "/voice-lives"

    .line 7
    .line 8
    :goto_0
    invoke-static {p1}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "with"

    .line 13
    .line 14
    const-string v1, "voice-rooms,users,voice-live-user-mask"

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v0, "search"

    .line 21
    .line 22
    const-string v1, "suggested"

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    iget-object v0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v0, Ljava/lang/String;

    .line 31
    .line 32
    const-string v1, "source"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    const-string v0, "action"

    .line 39
    .line 40
    const-string v1, "refresh-stopped"

    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    const-string v0, ","

    .line 47
    .line 48
    invoke-static {v0}, Ll/upq;->h(Ljava/lang/String;)Ll/upq;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v1, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v1, Ljava/lang/Iterable;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/upq;->d(Ljava/lang/Iterable;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "ids"

    .line 61
    .line 62
    invoke-static {v1, v0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    iget-object v0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v0, Ljava/lang/String;

    .line 69
    .line 70
    const-string v1, "voice-room-topic"

    .line 71
    .line 72
    invoke-static {v1, v0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    filled-new-array/range {v2 .. v7}, [Ll/st0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const-string v0, "refreshStoppedTopicVoiceRoom"

    .line 85
    .line 86
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    new-instance v0, Ll/i5n0;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/i5n0;-><init>(Ll/bkj0;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0
.end method

.method public static refreshSwipTopicRooms(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
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
    invoke-static {p0, p2, p3}, Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;->requestTopicVoiceRooms(Ljava/util/List;Ljava/lang/String;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/f5n0;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2}, Ll/f5n0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/g5n0;

    .line 15
    .line 16
    invoke-direct {p1, p3}, Ll/g5n0;-><init>(Z)V

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

.method private static requestTopicVoiceRooms(Ljava/util/List;Ljava/lang/String;Z)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ll/kfn0;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string p2, "/feed/recommend/voice-lives"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p2, "/voice-lives"

    .line 7
    .line 8
    :goto_0
    invoke-static {p2}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const-string v0, "search"

    .line 13
    .line 14
    const-string v1, "given"

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "with"

    .line 21
    .line 22
    const-string v2, "voice-lives,voice-rooms,voice-live-user-mask,users"

    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "source"

    .line 29
    .line 30
    invoke-static {v2, p1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v2, ","

    .line 35
    .line 36
    invoke-static {v2}, Ll/upq;->h(Ljava/lang/String;)Ll/upq;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, p0}, Ll/upq;->d(Ljava/lang/Iterable;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v2, "ids"

    .line 45
    .line 46
    invoke-static {v2, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    filled-new-array {v0, v1, p1, p0}, [Ll/st0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p2, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p1, "requestTopicVoiceRooms"

    .line 59
    .line 60
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p1, Ll/s2v;

    .line 65
    .line 66
    invoke-direct {p1}, Ll/s2v;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
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
    new-instance v1, Ll/k5n0;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ll/k5n0;-><init>(Ljava/util/List;)V

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

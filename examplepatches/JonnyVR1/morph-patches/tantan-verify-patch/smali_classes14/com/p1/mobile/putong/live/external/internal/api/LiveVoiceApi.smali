.class public Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;
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

.method public static synthetic a(Ljava/util/Map;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)Lcom/p1/mobile/putong/live/base/data/BLiveCounter;
    .locals 1

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->liveTabUnread:I

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->liveTabUnread:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 8
    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->squareDetailUnread:I

    .line 10
    .line 11
    iput p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->squareDetailUnread:I

    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/ftn0$a;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomFeeds:Ljava/util/List;

    .line 4
    .line 5
    new-instance v1, Ll/ftn0$a;

    .line 6
    .line 7
    new-instance v2, Ll/kfn0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/kfn0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 10
    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    :goto_0
    invoke-direct {v1, v2, p0}, Ll/ftn0$a;-><init>(Ljava/lang/Object;I)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method

.method public static synthetic d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/pbi;
    .locals 8

    .line 1
    new-instance v2, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v5, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    .line 23
    .line 24
    new-instance v3, Ll/v2v;

    .line 25
    .line 26
    invoke-direct {v3, v1}, Ll/v2v;-><init>(Ljava/util/Map;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    .line 35
    .line 36
    new-instance v3, Ll/w2v;

    .line 37
    .line 38
    invoke-direct {v3, v5}, Ll/w2v;-><init>(Ljava/util/Map;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserFeedInfos:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_0

    .line 62
    .line 63
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;

    .line 68
    .line 69
    new-instance v6, Ll/bai;

    .line 70
    .line 71
    invoke-direct {v6}, Ll/bai;-><init>()V

    .line 72
    .line 73
    .line 74
    iget-object v7, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;->doing:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v6, v7}, Ll/bai;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserFeedInfos;->doingIcon:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v6, v4}, Ll/bai;->b(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    new-instance v4, Ljava/util/HashMap;

    .line 89
    .line 90
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 91
    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLives:Ljava/util/List;

    .line 96
    .line 97
    new-instance v0, Ll/k2v;

    .line 98
    .line 99
    invoke-direct {v0, v4}, Ll/k2v;-><init>(Ljava/util/Map;)V

    .line 100
    .line 101
    .line 102
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 103
    .line 104
    .line 105
    new-instance v0, Ll/pbi;

    .line 106
    .line 107
    move-object v6, p0

    .line 108
    invoke-direct/range {v0 .. v6}, Ll/pbi;-><init>(Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-object v0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->EMPTY_ROOM:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 24
    .line 25
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 1

    .line 1
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/gm3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/gm3;->h()Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)V
    .locals 1

    .line 1
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/gm3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/gm3;->h()Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static getFeedVoiceCardData(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/ftn0$a;",
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
    const-string v1, "search"

    .line 16
    .line 17
    const-string v2, "suggested"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "source"

    .line 24
    .line 25
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "with"

    .line 30
    .line 31
    const-string v2, "voice-rooms,users,voice-live-user-mask"

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "getFeedVoiceCardData"

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance v0, Ll/l2v;

    .line 60
    .line 61
    invoke-direct {v0}, Ll/l2v;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public static getFeedVoiceUserData(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/pbi;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-lives-users"

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
    const-string v1, "search"

    .line 16
    .line 17
    const-string v2, "suggested"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "source"

    .line 24
    .line 25
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "with"

    .line 30
    .line 31
    const-string v2, "voice-rooms,voice-lives"

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "getFeedVoiceUserData"

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/m2v;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/m2v;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public static getLiveListInTopicInFeed(Ljava/lang/String;Ljava/lang/String;JILjava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JI",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/kfn0;",
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
    const-string v1, "voice-room-topic"

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "with"

    .line 22
    .line 23
    const-string v2, "voice-rooms,users"

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "keyword"

    .line 30
    .line 31
    invoke-virtual {v0, v1, p6}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 32
    .line 33
    .line 34
    move-result-object p6

    .line 35
    const-string v0, "search"

    .line 36
    .line 37
    const-string v1, "suggested"

    .line 38
    .line 39
    invoke-virtual {p6, v0, v1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 40
    .line 41
    .line 42
    move-result-object p6

    .line 43
    const-string v0, "source"

    .line 44
    .line 45
    invoke-virtual {p6, v0, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p6, "limit"

    .line 50
    .line 51
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p4

    .line 55
    invoke-virtual {p0, p6, p4}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-wide/16 v0, 0x0

    .line 60
    .line 61
    cmp-long p4, p2, v0

    .line 62
    .line 63
    if-ltz p4, :cond_0

    .line 64
    .line 65
    const-string p4, "until"

    .line 66
    .line 67
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p0, p4, p2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 72
    .line 73
    .line 74
    :cond_0
    const-string p2, "orderBy"

    .line 75
    .line 76
    invoke-virtual {p0, p2, p5}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    new-instance p2, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string p3, "getLiveListInTopic"

    .line 86
    .line 87
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance p1, Ll/s2v;

    .line 102
    .line 103
    invoke-direct {p1}, Ll/s2v;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method public static getRoomInfo(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/users/"

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
    const-string p0, "/voice-rooms"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "getRoomInfo"

    .line 29
    .line 30
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/u2v;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/u2v;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static getVoiceDataByChatAssistant(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/kfn0;",
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
    const-string v2, "with"

    .line 16
    .line 17
    const-string v3, "voice-rooms,users"

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
    invoke-static {v3, p1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v3, "source"

    .line 30
    .line 31
    invoke-static {v3, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {v1, v2, p1, p0}, [Ll/st0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "getVoiceDataByAssistant"

    .line 44
    .line 45
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance p1, Ll/s2v;

    .line 50
    .line 51
    invoke-direct {p1}, Ll/s2v;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public static getVoiceFeedEntryConfig()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/udn0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/feed/voice-lives-summary"

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
    const-string v1, "with"

    .line 16
    .line 17
    const-string v2, "users"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "getVoiceFeedEntryConfig"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/n2v;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/n2v;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    return-object v0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveCounter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->liveCounters:Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/udn0;
    .locals 2

    .line 1
    new-instance v0, Ll/udn0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLivesSummary:Ljava/util/List;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Ll/udn0;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static synthetic j(Ljava/util/Map;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->memberCount:D

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic k(Ljava/util/Map;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic l(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static livePushPGCReport(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "/voice-distribution/pgcReport"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/google/gson/JsonObject;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/google/gson/JsonObject;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v2, "type"

    .line 21
    .line 22
    invoke-virtual {v1, v2, p0}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string p0, "source"

    .line 26
    .line 27
    invoke-virtual {v1, p0, p1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "pgcReport"

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePostNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
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

.method public static notifyRefreshVoiceActivitiesNum()V
    .locals 3

    .line 1
    invoke-static {}, Ll/y6u;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->requestVoiceRedDot()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->requestLiveCounter()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/p2v;

    .line 16
    .line 17
    invoke-direct {v2}, Ll/p2v;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/q2v;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/q2v;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->requestVoiceRedDot()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/r2v;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/r2v;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static postVoiceActivitiesToZero()V
    .locals 1

    .line 67
    const-string v0, ""

    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->postVoiceActivitiesToZero(Ljava/lang/String;)V

    return-void
.end method

.method public static postVoiceActivitiesToZero(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "/feed/voice-live-activities/counter"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "method"

    .line 8
    .line 9
    const-string v2, "delete"

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "type"

    .line 16
    .line 17
    invoke-static {v2, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    filled-new-array {v1, v2}, [Ll/st0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "postVoiceActivitiesToZero"

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v1, ""

    .line 44
    .line 45
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePostNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance v0, Ll/j2v;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/j2v;-><init>()V

    .line 52
    .line 53
    .line 54
    new-instance v1, Ll/o2v;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/o2v;-><init>()V

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

.method public static reportCreateVoiceInfo(Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/voice-live/track-events"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->e(Ljava/lang/String;)Ljava/lang/String;

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
    new-instance v1, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 17
    .line 18
    .line 19
    :try_start_0
    const-string v2, "eventType"

    .line 20
    .line 21
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    const-string p0, "reportCreateVoiceInfo"

    .line 30
    .line 31
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLivePostNetReqObs(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static requestVoiceRedDot()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCounter;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/feed/voice-live-activities/counter"

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
    const-string v1, "notifyRefreshVoiceActivitiesNum"

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/t2v;

    .line 21
    .line 22
    invoke-direct {v1}, Ll/t2v;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    return-object v0
.end method

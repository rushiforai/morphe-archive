.class public Ll/erf;
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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Lcom/p1/mobile/putong/data/LiveBubbleConfig;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->new_()Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->type:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 14
    .line 15
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowAfterWatch:I

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 18
    .line 19
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleDisappear:I

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 22
    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 38
    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 40
    .line 41
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTimeInterval:J

    .line 42
    .line 43
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleTimeInterval:J

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->id:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->subType:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->subType:Ljava/lang/String;

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 54
    .line 55
    iput v1, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowNotMatchedTimes:I

    .line 56
    .line 57
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 58
    .line 59
    iput p0, v0, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->bubbleShowDisappearDays:I

    .line 60
    .line 61
    return-object v0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LiveBubbleConfig;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveBubbleConfig;->new_()Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/LiveBubbleConfig;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->bubbleConfigs:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ll/drf;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/drf;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)Ll/f7s;
    .locals 3

    .line 1
    new-instance v0, Ll/f7s;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/f7s;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->discoverReddot:I

    .line 10
    .line 11
    iput v1, v0, Ll/f7s;->h:I

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->liveTabUnread:I

    .line 14
    .line 15
    iput v1, v0, Ll/f7s;->a:I

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 18
    .line 19
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->discoverUnread:I

    .line 20
    .line 21
    iput v1, v0, Ll/f7s;->d:I

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->voiceLiveTextRedDot:Ljava/util/List;

    .line 24
    .line 25
    new-instance v2, Ll/crf;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/crf;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Ll/f7s;->c:Ljava/util/List;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->activity:Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;

    .line 37
    .line 38
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->squareDetailUnread:I

    .line 39
    .line 40
    iput v2, v0, Ll/f7s;->f:I

    .line 41
    .line 42
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->squareSummaryUnread:I

    .line 43
    .line 44
    iput v2, v0, Ll/f7s;->e:I

    .line 45
    .line 46
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCounter;->voiceActivityUnread:I

    .line 47
    .line 48
    iput v1, v0, Ll/f7s;->g:I

    .line 49
    .line 50
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->voiceLiveReddot:I

    .line 51
    .line 52
    iput p0, v0, Ll/f7s;->b:I

    .line 53
    .line 54
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 10
    .line 11
    invoke-static {v1}, Ll/erf;->f(Lcom/p1/mobile/putong/data/Owner;)Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 18
    .line 19
    invoke-static {v1}, Ll/erf;->f(Lcom/p1/mobile/putong/data/Owner;)Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 26
    .line 27
    invoke-static {v1}, Ll/erf;->j(Lcom/p1/mobile/putong/data/StreamUrl;)Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 32
    .line 33
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 34
    .line 35
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 36
    .line 37
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 38
    .line 39
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 40
    .line 41
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 42
    .line 43
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->startTime:D

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 46
    .line 47
    invoke-static {v1}, Ll/erf;->h(Lcom/p1/mobile/putong/data/LiveState;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 56
    .line 57
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 58
    .line 59
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->endTime:D

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 62
    .line 63
    invoke-static {v1}, Ll/erf;->i(Lcom/p1/mobile/putong/data/StreamCdnInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 70
    .line 71
    invoke-static {v1}, Ll/erf;->g(Lcom/p1/mobile/putong/data/RecommendInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 78
    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 82
    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 86
    .line 87
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 88
    .line 89
    return-object v0
.end method

.method public static f(Lcom/p1/mobile/putong/data/Owner;)Lcom/p1/mobile/putong/live/base/data/BLiveOwner;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Owner;->type:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->type:Ljava/lang/String;

    .line 12
    .line 13
    return-object v0
.end method

.method public static g(Lcom/p1/mobile/putong/data/RecommendInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RecommendInfo;->category:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 8
    .line 9
    iget p0, p0, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 10
    .line 11
    iput p0, v0, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 12
    .line 13
    return-object v0
.end method

.method public static h(Lcom/p1/mobile/putong/data/LiveState;)Lcom/p1/mobile/putong/live/base/data/BLiveState;
    .locals 2

    .line 1
    const-string v0, "onlive"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string v0, "suspended"

    .line 15
    .line 16
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string v0, "stopped"

    .line 28
    .line 29
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_2
    const-string p0, "unknown_"

    .line 41
    .line 42
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/putong/data/StreamCdnInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/data/StreamCdnInfo;->provider:I

    .line 6
    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/data/StreamCdnInfo;->businessType:I

    .line 10
    .line 11
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 12
    .line 13
    return-object v0
.end method

.method public static j(Lcom/p1/mobile/putong/data/StreamUrl;)Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/StreamUrl;->pullHls:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullHls:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/StreamUrl;->pullFlv:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/StreamUrl;->pullRtmp:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullRtmp:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/StreamUrl;->push:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 20
    .line 21
    return-object v0
.end method

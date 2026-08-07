.class public Ll/cxn;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getOpen()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->open:Z

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getHomeStretch()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->homeStretch:Z

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getConfig()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->getPollingIntervalInSeconds()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;->pollingIntervalInSeconds:J

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getConfig()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->getScrollIntervalInSeconds()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;->scrollIntervalInSeconds:J

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->config:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getCurrentList()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;->getName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->name:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;->getGiftId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftId:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;->getGiftIcon()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftIcon:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;->getAmount()J

    .line 91
    .line 92
    .line 93
    move-result-wide v3

    .line 94
    iput-wide v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->amount:J

    .line 95
    .line 96
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;->getRank()J

    .line 97
    .line 98
    .line 99
    move-result-wide v3

    .line 100
    iput-wide v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->rank:J

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;->getGap()J

    .line 103
    .line 104
    .line 105
    move-result-wide v3

    .line 106
    iput-wide v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->gap:J

    .line 107
    .line 108
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->current:Ljava/util/List;

    .line 113
    .line 114
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getJumpUrl()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->jumpUrl:Ljava/lang/String;

    .line 119
    .line 120
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.intl.giftLeaderboard"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/cxn;->B(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/cxn;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

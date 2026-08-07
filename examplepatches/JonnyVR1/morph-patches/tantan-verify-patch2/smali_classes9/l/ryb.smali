.class public Ll/ryb;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
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

.method public static B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRankings(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {v0, p0}, Ll/zsj;->C(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public C(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRankings(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getRankingsCount()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;->getRoomId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "no_care"

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0, v0}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    return p2
.end method

.method public D(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
    .locals 0

    .line 1
    invoke-static {p2}, Ll/ryb;->B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.gift.currentHourLeaderboards"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ryb;->C(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ryb;->D(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

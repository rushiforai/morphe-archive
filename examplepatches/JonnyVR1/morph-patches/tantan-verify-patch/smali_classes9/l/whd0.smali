.class public Ll/whd0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;",
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
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;",
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
.method public B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mq2;->c:Ll/zod;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;->getLiveId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;
    .locals 0

    .line 1
    return-object p2
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
    const-string p0, "live.gift.roomLiveLeaderboards"

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
    invoke-virtual {p0, p1, p2}, Ll/whd0;->B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;Ljava/lang/String;)Z

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
    invoke-virtual {p0, p1, p2}, Ll/whd0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

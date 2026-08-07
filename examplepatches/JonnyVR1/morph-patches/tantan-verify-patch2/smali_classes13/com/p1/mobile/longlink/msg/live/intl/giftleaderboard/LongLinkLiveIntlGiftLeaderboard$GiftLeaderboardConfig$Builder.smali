.class public final Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfigOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->e()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/a3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearPollingIntervalInSeconds()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->a(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearScrollIntervalInSeconds()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->b(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getPollingIntervalInSeconds()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->getPollingIntervalInSeconds()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getScrollIntervalInSeconds()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->getScrollIntervalInSeconds()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public setPollingIntervalInSeconds(J)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->c(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setScrollIntervalInSeconds(J)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->d(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

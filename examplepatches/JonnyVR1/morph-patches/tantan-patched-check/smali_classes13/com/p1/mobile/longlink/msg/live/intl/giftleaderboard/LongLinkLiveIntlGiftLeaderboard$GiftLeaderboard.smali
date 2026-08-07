.class public final Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GiftLeaderboard"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardOrBuilder;"
    }
.end annotation


# static fields
.field public static final CONFIG_FIELD_NUMBER:I = 0x3

.field public static final CURRENT_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

.field public static final HOMESTRETCH_FIELD_NUMBER:I = 0x2

.field public static final JUMPURL_FIELD_NUMBER:I = 0x5

.field public static final OPEN_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I

.field private config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

.field private current_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;",
            ">;"
        }
    .end annotation
.end field

.field private homeStretch_:Z

.field private jumpUrl_:Ljava/lang/String;

.field private open_:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->addAllCurrent(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllCurrent(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->ensureCurrentIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addCurrent(ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->ensureCurrentIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addCurrent(ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->ensureCurrentIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addCurrent(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->ensureCurrentIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addCurrent(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->ensureCurrentIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->addCurrent(ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->addCurrent(ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V

    return-void
.end method

.method private clearConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearCurrent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearHomeStretch()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearJumpUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getJumpUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOpen()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->addCurrent(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->addCurrent(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V

    return-void
.end method

.method private ensureCurrentIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->clearConfig()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->clearCurrent()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->clearHomeStretch()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->clearJumpUrl()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->clearOpen()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->mergeConfig(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->removeCurrent(I)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->setConfig(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;)V

    return-void
.end method

.method private mergeConfig(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->setConfig(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->setCurrent(ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->setCurrent(ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->setHomeStretch(Z)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->setJumpUrl(Ljava/lang/String;)V

    return-void
.end method

.method private removeCurrent(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->ensureCurrentIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->setJumpUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setConfig(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setConfig(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    return-void
.end method

.method private setCurrent(ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->ensureCurrentIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setCurrent(ILcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->ensureCurrentIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setHomeStretch(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setJumpUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setJumpUrlBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOpen(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->setOpen(Z)V

    return-void
.end method

.method public static bridge synthetic u()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/l710;->a()V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->PARSER:Ll/ng60;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    monitor-exit p0

    .line 42
    goto :goto_2

    .line 43
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p1

    .line 45
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->PARSER:Ll/ng60;

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 49
    .line 50
    check-cast p3, Lcom/google/protobuf/h;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    :cond_2
    :goto_3
    if-nez p1, :cond_b

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    const/16 v3, 0x8

    .line 62
    .line 63
    if-eq v2, v3, :cond_a

    .line 64
    .line 65
    const/16 v3, 0x10

    .line 66
    .line 67
    if-eq v2, v3, :cond_9

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_7

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_5

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq v2, v3, :cond_4

    .line 80
    .line 81
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-nez v2, :cond_2

    .line 86
    .line 87
    :cond_3
    move p1, v1

    .line 88
    goto :goto_3

    .line 89
    :catch_0
    move-exception p1

    .line 90
    goto :goto_5

    .line 91
    :catch_1
    move-exception p1

    .line 92
    goto/16 :goto_6

    .line 93
    .line 94
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 102
    .line 103
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-nez v2, :cond_6

    .line 108
    .line 109
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 110
    .line 111
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 116
    .line 117
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;->parser()Ll/ng60;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    check-cast v3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;

    .line 128
    .line 129
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 134
    .line 135
    if-eqz v2, :cond_8

    .line 136
    .line 137
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    check-cast v2, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig$Builder;

    .line 142
    .line 143
    goto :goto_4

    .line 144
    :cond_8
    move-object v2, v0

    .line 145
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->parser()Ll/ng60;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    check-cast v3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 154
    .line 155
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 156
    .line 157
    if-eqz v2, :cond_2

    .line 158
    .line 159
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    check-cast v2, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 167
    .line 168
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 169
    .line 170
    goto :goto_3

    .line 171
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    iput-boolean v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    iput-boolean v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 183
    .line 184
    goto/16 :goto_3

    .line 185
    .line 186
    :catchall_1
    move-exception p0

    .line 187
    throw p0

    .line 188
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 189
    .line 190
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 202
    .line 203
    .line 204
    return-object v0

    .line 205
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 210
    .line 211
    .line 212
    return-object v0

    .line 213
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 214
    .line 215
    return-object p0

    .line 216
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 217
    .line 218
    check-cast p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 219
    .line 220
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z

    .line 221
    .line 222
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z

    .line 223
    .line 224
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z

    .line 229
    .line 230
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 231
    .line 232
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 233
    .line 234
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 239
    .line 240
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 241
    .line 242
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 243
    .line 244
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 249
    .line 250
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 253
    .line 254
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 255
    .line 256
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 261
    .line 262
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    xor-int/2addr p1, v1

    .line 269
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 270
    .line 271
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 272
    .line 273
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    xor-int/2addr v1, v2

    .line 278
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 279
    .line 280
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 285
    .line 286
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 287
    .line 288
    if-ne p2, p1, :cond_c

    .line 289
    .line 290
    iget p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->bitField0_:I

    .line 291
    .line 292
    iget p2, p3, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->bitField0_:I

    .line 293
    .line 294
    or-int/2addr p1, p2

    .line 295
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->bitField0_:I

    .line 296
    .line 297
    :cond_c
    return-object p0

    .line 298
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;

    .line 299
    .line 300
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard$Builder;-><init>(Ll/a3w;)V

    .line 301
    .line 302
    .line 303
    return-object p0

    .line 304
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 305
    .line 306
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 307
    .line 308
    .line 309
    return-object v0

    .line 310
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 311
    .line 312
    return-object p0

    .line 313
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;

    .line 314
    .line 315
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;-><init>()V

    .line 316
    .line 317
    .line 318
    return-object p0

    .line 319
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public getConfig()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getCurrent(I)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;

    .line 8
    .line 9
    return-object p0
.end method

.method public getCurrentCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getCurrentList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentOrBuilder(I)Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItemOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItemOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getCurrentOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardItemOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHomeStretch()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getJumpUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJumpUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v1

    .line 19
    :goto_0
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 20
    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    add-int/2addr v0, v2

    .line 29
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 30
    .line 31
    if-eqz v2, :cond_3

    .line 32
    .line 33
    const/4 v2, 0x3

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getConfig()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    add-int/2addr v0, v2

    .line 43
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 44
    .line 45
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ge v1, v2, :cond_4

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 52
    .line 53
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/google/protobuf/q;

    .line 58
    .line 59
    const/4 v3, 0x4

    .line 60
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    add-int/2addr v0, v2

    .line 65
    add-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x5

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getJumpUrl()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    add-int/2addr v0, v1

    .line 86
    :cond_5
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 87
    .line 88
    return v0
.end method

.method public hasConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->open_:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->homeStretch_:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->config_:Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getConfig()Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboardConfig;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    const/4 v0, 0x0

    .line 30
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 31
    .line 32
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-ge v0, v1, :cond_3

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->current_:Lcom/google/protobuf/l$h;

    .line 39
    .line 40
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lcom/google/protobuf/q;

    .line 45
    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 48
    .line 49
    .line 50
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->jumpUrl_:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_4

    .line 60
    .line 61
    const/4 v0, 0x5

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/intl/giftleaderboard/LongLinkLiveIntlGiftLeaderboard$GiftLeaderboard;->getJumpUrl()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    return-void
.end method

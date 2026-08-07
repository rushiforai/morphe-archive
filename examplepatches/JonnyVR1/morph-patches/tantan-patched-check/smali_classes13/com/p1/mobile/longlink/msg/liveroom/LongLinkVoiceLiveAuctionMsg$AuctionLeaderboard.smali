.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboardOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AuctionLeaderboard"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboardOrBuilder;"
    }
.end annotation


# static fields
.field public static final AMOUNTBACKGROUNDID_FIELD_NUMBER:I = 0x9

.field public static final AMOUNT_FIELD_NUMBER:I = 0x2

.field public static final AVATARFRAMEDYNAMICURL_FIELD_NUMBER:I = 0x7

.field public static final AVATARFRAMEURL_FIELD_NUMBER:I = 0x6

.field public static final AVATAR_FIELD_NUMBER:I = 0x5

.field public static final BACKGROUND_FIELD_NUMBER:I = 0x8

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;",
            ">;"
        }
    .end annotation
.end field

.field public static final RANK_FIELD_NUMBER:I = 0x1

.field public static final USERID_FIELD_NUMBER:I = 0x3

.field public static final USERNAME_FIELD_NUMBER:I = 0x4


# instance fields
.field private amountBackgroundId_:Ljava/lang/String;

.field private amount_:J

.field private avatarFrameDynamicUrl_:Ljava/lang/String;

.field private avatarFrameUrl_:Ljava/lang/String;

.field private avatar_:Ljava/lang/String;

.field private background_:Ljava/lang/String;

.field private rank_:J

.field private userId_:Ljava/lang/String;

.field private userName_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

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
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearAmount()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearAmountBackgroundId()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearAvatar()V

    return-void
.end method

.method private clearAmount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearAmountBackgroundId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAmountBackgroundId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAvatar()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatar()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAvatarFrameDynamicUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatarFrameDynamicUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAvatarFrameUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatarFrameUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearBackground()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getBackground()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRank()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearAvatarFrameDynamicUrl()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearAvatarFrameUrl()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearBackground()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearRank()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->clearUserName()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAmount(J)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAmountBackgroundId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAmountBackgroundIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAvatar(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAvatarBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAvatarFrameDynamicUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAvatarFrameDynamicUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAvatarFrameUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setAvatarFrameUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setBackground(Ljava/lang/String;)V

    return-void
.end method

.method private setAmount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 2
    .line 3
    return-void
.end method

.method private setAmountBackgroundId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAmountBackgroundIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAvatarBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAvatarFrameDynamicUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAvatarFrameDynamicUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAvatarFrameUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAvatarFrameUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setBackground(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBackgroundBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRank(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J

    .line 2
    .line 3
    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setBackgroundBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setRank(J)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v1, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/l710;->a()V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->PARSER:Ll/ng60;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 51
    .line 52
    check-cast p3, Lcom/google/protobuf/h;

    .line 53
    .line 54
    :cond_2
    :goto_3
    if-nez v0, :cond_d

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/16 p3, 0x8

    .line 63
    .line 64
    if-eq p1, p3, :cond_c

    .line 65
    .line 66
    const/16 p3, 0x10

    .line 67
    .line 68
    if-eq p1, p3, :cond_b

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_a

    .line 73
    .line 74
    const/16 p3, 0x22

    .line 75
    .line 76
    if-eq p1, p3, :cond_9

    .line 77
    .line 78
    const/16 p3, 0x2a

    .line 79
    .line 80
    if-eq p1, p3, :cond_8

    .line 81
    .line 82
    const/16 p3, 0x32

    .line 83
    .line 84
    if-eq p1, p3, :cond_7

    .line 85
    .line 86
    const/16 p3, 0x3a

    .line 87
    .line 88
    if-eq p1, p3, :cond_6

    .line 89
    .line 90
    const/16 p3, 0x42

    .line 91
    .line 92
    if-eq p1, p3, :cond_5

    .line 93
    .line 94
    const/16 p3, 0x4a

    .line 95
    .line 96
    if-eq p1, p3, :cond_4

    .line 97
    .line 98
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_2

    .line 103
    .line 104
    :cond_3
    move v0, v2

    .line 105
    goto :goto_3

    .line 106
    :catch_0
    move-exception v0

    .line 107
    move-object p1, v0

    .line 108
    goto :goto_4

    .line 109
    :catch_1
    move-exception v0

    .line 110
    move-object p1, v0

    .line 111
    goto :goto_5

    .line 112
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 162
    .line 163
    .line 164
    move-result-wide v3

    .line 165
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 169
    .line 170
    .line 171
    move-result-wide v3

    .line 172
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :catchall_1
    move-exception v0

    .line 176
    move-object p0, v0

    .line 177
    throw p0

    .line 178
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    return-object v1

    .line 195
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 200
    .line 201
    .line 202
    return-object v1

    .line 203
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 204
    .line 205
    return-object p0

    .line 206
    :pswitch_3
    move-object v3, p2

    .line 207
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 208
    .line 209
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 210
    .line 211
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J

    .line 212
    .line 213
    const-wide/16 p1, 0x0

    .line 214
    .line 215
    cmp-long v1, v5, p1

    .line 216
    .line 217
    if-eqz v1, :cond_e

    .line 218
    .line 219
    move v4, v2

    .line 220
    goto :goto_6

    .line 221
    :cond_e
    move v4, v0

    .line 222
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J

    .line 223
    .line 224
    cmp-long v1, v8, p1

    .line 225
    .line 226
    if-eqz v1, :cond_f

    .line 227
    .line 228
    move v7, v2

    .line 229
    goto :goto_7

    .line 230
    :cond_f
    move v7, v0

    .line 231
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 232
    .line 233
    .line 234
    move-result-wide v4

    .line 235
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J

    .line 236
    .line 237
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 238
    .line 239
    cmp-long v1, v5, p1

    .line 240
    .line 241
    if-eqz v1, :cond_10

    .line 242
    .line 243
    move v4, v2

    .line 244
    goto :goto_8

    .line 245
    :cond_10
    move v4, v0

    .line 246
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 247
    .line 248
    cmp-long p1, v8, p1

    .line 249
    .line 250
    if-eqz p1, :cond_11

    .line 251
    .line 252
    move v7, v2

    .line 253
    goto :goto_9

    .line 254
    :cond_11
    move v7, v0

    .line 255
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 256
    .line 257
    .line 258
    move-result-wide p1

    .line 259
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    xor-int/2addr p1, v2

    .line 268
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    xor-int/2addr v0, v2

    .line 277
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 278
    .line 279
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 284
    .line 285
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 288
    .line 289
    .line 290
    move-result p1

    .line 291
    xor-int/2addr p1, v2

    .line 292
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 293
    .line 294
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    xor-int/2addr v0, v2

    .line 301
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 302
    .line 303
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 308
    .line 309
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    xor-int/2addr p1, v2

    .line 316
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 317
    .line 318
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    xor-int/2addr v0, v2

    .line 325
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 326
    .line 327
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p1

    .line 331
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 332
    .line 333
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 336
    .line 337
    .line 338
    move-result p1

    .line 339
    xor-int/2addr p1, v2

    .line 340
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 341
    .line 342
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 343
    .line 344
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    xor-int/2addr v0, v2

    .line 349
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 350
    .line 351
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object p1

    .line 355
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 356
    .line 357
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 358
    .line 359
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 360
    .line 361
    .line 362
    move-result p1

    .line 363
    xor-int/2addr p1, v2

    .line 364
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 365
    .line 366
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 367
    .line 368
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    xor-int/2addr v0, v2

    .line 373
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 374
    .line 375
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object p1

    .line 379
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 380
    .line 381
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 384
    .line 385
    .line 386
    move-result p1

    .line 387
    xor-int/2addr p1, v2

    .line 388
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 389
    .line 390
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 391
    .line 392
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 393
    .line 394
    .line 395
    move-result v0

    .line 396
    xor-int/2addr v0, v2

    .line 397
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 398
    .line 399
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object p1

    .line 403
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 404
    .line 405
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 406
    .line 407
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 408
    .line 409
    .line 410
    move-result p1

    .line 411
    xor-int/2addr p1, v2

    .line 412
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 413
    .line 414
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 415
    .line 416
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 417
    .line 418
    .line 419
    move-result v0

    .line 420
    xor-int/2addr v0, v2

    .line 421
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 422
    .line 423
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 428
    .line 429
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 430
    .line 431
    return-object p0

    .line 432
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;

    .line 433
    .line 434
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard$Builder;-><init>(Ll/f4w;)V

    .line 435
    .line 436
    .line 437
    return-object p0

    .line 438
    :pswitch_5
    return-object v1

    .line 439
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 440
    .line 441
    return-object p0

    .line 442
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;

    .line 443
    .line 444
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;-><init>()V

    .line 445
    .line 446
    .line 447
    return-object p0

    .line 448
    nop

    .line 449
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

.method public getAmount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getAmountBackgroundId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAmountBackgroundIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

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

.method public getAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvatarBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

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

.method public getAvatarFrameDynamicUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvatarFrameDynamicUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

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

.method public getAvatarFrameUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvatarFrameUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

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

.method public getBackground()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBackgroundBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

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

.method public getRank()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSerializedSize()I
    .locals 6

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v4, v0, v2

    .line 12
    .line 13
    if-eqz v4, :cond_1

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    invoke-static {v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    :goto_0
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 23
    .line 24
    cmp-long v1, v4, v2

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x3

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getUserId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/2addr v0, v1

    .line 52
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x4

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getUserName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    add-int/2addr v0, v1

    .line 70
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_5

    .line 77
    .line 78
    const/4 v1, 0x5

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatar()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    add-int/2addr v0, v1

    .line 88
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_6

    .line 95
    .line 96
    const/4 v1, 0x6

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatarFrameUrl()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    add-int/2addr v0, v1

    .line 106
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_7

    .line 113
    .line 114
    const/4 v1, 0x7

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatarFrameDynamicUrl()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    add-int/2addr v0, v1

    .line 124
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_8

    .line 131
    .line 132
    const/16 v1, 0x8

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getBackground()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    add-int/2addr v0, v1

    .line 143
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-nez v1, :cond_9

    .line 150
    .line 151
    const/16 v1, 0x9

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAmountBackgroundId()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    add-int/2addr v0, v1

    .line 162
    :cond_9
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 163
    .line 164
    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

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

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

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

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->rank_:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amount_:J

    .line 14
    .line 15
    cmp-long v2, v0, v2

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userId_:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getUserId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->userName_:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    const/4 v0, 0x4

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getUserName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatar_:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_4

    .line 62
    .line 63
    const/4 v0, 0x5

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatar()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameUrl_:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_5

    .line 78
    .line 79
    const/4 v0, 0x6

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatarFrameUrl()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->avatarFrameDynamicUrl_:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_6

    .line 94
    .line 95
    const/4 v0, 0x7

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAvatarFrameDynamicUrl()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->background_:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_7

    .line 110
    .line 111
    const/16 v0, 0x8

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getBackground()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->amountBackgroundId_:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_8

    .line 127
    .line 128
    const/16 v0, 0x9

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;->getAmountBackgroundId()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_8
    return-void
.end method

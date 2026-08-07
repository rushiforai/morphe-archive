.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceLiveRanking"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingOrBuilder;"
    }
.end annotation


# static fields
.field public static final AMOUNT_FIELD_NUMBER:I = 0x7

.field public static final ANCHORID_FIELD_NUMBER:I = 0x2

.field public static final ANCHORIMAGE_FIELD_NUMBER:I = 0x5

.field public static final ANCHORNAME_FIELD_NUMBER:I = 0x6

.field public static final CONTENT_FIELD_NUMBER:I = 0x9

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

.field public static final GAP_FIELD_NUMBER:I = 0xa

.field public static final LIVEID_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;",
            ">;"
        }
    .end annotation
.end field

.field public static final RANK_FIELD_NUMBER:I = 0x1

.field public static final ROOMID_FIELD_NUMBER:I = 0x3

.field public static final USERLIVESTATE_FIELD_NUMBER:I = 0x8


# instance fields
.field private amount_:J

.field private anchorId_:Ljava/lang/String;

.field private anchorImage_:Ljava/lang/String;

.field private anchorName_:Ljava/lang/String;

.field private content_:Ljava/lang/String;

.field private gap_:J

.field private liveId_:Ljava/lang/String;

.field private rank_:J

.field private roomId_:Ljava/lang/String;

.field private userLiveState_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setUserLiveStateValue(I)V

    return-void
.end method

.method public static bridge synthetic B()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearAmount()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearAnchorId()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearAnchorImage()V

    return-void
.end method

.method private clearAmount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearAnchorId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorImage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorImage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearContent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getContent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGap()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

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
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserLiveState()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearAnchorName()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearContent()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearGap()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearLiveId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearRank()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->clearUserLiveState()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setAmount(J)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setAnchorId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setAnchorIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setAnchorImage(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setAnchorImageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setAnchorName(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setAnchorNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setContent(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setContentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setAmount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 2
    .line 3
    return-void
.end method

.method private setAnchorId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAnchorImage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorImageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAnchorName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setContentBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGap(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 2
    .line 3
    return-void
.end method

.method private setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRank(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRoomIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserLiveState(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 9
    .line 10
    return-void
.end method

.method private setUserLiveStateValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setGap(J)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setRank(J)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->setUserLiveState(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_3

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    sparse-switch p1, :sswitch_data_0

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    :sswitch_0
    move v0, v2

    .line 70
    goto :goto_3

    .line 71
    :catch_0
    move-exception v0

    .line 72
    move-object p1, v0

    .line 73
    goto :goto_4

    .line 74
    :catch_1
    move-exception v0

    .line 75
    move-object p1, v0

    .line 76
    goto :goto_5

    .line 77
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 78
    .line 79
    .line 80
    move-result-wide v3

    .line 81
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 99
    .line 100
    .line 101
    move-result-wide v3

    .line 102
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 141
    .line 142
    .line 143
    move-result-wide v3

    .line 144
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :catchall_1
    move-exception v0

    .line 148
    move-object p0, v0

    .line 149
    throw p0

    .line 150
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 151
    .line 152
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 164
    .line 165
    .line 166
    return-object v1

    .line 167
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 172
    .line 173
    .line 174
    return-object v1

    .line 175
    :cond_3
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 176
    .line 177
    return-object p0

    .line 178
    :pswitch_3
    move-object v3, p2

    .line 179
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 180
    .line 181
    check-cast p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 182
    .line 183
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J

    .line 184
    .line 185
    const-wide/16 p1, 0x0

    .line 186
    .line 187
    cmp-long v1, v5, p1

    .line 188
    .line 189
    if-eqz v1, :cond_4

    .line 190
    .line 191
    move v4, v2

    .line 192
    goto :goto_6

    .line 193
    :cond_4
    move v4, v0

    .line 194
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J

    .line 195
    .line 196
    cmp-long v1, v8, p1

    .line 197
    .line 198
    if-eqz v1, :cond_5

    .line 199
    .line 200
    move v7, v2

    .line 201
    goto :goto_7

    .line 202
    :cond_5
    move v7, v0

    .line 203
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 204
    .line 205
    .line 206
    move-result-wide v4

    .line 207
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    xor-int/2addr v1, v2

    .line 216
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 217
    .line 218
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    xor-int/2addr v5, v2

    .line 225
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 226
    .line 227
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    xor-int/2addr v1, v2

    .line 240
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 241
    .line 242
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 243
    .line 244
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 245
    .line 246
    .line 247
    move-result v5

    .line 248
    xor-int/2addr v5, v2

    .line 249
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 250
    .line 251
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 256
    .line 257
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    xor-int/2addr v1, v2

    .line 264
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 265
    .line 266
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    xor-int/2addr v5, v2

    .line 273
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 274
    .line 275
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 282
    .line 283
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    xor-int/2addr v1, v2

    .line 288
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 289
    .line 290
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 293
    .line 294
    .line 295
    move-result v5

    .line 296
    xor-int/2addr v5, v2

    .line 297
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 298
    .line 299
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 304
    .line 305
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    xor-int/2addr v1, v2

    .line 312
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 313
    .line 314
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 315
    .line 316
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 317
    .line 318
    .line 319
    move-result v5

    .line 320
    xor-int/2addr v5, v2

    .line 321
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 322
    .line 323
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 328
    .line 329
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 330
    .line 331
    cmp-long v1, v5, p1

    .line 332
    .line 333
    if-eqz v1, :cond_6

    .line 334
    .line 335
    move v4, v2

    .line 336
    goto :goto_8

    .line 337
    :cond_6
    move v4, v0

    .line 338
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 339
    .line 340
    cmp-long v1, v8, p1

    .line 341
    .line 342
    if-eqz v1, :cond_7

    .line 343
    .line 344
    move v7, v2

    .line 345
    goto :goto_9

    .line 346
    :cond_7
    move v7, v0

    .line 347
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 348
    .line 349
    .line 350
    move-result-wide v4

    .line 351
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 352
    .line 353
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 354
    .line 355
    if-eqz v1, :cond_8

    .line 356
    .line 357
    move v4, v2

    .line 358
    goto :goto_a

    .line 359
    :cond_8
    move v4, v0

    .line 360
    :goto_a
    iget v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 361
    .line 362
    if-eqz v5, :cond_9

    .line 363
    .line 364
    move v6, v2

    .line 365
    goto :goto_b

    .line 366
    :cond_9
    move v6, v0

    .line 367
    :goto_b
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    iput v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 372
    .line 373
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 374
    .line 375
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    xor-int/2addr v1, v2

    .line 380
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 381
    .line 382
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 385
    .line 386
    .line 387
    move-result v5

    .line 388
    xor-int/2addr v5, v2

    .line 389
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 390
    .line 391
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 396
    .line 397
    move v1, v0

    .line 398
    move v4, v2

    .line 399
    move-object v0, v3

    .line 400
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 401
    .line 402
    cmp-long v5, v2, p1

    .line 403
    .line 404
    if-eqz v5, :cond_a

    .line 405
    .line 406
    move v5, v1

    .line 407
    move v1, v4

    .line 408
    goto :goto_c

    .line 409
    :cond_a
    move v5, v1

    .line 410
    :goto_c
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 411
    .line 412
    cmp-long p1, v6, p1

    .line 413
    .line 414
    if-eqz p1, :cond_b

    .line 415
    .line 416
    :goto_d
    move-wide v5, v6

    .line 417
    goto :goto_e

    .line 418
    :cond_b
    move v4, v5

    .line 419
    goto :goto_d

    .line 420
    :goto_e
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 421
    .line 422
    .line 423
    move-result-wide p1

    .line 424
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 425
    .line 426
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 427
    .line 428
    return-object p0

    .line 429
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;

    .line 430
    .line 431
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;-><init>(Ll/c4o0;)V

    .line 432
    .line 433
    .line 434
    return-object p0

    .line 435
    :pswitch_5
    return-object v1

    .line 436
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 437
    .line 438
    return-object p0

    .line 439
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 440
    .line 441
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;-><init>()V

    .line 442
    .line 443
    .line 444
    return-object p0

    .line 445
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

    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_a
        0x12 -> :sswitch_9
        0x1a -> :sswitch_8
        0x22 -> :sswitch_7
        0x2a -> :sswitch_6
        0x32 -> :sswitch_5
        0x38 -> :sswitch_4
        0x40 -> :sswitch_3
        0x4a -> :sswitch_2
        0x50 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAmount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getAnchorId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

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

.method public getAnchorImage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorImageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

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

.method public getAnchorName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

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

.method public getContent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

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

.method public getGap()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getRoomId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x4

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getLiveId()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_5

    .line 83
    .line 84
    const/4 v1, 0x5

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorImage()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_6

    .line 101
    .line 102
    const/4 v1, 0x6

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_6
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 113
    .line 114
    cmp-long v1, v4, v2

    .line 115
    .line 116
    if-eqz v1, :cond_7

    .line 117
    .line 118
    const/4 v1, 0x7

    .line 119
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    add-int/2addr v0, v1

    .line 124
    :cond_7
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 125
    .line 126
    sget-object v4, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->onlive:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 127
    .line 128
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->getNumber()I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    if-eq v1, v4, :cond_8

    .line 133
    .line 134
    const/16 v1, 0x8

    .line 135
    .line 136
    iget v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 137
    .line 138
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    add-int/2addr v0, v1

    .line 143
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getContent()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    add-int/2addr v0, v1

    .line 162
    :cond_9
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 163
    .line 164
    cmp-long v1, v4, v2

    .line 165
    .line 166
    if-eqz v1, :cond_a

    .line 167
    .line 168
    const/16 v1, 0xa

    .line 169
    .line 170
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    add-int/2addr v0, v1

    .line 175
    :cond_a
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 176
    .line 177
    return v0
.end method

.method public getUserLiveState()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getUserLiveStateValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 2
    .line 3
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->rank_:J

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorId_:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->roomId_:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getRoomId()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->liveId_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    const/4 v0, 0x4

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getLiveId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorImage_:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    const/4 v0, 0x5

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorImage()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->anchorName_:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    const/4 v0, 0x6

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->amount_:J

    .line 94
    .line 95
    cmp-long v4, v0, v2

    .line 96
    .line 97
    if-eqz v4, :cond_6

    .line 98
    .line 99
    const/4 v4, 0x7

    .line 100
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 101
    .line 102
    .line 103
    :cond_6
    iget v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 104
    .line 105
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->onlive:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->getNumber()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eq v0, v1, :cond_7

    .line 112
    .line 113
    const/16 v0, 0x8

    .line 114
    .line 115
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->userLiveState_:I

    .line 116
    .line 117
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 118
    .line 119
    .line 120
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->content_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getContent()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_8
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->gap_:J

    .line 138
    .line 139
    cmp-long p0, v0, v2

    .line 140
    .line 141
    if-eqz p0, :cond_9

    .line 142
    .line 143
    const/16 p0, 0xa

    .line 144
    .line 145
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 146
    .line 147
    .line 148
    :cond_9
    return-void
.end method

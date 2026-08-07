.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceLiveRankings"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingsOrBuilder;"
    }
.end annotation


# static fields
.field public static final ACTION_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

.field public static final LIVEID_FIELD_NUMBER:I = 0x6

.field public static final MSGTYPE_FIELD_NUMBER:I = 0x9

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;",
            ">;"
        }
    .end annotation
.end field

.field public static final RANKINGS_FIELD_NUMBER:I = 0x4

.field public static final RANKINGTIME_FIELD_NUMBER:I = 0x7

.field public static final ROOMID_FIELD_NUMBER:I = 0x5

.field public static final TITLE_FIELD_NUMBER:I = 0x1

.field public static final TYPE_FIELD_NUMBER:I = 0x2


# instance fields
.field private action_:I

.field private bitField0_:I

.field private liveId_:Ljava/lang/String;

.field private msgType_:I

.field private rankingTime_:J

.field private rankings_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;",
            ">;"
        }
    .end annotation
.end field

.field private roomId_:Ljava/lang/String;

.field private title_:Ljava/lang/String;

.field private type_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setType(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic D()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->addAllRankings(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllRankings(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->ensureRankingsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->ensureRankingsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->ensureRankingsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addRankings(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->ensureRankingsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addRankings(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->ensureRankingsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->addRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->addRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V

    return-void
.end method

.method private clearAction()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMsgType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearRankingTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRankings()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->addRankings(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->addRankings(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V

    return-void
.end method

.method private ensureRankingsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->clearAction()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->clearLiveId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->clearMsgType()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->clearRankingTime()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->clearRankings()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->clearTitle()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->clearType()V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->removeRankings(I)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setAction(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setActionValue(I)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private removeRankings(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->ensureRankingsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setMsgType(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;)V

    return-void
.end method

.method private setAction(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 9
    .line 10
    return-void
.end method

.method private setActionValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMsgType(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setMsgTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setRankingTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->ensureRankingsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->ensureRankingsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTitleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setMsgTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setRankingTime(J)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking$Builder;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setRankings(ILcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->setTitle(Ljava/lang/String;)V

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->PARSER:Ll/ng60;

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
    const/16 v3, 0xa

    .line 63
    .line 64
    if-eq p1, v3, :cond_c

    .line 65
    .line 66
    const/16 v3, 0x10

    .line 67
    .line 68
    if-eq p1, v3, :cond_b

    .line 69
    .line 70
    const/16 v3, 0x18

    .line 71
    .line 72
    if-eq p1, v3, :cond_a

    .line 73
    .line 74
    const/16 v3, 0x22

    .line 75
    .line 76
    if-eq p1, v3, :cond_8

    .line 77
    .line 78
    const/16 v3, 0x2a

    .line 79
    .line 80
    if-eq p1, v3, :cond_7

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_6

    .line 85
    .line 86
    const/16 v3, 0x38

    .line 87
    .line 88
    if-eq p1, v3, :cond_5

    .line 89
    .line 90
    const/16 v3, 0x48

    .line 91
    .line 92
    if-eq p1, v3, :cond_4

    .line 93
    .line 94
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_2

    .line 99
    .line 100
    :cond_3
    move v0, v2

    .line 101
    goto :goto_3

    .line 102
    :catch_0
    move-exception v0

    .line 103
    move-object p1, v0

    .line 104
    goto :goto_4

    .line 105
    :catch_1
    move-exception v0

    .line 106
    move-object p1, v0

    .line 107
    goto :goto_5

    .line 108
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 116
    .line 117
    .line 118
    move-result-wide v3

    .line 119
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 137
    .line 138
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-nez p1, :cond_9

    .line 143
    .line 144
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 145
    .line 146
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 151
    .line 152
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 153
    .line 154
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->parser()Ll/ng60;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    check-cast v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 163
    .line 164
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 187
    .line 188
    goto/16 :goto_3

    .line 189
    .line 190
    :catchall_1
    move-exception v0

    .line 191
    move-object p0, v0

    .line 192
    throw p0

    .line 193
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 194
    .line 195
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 207
    .line 208
    .line 209
    return-object v1

    .line 210
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 215
    .line 216
    .line 217
    return-object v1

    .line 218
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 219
    .line 220
    return-object p0

    .line 221
    :pswitch_3
    move-object v3, p2

    .line 222
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 223
    .line 224
    check-cast p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 225
    .line 226
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    xor-int/2addr p1, v2

    .line 233
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 234
    .line 235
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    xor-int/2addr v1, v2

    .line 242
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 243
    .line 244
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 249
    .line 250
    iget p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 251
    .line 252
    if-eqz p1, :cond_e

    .line 253
    .line 254
    move p2, v2

    .line 255
    goto :goto_6

    .line 256
    :cond_e
    move p2, v0

    .line 257
    :goto_6
    iget v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 258
    .line 259
    if-eqz v1, :cond_f

    .line 260
    .line 261
    move v4, v2

    .line 262
    goto :goto_7

    .line 263
    :cond_f
    move v4, v0

    .line 264
    :goto_7
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 269
    .line 270
    iget p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 271
    .line 272
    if-eqz p1, :cond_10

    .line 273
    .line 274
    move p2, v2

    .line 275
    goto :goto_8

    .line 276
    :cond_10
    move p2, v0

    .line 277
    :goto_8
    iget v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 278
    .line 279
    if-eqz v1, :cond_11

    .line 280
    .line 281
    move v4, v2

    .line 282
    goto :goto_9

    .line 283
    :cond_11
    move v4, v0

    .line 284
    :goto_9
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 289
    .line 290
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 291
    .line 292
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 293
    .line 294
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 299
    .line 300
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 301
    .line 302
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 303
    .line 304
    .line 305
    move-result p1

    .line 306
    xor-int/2addr p1, v2

    .line 307
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 308
    .line 309
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    xor-int/2addr v1, v2

    .line 316
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 317
    .line 318
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 323
    .line 324
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 325
    .line 326
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 327
    .line 328
    .line 329
    move-result p1

    .line 330
    xor-int/2addr p1, v2

    .line 331
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 332
    .line 333
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    xor-int/2addr v1, v2

    .line 340
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 341
    .line 342
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 347
    .line 348
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 349
    .line 350
    const-wide/16 p1, 0x0

    .line 351
    .line 352
    cmp-long v1, v5, p1

    .line 353
    .line 354
    if-eqz v1, :cond_12

    .line 355
    .line 356
    move v4, v2

    .line 357
    goto :goto_a

    .line 358
    :cond_12
    move v4, v0

    .line 359
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 360
    .line 361
    cmp-long p1, v8, p1

    .line 362
    .line 363
    if-eqz p1, :cond_13

    .line 364
    .line 365
    move v7, v2

    .line 366
    goto :goto_b

    .line 367
    :cond_13
    move v7, v0

    .line 368
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 369
    .line 370
    .line 371
    move-result-wide p1

    .line 372
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 373
    .line 374
    iget p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 375
    .line 376
    if-eqz p1, :cond_14

    .line 377
    .line 378
    move p2, v2

    .line 379
    goto :goto_c

    .line 380
    :cond_14
    move p2, v0

    .line 381
    :goto_c
    iget v1, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 382
    .line 383
    if-eqz v1, :cond_15

    .line 384
    .line 385
    move v0, v2

    .line 386
    :cond_15
    invoke-interface {v3, p2, p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 387
    .line 388
    .line 389
    move-result p1

    .line 390
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 391
    .line 392
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 393
    .line 394
    if-ne v3, p1, :cond_16

    .line 395
    .line 396
    iget p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->bitField0_:I

    .line 397
    .line 398
    iget p2, p3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->bitField0_:I

    .line 399
    .line 400
    or-int/2addr p1, p2

    .line 401
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->bitField0_:I

    .line 402
    .line 403
    :cond_16
    return-object p0

    .line 404
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;

    .line 405
    .line 406
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings$Builder;-><init>(Ll/c4o0;)V

    .line 407
    .line 408
    .line 409
    return-object p0

    .line 410
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 411
    .line 412
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 413
    .line 414
    .line 415
    return-object v1

    .line 416
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 417
    .line 418
    return-object p0

    .line 419
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 420
    .line 421
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;-><init>()V

    .line 422
    .line 423
    .line 424
    return-object p0

    .line 425
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

.method public getAction()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->forNumber(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getActionValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 2
    .line 3
    return p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

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

.method public getMsgType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;->forNumber(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getMsgTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getRankingTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRankings(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

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

.method public getRankingsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

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

.method public getRankingsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRankingsOrBuilder(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getRankingsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

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
    .locals 5

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getTitle()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v1

    .line 27
    :goto_0
    iget v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 28
    .line 29
    sget-object v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;->currentHour:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;

    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;->getNumber()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eq v2, v3, :cond_2

    .line 36
    .line 37
    const/4 v2, 0x2

    .line 38
    iget v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 39
    .line 40
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v0, v2

    .line 45
    :cond_2
    iget v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 46
    .line 47
    sget-object v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->all:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->getNumber()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eq v2, v3, :cond_3

    .line 54
    .line 55
    const/4 v2, 0x3

    .line 56
    iget v3, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 57
    .line 58
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v0, v2

    .line 63
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 64
    .line 65
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-ge v1, v2, :cond_4

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 72
    .line 73
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Lcom/google/protobuf/q;

    .line 78
    .line 79
    const/4 v3, 0x4

    .line 80
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    add-int/2addr v0, v2

    .line 85
    add-int/lit8 v1, v1, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_5

    .line 95
    .line 96
    const/4 v1, 0x5

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRoomId()Ljava/lang/String;

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
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_6

    .line 113
    .line 114
    const/4 v1, 0x6

    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getLiveId()Ljava/lang/String;

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
    :cond_6
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 125
    .line 126
    const-wide/16 v3, 0x0

    .line 127
    .line 128
    cmp-long v3, v1, v3

    .line 129
    .line 130
    if-eqz v3, :cond_7

    .line 131
    .line 132
    const/4 v3, 0x7

    .line 133
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    add-int/2addr v0, v1

    .line 138
    :cond_7
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 139
    .line 140
    sget-object v2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;->normal:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;

    .line 141
    .line 142
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;->getNumber()I

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-eq v1, v2, :cond_8

    .line 147
    .line 148
    const/16 v1, 0x9

    .line 149
    .line 150
    iget v2, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 151
    .line 152
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    add-int/2addr v0, v1

    .line 157
    :cond_8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 158
    .line 159
    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

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

.method public getType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;->forNumber(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->title_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getTitle()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;->currentHour:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;->getNumber()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->type_:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->all:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingAction;->getNumber()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eq v0, v1, :cond_2

    .line 42
    .line 43
    const/4 v0, 0x3

    .line 44
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->action_:I

    .line 45
    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 47
    .line 48
    .line 49
    :cond_2
    const/4 v0, 0x0

    .line 50
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-ge v0, v1, :cond_3

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankings_:Lcom/google/protobuf/l$h;

    .line 59
    .line 60
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Lcom/google/protobuf/q;

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->roomId_:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_4

    .line 80
    .line 81
    const/4 v0, 0x5

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRoomId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->liveId_:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_5

    .line 96
    .line 97
    const/4 v0, 0x6

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getLiveId()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->rankingTime_:J

    .line 106
    .line 107
    const-wide/16 v2, 0x0

    .line 108
    .line 109
    cmp-long v2, v0, v2

    .line 110
    .line 111
    if-eqz v2, :cond_6

    .line 112
    .line 113
    const/4 v2, 0x7

    .line 114
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 115
    .line 116
    .line 117
    :cond_6
    iget v0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 118
    .line 119
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;->normal:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;->getNumber()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eq v0, v1, :cond_7

    .line 126
    .line 127
    const/16 v0, 0x9

    .line 128
    .line 129
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->msgType_:I

    .line 130
    .line 131
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 132
    .line 133
    .line 134
    :cond_7
    return-void
.end method

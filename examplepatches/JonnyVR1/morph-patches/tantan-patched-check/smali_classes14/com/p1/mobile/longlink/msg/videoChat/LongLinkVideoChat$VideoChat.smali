.class public final Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VideoChat"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;,
        Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;,
        Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;,
        Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANCHORCALLID_FIELD_NUMBER:I = 0x11

.field public static final ANCHORID_FIELD_NUMBER:I = 0x3

.field public static final CALLED_FIELD_NUMBER:I = 0xc

.field public static final CATEGORY_FIELD_NUMBER:I = 0x12

.field public static final CREATEDTIME_FIELD_NUMBER:I = 0x15

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

.field public static final ENDEDTIME_FIELD_NUMBER:I = 0x7

.field public static final ENDTIPMESSAGE_FIELD_NUMBER:I = 0x17

.field public static final ENDTYPE_FIELD_NUMBER:I = 0x8

.field public static final ERRORMESSAGE_FIELD_NUMBER:I = 0xa

.field public static final GIFTID_FIELD_NUMBER:I = 0xd

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final LASTSTATUS_FIELD_NUMBER:I = 0x18

.field public static final LEAVEUSERID_FIELD_NUMBER:I = 0xb

.field public static final LIVEID_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;",
            ">;"
        }
    .end annotation
.end field

.field public static final PLAYERS_FIELD_NUMBER:I = 0xf

.field public static final PUNISHMESSAGE_FIELD_NUMBER:I = 0x9

.field public static final ROOMID_FIELD_NUMBER:I = 0x4

.field public static final RTCPROVIDER_FIELD_NUMBER:I = 0x19

.field public static final SOURCE_FIELD_NUMBER:I = 0x10

.field public static final STARTEDTIME_FIELD_NUMBER:I = 0x6

.field public static final STATUS_FIELD_NUMBER:I = 0x14

.field public static final TTC_FIELD_NUMBER:I = 0xe

.field public static final UPDATEDTIME_FIELD_NUMBER:I = 0x16

.field public static final USERID_FIELD_NUMBER:I = 0x2


# instance fields
.field private anchorCallId_:Ljava/lang/String;

.field private anchorId_:Ljava/lang/String;

.field private bitField0_:I

.field private called_:Z

.field private category_:I

.field private createdTime_:J

.field private endTipMessage_:Ljava/lang/String;

.field private endType_:I

.field private endedTime_:J

.field private errorMessage_:Ljava/lang/String;

.field private giftId_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private lastStatus_:I

.field private leaveUserId_:Ljava/lang/String;

.field private liveId_:Ljava/lang/String;

.field private players_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;",
            ">;"
        }
    .end annotation
.end field

.field private punishMessage_:Ljava/lang/String;

.field private roomId_:Ljava/lang/String;

.field private rtcProvider_:Ljava/lang/String;

.field private source_:Ljava/lang/String;

.field private startedTime_:J

.field private status_:I

.field private ttc_:J

.field private updatedTime_:J

.field private userId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 37
    .line 38
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearTtc()V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearUpdatedTime()V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->removePlayers(I)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setAnchorCallId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setAnchorCallIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setAnchorId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setAnchorIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setCalled(Z)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setCategory(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setCategoryValue(I)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setCreatedTime(J)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setEndTipMessage(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setEndTipMessageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setEndType(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setEndTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setEndedTime(J)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setErrorMessage(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setErrorMessageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setGiftId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setGiftIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setLastStatus(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)V

    return-void
.end method

.method public static bridge synthetic Y(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setLastStatusValue(I)V

    return-void
.end method

.method public static bridge synthetic Z(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setLeaveUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->addAllPlayers(Ljava/lang/Iterable;)V

    return-void
.end method

.method public static bridge synthetic a0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setLeaveUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private addAllPlayers(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ensurePlayersIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ensurePlayersIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ensurePlayersIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addPlayers(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ensurePlayersIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addPlayers(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ensurePlayersIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->addPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V

    return-void
.end method

.method public static bridge synthetic b0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->addPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    return-void
.end method

.method public static bridge synthetic c0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearAnchorCallId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorCallId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAnchorId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCalled()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearCategory()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearCreatedTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearEndTipMessage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndTipMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearEndType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearEndedTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearErrorMessage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getErrorMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGiftId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getGiftId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLastStatus()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearLeaveUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLeaveUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPlayers()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearPunishMessage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPunishMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRtcProvider()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRtcProvider()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSource()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getSource()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStartedTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearStatus()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearTtc()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUpdatedTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->addPlayers(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V

    return-void
.end method

.method public static bridge synthetic d0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->addPlayers(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    return-void
.end method

.method public static bridge synthetic e0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V

    return-void
.end method

.method private ensurePlayersIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearAnchorCallId()V

    return-void
.end method

.method public static bridge synthetic f0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setPunishMessage(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearAnchorId()V

    return-void
.end method

.method public static bridge synthetic g0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setPunishMessageBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearCalled()V

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearCategory()V

    return-void
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearCreatedTime()V

    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setRtcProvider(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearEndTipMessage()V

    return-void
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setRtcProviderBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearEndType()V

    return-void
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setSource(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearEndedTime()V

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setSourceBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearErrorMessage()V

    return-void
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setStartedTime(J)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearGiftId()V

    return-void
.end method

.method public static bridge synthetic o0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setStatus(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearId()V

    return-void
.end method

.method public static bridge synthetic p0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setStatusValue(I)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearLastStatus()V

    return-void
.end method

.method public static bridge synthetic q0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setTtc(J)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearLeaveUserId()V

    return-void
.end method

.method public static bridge synthetic r0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setUpdatedTime(J)V

    return-void
.end method

.method private removePlayers(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ensurePlayersIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearLiveId()V

    return-void
.end method

.method public static bridge synthetic s0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method private setAnchorCallId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnchorCallIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAnchorId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCalled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setCategory(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 9
    .line 10
    return-void
.end method

.method private setCategoryValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 2
    .line 3
    return-void
.end method

.method private setCreatedTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setEndTipMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setEndTipMessageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setEndType(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setEndTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setEndedTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setErrorMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setErrorMessageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGiftId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGiftIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLastStatus(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 9
    .line 10
    return-void
.end method

.method private setLastStatusValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 2
    .line 3
    return-void
.end method

.method private setLeaveUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLeaveUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ensurePlayersIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setPlayers(ILcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ensurePlayersIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setPunishMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setPunishMessageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRtcProvider(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRtcProviderBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSourceBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStartedTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setStatus(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 9
    .line 10
    return-void
.end method

.method private setStatusValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 2
    .line 3
    return-void
.end method

.method private setTtc(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 2
    .line 3
    return-void
.end method

.method private setUpdatedTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearPlayers()V

    return-void
.end method

.method public static bridge synthetic t0(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearPunishMessage()V

    return-void
.end method

.method public static bridge synthetic u0()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    return-object v0
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearRtcProvider()V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearSource()V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearStartedTime()V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->clearStatus()V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_4

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
    goto/16 :goto_4

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_5

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 143
    .line 144
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-nez p1, :cond_3

    .line 149
    .line 150
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 151
    .line 152
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 157
    .line 158
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 159
    .line 160
    invoke-static {}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->parser()Ll/ng60;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    check-cast v3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 169
    .line 170
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    goto :goto_3

    .line 174
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 175
    .line 176
    .line 177
    move-result-wide v3

    .line 178
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 186
    .line 187
    goto/16 :goto_3

    .line 188
    .line 189
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 194
    .line 195
    goto/16 :goto_3

    .line 196
    .line 197
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 202
    .line 203
    goto/16 :goto_3

    .line 204
    .line 205
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 210
    .line 211
    goto/16 :goto_3

    .line 212
    .line 213
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 218
    .line 219
    goto/16 :goto_3

    .line 220
    .line 221
    :sswitch_11
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 226
    .line 227
    goto/16 :goto_3

    .line 228
    .line 229
    :sswitch_12
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 230
    .line 231
    .line 232
    move-result-wide v3

    .line 233
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

    .line 234
    .line 235
    goto/16 :goto_3

    .line 236
    .line 237
    :sswitch_13
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 238
    .line 239
    .line 240
    move-result-wide v3

    .line 241
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 242
    .line 243
    goto/16 :goto_3

    .line 244
    .line 245
    :sswitch_14
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 250
    .line 251
    goto/16 :goto_3

    .line 252
    .line 253
    :sswitch_15
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 258
    .line 259
    goto/16 :goto_3

    .line 260
    .line 261
    :sswitch_16
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 266
    .line 267
    goto/16 :goto_3

    .line 268
    .line 269
    :sswitch_17
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p1

    .line 273
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 274
    .line 275
    goto/16 :goto_3

    .line 276
    .line 277
    :sswitch_18
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 282
    .line 283
    goto/16 :goto_3

    .line 284
    .line 285
    :catchall_1
    move-exception v0

    .line 286
    move-object p0, v0

    .line 287
    throw p0

    .line 288
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 289
    .line 290
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 302
    .line 303
    .line 304
    return-object v1

    .line 305
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 310
    .line 311
    .line 312
    return-object v1

    .line 313
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 314
    .line 315
    return-object p0

    .line 316
    :pswitch_3
    move-object v3, p2

    .line 317
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 318
    .line 319
    check-cast p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 320
    .line 321
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 324
    .line 325
    .line 326
    move-result p1

    .line 327
    xor-int/2addr p1, v2

    .line 328
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 329
    .line 330
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    xor-int/2addr v1, v2

    .line 337
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 338
    .line 339
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 344
    .line 345
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 346
    .line 347
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 348
    .line 349
    .line 350
    move-result p1

    .line 351
    xor-int/2addr p1, v2

    .line 352
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 353
    .line 354
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 355
    .line 356
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    xor-int/2addr v1, v2

    .line 361
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 362
    .line 363
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p1

    .line 367
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 368
    .line 369
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 370
    .line 371
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 372
    .line 373
    .line 374
    move-result p1

    .line 375
    xor-int/2addr p1, v2

    .line 376
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 377
    .line 378
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 379
    .line 380
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 381
    .line 382
    .line 383
    move-result v1

    .line 384
    xor-int/2addr v1, v2

    .line 385
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 386
    .line 387
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object p1

    .line 391
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 392
    .line 393
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 394
    .line 395
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 396
    .line 397
    .line 398
    move-result p1

    .line 399
    xor-int/2addr p1, v2

    .line 400
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 401
    .line 402
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 403
    .line 404
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    xor-int/2addr v1, v2

    .line 409
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 410
    .line 411
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 416
    .line 417
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 418
    .line 419
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 420
    .line 421
    .line 422
    move-result p1

    .line 423
    xor-int/2addr p1, v2

    .line 424
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 425
    .line 426
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 427
    .line 428
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 429
    .line 430
    .line 431
    move-result v1

    .line 432
    xor-int/2addr v1, v2

    .line 433
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 434
    .line 435
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 440
    .line 441
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 442
    .line 443
    const-wide/16 p1, 0x0

    .line 444
    .line 445
    cmp-long v1, v5, p1

    .line 446
    .line 447
    if-eqz v1, :cond_5

    .line 448
    .line 449
    move v4, v2

    .line 450
    goto :goto_6

    .line 451
    :cond_5
    move v4, v0

    .line 452
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 453
    .line 454
    cmp-long v1, v8, p1

    .line 455
    .line 456
    if-eqz v1, :cond_6

    .line 457
    .line 458
    move v7, v2

    .line 459
    goto :goto_7

    .line 460
    :cond_6
    move v7, v0

    .line 461
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 462
    .line 463
    .line 464
    move-result-wide v4

    .line 465
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 466
    .line 467
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

    .line 468
    .line 469
    cmp-long v1, v5, p1

    .line 470
    .line 471
    if-eqz v1, :cond_7

    .line 472
    .line 473
    move v4, v2

    .line 474
    goto :goto_8

    .line 475
    :cond_7
    move v4, v0

    .line 476
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

    .line 477
    .line 478
    cmp-long v1, v8, p1

    .line 479
    .line 480
    if-eqz v1, :cond_8

    .line 481
    .line 482
    move v7, v2

    .line 483
    goto :goto_9

    .line 484
    :cond_8
    move v7, v0

    .line 485
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 486
    .line 487
    .line 488
    move-result-wide v4

    .line 489
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

    .line 490
    .line 491
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 492
    .line 493
    if-eqz v1, :cond_9

    .line 494
    .line 495
    move v4, v2

    .line 496
    goto :goto_a

    .line 497
    :cond_9
    move v4, v0

    .line 498
    :goto_a
    iget v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 499
    .line 500
    if-eqz v5, :cond_a

    .line 501
    .line 502
    move v6, v2

    .line 503
    goto :goto_b

    .line 504
    :cond_a
    move v6, v0

    .line 505
    :goto_b
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 506
    .line 507
    .line 508
    move-result v1

    .line 509
    iput v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 510
    .line 511
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 512
    .line 513
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 514
    .line 515
    .line 516
    move-result v1

    .line 517
    xor-int/2addr v1, v2

    .line 518
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 519
    .line 520
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 521
    .line 522
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 523
    .line 524
    .line 525
    move-result v5

    .line 526
    xor-int/2addr v5, v2

    .line 527
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 528
    .line 529
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 534
    .line 535
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 536
    .line 537
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 538
    .line 539
    .line 540
    move-result v1

    .line 541
    xor-int/2addr v1, v2

    .line 542
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 543
    .line 544
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 545
    .line 546
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 547
    .line 548
    .line 549
    move-result v5

    .line 550
    xor-int/2addr v5, v2

    .line 551
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 552
    .line 553
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object v1

    .line 557
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 558
    .line 559
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 560
    .line 561
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 562
    .line 563
    .line 564
    move-result v1

    .line 565
    xor-int/2addr v1, v2

    .line 566
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 567
    .line 568
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 569
    .line 570
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 571
    .line 572
    .line 573
    move-result v5

    .line 574
    xor-int/2addr v5, v2

    .line 575
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 576
    .line 577
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object v1

    .line 581
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 582
    .line 583
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 584
    .line 585
    iget-boolean v4, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 586
    .line 587
    invoke-interface {v3, v1, v1, v4, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 588
    .line 589
    .line 590
    move-result v1

    .line 591
    iput-boolean v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 592
    .line 593
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 594
    .line 595
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 596
    .line 597
    .line 598
    move-result v1

    .line 599
    xor-int/2addr v1, v2

    .line 600
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 601
    .line 602
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 603
    .line 604
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 605
    .line 606
    .line 607
    move-result v5

    .line 608
    xor-int/2addr v5, v2

    .line 609
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 610
    .line 611
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v1

    .line 615
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 616
    .line 617
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 618
    .line 619
    cmp-long v1, v5, p1

    .line 620
    .line 621
    if-eqz v1, :cond_b

    .line 622
    .line 623
    move v4, v2

    .line 624
    goto :goto_c

    .line 625
    :cond_b
    move v4, v0

    .line 626
    :goto_c
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 627
    .line 628
    cmp-long v1, v8, p1

    .line 629
    .line 630
    if-eqz v1, :cond_c

    .line 631
    .line 632
    move v7, v2

    .line 633
    goto :goto_d

    .line 634
    :cond_c
    move v7, v0

    .line 635
    :goto_d
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 636
    .line 637
    .line 638
    move-result-wide v4

    .line 639
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 640
    .line 641
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 642
    .line 643
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 644
    .line 645
    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 646
    .line 647
    .line 648
    move-result-object v1

    .line 649
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 650
    .line 651
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 652
    .line 653
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 654
    .line 655
    .line 656
    move-result v1

    .line 657
    xor-int/2addr v1, v2

    .line 658
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 659
    .line 660
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 661
    .line 662
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 663
    .line 664
    .line 665
    move-result v5

    .line 666
    xor-int/2addr v5, v2

    .line 667
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 668
    .line 669
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 670
    .line 671
    .line 672
    move-result-object v1

    .line 673
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 674
    .line 675
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 676
    .line 677
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 678
    .line 679
    .line 680
    move-result v1

    .line 681
    xor-int/2addr v1, v2

    .line 682
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 683
    .line 684
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 685
    .line 686
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 687
    .line 688
    .line 689
    move-result v5

    .line 690
    xor-int/2addr v5, v2

    .line 691
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 692
    .line 693
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 694
    .line 695
    .line 696
    move-result-object v1

    .line 697
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 698
    .line 699
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 700
    .line 701
    if-eqz v1, :cond_d

    .line 702
    .line 703
    move v4, v2

    .line 704
    goto :goto_e

    .line 705
    :cond_d
    move v4, v0

    .line 706
    :goto_e
    iget v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 707
    .line 708
    if-eqz v5, :cond_e

    .line 709
    .line 710
    move v6, v2

    .line 711
    goto :goto_f

    .line 712
    :cond_e
    move v6, v0

    .line 713
    :goto_f
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 714
    .line 715
    .line 716
    move-result v1

    .line 717
    iput v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 718
    .line 719
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 720
    .line 721
    if-eqz v1, :cond_f

    .line 722
    .line 723
    move v4, v2

    .line 724
    goto :goto_10

    .line 725
    :cond_f
    move v4, v0

    .line 726
    :goto_10
    iget v5, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 727
    .line 728
    if-eqz v5, :cond_10

    .line 729
    .line 730
    move v6, v2

    .line 731
    goto :goto_11

    .line 732
    :cond_10
    move v6, v0

    .line 733
    :goto_11
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 734
    .line 735
    .line 736
    move-result v1

    .line 737
    iput v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 738
    .line 739
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 740
    .line 741
    cmp-long v1, v5, p1

    .line 742
    .line 743
    if-eqz v1, :cond_11

    .line 744
    .line 745
    move v4, v2

    .line 746
    goto :goto_12

    .line 747
    :cond_11
    move v4, v0

    .line 748
    :goto_12
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 749
    .line 750
    cmp-long v1, v8, p1

    .line 751
    .line 752
    if-eqz v1, :cond_12

    .line 753
    .line 754
    move v7, v2

    .line 755
    goto :goto_13

    .line 756
    :cond_12
    move v7, v0

    .line 757
    :goto_13
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 758
    .line 759
    .line 760
    move-result-wide v4

    .line 761
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 762
    .line 763
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

    .line 764
    .line 765
    cmp-long v1, v5, p1

    .line 766
    .line 767
    if-eqz v1, :cond_13

    .line 768
    .line 769
    move v4, v2

    .line 770
    goto :goto_14

    .line 771
    :cond_13
    move v4, v0

    .line 772
    :goto_14
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

    .line 773
    .line 774
    cmp-long p1, v8, p1

    .line 775
    .line 776
    if-eqz p1, :cond_14

    .line 777
    .line 778
    move v7, v2

    .line 779
    goto :goto_15

    .line 780
    :cond_14
    move v7, v0

    .line 781
    :goto_15
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 782
    .line 783
    .line 784
    move-result-wide p1

    .line 785
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

    .line 786
    .line 787
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 788
    .line 789
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 790
    .line 791
    .line 792
    move-result p1

    .line 793
    xor-int/2addr p1, v2

    .line 794
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 795
    .line 796
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 797
    .line 798
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 799
    .line 800
    .line 801
    move-result v1

    .line 802
    xor-int/2addr v1, v2

    .line 803
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 804
    .line 805
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 806
    .line 807
    .line 808
    move-result-object p1

    .line 809
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 810
    .line 811
    iget p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 812
    .line 813
    if-eqz p1, :cond_15

    .line 814
    .line 815
    move p2, v2

    .line 816
    goto :goto_16

    .line 817
    :cond_15
    move p2, v0

    .line 818
    :goto_16
    iget v1, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 819
    .line 820
    if-eqz v1, :cond_16

    .line 821
    .line 822
    move v0, v2

    .line 823
    :cond_16
    invoke-interface {v3, p2, p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 824
    .line 825
    .line 826
    move-result p1

    .line 827
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 828
    .line 829
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 830
    .line 831
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 832
    .line 833
    .line 834
    move-result p1

    .line 835
    xor-int/2addr p1, v2

    .line 836
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 837
    .line 838
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 839
    .line 840
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 841
    .line 842
    .line 843
    move-result v0

    .line 844
    xor-int/2addr v0, v2

    .line 845
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 846
    .line 847
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 848
    .line 849
    .line 850
    move-result-object p1

    .line 851
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 852
    .line 853
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 854
    .line 855
    if-ne v3, p1, :cond_17

    .line 856
    .line 857
    iget p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->bitField0_:I

    .line 858
    .line 859
    iget p2, p3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->bitField0_:I

    .line 860
    .line 861
    or-int/2addr p1, p2

    .line 862
    iput p1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->bitField0_:I

    .line 863
    .line 864
    :cond_17
    return-object p0

    .line 865
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;

    .line 866
    .line 867
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Builder;-><init>(Ll/z3w;)V

    .line 868
    .line 869
    .line 870
    return-object p0

    .line 871
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 872
    .line 873
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 874
    .line 875
    .line 876
    return-object v1

    .line 877
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 878
    .line 879
    return-object p0

    .line 880
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 881
    .line 882
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;-><init>()V

    .line 883
    .line 884
    .line 885
    return-object p0

    .line 886
    nop

    .line 887
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

    .line 888
    .line 889
    .line 890
    .line 891
    .line 892
    .line 893
    .line 894
    .line 895
    .line 896
    .line 897
    .line 898
    .line 899
    .line 900
    .line 901
    .line 902
    .line 903
    .line 904
    .line 905
    .line 906
    .line 907
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_18
        0x12 -> :sswitch_17
        0x1a -> :sswitch_16
        0x22 -> :sswitch_15
        0x2a -> :sswitch_14
        0x30 -> :sswitch_13
        0x38 -> :sswitch_12
        0x40 -> :sswitch_11
        0x4a -> :sswitch_10
        0x52 -> :sswitch_f
        0x5a -> :sswitch_e
        0x60 -> :sswitch_d
        0x6a -> :sswitch_c
        0x70 -> :sswitch_b
        0x7a -> :sswitch_a
        0x82 -> :sswitch_9
        0x8a -> :sswitch_8
        0x90 -> :sswitch_7
        0xa0 -> :sswitch_6
        0xa8 -> :sswitch_5
        0xb0 -> :sswitch_4
        0xba -> :sswitch_3
        0xc0 -> :sswitch_2
        0xca -> :sswitch_1
    .end sparse-switch
.end method

.method public getAnchorCallId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorCallIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

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

.method public getAnchorId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

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

.method public getCalled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getCategory()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;->forNumber(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getCategoryValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 2
    .line 3
    return p0
.end method

.method public getCreatedTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getEndTipMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEndTipMessageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

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

.method public getEndType()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->forNumber(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getEndTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getEndedTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getErrorMessageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

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

.method public getGiftId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

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

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

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

.method public getLastStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->forNumber(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getLastStatusValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 2
    .line 3
    return p0
.end method

.method public getLeaveUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeaveUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

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

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

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

.method public getPlayers(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;

    .line 8
    .line 9
    return-object p0
.end method

.method public getPlayersCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

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

.method public getPlayersList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlayersOrBuilder(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayerOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayerOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getPlayersOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayerOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPunishMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPunishMessageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

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

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

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

.method public getRtcProvider()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRtcProviderBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

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
    .locals 8

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getId()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getUserId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v0, v2

    .line 45
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_3

    .line 52
    .line 53
    const/4 v2, 0x3

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v0, v2

    .line 63
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_4

    .line 70
    .line 71
    const/4 v2, 0x4

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRoomId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    add-int/2addr v0, v2

    .line 81
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-nez v2, :cond_5

    .line 88
    .line 89
    const/4 v2, 0x5

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLiveId()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    add-int/2addr v0, v2

    .line 99
    :cond_5
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 100
    .line 101
    const-wide/16 v4, 0x0

    .line 102
    .line 103
    cmp-long v6, v2, v4

    .line 104
    .line 105
    if-eqz v6, :cond_6

    .line 106
    .line 107
    const/4 v6, 0x6

    .line 108
    invoke-static {v6, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    add-int/2addr v0, v2

    .line 113
    :cond_6
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

    .line 114
    .line 115
    cmp-long v6, v2, v4

    .line 116
    .line 117
    if-eqz v6, :cond_7

    .line 118
    .line 119
    const/4 v6, 0x7

    .line 120
    invoke-static {v6, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    add-int/2addr v0, v2

    .line 125
    :cond_7
    iget v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 126
    .line 127
    sget-object v3, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->endTypeUnknown:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 128
    .line 129
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->getNumber()I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    if-eq v2, v3, :cond_8

    .line 134
    .line 135
    const/16 v2, 0x8

    .line 136
    .line 137
    iget v3, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 138
    .line 139
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    add-int/2addr v0, v2

    .line 144
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    if-nez v2, :cond_9

    .line 151
    .line 152
    const/16 v2, 0x9

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPunishMessage()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    add-int/2addr v0, v2

    .line 163
    :cond_9
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-nez v2, :cond_a

    .line 170
    .line 171
    const/16 v2, 0xa

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getErrorMessage()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    add-int/2addr v0, v2

    .line 182
    :cond_a
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    if-nez v2, :cond_b

    .line 189
    .line 190
    const/16 v2, 0xb

    .line 191
    .line 192
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLeaveUserId()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    add-int/2addr v0, v2

    .line 201
    :cond_b
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 202
    .line 203
    if-eqz v2, :cond_c

    .line 204
    .line 205
    const/16 v3, 0xc

    .line 206
    .line 207
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    add-int/2addr v0, v2

    .line 212
    :cond_c
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-nez v2, :cond_d

    .line 219
    .line 220
    const/16 v2, 0xd

    .line 221
    .line 222
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getGiftId()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    add-int/2addr v0, v2

    .line 231
    :cond_d
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 232
    .line 233
    cmp-long v6, v2, v4

    .line 234
    .line 235
    if-eqz v6, :cond_e

    .line 236
    .line 237
    const/16 v6, 0xe

    .line 238
    .line 239
    invoke-static {v6, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    add-int/2addr v0, v2

    .line 244
    :cond_e
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 245
    .line 246
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    if-ge v1, v2, :cond_f

    .line 251
    .line 252
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 253
    .line 254
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    check-cast v2, Lcom/google/protobuf/q;

    .line 259
    .line 260
    const/16 v3, 0xf

    .line 261
    .line 262
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    add-int/2addr v0, v2

    .line 267
    add-int/lit8 v1, v1, 0x1

    .line 268
    .line 269
    goto :goto_1

    .line 270
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    if-nez v1, :cond_10

    .line 277
    .line 278
    const/16 v1, 0x10

    .line 279
    .line 280
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getSource()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    add-int/2addr v0, v1

    .line 289
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    if-nez v1, :cond_11

    .line 296
    .line 297
    const/16 v1, 0x11

    .line 298
    .line 299
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorCallId()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    add-int/2addr v0, v1

    .line 308
    :cond_11
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 309
    .line 310
    sget-object v2, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;->normal:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;

    .line 311
    .line 312
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;->getNumber()I

    .line 313
    .line 314
    .line 315
    move-result v2

    .line 316
    if-eq v1, v2, :cond_12

    .line 317
    .line 318
    const/16 v1, 0x12

    .line 319
    .line 320
    iget v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 321
    .line 322
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    add-int/2addr v0, v1

    .line 327
    :cond_12
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 328
    .line 329
    sget-object v2, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->StatusUnknown:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 330
    .line 331
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->getNumber()I

    .line 332
    .line 333
    .line 334
    move-result v3

    .line 335
    if-eq v1, v3, :cond_13

    .line 336
    .line 337
    const/16 v1, 0x14

    .line 338
    .line 339
    iget v3, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 340
    .line 341
    invoke-static {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    add-int/2addr v0, v1

    .line 346
    :cond_13
    iget-wide v6, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 347
    .line 348
    cmp-long v1, v6, v4

    .line 349
    .line 350
    if-eqz v1, :cond_14

    .line 351
    .line 352
    const/16 v1, 0x15

    .line 353
    .line 354
    invoke-static {v1, v6, v7}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 355
    .line 356
    .line 357
    move-result v1

    .line 358
    add-int/2addr v0, v1

    .line 359
    :cond_14
    iget-wide v6, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

    .line 360
    .line 361
    cmp-long v1, v6, v4

    .line 362
    .line 363
    if-eqz v1, :cond_15

    .line 364
    .line 365
    const/16 v1, 0x16

    .line 366
    .line 367
    invoke-static {v1, v6, v7}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    add-int/2addr v0, v1

    .line 372
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 373
    .line 374
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 375
    .line 376
    .line 377
    move-result v1

    .line 378
    if-nez v1, :cond_16

    .line 379
    .line 380
    const/16 v1, 0x17

    .line 381
    .line 382
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndTipMessage()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v3

    .line 386
    invoke-static {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 387
    .line 388
    .line 389
    move-result v1

    .line 390
    add-int/2addr v0, v1

    .line 391
    :cond_16
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 392
    .line 393
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->getNumber()I

    .line 394
    .line 395
    .line 396
    move-result v2

    .line 397
    if-eq v1, v2, :cond_17

    .line 398
    .line 399
    const/16 v1, 0x18

    .line 400
    .line 401
    iget v2, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 402
    .line 403
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    add-int/2addr v0, v1

    .line 408
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 409
    .line 410
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 411
    .line 412
    .line 413
    move-result v1

    .line 414
    if-nez v1, :cond_18

    .line 415
    .line 416
    const/16 v1, 0x19

    .line 417
    .line 418
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRtcProvider()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 423
    .line 424
    .line 425
    move-result v1

    .line 426
    add-int/2addr v0, v1

    .line 427
    :cond_18
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 428
    .line 429
    return v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

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

.method public getStartedTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->forNumber(I)Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getStatusValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 2
    .line 3
    return p0
.end method

.method public getTtc()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUpdatedTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

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
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->userId_:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getUserId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorId_:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x3

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->roomId_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    const/4 v0, 0x4

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRoomId()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->liveId_:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    const/4 v0, 0x5

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLiveId()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->startedTime_:J

    .line 82
    .line 83
    const-wide/16 v2, 0x0

    .line 84
    .line 85
    cmp-long v4, v0, v2

    .line 86
    .line 87
    if-eqz v4, :cond_5

    .line 88
    .line 89
    const/4 v4, 0x6

    .line 90
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 91
    .line 92
    .line 93
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endedTime_:J

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 104
    .line 105
    sget-object v1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->endTypeUnknown:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endType_:I

    .line 116
    .line 117
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 118
    .line 119
    .line 120
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->punishMessage_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPunishMessage()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->errorMessage_:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_9

    .line 144
    .line 145
    const/16 v0, 0xa

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getErrorMessage()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->leaveUserId_:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_a

    .line 161
    .line 162
    const/16 v0, 0xb

    .line 163
    .line 164
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLeaveUserId()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_a
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->called_:Z

    .line 172
    .line 173
    if-eqz v0, :cond_b

    .line 174
    .line 175
    const/16 v1, 0xc

    .line 176
    .line 177
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 178
    .line 179
    .line 180
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->giftId_:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_c

    .line 187
    .line 188
    const/16 v0, 0xd

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getGiftId()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :cond_c
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->ttc_:J

    .line 198
    .line 199
    cmp-long v4, v0, v2

    .line 200
    .line 201
    if-eqz v4, :cond_d

    .line 202
    .line 203
    const/16 v4, 0xe

    .line 204
    .line 205
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 206
    .line 207
    .line 208
    :cond_d
    const/4 v0, 0x0

    .line 209
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 210
    .line 211
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-ge v0, v1, :cond_e

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->players_:Lcom/google/protobuf/l$h;

    .line 218
    .line 219
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    check-cast v1, Lcom/google/protobuf/q;

    .line 224
    .line 225
    const/16 v4, 0xf

    .line 226
    .line 227
    invoke-virtual {p1, v4, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 228
    .line 229
    .line 230
    add-int/lit8 v0, v0, 0x1

    .line 231
    .line 232
    goto :goto_0

    .line 233
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->source_:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-nez v0, :cond_f

    .line 240
    .line 241
    const/16 v0, 0x10

    .line 242
    .line 243
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getSource()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 248
    .line 249
    .line 250
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->anchorCallId_:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_10

    .line 257
    .line 258
    const/16 v0, 0x11

    .line 259
    .line 260
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorCallId()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 265
    .line 266
    .line 267
    :cond_10
    iget v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 268
    .line 269
    sget-object v1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;->normal:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;

    .line 270
    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;->getNumber()I

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    if-eq v0, v1, :cond_11

    .line 276
    .line 277
    const/16 v0, 0x12

    .line 278
    .line 279
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->category_:I

    .line 280
    .line 281
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 282
    .line 283
    .line 284
    :cond_11
    iget v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 285
    .line 286
    sget-object v1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->StatusUnknown:Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 287
    .line 288
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->getNumber()I

    .line 289
    .line 290
    .line 291
    move-result v4

    .line 292
    if-eq v0, v4, :cond_12

    .line 293
    .line 294
    const/16 v0, 0x14

    .line 295
    .line 296
    iget v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->status_:I

    .line 297
    .line 298
    invoke-virtual {p1, v0, v4}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 299
    .line 300
    .line 301
    :cond_12
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->createdTime_:J

    .line 302
    .line 303
    cmp-long v0, v4, v2

    .line 304
    .line 305
    if-eqz v0, :cond_13

    .line 306
    .line 307
    const/16 v0, 0x15

    .line 308
    .line 309
    invoke-virtual {p1, v0, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 310
    .line 311
    .line 312
    :cond_13
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->updatedTime_:J

    .line 313
    .line 314
    cmp-long v0, v4, v2

    .line 315
    .line 316
    if-eqz v0, :cond_14

    .line 317
    .line 318
    const/16 v0, 0x16

    .line 319
    .line 320
    invoke-virtual {p1, v0, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 321
    .line 322
    .line 323
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->endTipMessage_:Ljava/lang/String;

    .line 324
    .line 325
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    if-nez v0, :cond_15

    .line 330
    .line 331
    const/16 v0, 0x17

    .line 332
    .line 333
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndTipMessage()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v2

    .line 337
    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 338
    .line 339
    .line 340
    :cond_15
    iget v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 341
    .line 342
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;->getNumber()I

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    if-eq v0, v1, :cond_16

    .line 347
    .line 348
    const/16 v0, 0x18

    .line 349
    .line 350
    iget v1, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->lastStatus_:I

    .line 351
    .line 352
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 353
    .line 354
    .line 355
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->rtcProvider_:Ljava/lang/String;

    .line 356
    .line 357
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    if-nez v0, :cond_17

    .line 362
    .line 363
    const/16 v0, 0x19

    .line 364
    .line 365
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRtcProvider()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object p0

    .line 369
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 370
    .line 371
    .line 372
    :cond_17
    return-void
.end method

.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveFixedRoomChatCellChatInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfoOrBuilder;"
    }
.end annotation


# static fields
.field public static final CURRENTMSG_FIELD_NUMBER:I = 0x4

.field public static final CURRENTSENDERNAME_FIELD_NUMBER:I = 0x3

.field public static final CURRENTSEQ_FIELD_NUMBER:I = 0x2

.field public static final CURRENTTIME_FIELD_NUMBER:I = 0x5

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNREADEDCOUNT_FIELD_NUMBER:I = 0x1


# instance fields
.field private currentMsg_:Ljava/lang/String;

.field private currentSenderName_:Ljava/lang/String;

.field private currentSeq_:J

.field private currentTime_:J

.field private unreadedCount_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->clearCurrentMsg()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->clearCurrentSenderName()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->clearCurrentSeq()V

    return-void
.end method

.method private clearCurrentMsg()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->getCurrentMsg()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCurrentSenderName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->getCurrentSenderName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCurrentSeq()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearCurrentTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUnreadedCount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->clearCurrentTime()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->clearUnreadedCount()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->setCurrentMsg(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->setCurrentMsgBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->setCurrentSenderName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->setCurrentSenderNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->setCurrentSeq(J)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->setCurrentTime(J)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->setUnreadedCount(J)V

    return-void
.end method

.method public static bridge synthetic m()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

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

.method private setCurrentMsg(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setCurrentMsgBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCurrentSenderName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setCurrentSenderNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCurrentSeq(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

    .line 2
    .line 3
    return-void
.end method

.method private setCurrentTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setUnreadedCount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_9

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
    if-eq p1, p3, :cond_8

    .line 65
    .line 66
    const/16 p3, 0x10

    .line 67
    .line 68
    if-eq p1, p3, :cond_7

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_6

    .line 73
    .line 74
    const/16 p3, 0x22

    .line 75
    .line 76
    if-eq p1, p3, :cond_5

    .line 77
    .line 78
    const/16 p3, 0x28

    .line 79
    .line 80
    if-eq p1, p3, :cond_4

    .line 81
    .line 82
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-nez p1, :cond_2

    .line 87
    .line 88
    :cond_3
    move v0, v2

    .line 89
    goto :goto_3

    .line 90
    :catch_0
    move-exception v0

    .line 91
    move-object p1, v0

    .line 92
    goto :goto_4

    .line 93
    :catch_1
    move-exception v0

    .line 94
    move-object p1, v0

    .line 95
    goto :goto_5

    .line 96
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 97
    .line 98
    .line 99
    move-result-wide v3

    .line 100
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->O()J

    .line 118
    .line 119
    .line 120
    move-result-wide v3

    .line 121
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 125
    .line 126
    .line 127
    move-result-wide v3

    .line 128
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :catchall_1
    move-exception v0

    .line 132
    move-object p0, v0

    .line 133
    throw p0

    .line 134
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 135
    .line 136
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 148
    .line 149
    .line 150
    return-object v1

    .line 151
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 156
    .line 157
    .line 158
    return-object v1

    .line 159
    :cond_9
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 160
    .line 161
    return-object p0

    .line 162
    :pswitch_3
    move-object v3, p2

    .line 163
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 164
    .line 165
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 166
    .line 167
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J

    .line 168
    .line 169
    const-wide/16 p1, 0x0

    .line 170
    .line 171
    cmp-long v1, v5, p1

    .line 172
    .line 173
    if-eqz v1, :cond_a

    .line 174
    .line 175
    move v4, v2

    .line 176
    goto :goto_6

    .line 177
    :cond_a
    move v4, v0

    .line 178
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J

    .line 179
    .line 180
    cmp-long v1, v8, p1

    .line 181
    .line 182
    if-eqz v1, :cond_b

    .line 183
    .line 184
    move v7, v2

    .line 185
    goto :goto_7

    .line 186
    :cond_b
    move v7, v0

    .line 187
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 188
    .line 189
    .line 190
    move-result-wide v4

    .line 191
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J

    .line 192
    .line 193
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

    .line 194
    .line 195
    cmp-long v1, v5, p1

    .line 196
    .line 197
    if-eqz v1, :cond_c

    .line 198
    .line 199
    move v4, v2

    .line 200
    goto :goto_8

    .line 201
    :cond_c
    move v4, v0

    .line 202
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

    .line 203
    .line 204
    cmp-long v1, v8, p1

    .line 205
    .line 206
    if-eqz v1, :cond_d

    .line 207
    .line 208
    move v7, v2

    .line 209
    goto :goto_9

    .line 210
    :cond_d
    move v7, v0

    .line 211
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 212
    .line 213
    .line 214
    move-result-wide v4

    .line 215
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    xor-int/2addr v1, v2

    .line 224
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 225
    .line 226
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 229
    .line 230
    .line 231
    move-result v5

    .line 232
    xor-int/2addr v5, v2

    .line 233
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 234
    .line 235
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 240
    .line 241
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    xor-int/2addr v1, v2

    .line 248
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 249
    .line 250
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 251
    .line 252
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 253
    .line 254
    .line 255
    move-result v5

    .line 256
    xor-int/2addr v5, v2

    .line 257
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 258
    .line 259
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 264
    .line 265
    move v1, v0

    .line 266
    move v4, v2

    .line 267
    move-object v0, v3

    .line 268
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

    .line 269
    .line 270
    cmp-long v5, v2, p1

    .line 271
    .line 272
    if-eqz v5, :cond_e

    .line 273
    .line 274
    move v5, v1

    .line 275
    move v1, v4

    .line 276
    goto :goto_a

    .line 277
    :cond_e
    move v5, v1

    .line 278
    :goto_a
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

    .line 279
    .line 280
    cmp-long p1, v6, p1

    .line 281
    .line 282
    if-eqz p1, :cond_f

    .line 283
    .line 284
    :goto_b
    move-wide v5, v6

    .line 285
    goto :goto_c

    .line 286
    :cond_f
    move v4, v5

    .line 287
    goto :goto_b

    .line 288
    :goto_c
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 289
    .line 290
    .line 291
    move-result-wide p1

    .line 292
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

    .line 293
    .line 294
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 295
    .line 296
    return-object p0

    .line 297
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;

    .line 298
    .line 299
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo$Builder;-><init>(Ll/n2w;)V

    .line 300
    .line 301
    .line 302
    return-object p0

    .line 303
    :pswitch_5
    return-object v1

    .line 304
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 305
    .line 306
    return-object p0

    .line 307
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;

    .line 308
    .line 309
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;-><init>()V

    .line 310
    .line 311
    .line 312
    return-object p0

    .line 313
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

.method public getCurrentMsg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentMsgBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

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

.method public getCurrentSenderName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentSenderNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

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

.method public getCurrentSeq()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getCurrentTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J

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
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

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
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->P(IJ)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->getCurrentSenderName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    add-int/2addr v0, v1

    .line 52
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->getCurrentMsg()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-static {v1, v4}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    add-int/2addr v0, v1

    .line 70
    :cond_4
    iget-wide v4, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

    .line 71
    .line 72
    cmp-long v1, v4, v2

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x5

    .line 77
    invoke-static {v1, v4, v5}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    add-int/2addr v0, v1

    .line 82
    :cond_5
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 83
    .line 84
    return v0
.end method

.method public getUnreadedCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->unreadedCount_:J

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSeq_:J

    .line 14
    .line 15
    cmp-long v4, v0, v2

    .line 16
    .line 17
    if-eqz v4, :cond_1

    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->I0(IJ)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentSenderName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->getCurrentSenderName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentMsg_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->getCurrentMsg()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellChatInfo;->currentTime_:J

    .line 56
    .line 57
    cmp-long p0, v0, v2

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const/4 p0, 0x5

    .line 62
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 63
    .line 64
    .line 65
    :cond_4
    return-void
.end method

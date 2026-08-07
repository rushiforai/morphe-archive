.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveFixedRoomChatCellRoomInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfoOrBuilder;"
    }
.end annotation


# static fields
.field public static final AVATARS_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

.field public static final LIVEID_FIELD_NUMBER:I = 0x5

.field public static final MEMBERCOUNT_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x1

.field public static final TITLE_FIELD_NUMBER:I = 0x2


# instance fields
.field private avatars_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private bitField0_:I

.field private liveId_:Ljava/lang/String;

.field private memberCount_:J

.field private roomId_:Ljava/lang/String;

.field private title_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->addAllAvatars(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllAvatars(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->ensureAvatarsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addAvatars(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->ensureAvatarsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addAvatarsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->ensureAvatarsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->addAvatars(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->addAvatarsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearAvatars()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearLiveId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMemberCount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getTitle()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->clearAvatars()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->clearLiveId()V

    return-void
.end method

.method private ensureAvatarsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->clearMemberCount()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->clearRoomId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->clearTitle()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->setAvatars(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->setLiveId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->setLiveIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->setMemberCount(J)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->setTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->setTitleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

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

.method public static bridge synthetic q()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    return-object v0
.end method

.method private setAvatars(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->ensureAvatarsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMemberCount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 12
    .line 13
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_a

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
    const/16 p3, 0xa

    .line 63
    .line 64
    if-eq p1, p3, :cond_9

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_8

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_6

    .line 73
    .line 74
    const/16 p3, 0x20

    .line 75
    .line 76
    if-eq p1, p3, :cond_5

    .line 77
    .line 78
    const/16 p3, 0x2a

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
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

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
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 115
    .line 116
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 117
    .line 118
    .line 119
    move-result p3

    .line 120
    if-nez p3, :cond_7

    .line 121
    .line 122
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 123
    .line 124
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 125
    .line 126
    .line 127
    move-result-object p3

    .line 128
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 129
    .line 130
    :cond_7
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 131
    .line 132
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :catchall_1
    move-exception v0

    .line 151
    move-object p0, v0

    .line 152
    throw p0

    .line 153
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    return-object v1

    .line 170
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 175
    .line 176
    .line 177
    return-object v1

    .line 178
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 179
    .line 180
    return-object p0

    .line 181
    :pswitch_3
    move-object v3, p2

    .line 182
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 183
    .line 184
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 185
    .line 186
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    xor-int/2addr p1, v2

    .line 193
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

    .line 194
    .line 195
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    xor-int/2addr v1, v2

    .line 202
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

    .line 203
    .line 204
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

    .line 209
    .line 210
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    xor-int/2addr p1, v2

    .line 217
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    xor-int/2addr v1, v2

    .line 226
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 227
    .line 228
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 235
    .line 236
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 237
    .line 238
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 243
    .line 244
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

    .line 245
    .line 246
    const-wide/16 p1, 0x0

    .line 247
    .line 248
    cmp-long v1, v5, p1

    .line 249
    .line 250
    if-eqz v1, :cond_b

    .line 251
    .line 252
    move v4, v2

    .line 253
    goto :goto_6

    .line 254
    :cond_b
    move v4, v0

    .line 255
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

    .line 256
    .line 257
    cmp-long p1, v8, p1

    .line 258
    .line 259
    if-eqz p1, :cond_c

    .line 260
    .line 261
    move v7, v2

    .line 262
    goto :goto_7

    .line 263
    :cond_c
    move v7, v0

    .line 264
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 265
    .line 266
    .line 267
    move-result-wide p1

    .line 268
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

    .line 269
    .line 270
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    xor-int/2addr p1, v2

    .line 277
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 278
    .line 279
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    xor-int/2addr v0, v2

    .line 286
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 287
    .line 288
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 293
    .line 294
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 295
    .line 296
    if-ne v3, p1, :cond_d

    .line 297
    .line 298
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->bitField0_:I

    .line 299
    .line 300
    iget p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->bitField0_:I

    .line 301
    .line 302
    or-int/2addr p1, p2

    .line 303
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->bitField0_:I

    .line 304
    .line 305
    :cond_d
    return-object p0

    .line 306
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;

    .line 307
    .line 308
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo$Builder;-><init>(Ll/n2w;)V

    .line 309
    .line 310
    .line 311
    return-object p0

    .line 312
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 313
    .line 314
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 315
    .line 316
    .line 317
    return-object v1

    .line 318
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 319
    .line 320
    return-object p0

    .line 321
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;

    .line 322
    .line 323
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;-><init>()V

    .line 324
    .line 325
    .line 326
    return-object p0

    .line 327
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

.method public getAvatars(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getAvatarsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getAvatarsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

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

.method public getAvatarsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

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

.method public getMemberCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getRoomId()Ljava/lang/String;

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
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getTitle()Ljava/lang/String;

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
    move v2, v1

    .line 46
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 47
    .line 48
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-ge v1, v3, :cond_3

    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 55
    .line 56
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    add-int/2addr v2, v3

    .line 67
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    add-int/2addr v0, v2

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getAvatarsList()Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v0, v1

    .line 80
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

    .line 81
    .line 82
    const-wide/16 v3, 0x0

    .line 83
    .line 84
    cmp-long v3, v1, v3

    .line 85
    .line 86
    if-eqz v3, :cond_4

    .line 87
    .line 88
    const/4 v3, 0x4

    .line 89
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_5

    .line 101
    .line 102
    const/4 v1, 0x5

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getLiveId()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_5
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 113
    .line 114
    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->title_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getTitle()Ljava/lang/String;

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
    const/4 v0, 0x0

    .line 34
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-ge v0, v1, :cond_2

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->avatars_:Lcom/google/protobuf/l$h;

    .line 43
    .line 44
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ljava/lang/String;

    .line 49
    .line 50
    const/4 v2, 0x3

    .line 51
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->memberCount_:J

    .line 58
    .line 59
    const-wide/16 v2, 0x0

    .line 60
    .line 61
    cmp-long v2, v0, v2

    .line 62
    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    const/4 v2, 0x4

    .line 66
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 67
    .line 68
    .line 69
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->liveId_:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_4

    .line 76
    .line 77
    const/4 v0, 0x5

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellRoomInfo;->getLiveId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_4
    return-void
.end method

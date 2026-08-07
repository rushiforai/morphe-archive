.class public final Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedalOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserMedal"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedalOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

.field public static final IDS_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERSION_FIELD_NUMBER:I = 0x2


# instance fields
.field private bitField0_:I

.field private ids_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private version_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->addAllIds(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllIds(Ljava/lang/Iterable;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ensureIdsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addIds(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ensureIdsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addIdsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ensureIdsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

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

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->addIds(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->addIdsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearIds()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearVersion()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->getVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->clearIds()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->clearVersion()V

    return-void
.end method

.method private ensureIdsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->setIds(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->setVersion(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->setVersionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

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

.method private setIds(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ensureIdsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setVersionBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_7

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-eqz p3, :cond_3

    .line 60
    .line 61
    const/16 v2, 0xa

    .line 62
    .line 63
    if-eq p3, v2, :cond_5

    .line 64
    .line 65
    const/16 v2, 0x12

    .line 66
    .line 67
    if-eq p3, v2, :cond_4

    .line 68
    .line 69
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->R(I)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-nez p3, :cond_2

    .line 74
    .line 75
    :cond_3
    move p1, v1

    .line 76
    goto :goto_3

    .line 77
    :catch_0
    move-exception p1

    .line 78
    goto :goto_4

    .line 79
    :catch_1
    move-exception p1

    .line 80
    goto :goto_5

    .line 81
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 93
    .line 94
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-nez v2, :cond_6

    .line 99
    .line 100
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 101
    .line 102
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 107
    .line 108
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 109
    .line 110
    invoke-interface {v2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :catchall_1
    move-exception p0

    .line 115
    throw p0

    .line 116
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    return-object v0

    .line 133
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    return-object v0

    .line 141
    :cond_7
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 142
    .line 143
    return-object p0

    .line 144
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 145
    .line 146
    check-cast p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 147
    .line 148
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 149
    .line 150
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 151
    .line 152
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 157
    .line 158
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    xor-int/2addr p1, v1

    .line 165
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 166
    .line 167
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    xor-int/2addr v1, v2

    .line 174
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 175
    .line 176
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 181
    .line 182
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 183
    .line 184
    if-ne p2, p1, :cond_8

    .line 185
    .line 186
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->bitField0_:I

    .line 187
    .line 188
    iget p2, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->bitField0_:I

    .line 189
    .line 190
    or-int/2addr p1, p2

    .line 191
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->bitField0_:I

    .line 192
    .line 193
    :cond_8
    return-object p0

    .line 194
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;

    .line 195
    .line 196
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal$Builder;-><init>(Ll/c2w;)V

    .line 197
    .line 198
    .line 199
    return-object p0

    .line 200
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 201
    .line 202
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 203
    .line 204
    .line 205
    return-object v0

    .line 206
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 207
    .line 208
    return-object p0

    .line 209
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;

    .line 210
    .line 211
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;-><init>()V

    .line 212
    .line 213
    .line 214
    return-object p0

    .line 215
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

.method public getIds(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

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

.method public getIdsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

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

.method public getIdsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

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

.method public getIdsList()Ljava/util/List;
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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 3

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
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v0, v2, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 18
    .line 19
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v1, v2

    .line 30
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->getIdsList()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr v1, v0

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    const/4 v0, 0x2

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->getVersion()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v0, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr v1, v0

    .line 60
    :cond_2
    iput v1, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 61
    .line 62
    return v1
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

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
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->ids_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/String;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->version_:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$UserMedal;->getVersion()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

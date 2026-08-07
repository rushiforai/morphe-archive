.class public final Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEventOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TurboCardReceiveEvent"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEventOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

.field public static final ICON_FIELD_NUMBER:I = 0x4

.field public static final NAME_FIELD_NUMBER:I = 0x2

.field public static final NUMS_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_FIELD_NUMBER:I = 0x1

.field public static final URL_FIELD_NUMBER:I = 0x5


# instance fields
.field private icon_:Ljava/lang/String;

.field private name_:Ljava/lang/String;

.field private nums_:J

.field private type_:I

.field private url_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->clearIcon()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->clearName()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->clearNums()V

    return-void
.end method

.method private clearIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearNums()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->clearType()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->clearUrl()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setNums(J)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setType(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->setUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

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

.method private setIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIconBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setNums(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 2
    .line 3
    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 2
    .line 3
    return-void
.end method

.method private setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->PARSER:Ll/ng60;

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
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_7

    .line 69
    .line 70
    const/16 p3, 0x18

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 111
    .line 112
    .line 113
    move-result-wide v3

    .line 114
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

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
    check-cast p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 166
    .line 167
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 168
    .line 169
    if-eqz p1, :cond_a

    .line 170
    .line 171
    move p2, v2

    .line 172
    goto :goto_6

    .line 173
    :cond_a
    move p2, v0

    .line 174
    :goto_6
    iget v1, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 175
    .line 176
    if-eqz v1, :cond_b

    .line 177
    .line 178
    move v4, v2

    .line 179
    goto :goto_7

    .line 180
    :cond_b
    move v4, v0

    .line 181
    :goto_7
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    xor-int/2addr p1, v2

    .line 194
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 195
    .line 196
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    xor-int/2addr v1, v2

    .line 203
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 204
    .line 205
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 210
    .line 211
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 212
    .line 213
    const-wide/16 p1, 0x0

    .line 214
    .line 215
    cmp-long v1, v5, p1

    .line 216
    .line 217
    if-eqz v1, :cond_c

    .line 218
    .line 219
    move v4, v2

    .line 220
    goto :goto_8

    .line 221
    :cond_c
    move v4, v0

    .line 222
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 223
    .line 224
    cmp-long p1, v8, p1

    .line 225
    .line 226
    if-eqz p1, :cond_d

    .line 227
    .line 228
    move v7, v2

    .line 229
    goto :goto_9

    .line 230
    :cond_d
    move v7, v0

    .line 231
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 232
    .line 233
    .line 234
    move-result-wide p1

    .line 235
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 236
    .line 237
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    xor-int/2addr p1, v2

    .line 244
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 245
    .line 246
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    xor-int/2addr v0, v2

    .line 253
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 254
    .line 255
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

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
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

    .line 278
    .line 279
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

    .line 284
    .line 285
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 286
    .line 287
    return-object p0

    .line 288
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;

    .line 289
    .line 290
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;-><init>(Ll/k3w;)V

    .line 291
    .line 292
    .line 293
    return-object p0

    .line 294
    :pswitch_5
    return-object v1

    .line 295
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 296
    .line 297
    return-object p0

    .line 298
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 299
    .line 300
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;-><init>()V

    .line 301
    .line 302
    .line 303
    return-object p0

    .line 304
    nop

    .line 305
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

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

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

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

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

.method public getNums()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 2
    .line 3
    return-wide v0
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->SENIOR:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->getNumber()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 45
    .line 46
    const-wide/16 v3, 0x0

    .line 47
    .line 48
    cmp-long v3, v1, v3

    .line 49
    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    const/4 v3, 0x3

    .line 53
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getIcon()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getUrl()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_5
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 95
    .line 96
    return v0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->SENIOR:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->getNumber()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->type_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getName()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->nums_:J

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    cmp-long v2, v0, v2

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    const/4 v2, 0x3

    .line 42
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->icon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getIcon()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->getUrl()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    return-void
.end method

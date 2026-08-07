.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ConnInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfoOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

.field public static final LOCALE_FIELD_NUMBER:I = 0x5

.field public static final LOC_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x6

.field public static final SIDE_FIELD_NUMBER:I = 0x2

.field public static final SOURCE_FIELD_NUMBER:I = 0x1

.field public static final UA_FIELD_NUMBER:I = 0x3


# instance fields
.field private loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

.field private locale_:Ljava/lang/String;

.field private roomId_:Ljava/lang/String;

.field private side_:I

.field private source_:I

.field private ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->clearLoc()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->clearLocale()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->clearRoomId()V

    return-void
.end method

.method private clearLoc()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 3
    .line 4
    return-void
.end method

.method private clearLocale()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getLocale()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSide()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearSource()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearUa()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->clearSide()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->clearSource()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->clearUa()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->mergeLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->mergeUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setLocale(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setLocaleBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method private mergeLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 33
    .line 34
    return-void
.end method

.method private mergeUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setSide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setSideValue(I)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setSource(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setSourceValue(I)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;)V

    return-void
.end method

.method private setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 8
    .line 9
    return-void
.end method

.method private setLoc(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    return-void
.end method

.method private setLocale(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLocaleBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 9
    .line 10
    return-void
.end method

.method private setSideValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 2
    .line 3
    return-void
.end method

.method private setSource(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 9
    .line 10
    return-void
.end method

.method private setSourceValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 2
    .line 3
    return-void
.end method

.method private setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 8
    .line 9
    return-void
.end method

.method private setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->setUa(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V

    return-void
.end method

.method public static bridge synthetic u()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v1, 0x0

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
    return-object v0

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    monitor-exit p0

    .line 43
    goto :goto_2

    .line 44
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p1

    .line 46
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->PARSER:Ll/ng60;

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 50
    .line 51
    check-cast p3, Lcom/google/protobuf/h;

    .line 52
    .line 53
    :cond_2
    :goto_3
    if-nez v1, :cond_c

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    const/16 v3, 0x8

    .line 62
    .line 63
    if-eq p1, v3, :cond_b

    .line 64
    .line 65
    const/16 v3, 0x10

    .line 66
    .line 67
    if-eq p1, v3, :cond_a

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq p1, v3, :cond_8

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq p1, v3, :cond_6

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq p1, v3, :cond_5

    .line 80
    .line 81
    const/16 v3, 0x32

    .line 82
    .line 83
    if-eq p1, v3, :cond_4

    .line 84
    .line 85
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_2

    .line 90
    .line 91
    :cond_3
    move v1, v2

    .line 92
    goto :goto_3

    .line 93
    :catch_0
    move-exception p1

    .line 94
    goto/16 :goto_6

    .line 95
    .line 96
    :catch_1
    move-exception p1

    .line 97
    goto/16 :goto_7

    .line 98
    .line 99
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 114
    .line 115
    if-eqz p1, :cond_7

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location$Builder;

    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_7
    move-object p1, v0

    .line 125
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;->parser()Ll/ng60;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 134
    .line 135
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 136
    .line 137
    if-eqz p1, :cond_2

    .line 138
    .line 139
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 147
    .line 148
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 152
    .line 153
    if-eqz p1, :cond_9

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 160
    .line 161
    goto :goto_5

    .line 162
    :cond_9
    move-object p1, v0

    .line 163
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->parser()Ll/ng60;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 172
    .line 173
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 174
    .line 175
    if-eqz p1, :cond_2

    .line 176
    .line 177
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 185
    .line 186
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 187
    .line 188
    goto/16 :goto_3

    .line 189
    .line 190
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 195
    .line 196
    goto/16 :goto_3

    .line 197
    .line 198
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 203
    .line 204
    goto/16 :goto_3

    .line 205
    .line 206
    :catchall_1
    move-exception p0

    .line 207
    throw p0

    .line 208
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 209
    .line 210
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 222
    .line 223
    .line 224
    return-object v0

    .line 225
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    return-object v0

    .line 233
    :cond_c
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 234
    .line 235
    return-object p0

    .line 236
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 237
    .line 238
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 239
    .line 240
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 241
    .line 242
    if-eqz p1, :cond_d

    .line 243
    .line 244
    move v0, v2

    .line 245
    goto :goto_8

    .line 246
    :cond_d
    move v0, v1

    .line 247
    :goto_8
    iget v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 248
    .line 249
    if-eqz v3, :cond_e

    .line 250
    .line 251
    move v4, v2

    .line 252
    goto :goto_9

    .line 253
    :cond_e
    move v4, v1

    .line 254
    :goto_9
    invoke-interface {p2, v0, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 259
    .line 260
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 261
    .line 262
    if-eqz p1, :cond_f

    .line 263
    .line 264
    move v0, v2

    .line 265
    goto :goto_a

    .line 266
    :cond_f
    move v0, v1

    .line 267
    :goto_a
    iget v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 268
    .line 269
    if-eqz v3, :cond_10

    .line 270
    .line 271
    move v1, v2

    .line 272
    :cond_10
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 277
    .line 278
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 279
    .line 280
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 281
    .line 282
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 287
    .line 288
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 289
    .line 290
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 291
    .line 292
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 293
    .line 294
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 299
    .line 300
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 301
    .line 302
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 305
    .line 306
    .line 307
    move-result p1

    .line 308
    xor-int/2addr p1, v2

    .line 309
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 310
    .line 311
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 314
    .line 315
    .line 316
    move-result v1

    .line 317
    xor-int/2addr v1, v2

    .line 318
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 319
    .line 320
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 325
    .line 326
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 327
    .line 328
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 329
    .line 330
    .line 331
    move-result p1

    .line 332
    xor-int/2addr p1, v2

    .line 333
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 334
    .line 335
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    xor-int/2addr v1, v2

    .line 342
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 343
    .line 344
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 349
    .line 350
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 351
    .line 352
    return-object p0

    .line 353
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;

    .line 354
    .line 355
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo$Builder;-><init>(Ll/a2w;)V

    .line 356
    .line 357
    .line 358
    return-object p0

    .line 359
    :pswitch_5
    return-object v0

    .line 360
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 361
    .line 362
    return-object p0

    .line 363
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;

    .line 364
    .line 365
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;-><init>()V

    .line 366
    .line 367
    .line 368
    return-object p0

    .line 369
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

.method public getLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getLocale()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocaleBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eq v1, v2, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    iget v2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_5

    .line 79
    .line 80
    const/4 v1, 0x5

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getLocale()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_6

    .line 97
    .line 98
    const/4 v1, 0x6

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getRoomId()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    add-int/2addr v0, v1

    .line 108
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 109
    .line 110
    return v0
.end method

.method public getSide()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getSideValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSource()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getSourceValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 2
    .line 3
    return p0
.end method

.method public getUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasLoc()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

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

.method public hasUa()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->source_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->side_:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->ua_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getUa()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->loc_:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getLoc()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$Location;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->locale_:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getLocale()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->roomId_:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    const/4 v0, 0x6

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ConnInfo;->getRoomId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    return-void
.end method

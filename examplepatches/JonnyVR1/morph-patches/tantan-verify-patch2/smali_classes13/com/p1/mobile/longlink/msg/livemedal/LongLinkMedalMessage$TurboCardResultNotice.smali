.class public final Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNoticeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TurboCardResultNotice"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNoticeOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x1

.field public static final TOTALAUDIENCE_FIELD_NUMBER:I = 0x2

.field public static final TYPE_FIELD_NUMBER:I = 0x3


# instance fields
.field private roomId_:Ljava/lang/String;

.field private totalAudience_:J

.field private type_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->clearRoomId()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->clearTotalAudience()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->clearType()V

    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTotalAudience()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->setTotalAudience(J)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->setType(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->setTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic i()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

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

.method private setRoomId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTotalAudience(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

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
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 2
    .line 3
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_7

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
    if-eq p1, p3, :cond_6

    .line 65
    .line 66
    const/16 p3, 0x10

    .line 67
    .line 68
    if-eq p1, p3, :cond_5

    .line 69
    .line 70
    const/16 p3, 0x18

    .line 71
    .line 72
    if-eq p1, p3, :cond_4

    .line 73
    .line 74
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    :cond_3
    move v0, v2

    .line 81
    goto :goto_3

    .line 82
    :catch_0
    move-exception v0

    .line 83
    move-object p1, v0

    .line 84
    goto :goto_4

    .line 85
    :catch_1
    move-exception v0

    .line 86
    move-object p1, v0

    .line 87
    goto :goto_5

    .line 88
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 96
    .line 97
    .line 98
    move-result-wide v3

    .line 99
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :catchall_1
    move-exception v0

    .line 110
    move-object p0, v0

    .line 111
    throw p0

    .line 112
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 126
    .line 127
    .line 128
    return-object v1

    .line 129
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    return-object v1

    .line 137
    :cond_7
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 138
    .line 139
    return-object p0

    .line 140
    :pswitch_3
    move-object v3, p2

    .line 141
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 142
    .line 143
    check-cast p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    xor-int/2addr p1, v2

    .line 152
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 153
    .line 154
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    xor-int/2addr v1, v2

    .line 161
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 162
    .line 163
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 168
    .line 169
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

    .line 170
    .line 171
    const-wide/16 p1, 0x0

    .line 172
    .line 173
    cmp-long v1, v5, p1

    .line 174
    .line 175
    if-eqz v1, :cond_8

    .line 176
    .line 177
    move v4, v2

    .line 178
    goto :goto_6

    .line 179
    :cond_8
    move v4, v0

    .line 180
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

    .line 181
    .line 182
    cmp-long p1, v8, p1

    .line 183
    .line 184
    if-eqz p1, :cond_9

    .line 185
    .line 186
    move v7, v2

    .line 187
    goto :goto_7

    .line 188
    :cond_9
    move v7, v0

    .line 189
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 190
    .line 191
    .line 192
    move-result-wide p1

    .line 193
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

    .line 194
    .line 195
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 196
    .line 197
    if-eqz p1, :cond_a

    .line 198
    .line 199
    move p2, v2

    .line 200
    goto :goto_8

    .line 201
    :cond_a
    move p2, v0

    .line 202
    :goto_8
    iget p3, p3, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 203
    .line 204
    if-eqz p3, :cond_b

    .line 205
    .line 206
    move v0, v2

    .line 207
    :cond_b
    invoke-interface {v3, p2, p1, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 212
    .line 213
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 214
    .line 215
    return-object p0

    .line 216
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;

    .line 217
    .line 218
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice$Builder;-><init>(Ll/k3w;)V

    .line 219
    .line 220
    .line 221
    return-object p0

    .line 222
    :pswitch_5
    return-object v1

    .line 223
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 224
    .line 225
    return-object p0

    .line 226
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;

    .line 227
    .line 228
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;-><init>()V

    .line 229
    .line 230
    .line 231
    return-object p0

    .line 232
    nop

    .line 233
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

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getRoomId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    cmp-long v3, v1, v3

    .line 31
    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 41
    .line 42
    sget-object v2, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->SENIOR:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->getNumber()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eq v1, v2, :cond_3

    .line 49
    .line 50
    const/4 v1, 0x3

    .line 51
    iget v2, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 59
    .line 60
    return v0
.end method

.method public getTotalAudience()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

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
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->roomId_:Ljava/lang/String;

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
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->getRoomId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->totalAudience_:J

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v2, v0, v2

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 30
    .line 31
    sget-object v1, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->SENIOR:Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->getNumber()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eq v0, v1, :cond_2

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;->type_:I

    .line 41
    .line 42
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 43
    .line 44
    .line 45
    :cond_2
    return-void
.end method

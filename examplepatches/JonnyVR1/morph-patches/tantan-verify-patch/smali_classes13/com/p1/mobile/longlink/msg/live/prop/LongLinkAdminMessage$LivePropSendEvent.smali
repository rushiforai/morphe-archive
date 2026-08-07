.class public final Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEventOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LivePropSendEvent"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEventOrBuilder;"
    }
.end annotation


# static fields
.field public static final AMOUNT_FIELD_NUMBER:I = 0x5

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

.field public static final FROMUSERID_FIELD_NUMBER:I = 0x2

.field public static final ID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;",
            ">;"
        }
    .end annotation
.end field

.field public static final TOUSERID_FIELD_NUMBER:I = 0x3

.field public static final TYPE_FIELD_NUMBER:I = 0x4


# instance fields
.field private amount_:J

.field private fromUserId_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private toUserId_:Ljava/lang/String;

.field private type_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->clearAmount()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->clearFromUserId()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->clearId()V

    return-void
.end method

.method private clearAmount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearFromUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getFromUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearToUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getToUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->clearToUserId()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->clearType()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setAmount(J)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setFromUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setFromUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setToUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setToUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setType(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->setTypeValue(I)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object v0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

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

.method private setAmount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 2
    .line 3
    return-void
.end method

.method private setFromUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setFromUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setToUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setToUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->PARSER:Ll/ng60;

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
    const/16 p3, 0xa

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
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 160
    .line 161
    return-object p0

    .line 162
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 163
    .line 164
    check-cast p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 165
    .line 166
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    xor-int/2addr p1, v2

    .line 173
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    xor-int/2addr v3, v2

    .line 182
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 183
    .line 184
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 189
    .line 190
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    xor-int/2addr p1, v2

    .line 197
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 198
    .line 199
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 202
    .line 203
    .line 204
    move-result v3

    .line 205
    xor-int/2addr v3, v2

    .line 206
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 207
    .line 208
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 213
    .line 214
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    xor-int/2addr p1, v2

    .line 221
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 222
    .line 223
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    xor-int/2addr v3, v2

    .line 230
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 231
    .line 232
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 237
    .line 238
    iget p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 239
    .line 240
    if-eqz p1, :cond_a

    .line 241
    .line 242
    move v1, v2

    .line 243
    goto :goto_6

    .line 244
    :cond_a
    move v1, v0

    .line 245
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 246
    .line 247
    if-eqz v3, :cond_b

    .line 248
    .line 249
    move v4, v2

    .line 250
    goto :goto_7

    .line 251
    :cond_b
    move v4, v0

    .line 252
    :goto_7
    invoke-interface {p2, v1, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 253
    .line 254
    .line 255
    move-result p1

    .line 256
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 257
    .line 258
    move p1, v2

    .line 259
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 260
    .line 261
    const-wide/16 v4, 0x0

    .line 262
    .line 263
    cmp-long v1, v2, v4

    .line 264
    .line 265
    if-eqz v1, :cond_c

    .line 266
    .line 267
    move v1, p1

    .line 268
    goto :goto_8

    .line 269
    :cond_c
    move v1, v0

    .line 270
    :goto_8
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 271
    .line 272
    cmp-long p3, v6, v4

    .line 273
    .line 274
    if-eqz p3, :cond_d

    .line 275
    .line 276
    move v4, p1

    .line 277
    move-object v0, p2

    .line 278
    move-wide v5, v6

    .line 279
    goto :goto_9

    .line 280
    :cond_d
    move v4, v0

    .line 281
    move-wide v5, v6

    .line 282
    move-object v0, p2

    .line 283
    :goto_9
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 284
    .line 285
    .line 286
    move-result-wide p1

    .line 287
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 288
    .line 289
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 290
    .line 291
    return-object p0

    .line 292
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;

    .line 293
    .line 294
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent$Builder;-><init>(Ll/r1w;)V

    .line 295
    .line 296
    .line 297
    return-object p0

    .line 298
    :pswitch_5
    return-object v1

    .line 299
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 300
    .line 301
    return-object p0

    .line 302
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;

    .line 303
    .line 304
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;-><init>()V

    .line 305
    .line 306
    .line 307
    return-object p0

    .line 308
    nop

    .line 309
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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFromUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFromUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getFromUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getToUserId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/2addr v0, v1

    .line 62
    :cond_3
    iget v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 63
    .line 64
    sget-object v2, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->unknown:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->getNumber()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eq v1, v2, :cond_4

    .line 71
    .line 72
    const/4 v1, 0x4

    .line 73
    iget v2, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 74
    .line 75
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v0, v1

    .line 80
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 81
    .line 82
    const-wide/16 v3, 0x0

    .line 83
    .line 84
    cmp-long v3, v1, v3

    .line 85
    .line 86
    if-eqz v3, :cond_5

    .line 87
    .line 88
    const/4 v3, 0x5

    .line 89
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

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

.method public getToUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

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

.method public getType()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->forNumber(I)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->fromUserId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getFromUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->toUserId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->getToUserId()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->unknown:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->getNumber()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eq v0, v1, :cond_3

    .line 58
    .line 59
    const/4 v0, 0x4

    .line 60
    iget v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->type_:I

    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendEvent;->amount_:J

    .line 66
    .line 67
    const-wide/16 v2, 0x0

    .line 68
    .line 69
    cmp-long p0, v0, v2

    .line 70
    .line 71
    if-eqz p0, :cond_4

    .line 72
    .line 73
    const/4 p0, 0x5

    .line 74
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 75
    .line 76
    .line 77
    :cond_4
    return-void
.end method

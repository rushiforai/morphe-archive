.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveFixedRoomChatCellInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfoOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

.field public static final DISSOLVEREASON_FIELD_NUMBER:I = 0x5

.field public static final ISDISSOLVED_FIELD_NUMBER:I = 0x4

.field public static final ISONTOP_FIELD_NUMBER:I = 0x1

.field public static final ISREMIND_FIELD_NUMBER:I = 0x6

.field public static final ISREMOVED_FIELD_NUMBER:I = 0x3

.field public static final ISSHOW_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private dissolveReason_:Ljava/lang/String;

.field private isDissolved_:Z

.field private isOnTop_:Z

.field private isRemind_:Z

.field private isRemoved_:Z

.field private isShow_:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->clearDissolveReason()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->clearIsDissolved()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->clearIsOnTop()V

    return-void
.end method

.method private clearDissolveReason()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->getDissolveReason()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIsDissolved()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIsOnTop()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIsRemind()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIsRemoved()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIsShow()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->clearIsRemind()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->clearIsRemoved()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->clearIsShow()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->setDissolveReason(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->setDissolveReasonBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->setIsDissolved(Z)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->setIsOnTop(Z)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->setIsRemind(Z)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->setIsRemoved(Z)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->setIsShow(Z)V

    return-void
.end method

.method public static bridge synthetic n()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

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

.method private setDissolveReason(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setDissolveReasonBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIsDissolved(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIsOnTop(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIsRemind(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIsRemoved(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIsShow(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_a

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
    const/16 v2, 0x8

    .line 62
    .line 63
    if-eq p3, v2, :cond_9

    .line 64
    .line 65
    const/16 v2, 0x10

    .line 66
    .line 67
    if-eq p3, v2, :cond_8

    .line 68
    .line 69
    const/16 v2, 0x18

    .line 70
    .line 71
    if-eq p3, v2, :cond_7

    .line 72
    .line 73
    const/16 v2, 0x20

    .line 74
    .line 75
    if-eq p3, v2, :cond_6

    .line 76
    .line 77
    const/16 v2, 0x2a

    .line 78
    .line 79
    if-eq p3, v2, :cond_5

    .line 80
    .line 81
    const/16 v2, 0x30

    .line 82
    .line 83
    if-eq p3, v2, :cond_4

    .line 84
    .line 85
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->R(I)Z

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    if-nez p3, :cond_2

    .line 90
    .line 91
    :cond_3
    move p1, v1

    .line 92
    goto :goto_3

    .line 93
    :catch_0
    move-exception p1

    .line 94
    goto :goto_4

    .line 95
    :catch_1
    move-exception p1

    .line 96
    goto :goto_5

    .line 97
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    iput-boolean p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 112
    .line 113
    .line 114
    move-result p3

    .line 115
    iput-boolean p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 119
    .line 120
    .line 121
    move-result p3

    .line 122
    iput-boolean p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 126
    .line 127
    .line 128
    move-result p3

    .line 129
    iput-boolean p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 133
    .line 134
    .line 135
    move-result p3

    .line 136
    iput-boolean p3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :catchall_1
    move-exception p0

    .line 140
    throw p0

    .line 141
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 142
    .line 143
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 155
    .line 156
    .line 157
    return-object v0

    .line 158
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    return-object v0

    .line 166
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 167
    .line 168
    return-object p0

    .line 169
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 170
    .line 171
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 172
    .line 173
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z

    .line 174
    .line 175
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z

    .line 176
    .line 177
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z

    .line 182
    .line 183
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 184
    .line 185
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 186
    .line 187
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 192
    .line 193
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 194
    .line 195
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 196
    .line 197
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 202
    .line 203
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 204
    .line 205
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 206
    .line 207
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    xor-int/2addr p1, v1

    .line 220
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 221
    .line 222
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    xor-int/2addr v1, v2

    .line 229
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 230
    .line 231
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 236
    .line 237
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 238
    .line 239
    iget-boolean p3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 240
    .line 241
    invoke-interface {p2, p1, p1, p3, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 246
    .line 247
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 248
    .line 249
    return-object p0

    .line 250
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;

    .line 251
    .line 252
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo$Builder;-><init>(Ll/n2w;)V

    .line 253
    .line 254
    .line 255
    return-object p0

    .line 256
    :pswitch_5
    return-object v0

    .line 257
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 258
    .line 259
    return-object p0

    .line 260
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;

    .line 261
    .line 262
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;-><init>()V

    .line 263
    .line 264
    .line 265
    return-object p0

    .line 266
    nop

    .line 267
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

.method public getDissolveReason()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDissolveReasonBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

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

.method public getIsDissolved()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsOnTop()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsRemind()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsRemoved()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsShow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 2
    .line 3
    return p0
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
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, v0}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 19
    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    const/4 v2, 0x2

    .line 23
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int/2addr v0, v1

    .line 28
    :cond_2
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 29
    .line 30
    if-eqz v1, :cond_3

    .line 31
    .line 32
    const/4 v2, 0x3

    .line 33
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int/2addr v0, v1

    .line 38
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 39
    .line 40
    if-eqz v1, :cond_4

    .line 41
    .line 42
    const/4 v2, 0x4

    .line 43
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    add-int/2addr v0, v1

    .line 48
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x5

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->getDissolveReason()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    add-int/2addr v0, v1

    .line 66
    :cond_5
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 67
    .line 68
    if-eqz v1, :cond_6

    .line 69
    .line 70
    const/4 v2, 0x6

    .line 71
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 77
    .line 78
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isOnTop_:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isShow_:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemoved_:Z

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isDissolved_:Z

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    const/4 v1, 0x4

    .line 30
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->dissolveReason_:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->getDissolveReason()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkFixedRoomMessage$LiveFixedRoomChatCellInfo;->isRemind_:Z

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 55
    .line 56
    .line 57
    :cond_5
    return-void
.end method

.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Msg"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgOrBuilder;"
    }
.end annotation


# static fields
.field public static final DATA_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

.field public static final ISACK_FIELD_NUMBER:I = 0x8

.field public static final ISRELIABLE_FIELD_NUMBER:I = 0x9

.field public static final MSGID_FIELD_NUMBER:I = 0x2

.field public static final MSGTYPENAME_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;",
            ">;"
        }
    .end annotation
.end field

.field public static final PUSH_FIELD_NUMBER:I = 0x4

.field public static final TYPE_FIELD_NUMBER:I = 0x1

.field public static final VERSION_FIELD_NUMBER:I = 0x7


# instance fields
.field private data_:Lcom/google/protobuf/Any;

.field private isAck_:Z

.field private isReliable_:Z

.field private msgId_:Ljava/lang/String;

.field private msgTypeName_:Ljava/lang/String;

.field private push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

.field private type_:I

.field private version_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic access$000()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setTypeValue(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1000(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->clearData()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1100(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setPush(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setPush(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->mergePush(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1400(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->clearPush()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1500(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setMsgTypeName(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1600(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->clearMsgTypeName()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1700(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setMsgTypeNameBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1800(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setVersion(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1900(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->clearVersion()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setType(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2000(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setVersionBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2100(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setIsAck(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2200(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->clearIsAck()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2300(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setIsReliable(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$2400(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->clearIsReliable()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->clearType()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setMsgId(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->clearMsgId()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setMsgIdBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/google/protobuf/Any;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setData(Lcom/google/protobuf/Any;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/google/protobuf/Any$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->setData(Lcom/google/protobuf/Any$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;Lcom/google/protobuf/Any;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->mergeData(Lcom/google/protobuf/Any;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private clearData()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 3
    .line 4
    return-void
.end method

.method private clearIsAck()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIsReliable()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearMsgId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMsgTypeName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgTypeName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPush()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 3
    .line 4
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearVersion()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    return-object v0
.end method

.method private mergeData(Lcom/google/protobuf/Any;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/protobuf/Any;->getDefaultInstance()Lcom/google/protobuf/Any;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/protobuf/Any;->newBuilder(Lcom/google/protobuf/Any;)Lcom/google/protobuf/Any$b;

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
    check-cast p1, Lcom/google/protobuf/Any$b;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/google/protobuf/Any;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 33
    .line 34
    return-void
.end method

.method private mergePush(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

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

.method private setData(Lcom/google/protobuf/Any$b;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/google/protobuf/Any;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 8
    .line 9
    return-void
.end method

.method private setData(Lcom/google/protobuf/Any;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    return-void
.end method

.method private setIsAck(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIsReliable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setMsgId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setMsgIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMsgTypeName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setMsgTypeNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPush(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 8
    .line 9
    return-void
.end method

.method private setPush(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 2
    .line 3
    return-void
.end method

.method private setVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_e

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
    if-eq p1, v3, :cond_d

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq p1, v3, :cond_c

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq p1, v3, :cond_a

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq p1, v3, :cond_8

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq p1, v3, :cond_7

    .line 80
    .line 81
    const/16 v3, 0x3a

    .line 82
    .line 83
    if-eq p1, v3, :cond_6

    .line 84
    .line 85
    const/16 v3, 0x40

    .line 86
    .line 87
    if-eq p1, v3, :cond_5

    .line 88
    .line 89
    const/16 v3, 0x48

    .line 90
    .line 91
    if-eq p1, v3, :cond_4

    .line 92
    .line 93
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_2

    .line 98
    .line 99
    :cond_3
    move v0, v2

    .line 100
    goto :goto_3

    .line 101
    :catch_0
    move-exception p1

    .line 102
    goto/16 :goto_6

    .line 103
    .line 104
    :catch_1
    move-exception p1

    .line 105
    goto/16 :goto_7

    .line 106
    .line 107
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 136
    .line 137
    if-eqz p1, :cond_9

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;

    .line 144
    .line 145
    goto :goto_4

    .line 146
    :cond_9
    move-object p1, v1

    .line 147
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->parser()Ll/ng60;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 156
    .line 157
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 158
    .line 159
    if-eqz p1, :cond_2

    .line 160
    .line 161
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 169
    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 174
    .line 175
    if-eqz p1, :cond_b

    .line 176
    .line 177
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    check-cast p1, Lcom/google/protobuf/Any$b;

    .line 182
    .line 183
    goto :goto_5

    .line 184
    :cond_b
    move-object p1, v1

    .line 185
    :goto_5
    invoke-static {}, Lcom/google/protobuf/Any;->parser()Ll/ng60;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Lcom/google/protobuf/Any;

    .line 194
    .line 195
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 196
    .line 197
    if-eqz p1, :cond_2

    .line 198
    .line 199
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    check-cast p1, Lcom/google/protobuf/Any;

    .line 207
    .line 208
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 209
    .line 210
    goto/16 :goto_3

    .line 211
    .line 212
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 217
    .line 218
    goto/16 :goto_3

    .line 219
    .line 220
    :cond_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 225
    .line 226
    goto/16 :goto_3

    .line 227
    .line 228
    :catchall_1
    move-exception p0

    .line 229
    throw p0

    .line 230
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 231
    .line 232
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 244
    .line 245
    .line 246
    return-object v1

    .line 247
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 252
    .line 253
    .line 254
    return-object v1

    .line 255
    :cond_e
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 256
    .line 257
    return-object p0

    .line 258
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 259
    .line 260
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 261
    .line 262
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 263
    .line 264
    if-eqz p1, :cond_f

    .line 265
    .line 266
    move v1, v2

    .line 267
    goto :goto_8

    .line 268
    :cond_f
    move v1, v0

    .line 269
    :goto_8
    iget v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 270
    .line 271
    if-eqz v3, :cond_10

    .line 272
    .line 273
    move v0, v2

    .line 274
    :cond_10
    invoke-interface {p2, v1, p1, v0, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 279
    .line 280
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 283
    .line 284
    .line 285
    move-result p1

    .line 286
    xor-int/2addr p1, v2

    .line 287
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 288
    .line 289
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 290
    .line 291
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    xor-int/2addr v1, v2

    .line 296
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 297
    .line 298
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 303
    .line 304
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 305
    .line 306
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 307
    .line 308
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    check-cast p1, Lcom/google/protobuf/Any;

    .line 313
    .line 314
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 315
    .line 316
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 317
    .line 318
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 319
    .line 320
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 325
    .line 326
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 327
    .line 328
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 331
    .line 332
    .line 333
    move-result p1

    .line 334
    xor-int/2addr p1, v2

    .line 335
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 336
    .line 337
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 338
    .line 339
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 340
    .line 341
    .line 342
    move-result v1

    .line 343
    xor-int/2addr v1, v2

    .line 344
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 345
    .line 346
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 351
    .line 352
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 355
    .line 356
    .line 357
    move-result p1

    .line 358
    xor-int/2addr p1, v2

    .line 359
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 360
    .line 361
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    xor-int/2addr v1, v2

    .line 368
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 369
    .line 370
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 375
    .line 376
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 377
    .line 378
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 379
    .line 380
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 381
    .line 382
    .line 383
    move-result p1

    .line 384
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 385
    .line 386
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 387
    .line 388
    iget-boolean p3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 389
    .line 390
    invoke-interface {p2, p1, p1, p3, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 391
    .line 392
    .line 393
    move-result p1

    .line 394
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 395
    .line 396
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 397
    .line 398
    return-object p0

    .line 399
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;

    .line 400
    .line 401
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg$Builder;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$1;)V

    .line 402
    .line 403
    .line 404
    return-object p0

    .line 405
    :pswitch_5
    return-object v1

    .line 406
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 407
    .line 408
    return-object p0

    .line 409
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;

    .line 410
    .line 411
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;-><init>()V

    .line 412
    .line 413
    .line 414
    return-object p0

    .line 415
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

.method public getData()Lcom/google/protobuf/Any;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/protobuf/Any;->getDefaultInstance()Lcom/google/protobuf/Any;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getIsAck()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsReliable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMsgId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMsgIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

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

.method public getMsgTypeName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMsgTypeNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

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

.method public getPush()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_CHAT_MSG:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getData()Lcom/google/protobuf/Any;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x4

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getPush()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgTypeName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

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
    const/4 v1, 0x7

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getVersion()Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 109
    .line 110
    if-eqz v1, :cond_7

    .line 111
    .line 112
    const/16 v2, 0x8

    .line 113
    .line 114
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    add-int/2addr v0, v1

    .line 119
    :cond_7
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 120
    .line 121
    if-eqz v1, :cond_8

    .line 122
    .line 123
    const/16 v2, 0x9

    .line 124
    .line 125
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    add-int/2addr v0, v1

    .line 130
    :cond_8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 131
    .line 132
    return v0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

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

.method public hasData()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

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

.method public hasPush()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->MSG_TYPE_CHAT_MSG:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->type_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->data_:Lcom/google/protobuf/Any;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getData()Lcom/google/protobuf/Any;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->push_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getPush()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->msgTypeName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getMsgTypeName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->version_:Ljava/lang/String;

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
    const/4 v0, 0x7

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->getVersion()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isAck_:Z

    .line 90
    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    const/16 v1, 0x8

    .line 94
    .line 95
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 96
    .line 97
    .line 98
    :cond_6
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$Msg;->isReliable_:Z

    .line 99
    .line 100
    if-eqz p0, :cond_7

    .line 101
    .line 102
    const/16 v0, 0x9

    .line 103
    .line 104
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 105
    .line 106
    .line 107
    :cond_7
    return-void
.end method

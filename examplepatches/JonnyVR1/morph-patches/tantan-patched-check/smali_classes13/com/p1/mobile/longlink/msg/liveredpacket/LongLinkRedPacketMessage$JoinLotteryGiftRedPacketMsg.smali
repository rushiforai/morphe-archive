.class public final Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "JoinLotteryGiftRedPacketMsg"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;",
        "Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsgOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

.field public static final ISAGGREGATE_FIELD_NUMBER:I = 0x4

.field public static final JUMPSCHEME_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;",
            ">;"
        }
    .end annotation
.end field

.field public static final ROOMID_FIELD_NUMBER:I = 0x5

.field public static final TEMPLATE_FIELD_NUMBER:I = 0x6

.field public static final USERID_FIELD_NUMBER:I = 0x1

.field public static final USERNAME_FIELD_NUMBER:I = 0x2


# instance fields
.field private isAggregate_:Z

.field private jumpScheme_:Ljava/lang/String;

.field private roomId_:Ljava/lang/String;

.field private template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

.field private userId_:Ljava/lang/String;

.field private userName_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->clearIsAggregate()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->clearJumpScheme()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->clearRoomId()V

    return-void
.end method

.method private clearIsAggregate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearJumpScheme()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getJumpScheme()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRoomId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTemplate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->clearTemplate()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->clearUserName()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->mergeTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setIsAggregate(Z)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setJumpScheme(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setJumpSchemeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setRoomId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setRoomIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V

    return-void
.end method

.method private mergeTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    return-object v0
.end method

.method private setIsAggregate(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setJumpScheme(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setJumpSchemeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 8
    .line 9
    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_b

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    const/16 v3, 0xa

    .line 62
    .line 63
    if-eq v2, v3, :cond_a

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_9

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_8

    .line 72
    .line 73
    const/16 v3, 0x20

    .line 74
    .line 75
    if-eq v2, v3, :cond_7

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq v2, v3, :cond_6

    .line 80
    .line 81
    const/16 v3, 0x32

    .line 82
    .line 83
    if-eq v2, v3, :cond_4

    .line 84
    .line 85
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-nez v2, :cond_2

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
    goto :goto_5

    .line 95
    :catch_1
    move-exception p1

    .line 96
    goto :goto_6

    .line 97
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 98
    .line 99
    if-eqz v2, :cond_5

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_5
    move-object v2, v0

    .line 109
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->parser()Ll/ng60;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 118
    .line 119
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 120
    .line 121
    if-eqz v2, :cond_2

    .line 122
    .line 123
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 131
    .line 132
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    iput-boolean v2, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :catchall_1
    move-exception p0

    .line 171
    throw p0

    .line 172
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 173
    .line 174
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    return-object v0

    .line 189
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 194
    .line 195
    .line 196
    return-object v0

    .line 197
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 198
    .line 199
    return-object p0

    .line 200
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 201
    .line 202
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 203
    .line 204
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    xor-int/2addr p1, v1

    .line 211
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    xor-int/2addr v2, v1

    .line 220
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 221
    .line 222
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 227
    .line 228
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    xor-int/2addr p1, v1

    .line 235
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 236
    .line 237
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    xor-int/2addr v2, v1

    .line 244
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 245
    .line 246
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    xor-int/2addr p1, v1

    .line 259
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 260
    .line 261
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    xor-int/2addr v2, v1

    .line 268
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 269
    .line 270
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 275
    .line 276
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 277
    .line 278
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 279
    .line 280
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 285
    .line 286
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 287
    .line 288
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    xor-int/2addr p1, v1

    .line 293
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 294
    .line 295
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 298
    .line 299
    .line 300
    move-result v2

    .line 301
    xor-int/2addr v1, v2

    .line 302
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 303
    .line 304
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 309
    .line 310
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 311
    .line 312
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 313
    .line 314
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    check-cast p1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 319
    .line 320
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 321
    .line 322
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 323
    .line 324
    return-object p0

    .line 325
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;

    .line 326
    .line 327
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg$Builder;-><init>(Ll/t3w;)V

    .line 328
    .line 329
    .line 330
    return-object p0

    .line 331
    :pswitch_5
    return-object v0

    .line 332
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 333
    .line 334
    return-object p0

    .line 335
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;

    .line 336
    .line 337
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;-><init>()V

    .line 338
    .line 339
    .line 340
    return-object p0

    .line 341
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

.method public getIsAggregate()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getJumpScheme()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJumpSchemeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getUserName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getJumpScheme()Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getRoomId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    const/4 v1, 0x6

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    add-int/2addr v0, v1

    .line 104
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 105
    .line 106
    return v0
.end method

.method public getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

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

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

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

.method public hasTemplate()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->userName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getUserName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->jumpScheme_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getJumpScheme()Ljava/lang/String;

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
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->isAggregate_:Z

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    const/4 v1, 0x4

    .line 54
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->roomId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getRoomId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->template_:Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 74
    .line 75
    if-eqz v0, :cond_5

    .line 76
    .line 77
    const/4 v0, 0x6

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveredpacket/LongLinkRedPacketMessage$JoinLotteryGiftRedPacketMsg;->getTemplate()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 83
    .line 84
    .line 85
    :cond_5
    return-void
.end method

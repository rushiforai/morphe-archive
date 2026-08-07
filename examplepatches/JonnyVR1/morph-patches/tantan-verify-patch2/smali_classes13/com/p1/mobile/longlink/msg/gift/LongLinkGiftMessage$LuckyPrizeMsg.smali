.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LuckyPrizeMsg"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsgOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

.field public static final ICONURL_FIELD_NUMBER:I = 0x3

.field public static final JUMPROOMID_FIELD_NUMBER:I = 0x1

.field public static final LIVEID_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;",
            ">;"
        }
    .end annotation
.end field

.field public static final TEMPLATE_FIELD_NUMBER:I = 0x4


# instance fields
.field private iconUrl_:Ljava/lang/String;

.field private jumpRoomID_:Ljava/lang/String;

.field private liveID_:Ljava/lang/String;

.field private template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->clearIconUrl()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->clearJumpRoomID()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->clearLiveID()V

    return-void
.end method

.method private clearIconUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getIconUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearJumpRoomID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getJumpRoomID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLiveID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getLiveID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTemplate()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->clearTemplate()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->mergeTemplate(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->setIconUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->setIconUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->setJumpRoomID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->setJumpRoomIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->setLiveID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->setLiveIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->setTemplate(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->setTemplate(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V

    return-void
.end method

.method private mergeTemplate(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

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

.method private setIconUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIconUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setJumpRoomID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setJumpRoomIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLiveID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 8
    .line 9
    return-void
.end method

.method private setTemplate(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_9

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
    if-eq v2, v3, :cond_8

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_7

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_6

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_4

    .line 76
    .line 77
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_2

    .line 82
    .line 83
    :cond_3
    move p1, v1

    .line 84
    goto :goto_3

    .line 85
    :catch_0
    move-exception p1

    .line 86
    goto :goto_5

    .line 87
    :catch_1
    move-exception p1

    .line 88
    goto :goto_6

    .line 89
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 90
    .line 91
    if-eqz v2, :cond_5

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData$Builder;

    .line 98
    .line 99
    goto :goto_4

    .line 100
    :cond_5
    move-object v2, v0

    .line 101
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->parser()Ll/ng60;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 110
    .line 111
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 112
    .line 113
    if-eqz v2, :cond_2

    .line 114
    .line 115
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 123
    .line 124
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :catchall_1
    move-exception p0

    .line 149
    throw p0

    .line 150
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 151
    .line 152
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 164
    .line 165
    .line 166
    return-object v0

    .line 167
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 172
    .line 173
    .line 174
    return-object v0

    .line 175
    :cond_9
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 176
    .line 177
    return-object p0

    .line 178
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 179
    .line 180
    check-cast p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 181
    .line 182
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    xor-int/2addr p1, v1

    .line 189
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    xor-int/2addr v2, v1

    .line 198
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 199
    .line 200
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 205
    .line 206
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    xor-int/2addr p1, v1

    .line 213
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 214
    .line 215
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 216
    .line 217
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    xor-int/2addr v2, v1

    .line 222
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 223
    .line 224
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 229
    .line 230
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    xor-int/2addr p1, v1

    .line 237
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 238
    .line 239
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 242
    .line 243
    .line 244
    move-result v2

    .line 245
    xor-int/2addr v1, v2

    .line 246
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 247
    .line 248
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 253
    .line 254
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 255
    .line 256
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 257
    .line 258
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 263
    .line 264
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 265
    .line 266
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 267
    .line 268
    return-object p0

    .line 269
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;

    .line 270
    .line 271
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg$Builder;-><init>(Ll/o2w;)V

    .line 272
    .line 273
    .line 274
    return-object p0

    .line 275
    :pswitch_5
    return-object v0

    .line 276
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 277
    .line 278
    return-object p0

    .line 279
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;

    .line 280
    .line 281
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;-><init>()V

    .line 282
    .line 283
    .line 284
    return-object p0

    .line 285
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

.method public getIconUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

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

.method public getJumpRoomID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJumpRoomIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

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

.method public getLiveID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getJumpRoomID()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getLiveID()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getIconUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x4

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getTemplate()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 77
    .line 78
    return v0
.end method

.method public getTemplate()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasTemplate()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->jumpRoomID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getJumpRoomID()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->liveID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getLiveID()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->iconUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getIconUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->template_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    const/4 v0, 0x4

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LuckyPrizeMsg;->getTemplate()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    return-void
.end method

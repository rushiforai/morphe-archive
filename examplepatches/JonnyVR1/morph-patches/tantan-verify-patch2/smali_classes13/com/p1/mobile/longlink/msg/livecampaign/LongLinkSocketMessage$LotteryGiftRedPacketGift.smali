.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGiftOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LotteryGiftRedPacketGift"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGiftOrBuilder;"
    }
.end annotation


# static fields
.field public static final AMOUNT_FIELD_NUMBER:I = 0x5

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final NAME_FIELD_NUMBER:I = 0x2

.field public static final NUM_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;",
            ">;"
        }
    .end annotation
.end field

.field public static final URL_FIELD_NUMBER:I = 0x3


# instance fields
.field private amount_:J

.field private id_:Ljava/lang/String;

.field private name_:Ljava/lang/String;

.field private num_:J

.field private url_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->clearAmount()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->clearId()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->clearName()V

    return-void
.end method

.method private clearAmount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearNum()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->clearNum()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->clearUrl()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->setAmount(J)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->setNum(J)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->setUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->setUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

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
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

    .line 2
    .line 3
    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setNum(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->PARSER:Ll/ng60;

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
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

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
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

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
    check-cast p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 166
    .line 167
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    xor-int/2addr p1, v2

    .line 174
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

    .line 175
    .line 176
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    xor-int/2addr v1, v2

    .line 183
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

    .line 184
    .line 185
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    xor-int/2addr p1, v2

    .line 198
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 199
    .line 200
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    xor-int/2addr v1, v2

    .line 207
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 208
    .line 209
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 214
    .line 215
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 216
    .line 217
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 218
    .line 219
    .line 220
    move-result p1

    .line 221
    xor-int/2addr p1, v2

    .line 222
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 223
    .line 224
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 225
    .line 226
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    xor-int/2addr v1, v2

    .line 231
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 232
    .line 233
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 238
    .line 239
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

    .line 240
    .line 241
    const-wide/16 p1, 0x0

    .line 242
    .line 243
    cmp-long v1, v5, p1

    .line 244
    .line 245
    if-eqz v1, :cond_a

    .line 246
    .line 247
    move v4, v2

    .line 248
    goto :goto_6

    .line 249
    :cond_a
    move v4, v0

    .line 250
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

    .line 251
    .line 252
    cmp-long v1, v8, p1

    .line 253
    .line 254
    if-eqz v1, :cond_b

    .line 255
    .line 256
    move v7, v2

    .line 257
    goto :goto_7

    .line 258
    :cond_b
    move v7, v0

    .line 259
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 260
    .line 261
    .line 262
    move-result-wide v4

    .line 263
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

    .line 264
    .line 265
    move v1, v0

    .line 266
    move v4, v2

    .line 267
    move-object v0, v3

    .line 268
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

    .line 269
    .line 270
    cmp-long v5, v2, p1

    .line 271
    .line 272
    if-eqz v5, :cond_c

    .line 273
    .line 274
    move v5, v1

    .line 275
    move v1, v4

    .line 276
    goto :goto_8

    .line 277
    :cond_c
    move v5, v1

    .line 278
    :goto_8
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

    .line 279
    .line 280
    cmp-long p1, v6, p1

    .line 281
    .line 282
    if-eqz p1, :cond_d

    .line 283
    .line 284
    :goto_9
    move-wide v5, v6

    .line 285
    goto :goto_a

    .line 286
    :cond_d
    move v4, v5

    .line 287
    goto :goto_9

    .line 288
    :goto_a
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 289
    .line 290
    .line 291
    move-result-wide p1

    .line 292
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

    .line 293
    .line 294
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 295
    .line 296
    return-object p0

    .line 297
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;

    .line 298
    .line 299
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift$Builder;-><init>(Ll/v3w;)V

    .line 300
    .line 301
    .line 302
    return-object p0

    .line 303
    :pswitch_5
    return-object v1

    .line 304
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 305
    .line 306
    return-object p0

    .line 307
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;

    .line 308
    .line 309
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;-><init>()V

    .line 310
    .line 311
    .line 312
    return-object p0

    .line 313
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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

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

.method public getNum()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSerializedSize()I
    .locals 6

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getUrl()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

    .line 63
    .line 64
    const-wide/16 v3, 0x0

    .line 65
    .line 66
    cmp-long v5, v1, v3

    .line 67
    .line 68
    if-eqz v5, :cond_4

    .line 69
    .line 70
    const/4 v5, 0x4

    .line 71
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

    .line 77
    .line 78
    cmp-long v3, v1, v3

    .line 79
    .line 80
    if-eqz v3, :cond_5

    .line 81
    .line 82
    const/4 v3, 0x5

    .line 83
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    add-int/2addr v0, v1

    .line 88
    :cond_5
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 89
    .line 90
    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->getUrl()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->num_:J

    .line 50
    .line 51
    const-wide/16 v2, 0x0

    .line 52
    .line 53
    cmp-long v4, v0, v2

    .line 54
    .line 55
    if-eqz v4, :cond_3

    .line 56
    .line 57
    const/4 v4, 0x4

    .line 58
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LotteryGiftRedPacketGift;->amount_:J

    .line 62
    .line 63
    cmp-long p0, v0, v2

    .line 64
    .line 65
    if-eqz p0, :cond_4

    .line 66
    .line 67
    const/4 p0, 0x5

    .line 68
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 69
    .line 70
    .line 71
    :cond_4
    return-void
.end method

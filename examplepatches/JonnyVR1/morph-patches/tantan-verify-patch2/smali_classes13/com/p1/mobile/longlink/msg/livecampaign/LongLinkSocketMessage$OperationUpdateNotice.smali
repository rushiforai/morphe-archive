.class public final Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNoticeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "OperationUpdateNotice"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;,
        Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNoticeOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANIMATION_FIELD_NUMBER:I = 0x7

.field public static final DATA_FIELD_NUMBER:I = 0x6

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

.field public static final OPERATIONTYPE_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;",
            ">;"
        }
    .end annotation
.end field

.field public static final POSITION_FIELD_NUMBER:I = 0x1

.field public static final RANDOMDELAYSECONDS_FIELD_NUMBER:I = 0x4

.field public static final SUBSCRIPTION_FIELD_NUMBER:I = 0x2

.field public static final TIMESTAMP_FIELD_NUMBER:I = 0x5


# instance fields
.field private animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

.field private data_:Ljava/lang/String;

.field private operationType_:Ljava/lang/String;

.field private position_:I

.field private randomDelaySeconds_:J

.field private subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

.field private timestamp_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->clearAnimation()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->clearData()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->clearOperationType()V

    return-void
.end method

.method private clearAnimation()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 3
    .line 4
    return-void
.end method

.method private clearData()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getData()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOperationType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getOperationType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPosition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearRandomDelaySeconds()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearSubscription()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 3
    .line 4
    return-void
.end method

.method private clearTimestamp()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->clearPosition()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->clearRandomDelaySeconds()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->clearSubscription()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->clearTimestamp()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->mergeAnimation(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->mergeSubscription(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setAnimation(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation$Builder;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setAnimation(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setData(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setDataBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private mergeAnimation(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;->newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 33
    .line 34
    return-void
.end method

.method private mergeSubscription(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setOperationType(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setOperationTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setPosition(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setPositionValue(I)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setRandomDelaySeconds(J)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setSubscription(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;)V

    return-void
.end method

.method private setAnimation(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 8
    .line 9
    return-void
.end method

.method private setAnimation(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    return-void
.end method

.method private setData(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setDataBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOperationType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOperationTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPosition(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 9
    .line 10
    return-void
.end method

.method private setPositionValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 2
    .line 3
    return-void
.end method

.method private setRandomDelaySeconds(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

    .line 2
    .line 3
    return-void
.end method

.method private setSubscription(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 8
    .line 9
    return-void
.end method

.method private setSubscription(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    return-void
.end method

.method private setTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setSubscription(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->setTimestamp(J)V

    return-void
.end method

.method public static bridge synthetic v()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    return-object v0
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_d

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
    const/16 v3, 0x8

    .line 63
    .line 64
    if-eq p1, v3, :cond_c

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_a

    .line 69
    .line 70
    const/16 v3, 0x1a

    .line 71
    .line 72
    if-eq p1, v3, :cond_9

    .line 73
    .line 74
    const/16 v3, 0x20

    .line 75
    .line 76
    if-eq p1, v3, :cond_8

    .line 77
    .line 78
    const/16 v3, 0x28

    .line 79
    .line 80
    if-eq p1, v3, :cond_7

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_6

    .line 85
    .line 86
    const/16 v3, 0x3a

    .line 87
    .line 88
    if-eq p1, v3, :cond_4

    .line 89
    .line 90
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_2

    .line 95
    .line 96
    :cond_3
    move v0, v2

    .line 97
    goto :goto_3

    .line 98
    :catch_0
    move-exception v0

    .line 99
    move-object p1, v0

    .line 100
    goto/16 :goto_6

    .line 101
    .line 102
    :catch_1
    move-exception v0

    .line 103
    move-object p1, v0

    .line 104
    goto/16 :goto_7

    .line 105
    .line 106
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 107
    .line 108
    if-eqz p1, :cond_5

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation$Builder;

    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_5
    move-object p1, v1

    .line 118
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;->parser()Ll/ng60;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 127
    .line 128
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 129
    .line 130
    if-eqz p1, :cond_2

    .line 131
    .line 132
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 140
    .line 141
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 142
    .line 143
    goto :goto_3

    .line 144
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 152
    .line 153
    .line 154
    move-result-wide v3

    .line 155
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 159
    .line 160
    .line 161
    move-result-wide v3

    .line 162
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 173
    .line 174
    if-eqz p1, :cond_b

    .line 175
    .line 176
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription$Builder;

    .line 181
    .line 182
    goto :goto_5

    .line 183
    :cond_b
    move-object p1, v1

    .line 184
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->parser()Ll/ng60;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    check-cast v3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 193
    .line 194
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 195
    .line 196
    if-eqz p1, :cond_2

    .line 197
    .line 198
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 199
    .line 200
    .line 201
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 206
    .line 207
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 208
    .line 209
    goto/16 :goto_3

    .line 210
    .line 211
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 216
    .line 217
    goto/16 :goto_3

    .line 218
    .line 219
    :catchall_1
    move-exception v0

    .line 220
    move-object p0, v0

    .line 221
    throw p0

    .line 222
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 223
    .line 224
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 236
    .line 237
    .line 238
    return-object v1

    .line 239
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

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
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 248
    .line 249
    return-object p0

    .line 250
    :pswitch_3
    move-object v3, p2

    .line 251
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 252
    .line 253
    check-cast p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 254
    .line 255
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 256
    .line 257
    if-eqz p1, :cond_e

    .line 258
    .line 259
    move p2, v2

    .line 260
    goto :goto_8

    .line 261
    :cond_e
    move p2, v0

    .line 262
    :goto_8
    iget v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 263
    .line 264
    if-eqz v1, :cond_f

    .line 265
    .line 266
    move v4, v2

    .line 267
    goto :goto_9

    .line 268
    :cond_f
    move v4, v0

    .line 269
    :goto_9
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 270
    .line 271
    .line 272
    move-result p1

    .line 273
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 274
    .line 275
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 276
    .line 277
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 278
    .line 279
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 284
    .line 285
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 286
    .line 287
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 290
    .line 291
    .line 292
    move-result p1

    .line 293
    xor-int/2addr p1, v2

    .line 294
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 295
    .line 296
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    xor-int/2addr v1, v2

    .line 303
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 304
    .line 305
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 310
    .line 311
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

    .line 312
    .line 313
    const-wide/16 p1, 0x0

    .line 314
    .line 315
    cmp-long v1, v5, p1

    .line 316
    .line 317
    if-eqz v1, :cond_10

    .line 318
    .line 319
    move v4, v2

    .line 320
    goto :goto_a

    .line 321
    :cond_10
    move v4, v0

    .line 322
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

    .line 323
    .line 324
    cmp-long v1, v8, p1

    .line 325
    .line 326
    if-eqz v1, :cond_11

    .line 327
    .line 328
    move v7, v2

    .line 329
    goto :goto_b

    .line 330
    :cond_11
    move v7, v0

    .line 331
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 332
    .line 333
    .line 334
    move-result-wide v4

    .line 335
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

    .line 336
    .line 337
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 338
    .line 339
    cmp-long v1, v5, p1

    .line 340
    .line 341
    if-eqz v1, :cond_12

    .line 342
    .line 343
    move v4, v2

    .line 344
    goto :goto_c

    .line 345
    :cond_12
    move v4, v0

    .line 346
    :goto_c
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 347
    .line 348
    cmp-long p1, v8, p1

    .line 349
    .line 350
    if-eqz p1, :cond_13

    .line 351
    .line 352
    move v7, v2

    .line 353
    goto :goto_d

    .line 354
    :cond_13
    move v7, v0

    .line 355
    :goto_d
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 356
    .line 357
    .line 358
    move-result-wide p1

    .line 359
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 360
    .line 361
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 364
    .line 365
    .line 366
    move-result p1

    .line 367
    xor-int/2addr p1, v2

    .line 368
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 369
    .line 370
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 371
    .line 372
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    xor-int/2addr v0, v2

    .line 377
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 378
    .line 379
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 384
    .line 385
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 386
    .line 387
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 388
    .line 389
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 394
    .line 395
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 396
    .line 397
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 398
    .line 399
    return-object p0

    .line 400
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;

    .line 401
    .line 402
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$Builder;-><init>(Ll/v3w;)V

    .line 403
    .line 404
    .line 405
    return-object p0

    .line 406
    :pswitch_5
    return-object v1

    .line 407
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 408
    .line 409
    return-object p0

    .line 410
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;

    .line 411
    .line 412
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;-><init>()V

    .line 413
    .line 414
    .line 415
    return-object p0

    .line 416
    nop

    .line 417
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

.method public getAnimation()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

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

.method public getOperationType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOperationTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

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

.method public getPosition()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->forNumber(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getPositionValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 2
    .line 3
    return p0
.end method

.method public getRandomDelaySeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->Unknown:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getSubscription()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getOperationType()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

    .line 59
    .line 60
    const-wide/16 v3, 0x0

    .line 61
    .line 62
    cmp-long v5, v1, v3

    .line 63
    .line 64
    if-eqz v5, :cond_4

    .line 65
    .line 66
    const/4 v5, 0x4

    .line 67
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 73
    .line 74
    cmp-long v3, v1, v3

    .line 75
    .line 76
    if-eqz v3, :cond_5

    .line 77
    .line 78
    const/4 v3, 0x5

    .line 79
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    add-int/2addr v0, v1

    .line 84
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_6

    .line 91
    .line 92
    const/4 v1, 0x6

    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getData()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    add-int/2addr v0, v1

    .line 102
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 103
    .line 104
    if-eqz v1, :cond_7

    .line 105
    .line 106
    const/4 v1, 0x7

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getAnimation()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_7
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 117
    .line 118
    return v0
.end method

.method public getSubscription()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasAnimation()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

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

.method public hasSubscription()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->Unknown:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice$OperationUpdatePosition;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->position_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->subscription_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getSubscription()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationSubscription;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->operationType_:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getOperationType()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->randomDelaySeconds_:J

    .line 46
    .line 47
    const-wide/16 v2, 0x0

    .line 48
    .line 49
    cmp-long v4, v0, v2

    .line 50
    .line 51
    if-eqz v4, :cond_3

    .line 52
    .line 53
    const/4 v4, 0x4

    .line 54
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->timestamp_:J

    .line 58
    .line 59
    cmp-long v2, v0, v2

    .line 60
    .line 61
    if-eqz v2, :cond_4

    .line 62
    .line 63
    const/4 v2, 0x5

    .line 64
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 65
    .line 66
    .line 67
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->data_:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_5

    .line 74
    .line 75
    const/4 v0, 0x6

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getData()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->animation_:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 84
    .line 85
    if-eqz v0, :cond_6

    .line 86
    .line 87
    const/4 v0, 0x7

    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationUpdateNotice;->getAnimation()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationAnimation;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 93
    .line 94
    .line 95
    :cond_6
    return-void
.end method

.class public final Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$HeadlineOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Headline"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;,
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;,
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;,
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;,
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecordOrBuilder;,
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;,
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$ResourceOrBuilder;,
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatusOrBuilder;,
        Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$UserOrBuilder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$HeadlineOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANCHOR_FIELD_NUMBER:I = 0x1

.field public static final AUDIENCE_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

.field public static final GIFTRECORD_FIELD_NUMBER:I = 0x9

.field public static final GRABGIFTRECORDS_FIELD_NUMBER:I = 0xa

.field public static final LEFTTIME_FIELD_NUMBER:I = 0x5

.field public static final LIVESTATUS_FIELD_NUMBER:I = 0x8

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;",
            ">;"
        }
    .end annotation
.end field

.field public static final PRICE_FIELD_NUMBER:I = 0xb

.field public static final RESOURCE_FIELD_NUMBER:I = 0x3

.field public static final STATUS_FIELD_NUMBER:I = 0x6

.field public static final TEXT_FIELD_NUMBER:I = 0x7

.field public static final VERSION_FIELD_NUMBER:I = 0x4


# instance fields
.field private anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

.field private audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

.field private bitField0_:I

.field private giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

.field private grabGiftRecords_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;",
            ">;"
        }
    .end annotation
.end field

.field private leftTime_:J

.field private liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

.field private price_:J

.field private resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

.field private status_:Z

.field private text_:Ljava/lang/String;

.field private version_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setLeftTime(J)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus$Builder;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setPrice(J)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource$Builder;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setStatus(Z)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setText(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setTextBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setVersion(J)V

    return-void
.end method

.method public static bridge synthetic O()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->addAllGrabGiftRecords(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllGrabGiftRecords(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->ensureGrabGiftRecordsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->ensureGrabGiftRecordsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->ensureGrabGiftRecordsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addGrabGiftRecords(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->ensureGrabGiftRecordsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addGrabGiftRecords(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->ensureGrabGiftRecordsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->addGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->addGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    return-void
.end method

.method private clearAnchor()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 3
    .line 4
    return-void
.end method

.method private clearAudience()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 3
    .line 4
    return-void
.end method

.method private clearGiftRecord()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 3
    .line 4
    return-void
.end method

.method private clearGrabGiftRecords()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearLeftTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearLiveStatus()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 3
    .line 4
    return-void
.end method

.method private clearPrice()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearResource()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 3
    .line 4
    return-void
.end method

.method private clearStatus()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearText()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearVersion()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->addGrabGiftRecords(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->addGrabGiftRecords(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    return-void
.end method

.method private ensureGrabGiftRecordsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearAnchor()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearAudience()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearGiftRecord()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearGrabGiftRecords()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearLeftTime()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearLiveStatus()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearPrice()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearResource()V

    return-void
.end method

.method private mergeAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 33
    .line 34
    return-void
.end method

.method private mergeAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 33
    .line 34
    return-void
.end method

.method private mergeGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 33
    .line 34
    return-void
.end method

.method private mergeLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 33
    .line 34
    return-void
.end method

.method private mergeResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;->newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearStatus()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearText()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->clearVersion()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->mergeAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->mergeAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V

    return-void
.end method

.method private removeGrabGiftRecords(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->ensureGrabGiftRecordsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->mergeGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V

    return-void
.end method

.method private setAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 8
    .line 9
    return-void
.end method

.method private setAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    return-void
.end method

.method private setAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 8
    .line 9
    return-void
.end method

.method private setAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    return-void
.end method

.method private setGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 8
    .line 9
    return-void
.end method

.method private setGiftRecord(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    return-void
.end method

.method private setGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->ensureGrabGiftRecordsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setGrabGiftRecords(ILcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->ensureGrabGiftRecordsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setLeftTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 8
    .line 9
    return-void
.end method

.method private setLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    return-void
.end method

.method private setPrice(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 2
    .line 3
    return-void
.end method

.method private setResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 8
    .line 9
    return-void
.end method

.method private setResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    return-void
.end method

.method private setStatus(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTextBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setVersion(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->mergeLiveStatus(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->mergeResource(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->removeGrabGiftRecords(I)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setAnchor(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->setAudience(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->PARSER:Ll/ng60;

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
    sparse-switch p1, :sswitch_data_0

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    :sswitch_0
    move v0, v2

    .line 70
    goto :goto_3

    .line 71
    :catch_0
    move-exception v0

    .line 72
    move-object p1, v0

    .line 73
    goto/16 :goto_9

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_a

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 80
    .line 81
    .line 82
    move-result-wide v3

    .line 83
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :sswitch_2
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 87
    .line 88
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_3

    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 95
    .line 96
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 101
    .line 102
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;->parser()Ll/ng60;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 113
    .line 114
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_3

    .line 118
    :sswitch_3
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 119
    .line 120
    if-eqz p1, :cond_4

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord$Builder;

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_4
    move-object p1, v1

    .line 130
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;->parser()Ll/ng60;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 139
    .line 140
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 141
    .line 142
    if-eqz p1, :cond_2

    .line 143
    .line 144
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 152
    .line 153
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :sswitch_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 157
    .line 158
    if-eqz p1, :cond_5

    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus$Builder;

    .line 165
    .line 166
    goto :goto_5

    .line 167
    :cond_5
    move-object p1, v1

    .line 168
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;->parser()Ll/ng60;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 177
    .line 178
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 179
    .line 180
    if-eqz p1, :cond_2

    .line 181
    .line 182
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 190
    .line 191
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 192
    .line 193
    goto/16 :goto_3

    .line 194
    .line 195
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 200
    .line 201
    goto/16 :goto_3

    .line 202
    .line 203
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 208
    .line 209
    goto/16 :goto_3

    .line 210
    .line 211
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 212
    .line 213
    .line 214
    move-result-wide v3

    .line 215
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 216
    .line 217
    goto/16 :goto_3

    .line 218
    .line 219
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 220
    .line 221
    .line 222
    move-result-wide v3

    .line 223
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 224
    .line 225
    goto/16 :goto_3

    .line 226
    .line 227
    :sswitch_9
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 228
    .line 229
    if-eqz p1, :cond_6

    .line 230
    .line 231
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource$Builder;

    .line 236
    .line 237
    goto :goto_6

    .line 238
    :cond_6
    move-object p1, v1

    .line 239
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;->parser()Ll/ng60;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 248
    .line 249
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 250
    .line 251
    if-eqz p1, :cond_2

    .line 252
    .line 253
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 254
    .line 255
    .line 256
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 261
    .line 262
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 263
    .line 264
    goto/16 :goto_3

    .line 265
    .line 266
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 267
    .line 268
    if-eqz p1, :cond_7

    .line 269
    .line 270
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;

    .line 275
    .line 276
    goto :goto_7

    .line 277
    :cond_7
    move-object p1, v1

    .line 278
    :goto_7
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;->parser()Ll/ng60;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 283
    .line 284
    .line 285
    move-result-object v3

    .line 286
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 287
    .line 288
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 289
    .line 290
    if-eqz p1, :cond_2

    .line 291
    .line 292
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 293
    .line 294
    .line 295
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 300
    .line 301
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 302
    .line 303
    goto/16 :goto_3

    .line 304
    .line 305
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 306
    .line 307
    if-eqz p1, :cond_8

    .line 308
    .line 309
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User$Builder;

    .line 314
    .line 315
    goto :goto_8

    .line 316
    :cond_8
    move-object p1, v1

    .line 317
    :goto_8
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;->parser()Ll/ng60;

    .line 318
    .line 319
    .line 320
    move-result-object v3

    .line 321
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 322
    .line 323
    .line 324
    move-result-object v3

    .line 325
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 326
    .line 327
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 328
    .line 329
    if-eqz p1, :cond_2

    .line 330
    .line 331
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 332
    .line 333
    .line 334
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 339
    .line 340
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 341
    .line 342
    goto/16 :goto_3

    .line 343
    .line 344
    :catchall_1
    move-exception v0

    .line 345
    move-object p0, v0

    .line 346
    throw p0

    .line 347
    :goto_9
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 348
    .line 349
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 357
    .line 358
    .line 359
    move-result-object p0

    .line 360
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 361
    .line 362
    .line 363
    return-object v1

    .line 364
    :goto_a
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 369
    .line 370
    .line 371
    return-object v1

    .line 372
    :cond_9
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 373
    .line 374
    return-object p0

    .line 375
    :pswitch_3
    move-object v3, p2

    .line 376
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 377
    .line 378
    check-cast p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 379
    .line 380
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 381
    .line 382
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 383
    .line 384
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 389
    .line 390
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 391
    .line 392
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 393
    .line 394
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 395
    .line 396
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 401
    .line 402
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 403
    .line 404
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 405
    .line 406
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 407
    .line 408
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 409
    .line 410
    .line 411
    move-result-object p1

    .line 412
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 413
    .line 414
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 415
    .line 416
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 417
    .line 418
    const-wide/16 p1, 0x0

    .line 419
    .line 420
    cmp-long v1, v5, p1

    .line 421
    .line 422
    if-eqz v1, :cond_a

    .line 423
    .line 424
    move v4, v2

    .line 425
    goto :goto_b

    .line 426
    :cond_a
    move v4, v0

    .line 427
    :goto_b
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 428
    .line 429
    cmp-long v1, v8, p1

    .line 430
    .line 431
    if-eqz v1, :cond_b

    .line 432
    .line 433
    move v7, v2

    .line 434
    goto :goto_c

    .line 435
    :cond_b
    move v7, v0

    .line 436
    :goto_c
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 437
    .line 438
    .line 439
    move-result-wide v4

    .line 440
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 441
    .line 442
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 443
    .line 444
    cmp-long v1, v5, p1

    .line 445
    .line 446
    if-eqz v1, :cond_c

    .line 447
    .line 448
    move v4, v2

    .line 449
    goto :goto_d

    .line 450
    :cond_c
    move v4, v0

    .line 451
    :goto_d
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 452
    .line 453
    cmp-long v1, v8, p1

    .line 454
    .line 455
    if-eqz v1, :cond_d

    .line 456
    .line 457
    move v7, v2

    .line 458
    goto :goto_e

    .line 459
    :cond_d
    move v7, v0

    .line 460
    :goto_e
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 461
    .line 462
    .line 463
    move-result-wide v4

    .line 464
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 465
    .line 466
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 467
    .line 468
    iget-boolean v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 469
    .line 470
    invoke-interface {v3, v1, v1, v4, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 471
    .line 472
    .line 473
    move-result v1

    .line 474
    iput-boolean v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 475
    .line 476
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 477
    .line 478
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 479
    .line 480
    .line 481
    move-result v1

    .line 482
    xor-int/2addr v1, v2

    .line 483
    iget-object v4, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 484
    .line 485
    iget-object v5, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 486
    .line 487
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 488
    .line 489
    .line 490
    move-result v5

    .line 491
    xor-int/2addr v5, v2

    .line 492
    iget-object v6, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 493
    .line 494
    invoke-interface {v3, v1, v4, v5, v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v1

    .line 498
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 499
    .line 500
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 501
    .line 502
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 503
    .line 504
    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 505
    .line 506
    .line 507
    move-result-object v1

    .line 508
    check-cast v1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 509
    .line 510
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 511
    .line 512
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 513
    .line 514
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 515
    .line 516
    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 517
    .line 518
    .line 519
    move-result-object v1

    .line 520
    check-cast v1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 521
    .line 522
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 523
    .line 524
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 525
    .line 526
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 527
    .line 528
    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 533
    .line 534
    move v1, v0

    .line 535
    move v4, v2

    .line 536
    move-object v0, v3

    .line 537
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 538
    .line 539
    cmp-long v5, v2, p1

    .line 540
    .line 541
    if-eqz v5, :cond_e

    .line 542
    .line 543
    move v5, v1

    .line 544
    move v1, v4

    .line 545
    goto :goto_f

    .line 546
    :cond_e
    move v5, v1

    .line 547
    :goto_f
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 548
    .line 549
    cmp-long p1, v6, p1

    .line 550
    .line 551
    if-eqz p1, :cond_f

    .line 552
    .line 553
    :goto_10
    move-wide v5, v6

    .line 554
    goto :goto_11

    .line 555
    :cond_f
    move v4, v5

    .line 556
    goto :goto_10

    .line 557
    :goto_11
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 558
    .line 559
    .line 560
    move-result-wide p1

    .line 561
    move-object v3, v0

    .line 562
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 563
    .line 564
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 565
    .line 566
    if-ne v3, p1, :cond_10

    .line 567
    .line 568
    iget p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->bitField0_:I

    .line 569
    .line 570
    iget p2, p3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->bitField0_:I

    .line 571
    .line 572
    or-int/2addr p1, p2

    .line 573
    iput p1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->bitField0_:I

    .line 574
    .line 575
    :cond_10
    return-object p0

    .line 576
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;

    .line 577
    .line 578
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Builder;-><init>(Ll/o2w;)V

    .line 579
    .line 580
    .line 581
    return-object p0

    .line 582
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 583
    .line 584
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 585
    .line 586
    .line 587
    return-object v1

    .line 588
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 589
    .line 590
    return-object p0

    .line 591
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;

    .line 592
    .line 593
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;-><init>()V

    .line 594
    .line 595
    .line 596
    return-object p0

    .line 597
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

    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x20 -> :sswitch_8
        0x28 -> :sswitch_7
        0x30 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x52 -> :sswitch_2
        0x58 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAnchor()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getAudience()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getGiftRecord()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getGrabGiftRecords(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 8
    .line 9
    return-object p0
.end method

.method public getGrabGiftRecordsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getGrabGiftRecordsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGrabGiftRecordsOrBuilder(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecordOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecordOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getGrabGiftRecordsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecordOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeftTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLiveStatus()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getPrice()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getResource()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 7

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getAnchor()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v0, v1

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 24
    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getAudience()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    add-int/2addr v0, v2

    .line 37
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 38
    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    const/4 v2, 0x3

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getResource()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    add-int/2addr v0, v2

    .line 51
    :cond_3
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 52
    .line 53
    const-wide/16 v4, 0x0

    .line 54
    .line 55
    cmp-long v6, v2, v4

    .line 56
    .line 57
    if-eqz v6, :cond_4

    .line 58
    .line 59
    const/4 v6, 0x4

    .line 60
    invoke-static {v6, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    add-int/2addr v0, v2

    .line 65
    :cond_4
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 66
    .line 67
    cmp-long v6, v2, v4

    .line 68
    .line 69
    if-eqz v6, :cond_5

    .line 70
    .line 71
    const/4 v6, 0x5

    .line 72
    invoke-static {v6, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    add-int/2addr v0, v2

    .line 77
    :cond_5
    iget-boolean v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 78
    .line 79
    if-eqz v2, :cond_6

    .line 80
    .line 81
    const/4 v3, 0x6

    .line 82
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    add-int/2addr v0, v2

    .line 87
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_7

    .line 94
    .line 95
    const/4 v2, 0x7

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getText()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    add-int/2addr v0, v2

    .line 105
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 106
    .line 107
    if-eqz v2, :cond_8

    .line 108
    .line 109
    const/16 v2, 0x8

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getLiveStatus()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    add-int/2addr v0, v2

    .line 120
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 121
    .line 122
    if-eqz v2, :cond_9

    .line 123
    .line 124
    const/16 v2, 0x9

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getGiftRecord()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    add-int/2addr v0, v2

    .line 135
    :cond_9
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 136
    .line 137
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-ge v1, v2, :cond_a

    .line 142
    .line 143
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 144
    .line 145
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Lcom/google/protobuf/q;

    .line 150
    .line 151
    const/16 v3, 0xa

    .line 152
    .line 153
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    add-int/2addr v0, v2

    .line 158
    add-int/lit8 v1, v1, 0x1

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_a
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 162
    .line 163
    cmp-long v3, v1, v4

    .line 164
    .line 165
    if-eqz v3, :cond_b

    .line 166
    .line 167
    const/16 v3, 0xb

    .line 168
    .line 169
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    add-int/2addr v0, v1

    .line 174
    :cond_b
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 175
    .line 176
    return v0
.end method

.method public getStatus()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

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

.method public getVersion()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasAnchor()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

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

.method public hasAudience()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

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

.method public hasGiftRecord()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

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

.method public hasLiveStatus()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

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

.method public hasResource()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->anchor_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getAnchor()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->audience_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getAudience()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$User;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->resource_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getResource()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$Resource;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->version_:J

    .line 38
    .line 39
    const-wide/16 v2, 0x0

    .line 40
    .line 41
    cmp-long v4, v0, v2

    .line 42
    .line 43
    if-eqz v4, :cond_3

    .line 44
    .line 45
    const/4 v4, 0x4

    .line 46
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->leftTime_:J

    .line 50
    .line 51
    cmp-long v4, v0, v2

    .line 52
    .line 53
    if-eqz v4, :cond_4

    .line 54
    .line 55
    const/4 v4, 0x5

    .line 56
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 57
    .line 58
    .line 59
    :cond_4
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->status_:Z

    .line 60
    .line 61
    if-eqz v0, :cond_5

    .line 62
    .line 63
    const/4 v1, 0x6

    .line 64
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 65
    .line 66
    .line 67
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->text_:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_6

    .line 74
    .line 75
    const/4 v0, 0x7

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getText()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->liveStatus_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 84
    .line 85
    if-eqz v0, :cond_7

    .line 86
    .line 87
    const/16 v0, 0x8

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getLiveStatus()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$LiveStatus;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 94
    .line 95
    .line 96
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->giftRecord_:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 97
    .line 98
    if-eqz v0, :cond_8

    .line 99
    .line 100
    const/16 v0, 0x9

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->getGiftRecord()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline$GiftRecord;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 107
    .line 108
    .line 109
    :cond_8
    const/4 v0, 0x0

    .line 110
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 111
    .line 112
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-ge v0, v1, :cond_9

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->grabGiftRecords_:Lcom/google/protobuf/l$h;

    .line 119
    .line 120
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Lcom/google/protobuf/q;

    .line 125
    .line 126
    const/16 v4, 0xa

    .line 127
    .line 128
    invoke-virtual {p1, v4, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 129
    .line 130
    .line 131
    add-int/lit8 v0, v0, 0x1

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_9
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Headline;->price_:J

    .line 135
    .line 136
    cmp-long p0, v0, v2

    .line 137
    .line 138
    if-eqz p0, :cond_a

    .line 139
    .line 140
    const/16 p0, 0xb

    .line 141
    .line 142
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 143
    .line 144
    .line 145
    :cond_a
    return-void
.end method

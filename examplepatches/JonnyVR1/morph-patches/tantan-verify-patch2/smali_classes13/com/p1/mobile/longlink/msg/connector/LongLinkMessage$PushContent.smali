.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContentOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PushContent"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;,
        Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$MessageCustomDefaultEntryHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContentOrBuilder;"
    }
.end annotation


# static fields
.field public static final CONTENT_FIELD_NUMBER:I = 0x1

.field public static final COUNTER_FIELD_NUMBER:I = 0x10

.field public static final CREATETIME_FIELD_NUMBER:I = 0xc

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

.field public static final IMAGEURLWITHOUTFORMAT_FIELD_NUMBER:I = 0xd

.field public static final INTENT_FIELD_NUMBER:I = 0xb

.field public static final LINK_FIELD_NUMBER:I = 0xf

.field public static final MESSAGECUSTOM_FIELD_NUMBER:I = 0x11

.field public static final MESSAGE_FIELD_NUMBER:I = 0xa

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;",
            ">;"
        }
    .end annotation
.end field

.field public static final PRIMARYPICTURE_FIELD_NUMBER:I = 0x5

.field public static final PRIORITY_FIELD_NUMBER:I = 0x6

.field public static final REQID_FIELD_NUMBER:I = 0xe

.field public static final SILENTAGGREGATION_FIELD_NUMBER:I = 0x8

.field public static final SILENT_FIELD_NUMBER:I = 0x9

.field public static final STACKID_FIELD_NUMBER:I = 0x7

.field public static final TICKER_FIELD_NUMBER:I = 0x4

.field public static final TITLE_FIELD_NUMBER:I = 0x2

.field public static final VALUE_FIELD_NUMBER:I = 0x3


# instance fields
.field private bitField0_:I

.field private content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

.field private counter_:I

.field private createTime_:J

.field private imageURLWithoutFormat_:Ljava/lang/String;

.field private intent_:Ljava/lang/String;

.field private link_:Ljava/lang/String;

.field private messageCustom_:Lcom/google/protobuf/MapFieldLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private message_:Ljava/lang/String;

.field private primaryPicture_:Ljava/lang/String;

.field private priority_:I

.field private reqId_:Ljava/lang/String;

.field private silentAggregation_:Z

.field private silent_:Z

.field private stackId_:I

.field private ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

.field private title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

.field private value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

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
    invoke-static {}, Lcom/google/protobuf/MapFieldLite;->emptyMapField()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic access$3700()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$3800(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setContent(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$3900(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setContent(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4000(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->mergeContent(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4100(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearContent()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4200(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setTitle(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4300(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setTitle(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4400(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->mergeTitle(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4500(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearTitle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4600(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setValue(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4700(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setValue(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4800(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->mergeValue(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$4900(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearValue()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5000(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setTicker(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5100(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setTicker(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5200(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->mergeTicker(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5300(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearTicker()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5400(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setPrimaryPicture(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5500(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearPrimaryPicture()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5600(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setPrimaryPictureBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5700(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setPriority(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5800(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearPriority()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$5900(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setStackId(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6000(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearStackId()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6100(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setSilentAggregation(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6200(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearSilentAggregation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6300(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setSilent(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6400(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearSilent()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6500(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setMessage(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6600(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearMessage()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6700(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setMessageBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6800(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setIntent(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$6900(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearIntent()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7000(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setIntentBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7100(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setCreateTime(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7200(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearCreateTime()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7300(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setImageURLWithoutFormat(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7400(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearImageURLWithoutFormat()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7500(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setImageURLWithoutFormatBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7600(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setReqId(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7700(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearReqId()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7800(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setReqIdBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$7900(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setLink(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8000(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearLink()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8100(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setLinkBytes(Lcom/google/protobuf/ByteString;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8200(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->setCounter(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8300(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->clearCounter()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$8400(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)Ljava/util/Map;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getMutableMessageCustomMap()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private clearContent()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 3
    .line 4
    return-void
.end method

.method private clearCounter()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearCreateTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearImageURLWithoutFormat()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getImageURLWithoutFormat()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIntent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getIntent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLink()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getLink()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMessage()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getMessage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPrimaryPicture()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getPrimaryPicture()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPriority()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearReqId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getReqId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSilent()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearSilentAggregation()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearStackId()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearTicker()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 3
    .line 4
    return-void
.end method

.method private clearTitle()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 3
    .line 4
    return-void
.end method

.method private clearValue()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 3
    .line 4
    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    return-object v0
.end method

.method private getMutableMessageCustomMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMutableMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    return-object p0
.end method

.method private internalGetMutableMessageCustom()Lcom/google/protobuf/MapFieldLite;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/MapFieldLite<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/protobuf/MapFieldLite;->mutableCopy()Lcom/google/protobuf/MapFieldLite;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 18
    .line 19
    return-object p0
.end method

.method private mergeContent(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 33
    .line 34
    return-void
.end method

.method private mergeTicker(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 33
    .line 34
    return-void
.end method

.method private mergeTitle(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 33
    .line 34
    return-void
.end method

.method private mergeValue(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

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

.method private setContent(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 8
    .line 9
    return-void
.end method

.method private setContent(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    return-void
.end method

.method private setCounter(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 2
    .line 3
    return-void
.end method

.method private setCreateTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setImageURLWithoutFormat(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setImageURLWithoutFormatBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIntent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIntentBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLink(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLinkBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setMessageBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPrimaryPicture(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setPrimaryPictureBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPriority(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 2
    .line 3
    return-void
.end method

.method private setReqId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setReqIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSilent(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setSilentAggregation(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setStackId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 2
    .line 3
    return-void
.end method

.method private setTicker(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 8
    .line 9
    return-void
.end method

.method private setTicker(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    return-void
.end method

.method private setTitle(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 8
    .line 9
    return-void
.end method

.method private setTitle(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    return-void
.end method

.method private setValue(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 8
    .line 9
    return-void
.end method

.method private setValue(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    return-void
.end method


# virtual methods
.method public containsMessageCustom(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_8

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
    goto/16 :goto_8

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_9

    .line 78
    .line 79
    :sswitch_1
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->isMutable()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_3

    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/google/protobuf/MapFieldLite;->mutableCopy()Lcom/google/protobuf/MapFieldLite;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 94
    .line 95
    :cond_3
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$MessageCustomDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/p;

    .line 96
    .line 97
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 98
    .line 99
    invoke-virtual {p1, v3, p2, p3}, Lcom/google/protobuf/p;->e(Lcom/google/protobuf/MapFieldLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)V

    .line 100
    .line 101
    .line 102
    goto :goto_3

    .line 103
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_3

    .line 124
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 132
    .line 133
    .line 134
    move-result-wide v3

    .line 135
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 136
    .line 137
    goto :goto_3

    .line 138
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :sswitch_e
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 189
    .line 190
    if-eqz p1, :cond_4

    .line 191
    .line 192
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_4
    move-object p1, v1

    .line 200
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->parser()Ll/ng60;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 209
    .line 210
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 211
    .line 212
    if-eqz p1, :cond_2

    .line 213
    .line 214
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 215
    .line 216
    .line 217
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 222
    .line 223
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 224
    .line 225
    goto/16 :goto_3

    .line 226
    .line 227
    :sswitch_f
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 228
    .line 229
    if-eqz p1, :cond_5

    .line 230
    .line 231
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

    .line 236
    .line 237
    goto :goto_5

    .line 238
    :cond_5
    move-object p1, v1

    .line 239
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->parser()Ll/ng60;

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
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 248
    .line 249
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 261
    .line 262
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 263
    .line 264
    goto/16 :goto_3

    .line 265
    .line 266
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 267
    .line 268
    if-eqz p1, :cond_6

    .line 269
    .line 270
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n$Builder;

    .line 275
    .line 276
    goto :goto_6

    .line 277
    :cond_6
    move-object p1, v1

    .line 278
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->parser()Ll/ng60;

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
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 287
    .line 288
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 300
    .line 301
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 302
    .line 303
    goto/16 :goto_3

    .line 304
    .line 305
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 306
    .line 307
    if-eqz p1, :cond_7

    .line 308
    .line 309
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType$Builder;

    .line 314
    .line 315
    goto :goto_7

    .line 316
    :cond_7
    move-object p1, v1

    .line 317
    :goto_7
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->parser()Ll/ng60;

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
    check-cast v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 326
    .line 327
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 339
    .line 340
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;
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
    :goto_8
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
    :goto_9
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
    :cond_8
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

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
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 379
    .line 380
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 381
    .line 382
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 383
    .line 384
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 389
    .line 390
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 391
    .line 392
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 393
    .line 394
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 395
    .line 396
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 397
    .line 398
    .line 399
    move-result-object p1

    .line 400
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 401
    .line 402
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 403
    .line 404
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 405
    .line 406
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 407
    .line 408
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 409
    .line 410
    .line 411
    move-result-object p1

    .line 412
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 413
    .line 414
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 415
    .line 416
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 417
    .line 418
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 419
    .line 420
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    check-cast p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 425
    .line 426
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 427
    .line 428
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 429
    .line 430
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 431
    .line 432
    .line 433
    move-result p1

    .line 434
    xor-int/2addr p1, v2

    .line 435
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 436
    .line 437
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 438
    .line 439
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    xor-int/2addr v1, v2

    .line 444
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 445
    .line 446
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object p1

    .line 450
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 451
    .line 452
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 453
    .line 454
    if-eqz p1, :cond_9

    .line 455
    .line 456
    move p2, v2

    .line 457
    goto :goto_a

    .line 458
    :cond_9
    move p2, v0

    .line 459
    :goto_a
    iget v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 460
    .line 461
    if-eqz v1, :cond_a

    .line 462
    .line 463
    move v4, v2

    .line 464
    goto :goto_b

    .line 465
    :cond_a
    move v4, v0

    .line 466
    :goto_b
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 467
    .line 468
    .line 469
    move-result p1

    .line 470
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 471
    .line 472
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 473
    .line 474
    if-eqz p1, :cond_b

    .line 475
    .line 476
    move p2, v2

    .line 477
    goto :goto_c

    .line 478
    :cond_b
    move p2, v0

    .line 479
    :goto_c
    iget v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 480
    .line 481
    if-eqz v1, :cond_c

    .line 482
    .line 483
    move v4, v2

    .line 484
    goto :goto_d

    .line 485
    :cond_c
    move v4, v0

    .line 486
    :goto_d
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 487
    .line 488
    .line 489
    move-result p1

    .line 490
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 491
    .line 492
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 493
    .line 494
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 495
    .line 496
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 497
    .line 498
    .line 499
    move-result p1

    .line 500
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 501
    .line 502
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 503
    .line 504
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 505
    .line 506
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 507
    .line 508
    .line 509
    move-result p1

    .line 510
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 511
    .line 512
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 513
    .line 514
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 515
    .line 516
    .line 517
    move-result p1

    .line 518
    xor-int/2addr p1, v2

    .line 519
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 520
    .line 521
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 522
    .line 523
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 524
    .line 525
    .line 526
    move-result v1

    .line 527
    xor-int/2addr v1, v2

    .line 528
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 529
    .line 530
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object p1

    .line 534
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 535
    .line 536
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 537
    .line 538
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 539
    .line 540
    .line 541
    move-result p1

    .line 542
    xor-int/2addr p1, v2

    .line 543
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 544
    .line 545
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 546
    .line 547
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 548
    .line 549
    .line 550
    move-result v1

    .line 551
    xor-int/2addr v1, v2

    .line 552
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 553
    .line 554
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 555
    .line 556
    .line 557
    move-result-object p1

    .line 558
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 559
    .line 560
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 561
    .line 562
    const-wide/16 p1, 0x0

    .line 563
    .line 564
    cmp-long v1, v5, p1

    .line 565
    .line 566
    if-eqz v1, :cond_d

    .line 567
    .line 568
    move v4, v2

    .line 569
    goto :goto_e

    .line 570
    :cond_d
    move v4, v0

    .line 571
    :goto_e
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 572
    .line 573
    cmp-long p1, v8, p1

    .line 574
    .line 575
    if-eqz p1, :cond_e

    .line 576
    .line 577
    move v7, v2

    .line 578
    goto :goto_f

    .line 579
    :cond_e
    move v7, v0

    .line 580
    :goto_f
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 581
    .line 582
    .line 583
    move-result-wide p1

    .line 584
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 585
    .line 586
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 587
    .line 588
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 589
    .line 590
    .line 591
    move-result p1

    .line 592
    xor-int/2addr p1, v2

    .line 593
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 594
    .line 595
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 596
    .line 597
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 598
    .line 599
    .line 600
    move-result v1

    .line 601
    xor-int/2addr v1, v2

    .line 602
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 603
    .line 604
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object p1

    .line 608
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 609
    .line 610
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 611
    .line 612
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 613
    .line 614
    .line 615
    move-result p1

    .line 616
    xor-int/2addr p1, v2

    .line 617
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 618
    .line 619
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 620
    .line 621
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 622
    .line 623
    .line 624
    move-result v1

    .line 625
    xor-int/2addr v1, v2

    .line 626
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 627
    .line 628
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 629
    .line 630
    .line 631
    move-result-object p1

    .line 632
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 633
    .line 634
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 635
    .line 636
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 637
    .line 638
    .line 639
    move-result p1

    .line 640
    xor-int/2addr p1, v2

    .line 641
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 642
    .line 643
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 644
    .line 645
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 646
    .line 647
    .line 648
    move-result v1

    .line 649
    xor-int/2addr v1, v2

    .line 650
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 651
    .line 652
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 653
    .line 654
    .line 655
    move-result-object p1

    .line 656
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 657
    .line 658
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 659
    .line 660
    if-eqz p1, :cond_f

    .line 661
    .line 662
    move p2, v2

    .line 663
    goto :goto_10

    .line 664
    :cond_f
    move p2, v0

    .line 665
    :goto_10
    iget v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 666
    .line 667
    if-eqz v1, :cond_10

    .line 668
    .line 669
    move v0, v2

    .line 670
    :cond_10
    invoke-interface {v3, p2, p1, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 671
    .line 672
    .line 673
    move-result p1

    .line 674
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 675
    .line 676
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 677
    .line 678
    invoke-direct {p3}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 679
    .line 680
    .line 681
    move-result-object p2

    .line 682
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->l(Lcom/google/protobuf/MapFieldLite;Lcom/google/protobuf/MapFieldLite;)Lcom/google/protobuf/MapFieldLite;

    .line 683
    .line 684
    .line 685
    move-result-object p1

    .line 686
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 687
    .line 688
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 689
    .line 690
    if-ne v3, p1, :cond_11

    .line 691
    .line 692
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->bitField0_:I

    .line 693
    .line 694
    iget p2, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->bitField0_:I

    .line 695
    .line 696
    or-int/2addr p1, p2

    .line 697
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->bitField0_:I

    .line 698
    .line 699
    :cond_11
    return-object p0

    .line 700
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;

    .line 701
    .line 702
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$Builder;-><init>(Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$1;)V

    .line 703
    .line 704
    .line 705
    return-object p0

    .line 706
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->messageCustom_:Lcom/google/protobuf/MapFieldLite;

    .line 707
    .line 708
    invoke-virtual {p0}, Lcom/google/protobuf/MapFieldLite;->makeImmutable()V

    .line 709
    .line 710
    .line 711
    return-object v1

    .line 712
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 713
    .line 714
    return-object p0

    .line 715
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;

    .line 716
    .line 717
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;-><init>()V

    .line 718
    .line 719
    .line 720
    return-object p0

    .line 721
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

    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_11
        0x12 -> :sswitch_10
        0x1a -> :sswitch_f
        0x22 -> :sswitch_e
        0x2a -> :sswitch_d
        0x30 -> :sswitch_c
        0x38 -> :sswitch_b
        0x40 -> :sswitch_a
        0x48 -> :sswitch_9
        0x52 -> :sswitch_8
        0x5a -> :sswitch_7
        0x60 -> :sswitch_6
        0x6a -> :sswitch_5
        0x72 -> :sswitch_4
        0x7a -> :sswitch_3
        0x80 -> :sswitch_2
        0x8a -> :sswitch_1
    .end sparse-switch
.end method

.method public getContent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getCounter()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 2
    .line 3
    return p0
.end method

.method public getCreateTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getImageURLWithoutFormat()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImageURLWithoutFormatBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

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

.method public getIntent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIntentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

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

.method public getLink()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLinkBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

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

.method public getMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMessageBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

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

.method public getMessageCustom()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getMessageCustomMap()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getMessageCustomCount()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getMessageCustomMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMessageCustomOrDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    return-object p2
.end method

.method public getMessageCustomOrThrow(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public getPrimaryPicture()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrimaryPictureBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

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

.method public getPriority()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 2
    .line 3
    return p0
.end method

.method public getReqId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReqIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getContent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getTitle()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v0, v1

    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x3

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getValue()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    add-int/2addr v0, v1

    .line 50
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 51
    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x4

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getTicker()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    add-int/2addr v0, v1

    .line 64
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_5

    .line 71
    .line 72
    const/4 v1, 0x5

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getPrimaryPicture()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    add-int/2addr v0, v1

    .line 82
    :cond_5
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 83
    .line 84
    if-eqz v1, :cond_6

    .line 85
    .line 86
    const/4 v2, 0x6

    .line 87
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    add-int/2addr v0, v1

    .line 92
    :cond_6
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 93
    .line 94
    if-eqz v1, :cond_7

    .line 95
    .line 96
    const/4 v2, 0x7

    .line 97
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    add-int/2addr v0, v1

    .line 102
    :cond_7
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 103
    .line 104
    if-eqz v1, :cond_8

    .line 105
    .line 106
    const/16 v2, 0x8

    .line 107
    .line 108
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    add-int/2addr v0, v1

    .line 113
    :cond_8
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 114
    .line 115
    if-eqz v1, :cond_9

    .line 116
    .line 117
    const/16 v2, 0x9

    .line 118
    .line 119
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    add-int/2addr v0, v1

    .line 124
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_a

    .line 131
    .line 132
    const/16 v1, 0xa

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getMessage()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    add-int/2addr v0, v1

    .line 143
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-nez v1, :cond_b

    .line 150
    .line 151
    const/16 v1, 0xb

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getIntent()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    add-int/2addr v0, v1

    .line 162
    :cond_b
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 163
    .line 164
    const-wide/16 v3, 0x0

    .line 165
    .line 166
    cmp-long v3, v1, v3

    .line 167
    .line 168
    if-eqz v3, :cond_c

    .line 169
    .line 170
    const/16 v3, 0xc

    .line 171
    .line 172
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    add-int/2addr v0, v1

    .line 177
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-nez v1, :cond_d

    .line 184
    .line 185
    const/16 v1, 0xd

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getImageURLWithoutFormat()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    add-int/2addr v0, v1

    .line 196
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    if-nez v1, :cond_e

    .line 203
    .line 204
    const/16 v1, 0xe

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getReqId()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    add-int/2addr v0, v1

    .line 215
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 216
    .line 217
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-nez v1, :cond_f

    .line 222
    .line 223
    const/16 v1, 0xf

    .line 224
    .line 225
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getLink()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    add-int/2addr v0, v1

    .line 234
    :cond_f
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 235
    .line 236
    if-eqz v1, :cond_10

    .line 237
    .line 238
    const/16 v2, 0x10

    .line 239
    .line 240
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    add-int/2addr v0, v1

    .line 245
    :cond_10
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    invoke-virtual {v1}, Lcom/google/protobuf/MapFieldLite;->entrySet()Ljava/util/Set;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    if-eqz v2, :cond_11

    .line 262
    .line 263
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    check-cast v2, Ljava/util/Map$Entry;

    .line 268
    .line 269
    sget-object v3, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$MessageCustomDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/p;

    .line 270
    .line 271
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v4

    .line 275
    check-cast v4, Ljava/lang/String;

    .line 276
    .line 277
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    check-cast v2, Ljava/lang/String;

    .line 282
    .line 283
    const/16 v5, 0x11

    .line 284
    .line 285
    invoke-virtual {v3, v5, v4, v2}, Lcom/google/protobuf/p;->a(ILjava/lang/Object;Ljava/lang/Object;)I

    .line 286
    .line 287
    .line 288
    move-result v2

    .line 289
    add-int/2addr v0, v2

    .line 290
    goto :goto_1

    .line 291
    :cond_11
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 292
    .line 293
    return v0
.end method

.method public getSilent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSilentAggregation()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getStackId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 2
    .line 3
    return p0
.end method

.method public getTicker()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getTitle()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getValue()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasContent()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

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

.method public hasTicker()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

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

.method public hasTitle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

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

.method public hasValue()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->content_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getContent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->title_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getTitle()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->value_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getValue()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->ticker_:Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getTicker()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->primaryPicture_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_4

    .line 56
    .line 57
    const/4 v0, 0x5

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getPrimaryPicture()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_4
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->priority_:I

    .line 66
    .line 67
    if-eqz v0, :cond_5

    .line 68
    .line 69
    const/4 v1, 0x6

    .line 70
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 71
    .line 72
    .line 73
    :cond_5
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->stackId_:I

    .line 74
    .line 75
    if-eqz v0, :cond_6

    .line 76
    .line 77
    const/4 v1, 0x7

    .line 78
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 79
    .line 80
    .line 81
    :cond_6
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silentAggregation_:Z

    .line 82
    .line 83
    if-eqz v0, :cond_7

    .line 84
    .line 85
    const/16 v1, 0x8

    .line 86
    .line 87
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 88
    .line 89
    .line 90
    :cond_7
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->silent_:Z

    .line 91
    .line 92
    if-eqz v0, :cond_8

    .line 93
    .line 94
    const/16 v1, 0x9

    .line 95
    .line 96
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 97
    .line 98
    .line 99
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->message_:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_9

    .line 106
    .line 107
    const/16 v0, 0xa

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getMessage()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->intent_:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_a

    .line 123
    .line 124
    const/16 v0, 0xb

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getIntent()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_a
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->createTime_:J

    .line 134
    .line 135
    const-wide/16 v2, 0x0

    .line 136
    .line 137
    cmp-long v2, v0, v2

    .line 138
    .line 139
    if-eqz v2, :cond_b

    .line 140
    .line 141
    const/16 v2, 0xc

    .line 142
    .line 143
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 144
    .line 145
    .line 146
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->imageURLWithoutFormat_:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-nez v0, :cond_c

    .line 153
    .line 154
    const/16 v0, 0xd

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getImageURLWithoutFormat()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->reqId_:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_d

    .line 170
    .line 171
    const/16 v0, 0xe

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getReqId()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 178
    .line 179
    .line 180
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->link_:Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_e

    .line 187
    .line 188
    const/16 v0, 0xf

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->getLink()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :cond_e
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->counter_:I

    .line 198
    .line 199
    if-eqz v0, :cond_f

    .line 200
    .line 201
    const/16 v1, 0x10

    .line 202
    .line 203
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 204
    .line 205
    .line 206
    :cond_f
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;->internalGetMessageCustom()Lcom/google/protobuf/MapFieldLite;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-virtual {p0}, Lcom/google/protobuf/MapFieldLite;->entrySet()Ljava/util/Set;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-eqz v0, :cond_10

    .line 223
    .line 224
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Ljava/util/Map$Entry;

    .line 229
    .line 230
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent$MessageCustomDefaultEntryHolder;->defaultEntry:Lcom/google/protobuf/p;

    .line 231
    .line 232
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    check-cast v2, Ljava/lang/String;

    .line 237
    .line 238
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    check-cast v0, Ljava/lang/String;

    .line 243
    .line 244
    const/16 v3, 0x11

    .line 245
    .line 246
    invoke-virtual {v1, p1, v3, v2, v0}, Lcom/google/protobuf/p;->f(Lcom/google/protobuf/CodedOutputStream;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 247
    .line 248
    .line 249
    goto :goto_0

    .line 250
    :cond_10
    return-void
.end method

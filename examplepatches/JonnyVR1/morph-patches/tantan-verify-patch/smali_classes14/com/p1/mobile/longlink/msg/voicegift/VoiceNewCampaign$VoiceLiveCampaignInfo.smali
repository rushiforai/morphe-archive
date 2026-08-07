.class public final Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceLiveCampaignInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;",
        "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfoOrBuilder;"
    }
.end annotation


# static fields
.field public static final DATA_FIELD_NUMBER:I = 0x6

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

.field public static final ID_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final POSITION_FIELD_NUMBER:I = 0x3

.field public static final SUBSCRIBETYPE_FIELD_NUMBER:I = 0x4

.field public static final TYPE_FIELD_NUMBER:I = 0x1

.field public static final UPDATETYPE_FIELD_NUMBER:I = 0x5


# instance fields
.field private data_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private position_:J

.field private subscribeType_:Ljava/lang/String;

.field private type_:I

.field private updateType_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->clearData()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->clearId()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->clearPosition()V

    return-void
.end method

.method private clearData()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getData()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPosition()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearSubscribeType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getSubscribeType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearUpdateType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getUpdateType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->clearSubscribeType()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->clearType()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->clearUpdateType()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setData(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setDataBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setPosition(J)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setSubscribeType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setSubscribeTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setType(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setUpdateType(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->setUpdateTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    return-object v0
.end method

.method private setData(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPosition(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 2
    .line 3
    return-void
.end method

.method private setSubscribeType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSubscribeTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 2
    .line 3
    return-void
.end method

.method private setUpdateType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUpdateTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_a

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
    const/16 p3, 0x8

    .line 63
    .line 64
    if-eq p1, p3, :cond_9

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_8

    .line 69
    .line 70
    const/16 p3, 0x18

    .line 71
    .line 72
    if-eq p1, p3, :cond_7

    .line 73
    .line 74
    const/16 p3, 0x22

    .line 75
    .line 76
    if-eq p1, p3, :cond_6

    .line 77
    .line 78
    const/16 p3, 0x2a

    .line 79
    .line 80
    if-eq p1, p3, :cond_5

    .line 81
    .line 82
    const/16 p3, 0x32

    .line 83
    .line 84
    if-eq p1, p3, :cond_4

    .line 85
    .line 86
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    :cond_3
    move v0, v2

    .line 93
    goto :goto_3

    .line 94
    :catch_0
    move-exception v0

    .line 95
    move-object p1, v0

    .line 96
    goto :goto_4

    .line 97
    :catch_1
    move-exception v0

    .line 98
    move-object p1, v0

    .line 99
    goto :goto_5

    .line 100
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 122
    .line 123
    .line 124
    move-result-wide v3

    .line 125
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :catchall_1
    move-exception v0

    .line 143
    move-object p0, v0

    .line 144
    throw p0

    .line 145
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 146
    .line 147
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    return-object v1

    .line 162
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    return-object v1

    .line 170
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 171
    .line 172
    return-object p0

    .line 173
    :pswitch_3
    move-object v3, p2

    .line 174
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 175
    .line 176
    check-cast p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 177
    .line 178
    iget p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 179
    .line 180
    if-eqz p1, :cond_b

    .line 181
    .line 182
    move p2, v2

    .line 183
    goto :goto_6

    .line 184
    :cond_b
    move p2, v0

    .line 185
    :goto_6
    iget v1, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 186
    .line 187
    if-eqz v1, :cond_c

    .line 188
    .line 189
    move v4, v2

    .line 190
    goto :goto_7

    .line 191
    :cond_c
    move v4, v0

    .line 192
    :goto_7
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    iput p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 197
    .line 198
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    xor-int/2addr p1, v2

    .line 205
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 206
    .line 207
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    xor-int/2addr v1, v2

    .line 214
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 215
    .line 216
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 221
    .line 222
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 223
    .line 224
    const-wide/16 p1, 0x0

    .line 225
    .line 226
    cmp-long v1, v5, p1

    .line 227
    .line 228
    if-eqz v1, :cond_d

    .line 229
    .line 230
    move v4, v2

    .line 231
    goto :goto_8

    .line 232
    :cond_d
    move v4, v0

    .line 233
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 234
    .line 235
    cmp-long p1, v8, p1

    .line 236
    .line 237
    if-eqz p1, :cond_e

    .line 238
    .line 239
    move v7, v2

    .line 240
    goto :goto_9

    .line 241
    :cond_e
    move v7, v0

    .line 242
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 243
    .line 244
    .line 245
    move-result-wide p1

    .line 246
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 247
    .line 248
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    xor-int/2addr p1, v2

    .line 255
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 256
    .line 257
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    xor-int/2addr v0, v2

    .line 264
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 265
    .line 266
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 271
    .line 272
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 273
    .line 274
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    xor-int/2addr p1, v2

    .line 279
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 280
    .line 281
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 282
    .line 283
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    xor-int/2addr v0, v2

    .line 288
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 289
    .line 290
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 295
    .line 296
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 299
    .line 300
    .line 301
    move-result p1

    .line 302
    xor-int/2addr p1, v2

    .line 303
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 304
    .line 305
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    xor-int/2addr v0, v2

    .line 312
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 313
    .line 314
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 319
    .line 320
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 321
    .line 322
    return-object p0

    .line 323
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;

    .line 324
    .line 325
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo$Builder;-><init>(Ll/cbo0;)V

    .line 326
    .line 327
    .line 328
    return-object p0

    .line 329
    :pswitch_5
    return-object v1

    .line 330
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 331
    .line 332
    return-object p0

    .line 333
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;

    .line 334
    .line 335
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;-><init>()V

    .line 336
    .line 337
    .line 338
    return-object p0

    .line 339
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

.method public getData()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDataBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

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

.method public getPosition()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 2
    .line 3
    return-wide v0
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;->List:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getId()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 45
    .line 46
    const-wide/16 v3, 0x0

    .line 47
    .line 48
    cmp-long v3, v1, v3

    .line 49
    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    const/4 v3, 0x3

    .line 53
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x4

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getSubscribeType()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-nez v1, :cond_5

    .line 83
    .line 84
    const/4 v1, 0x5

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getUpdateType()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_6

    .line 101
    .line 102
    const/4 v1, 0x6

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getData()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 113
    .line 114
    return v0
.end method

.method public getSubscribeType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubscribeTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

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

.method public getType()Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;->forNumber(I)Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public getUpdateType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUpdateTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;->List:Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignType;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->type_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getId()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->position_:J

    .line 34
    .line 35
    const-wide/16 v2, 0x0

    .line 36
    .line 37
    cmp-long v2, v0, v2

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    const/4 v2, 0x3

    .line 42
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->subscribeType_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    const/4 v0, 0x4

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getSubscribeType()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->updateType_:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    const/4 v0, 0x5

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getUpdateType()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->data_:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    const/4 v0, 0x6

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicegift/VoiceNewCampaign$VoiceLiveCampaignInfo;->getData()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    return-void
.end method

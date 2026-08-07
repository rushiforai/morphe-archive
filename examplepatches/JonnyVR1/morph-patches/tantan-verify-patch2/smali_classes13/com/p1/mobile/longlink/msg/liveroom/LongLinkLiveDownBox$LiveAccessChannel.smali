.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannelOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveAccessChannel"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannelOrBuilder;"
    }
.end annotation


# static fields
.field public static final BOTTOMREMAINDURATION_FIELD_NUMBER:I = 0x8

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

.field public static final DYNAMICTYPE_FIELD_NUMBER:I = 0x3

.field public static final INNERICON_FIELD_NUMBER:I = 0x2

.field public static final JUMPSCHEMA_FIELD_NUMBER:I = 0x5

.field public static final JUMPTYPE_FIELD_NUMBER:I = 0x4

.field public static final OUTERICON_FIELD_NUMBER:I = 0x1

.field public static final OUTERVANISHDYNAMIC_FIELD_NUMBER:I = 0x6

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCE_FIELD_NUMBER:I = 0x7


# instance fields
.field private bottomRemainDuration_:J

.field private dynamicType_:I

.field private innerIcon_:Ljava/lang/String;

.field private jumpSchema_:Ljava/lang/String;

.field private jumpType_:I

.field private outerIcon_:Ljava/lang/String;

.field private outerVanishDynamic_:Ljava/lang/String;

.field private source_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->clearBottomRemainDuration()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->clearDynamicType()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->clearInnerIcon()V

    return-void
.end method

.method private clearBottomRemainDuration()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearDynamicType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearInnerIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getInnerIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearJumpSchema()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getJumpSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearJumpType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearOuterIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOuterVanishDynamic()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterVanishDynamic()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSource()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getSource()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->clearJumpSchema()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->clearJumpType()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->clearOuterIcon()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->clearOuterVanishDynamic()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->clearSource()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setBottomRemainDuration(J)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setDynamicType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setDynamicTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setInnerIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setInnerIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setJumpSchema(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setJumpSchemaBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setJumpType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setJumpTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setOuterIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setOuterIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setBottomRemainDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 2
    .line 3
    return-void
.end method

.method private setDynamicType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setDynamicTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setInnerIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setInnerIconBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setJumpSchema(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setJumpSchemaBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setJumpType(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setJumpTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setOuterIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOuterIconBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOuterVanishDynamic(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOuterVanishDynamicBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSourceBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setOuterVanishDynamic(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setOuterVanishDynamicBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setSource(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->setSourceBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_c

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
    if-eq p1, p3, :cond_b

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_a

    .line 69
    .line 70
    const/16 p3, 0x18

    .line 71
    .line 72
    if-eq p1, p3, :cond_9

    .line 73
    .line 74
    const/16 p3, 0x20

    .line 75
    .line 76
    if-eq p1, p3, :cond_8

    .line 77
    .line 78
    const/16 p3, 0x2a

    .line 79
    .line 80
    if-eq p1, p3, :cond_7

    .line 81
    .line 82
    const/16 p3, 0x32

    .line 83
    .line 84
    if-eq p1, p3, :cond_6

    .line 85
    .line 86
    const/16 p3, 0x3a

    .line 87
    .line 88
    if-eq p1, p3, :cond_5

    .line 89
    .line 90
    const/16 p3, 0x40

    .line 91
    .line 92
    if-eq p1, p3, :cond_4

    .line 93
    .line 94
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_2

    .line 99
    .line 100
    :cond_3
    move v0, v2

    .line 101
    goto :goto_3

    .line 102
    :catch_0
    move-exception v0

    .line 103
    move-object p1, v0

    .line 104
    goto :goto_4

    .line 105
    :catch_1
    move-exception v0

    .line 106
    move-object p1, v0

    .line 107
    goto :goto_5

    .line 108
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 109
    .line 110
    .line 111
    move-result-wide v3

    .line 112
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 162
    .line 163
    goto :goto_3

    .line 164
    :catchall_1
    move-exception v0

    .line 165
    move-object p0, v0

    .line 166
    throw p0

    .line 167
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 168
    .line 169
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 181
    .line 182
    .line 183
    return-object v1

    .line 184
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 189
    .line 190
    .line 191
    return-object v1

    .line 192
    :cond_c
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 193
    .line 194
    return-object p0

    .line 195
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 196
    .line 197
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 198
    .line 199
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 200
    .line 201
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    xor-int/2addr p1, v2

    .line 206
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 207
    .line 208
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    xor-int/2addr v3, v2

    .line 215
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 216
    .line 217
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 222
    .line 223
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    xor-int/2addr p1, v2

    .line 230
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 231
    .line 232
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    xor-int/2addr v3, v2

    .line 239
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 240
    .line 241
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 246
    .line 247
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 248
    .line 249
    if-eqz p1, :cond_d

    .line 250
    .line 251
    move v1, v2

    .line 252
    goto :goto_6

    .line 253
    :cond_d
    move v1, v0

    .line 254
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 255
    .line 256
    if-eqz v3, :cond_e

    .line 257
    .line 258
    move v4, v2

    .line 259
    goto :goto_7

    .line 260
    :cond_e
    move v4, v0

    .line 261
    :goto_7
    invoke-interface {p2, v1, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 266
    .line 267
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 268
    .line 269
    if-eqz p1, :cond_f

    .line 270
    .line 271
    move v1, v2

    .line 272
    goto :goto_8

    .line 273
    :cond_f
    move v1, v0

    .line 274
    :goto_8
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 275
    .line 276
    if-eqz v3, :cond_10

    .line 277
    .line 278
    move v4, v2

    .line 279
    goto :goto_9

    .line 280
    :cond_10
    move v4, v0

    .line 281
    :goto_9
    invoke-interface {p2, v1, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 286
    .line 287
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 295
    .line 296
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    xor-int/2addr v3, v2

    .line 303
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 304
    .line 305
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 310
    .line 311
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    xor-int/2addr p1, v2

    .line 318
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 319
    .line 320
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 321
    .line 322
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 323
    .line 324
    .line 325
    move-result v3

    .line 326
    xor-int/2addr v3, v2

    .line 327
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 328
    .line 329
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 334
    .line 335
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 338
    .line 339
    .line 340
    move-result p1

    .line 341
    xor-int/2addr p1, v2

    .line 342
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 343
    .line 344
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 345
    .line 346
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 347
    .line 348
    .line 349
    move-result v3

    .line 350
    xor-int/2addr v3, v2

    .line 351
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 352
    .line 353
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 358
    .line 359
    move p1, v2

    .line 360
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 361
    .line 362
    const-wide/16 v4, 0x0

    .line 363
    .line 364
    cmp-long v1, v2, v4

    .line 365
    .line 366
    if-eqz v1, :cond_11

    .line 367
    .line 368
    move v1, p1

    .line 369
    goto :goto_a

    .line 370
    :cond_11
    move v1, v0

    .line 371
    :goto_a
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 372
    .line 373
    cmp-long p3, v6, v4

    .line 374
    .line 375
    if-eqz p3, :cond_12

    .line 376
    .line 377
    move v4, p1

    .line 378
    move-object v0, p2

    .line 379
    move-wide v5, v6

    .line 380
    goto :goto_b

    .line 381
    :cond_12
    move v4, v0

    .line 382
    move-wide v5, v6

    .line 383
    move-object v0, p2

    .line 384
    :goto_b
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 385
    .line 386
    .line 387
    move-result-wide p1

    .line 388
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 389
    .line 390
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 391
    .line 392
    return-object p0

    .line 393
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;

    .line 394
    .line 395
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel$Builder;-><init>(Ll/y2w;)V

    .line 396
    .line 397
    .line 398
    return-object p0

    .line 399
    :pswitch_5
    return-object v1

    .line 400
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 401
    .line 402
    return-object p0

    .line 403
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 404
    .line 405
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;-><init>()V

    .line 406
    .line 407
    .line 408
    return-object p0

    .line 409
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

.method public getBottomRemainDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getDynamicType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getDynamicTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInnerIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

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

.method public getJumpSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJumpSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

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

.method public getJumpType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getJumpTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getOuterIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOuterIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

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

.method public getOuterVanishDynamic()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOuterVanishDynamicBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterIcon()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getInnerIcon()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;->fall:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;->getNumber()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eq v1, v2, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x3

    .line 55
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 56
    .line 57
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/2addr v0, v1

    .line 62
    :cond_3
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 63
    .line 64
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;->url:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;->getNumber()I

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
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_5

    .line 87
    .line 88
    const/4 v1, 0x5

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getJumpSchema()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    add-int/2addr v0, v1

    .line 98
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_6

    .line 105
    .line 106
    const/4 v1, 0x6

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterVanishDynamic()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_7

    .line 123
    .line 124
    const/4 v1, 0x7

    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getSource()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    add-int/2addr v0, v1

    .line 134
    :cond_7
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 135
    .line 136
    const-wide/16 v3, 0x0

    .line 137
    .line 138
    cmp-long v3, v1, v3

    .line 139
    .line 140
    if-eqz v3, :cond_8

    .line 141
    .line 142
    const/16 v3, 0x8

    .line 143
    .line 144
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v0, v1

    .line 149
    :cond_8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 150
    .line 151
    return v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerIcon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterIcon()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->innerIcon_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getInnerIcon()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;->fall:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$DynamicType;->getNumber()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eq v0, v1, :cond_2

    .line 42
    .line 43
    const/4 v0, 0x3

    .line 44
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->dynamicType_:I

    .line 45
    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;->url:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$AccessChannelJumpType;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpType_:I

    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->jumpSchema_:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    const/4 v0, 0x5

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getJumpSchema()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->outerVanishDynamic_:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_5

    .line 88
    .line 89
    const/4 v0, 0x6

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterVanishDynamic()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->source_:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_6

    .line 104
    .line 105
    const/4 v0, 0x7

    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getSource()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->bottomRemainDuration_:J

    .line 114
    .line 115
    const-wide/16 v2, 0x0

    .line 116
    .line 117
    cmp-long p0, v0, v2

    .line 118
    .line 119
    if-eqz p0, :cond_7

    .line 120
    .line 121
    const/16 p0, 0x8

    .line 122
    .line 123
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 124
    .line 125
    .line 126
    :cond_7
    return-void
.end method

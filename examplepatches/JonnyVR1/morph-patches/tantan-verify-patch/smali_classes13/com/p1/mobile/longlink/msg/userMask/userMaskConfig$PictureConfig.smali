.class public final Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PictureConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfigOrBuilder;"
    }
.end annotation


# static fields
.field public static final CHANGEVOICENO_FIELD_NUMBER:I = 0x7

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

.field public static final DYNAMICURL_FIELD_NUMBER:I = 0x2

.field public static final ENDMILL_FIELD_NUMBER:I = 0x8

.field public static final FUNNYURL_FIELD_NUMBER:I = 0x9

.field public static final MEDIUMDYNAMICURL_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMAININGSEC_FIELD_NUMBER:I = 0x6

.field public static final SMALLDYNAMICURL_FIELD_NUMBER:I = 0x3

.field public static final STATICURL_FIELD_NUMBER:I = 0x1

.field public static final TOTALSEC_FIELD_NUMBER:I = 0x5


# instance fields
.field private changeVoiceNo_:J

.field private dynamicUrl_:Ljava/lang/String;

.field private endMill_:J

.field private funnyUrl_:Ljava/lang/String;

.field private mediumDynamicUrl_:Ljava/lang/String;

.field private remainingSec_:J

.field private smallDynamicUrl_:Ljava/lang/String;

.field private staticUrl_:Ljava/lang/String;

.field private totalSec_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearChangeVoiceNo()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearDynamicUrl()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearEndMill()V

    return-void
.end method

.method private clearChangeVoiceNo()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearDynamicUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearEndMill()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearFunnyUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getFunnyUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearMediumDynamicUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getMediumDynamicUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRemainingSec()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearSmallDynamicUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getSmallDynamicUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearStaticUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTotalSec()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearFunnyUrl()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearMediumDynamicUrl()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearRemainingSec()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearSmallDynamicUrl()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearStaticUrl()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->clearTotalSec()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setChangeVoiceNo(J)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setDynamicUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setDynamicUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setEndMill(J)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setFunnyUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setFunnyUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setMediumDynamicUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setMediumDynamicUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setRemainingSec(J)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setSmallDynamicUrl(Ljava/lang/String;)V

    return-void
.end method

.method private setChangeVoiceNo(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 2
    .line 3
    return-void
.end method

.method private setDynamicUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setDynamicUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setEndMill(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 2
    .line 3
    return-void
.end method

.method private setFunnyUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setFunnyUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setMediumDynamicUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setMediumDynamicUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRemainingSec(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

    .line 2
    .line 3
    return-void
.end method

.method private setSmallDynamicUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSmallDynamicUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setStaticUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setStaticUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTotalSec(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setSmallDynamicUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setStaticUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setStaticUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->setTotalSec(J)V

    return-void
.end method

.method public static bridge synthetic x()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->PARSER:Ll/ng60;

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
    const/16 p3, 0xa

    .line 63
    .line 64
    if-eq p1, p3, :cond_c

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_b

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_a

    .line 73
    .line 74
    const/16 p3, 0x22

    .line 75
    .line 76
    if-eq p1, p3, :cond_9

    .line 77
    .line 78
    const/16 p3, 0x28

    .line 79
    .line 80
    if-eq p1, p3, :cond_8

    .line 81
    .line 82
    const/16 p3, 0x30

    .line 83
    .line 84
    if-eq p1, p3, :cond_7

    .line 85
    .line 86
    const/16 p3, 0x38

    .line 87
    .line 88
    if-eq p1, p3, :cond_6

    .line 89
    .line 90
    const/16 p3, 0x40

    .line 91
    .line 92
    if-eq p1, p3, :cond_5

    .line 93
    .line 94
    const/16 p3, 0x4a

    .line 95
    .line 96
    if-eq p1, p3, :cond_4

    .line 97
    .line 98
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_2

    .line 103
    .line 104
    :cond_3
    move v0, v2

    .line 105
    goto :goto_3

    .line 106
    :catch_0
    move-exception v0

    .line 107
    move-object p1, v0

    .line 108
    goto :goto_4

    .line 109
    :catch_1
    move-exception v0

    .line 110
    move-object p1, v0

    .line 111
    goto :goto_5

    .line 112
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 120
    .line 121
    .line 122
    move-result-wide v3

    .line 123
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 127
    .line 128
    .line 129
    move-result-wide v3

    .line 130
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 134
    .line 135
    .line 136
    move-result-wide v3

    .line 137
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 141
    .line 142
    .line 143
    move-result-wide v3

    .line 144
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :catchall_1
    move-exception v0

    .line 176
    move-object p0, v0

    .line 177
    throw p0

    .line 178
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    return-object v1

    .line 195
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 200
    .line 201
    .line 202
    return-object v1

    .line 203
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 204
    .line 205
    return-object p0

    .line 206
    :pswitch_3
    move-object v3, p2

    .line 207
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 208
    .line 209
    check-cast p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 210
    .line 211
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    xor-int/2addr p1, v2

    .line 218
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 219
    .line 220
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    xor-int/2addr v1, v2

    .line 227
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 228
    .line 229
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    xor-int/2addr p1, v2

    .line 242
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 243
    .line 244
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    xor-int/2addr v1, v2

    .line 251
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 252
    .line 253
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 258
    .line 259
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 262
    .line 263
    .line 264
    move-result p1

    .line 265
    xor-int/2addr p1, v2

    .line 266
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 267
    .line 268
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    xor-int/2addr v1, v2

    .line 275
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 276
    .line 277
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 282
    .line 283
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 286
    .line 287
    .line 288
    move-result p1

    .line 289
    xor-int/2addr p1, v2

    .line 290
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 291
    .line 292
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    xor-int/2addr v1, v2

    .line 299
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 300
    .line 301
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 306
    .line 307
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 308
    .line 309
    const-wide/16 p1, 0x0

    .line 310
    .line 311
    cmp-long v1, v5, p1

    .line 312
    .line 313
    if-eqz v1, :cond_e

    .line 314
    .line 315
    move v4, v2

    .line 316
    goto :goto_6

    .line 317
    :cond_e
    move v4, v0

    .line 318
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 319
    .line 320
    cmp-long v1, v8, p1

    .line 321
    .line 322
    if-eqz v1, :cond_f

    .line 323
    .line 324
    move v7, v2

    .line 325
    goto :goto_7

    .line 326
    :cond_f
    move v7, v0

    .line 327
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 328
    .line 329
    .line 330
    move-result-wide v4

    .line 331
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 332
    .line 333
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

    .line 334
    .line 335
    cmp-long v1, v5, p1

    .line 336
    .line 337
    if-eqz v1, :cond_10

    .line 338
    .line 339
    move v4, v2

    .line 340
    goto :goto_8

    .line 341
    :cond_10
    move v4, v0

    .line 342
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

    .line 343
    .line 344
    cmp-long v1, v8, p1

    .line 345
    .line 346
    if-eqz v1, :cond_11

    .line 347
    .line 348
    move v7, v2

    .line 349
    goto :goto_9

    .line 350
    :cond_11
    move v7, v0

    .line 351
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 352
    .line 353
    .line 354
    move-result-wide v4

    .line 355
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

    .line 356
    .line 357
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 358
    .line 359
    cmp-long v1, v5, p1

    .line 360
    .line 361
    if-eqz v1, :cond_12

    .line 362
    .line 363
    move v4, v2

    .line 364
    goto :goto_a

    .line 365
    :cond_12
    move v4, v0

    .line 366
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 367
    .line 368
    cmp-long v1, v8, p1

    .line 369
    .line 370
    if-eqz v1, :cond_13

    .line 371
    .line 372
    move v7, v2

    .line 373
    goto :goto_b

    .line 374
    :cond_13
    move v7, v0

    .line 375
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 376
    .line 377
    .line 378
    move-result-wide v4

    .line 379
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 380
    .line 381
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 382
    .line 383
    cmp-long v1, v5, p1

    .line 384
    .line 385
    if-eqz v1, :cond_14

    .line 386
    .line 387
    move v4, v2

    .line 388
    goto :goto_c

    .line 389
    :cond_14
    move v4, v0

    .line 390
    :goto_c
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 391
    .line 392
    cmp-long p1, v8, p1

    .line 393
    .line 394
    if-eqz p1, :cond_15

    .line 395
    .line 396
    move v7, v2

    .line 397
    goto :goto_d

    .line 398
    :cond_15
    move v7, v0

    .line 399
    :goto_d
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 400
    .line 401
    .line 402
    move-result-wide p1

    .line 403
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 404
    .line 405
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 406
    .line 407
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 408
    .line 409
    .line 410
    move-result p1

    .line 411
    xor-int/2addr p1, v2

    .line 412
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 413
    .line 414
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 415
    .line 416
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 417
    .line 418
    .line 419
    move-result v0

    .line 420
    xor-int/2addr v0, v2

    .line 421
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 422
    .line 423
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 428
    .line 429
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 430
    .line 431
    return-object p0

    .line 432
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 433
    .line 434
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;-><init>(Ll/c6r0;)V

    .line 435
    .line 436
    .line 437
    return-object p0

    .line 438
    :pswitch_5
    return-object v1

    .line 439
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 440
    .line 441
    return-object p0

    .line 442
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 443
    .line 444
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;-><init>()V

    .line 445
    .line 446
    .line 447
    return-object p0

    .line 448
    nop

    .line 449
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

.method public getChangeVoiceNo()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getDynamicUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDynamicUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

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

.method public getEndMill()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFunnyUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFunnyUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

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

.method public getMediumDynamicUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMediumDynamicUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

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

.method public getRemainingSec()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getStaticUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDynamicUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getSmallDynamicUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_4

    .line 69
    .line 70
    const/4 v1, 0x4

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getMediumDynamicUrl()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v0, v1

    .line 80
    :cond_4
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 81
    .line 82
    const-wide/16 v3, 0x0

    .line 83
    .line 84
    cmp-long v5, v1, v3

    .line 85
    .line 86
    if-eqz v5, :cond_5

    .line 87
    .line 88
    const/4 v5, 0x5

    .line 89
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_5
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

    .line 95
    .line 96
    cmp-long v5, v1, v3

    .line 97
    .line 98
    if-eqz v5, :cond_6

    .line 99
    .line 100
    const/4 v5, 0x6

    .line 101
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    add-int/2addr v0, v1

    .line 106
    :cond_6
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 107
    .line 108
    cmp-long v5, v1, v3

    .line 109
    .line 110
    if-eqz v5, :cond_7

    .line 111
    .line 112
    const/4 v5, 0x7

    .line 113
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    add-int/2addr v0, v1

    .line 118
    :cond_7
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 119
    .line 120
    cmp-long v3, v1, v3

    .line 121
    .line 122
    if-eqz v3, :cond_8

    .line 123
    .line 124
    const/16 v3, 0x8

    .line 125
    .line 126
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    add-int/2addr v0, v1

    .line 131
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-nez v1, :cond_9

    .line 138
    .line 139
    const/16 v1, 0x9

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getFunnyUrl()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    add-int/2addr v0, v1

    .line 150
    :cond_9
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 151
    .line 152
    return v0
.end method

.method public getSmallDynamicUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSmallDynamicUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

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

.method public getStaticUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStaticUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

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

.method public getTotalSec()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->staticUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getStaticUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->dynamicUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDynamicUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->smallDynamicUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getSmallDynamicUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->mediumDynamicUrl_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    const/4 v0, 0x4

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getMediumDynamicUrl()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->totalSec_:J

    .line 66
    .line 67
    const-wide/16 v2, 0x0

    .line 68
    .line 69
    cmp-long v4, v0, v2

    .line 70
    .line 71
    if-eqz v4, :cond_4

    .line 72
    .line 73
    const/4 v4, 0x5

    .line 74
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->remainingSec_:J

    .line 78
    .line 79
    cmp-long v4, v0, v2

    .line 80
    .line 81
    if-eqz v4, :cond_5

    .line 82
    .line 83
    const/4 v4, 0x6

    .line 84
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 85
    .line 86
    .line 87
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->changeVoiceNo_:J

    .line 88
    .line 89
    cmp-long v4, v0, v2

    .line 90
    .line 91
    if-eqz v4, :cond_6

    .line 92
    .line 93
    const/4 v4, 0x7

    .line 94
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 95
    .line 96
    .line 97
    :cond_6
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->endMill_:J

    .line 98
    .line 99
    cmp-long v2, v0, v2

    .line 100
    .line 101
    if-eqz v2, :cond_7

    .line 102
    .line 103
    const/16 v2, 0x8

    .line 104
    .line 105
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 106
    .line 107
    .line 108
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->funnyUrl_:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_8

    .line 115
    .line 116
    const/16 v0, 0x9

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getFunnyUrl()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_8
    return-void
.end method

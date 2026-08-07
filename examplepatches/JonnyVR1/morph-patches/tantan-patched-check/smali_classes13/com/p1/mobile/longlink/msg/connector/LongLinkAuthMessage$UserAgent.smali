.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgentOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserAgent"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgentOrBuilder;"
    }
.end annotation


# static fields
.field public static final APPUIVERSION_FIELD_NUMBER:I = 0x6

.field public static final APPVERSION_FIELD_NUMBER:I = 0x2

.field public static final BRAND_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

.field public static final MODEL_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCEVERSION_FIELD_NUMBER:I = 0x3

.field public static final SOURCE_FIELD_NUMBER:I = 0x1


# instance fields
.field private appUIVersion_:Ljava/lang/String;

.field private appVersion_:Ljava/lang/String;

.field private brand_:Ljava/lang/String;

.field private model_:Ljava/lang/String;

.field private sourceVersion_:Ljava/lang/String;

.field private source_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->clearAppUIVersion()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->clearAppVersion()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->clearBrand()V

    return-void
.end method

.method private clearAppUIVersion()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getAppUIVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAppVersion()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getAppVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearBrand()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getBrand()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearModel()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getModel()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSource()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearSourceVersion()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getSourceVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->clearModel()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->clearSource()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->clearSourceVersion()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setAppUIVersion(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setAppUIVersionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setAppVersion(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setAppVersionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setBrand(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setBrandBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setModel(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setModelBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setSource(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setSourceValue(I)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setSourceVersion(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->setSourceVersionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    return-object v0
.end method

.method private setAppUIVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAppUIVersionBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAppVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAppVersionBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setBrand(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBrandBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setModel(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setModelBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSource(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 9
    .line 10
    return-void
.end method

.method private setSourceValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 2
    .line 3
    return-void
.end method

.method private setSourceVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSourceVersionBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    return-object v0

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->PARSER:Ll/ng60;

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
    if-nez v1, :cond_a

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
    const/16 p3, 0x8

    .line 62
    .line 63
    if-eq p1, p3, :cond_9

    .line 64
    .line 65
    const/16 p3, 0x12

    .line 66
    .line 67
    if-eq p1, p3, :cond_8

    .line 68
    .line 69
    const/16 p3, 0x1a

    .line 70
    .line 71
    if-eq p1, p3, :cond_7

    .line 72
    .line 73
    const/16 p3, 0x22

    .line 74
    .line 75
    if-eq p1, p3, :cond_6

    .line 76
    .line 77
    const/16 p3, 0x2a

    .line 78
    .line 79
    if-eq p1, p3, :cond_5

    .line 80
    .line 81
    const/16 p3, 0x32

    .line 82
    .line 83
    if-eq p1, p3, :cond_4

    .line 84
    .line 85
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_2

    .line 90
    .line 91
    :cond_3
    move v1, v2

    .line 92
    goto :goto_3

    .line 93
    :catch_0
    move-exception p1

    .line 94
    goto :goto_4

    .line 95
    :catch_1
    move-exception p1

    .line 96
    goto :goto_5

    .line 97
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :catchall_1
    move-exception p0

    .line 140
    throw p0

    .line 141
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 142
    .line 143
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 155
    .line 156
    .line 157
    return-object v0

    .line 158
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 163
    .line 164
    .line 165
    return-object v0

    .line 166
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 167
    .line 168
    return-object p0

    .line 169
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 170
    .line 171
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 172
    .line 173
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 174
    .line 175
    if-eqz p1, :cond_b

    .line 176
    .line 177
    move v0, v2

    .line 178
    goto :goto_6

    .line 179
    :cond_b
    move v0, v1

    .line 180
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 181
    .line 182
    if-eqz v3, :cond_c

    .line 183
    .line 184
    move v1, v2

    .line 185
    :cond_c
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 199
    .line 200
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

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
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 208
    .line 209
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 214
    .line 215
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 223
    .line 224
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

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
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 232
    .line 233
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 238
    .line 239
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    xor-int/2addr p1, v2

    .line 246
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 247
    .line 248
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    xor-int/2addr v1, v2

    .line 255
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 256
    .line 257
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 262
    .line 263
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 264
    .line 265
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 266
    .line 267
    .line 268
    move-result p1

    .line 269
    xor-int/2addr p1, v2

    .line 270
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 271
    .line 272
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 273
    .line 274
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    xor-int/2addr v1, v2

    .line 279
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 280
    .line 281
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 286
    .line 287
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 295
    .line 296
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

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
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 304
    .line 305
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 310
    .line 311
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 312
    .line 313
    return-object p0

    .line 314
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;

    .line 315
    .line 316
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent$Builder;-><init>(Ll/a2w;)V

    .line 317
    .line 318
    .line 319
    return-object p0

    .line 320
    :pswitch_5
    return-object v0

    .line 321
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 322
    .line 323
    return-object p0

    .line 324
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;

    .line 325
    .line 326
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;-><init>()V

    .line 327
    .line 328
    .line 329
    return-object p0

    .line 330
    nop

    .line 331
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

.method public getAppUIVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppUIVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

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

.method public getAppVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

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

.method public getBrand()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBrandBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

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

.method public getModel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModelBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getAppVersion()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getSourceVersion()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getBrand()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getModel()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getAppUIVersion()Ljava/lang/String;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 117
    .line 118
    return v0
.end method

.method public getSource()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getSourceValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSourceVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->CLIENT_SOURCE_ANDROID:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$ClientSourceEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->source_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appVersion_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getAppVersion()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->sourceVersion_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getSourceVersion()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->brand_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getBrand()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->model_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getModel()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->appUIVersion_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$UserAgent;->getAppUIVersion()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    return-void
.end method

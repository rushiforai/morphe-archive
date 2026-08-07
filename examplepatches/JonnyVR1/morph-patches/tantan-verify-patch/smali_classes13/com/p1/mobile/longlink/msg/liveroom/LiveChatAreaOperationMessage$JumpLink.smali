.class public final Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLinkOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "JumpLink"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLinkOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

.field public static final ENABLECLOSE_FIELD_NUMBER:I = 0x5

.field public static final ISCLIENTDEAL_FIELD_NUMBER:I = 0x7

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;",
            ">;"
        }
    .end annotation
.end field

.field public static final SCHEMA_FIELD_NUMBER:I = 0x6

.field public static final SHOWTIME_FIELD_NUMBER:I = 0x2

.field public static final URL_FIELD_NUMBER:I = 0x1

.field public static final WIDTHHIGHRATIO_FIELD_NUMBER:I = 0x3

.field public static final WIDTHSCREENRATIO_FIELD_NUMBER:I = 0x4


# instance fields
.field private enableClose_:Z

.field private isClientDeal_:Z

.field private schema_:Ljava/lang/String;

.field private showTime_:J

.field private url_:Ljava/lang/String;

.field private widthHighRatio_:F

.field private widthScreenRatio_:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->clearEnableClose()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->clearIsClientDeal()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->clearSchema()V

    return-void
.end method

.method private clearEnableClose()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearIsClientDeal()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearSchema()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearShowTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearWidthHighRatio()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 3
    .line 4
    return-void
.end method

.method private clearWidthScreenRatio()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->clearShowTime()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->clearUrl()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->clearWidthHighRatio()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->clearWidthScreenRatio()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setEnableClose(Z)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setIsClientDeal(Z)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setSchema(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setSchemaBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setShowTime(J)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setWidthHighRatio(F)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->setWidthScreenRatio(F)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

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

.method public static bridge synthetic q()Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-object v0
.end method

.method private setEnableClose(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setIsClientDeal(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setSchema(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSchemaBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setShowTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setWidthHighRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 2
    .line 3
    return-void
.end method

.method private setWidthScreenRatio(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_b

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
    if-eq p1, p3, :cond_a

    .line 65
    .line 66
    const/16 p3, 0x10

    .line 67
    .line 68
    if-eq p1, p3, :cond_9

    .line 69
    .line 70
    const/16 p3, 0x1d

    .line 71
    .line 72
    if-eq p1, p3, :cond_8

    .line 73
    .line 74
    const/16 p3, 0x25

    .line 75
    .line 76
    if-eq p1, p3, :cond_7

    .line 77
    .line 78
    const/16 p3, 0x28

    .line 79
    .line 80
    if-eq p1, p3, :cond_6

    .line 81
    .line 82
    const/16 p3, 0x32

    .line 83
    .line 84
    if-eq p1, p3, :cond_5

    .line 85
    .line 86
    const/16 p3, 0x38

    .line 87
    .line 88
    if-eq p1, p3, :cond_4

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
    goto :goto_4

    .line 101
    :catch_1
    move-exception v0

    .line 102
    move-object p1, v0

    .line 103
    goto :goto_5

    .line 104
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 140
    .line 141
    .line 142
    move-result-wide v3

    .line 143
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :catchall_1
    move-exception v0

    .line 154
    move-object p0, v0

    .line 155
    throw p0

    .line 156
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 157
    .line 158
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 170
    .line 171
    .line 172
    return-object v1

    .line 173
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 178
    .line 179
    .line 180
    return-object v1

    .line 181
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 182
    .line 183
    return-object p0

    .line 184
    :pswitch_3
    move-object v3, p2

    .line 185
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 186
    .line 187
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    xor-int/2addr p1, v2

    .line 196
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 197
    .line 198
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    xor-int/2addr v1, v2

    .line 205
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 206
    .line 207
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 212
    .line 213
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

    .line 214
    .line 215
    const-wide/16 p1, 0x0

    .line 216
    .line 217
    cmp-long v1, v5, p1

    .line 218
    .line 219
    if-eqz v1, :cond_c

    .line 220
    .line 221
    move v4, v2

    .line 222
    goto :goto_6

    .line 223
    :cond_c
    move v4, v0

    .line 224
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

    .line 225
    .line 226
    cmp-long p1, v8, p1

    .line 227
    .line 228
    if-eqz p1, :cond_d

    .line 229
    .line 230
    move v7, v2

    .line 231
    goto :goto_7

    .line 232
    :cond_d
    move v7, v0

    .line 233
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 234
    .line 235
    .line 236
    move-result-wide p1

    .line 237
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

    .line 238
    .line 239
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 240
    .line 241
    const/4 p2, 0x0

    .line 242
    cmpl-float v1, p1, p2

    .line 243
    .line 244
    if-eqz v1, :cond_e

    .line 245
    .line 246
    move v1, v2

    .line 247
    goto :goto_8

    .line 248
    :cond_e
    move v1, v0

    .line 249
    :goto_8
    iget v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 250
    .line 251
    cmpl-float v5, v4, p2

    .line 252
    .line 253
    if-eqz v5, :cond_f

    .line 254
    .line 255
    move v5, v2

    .line 256
    goto :goto_9

    .line 257
    :cond_f
    move v5, v0

    .line 258
    :goto_9
    invoke-interface {v3, v1, p1, v5, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->p(ZFZF)F

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 263
    .line 264
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 265
    .line 266
    cmpl-float v1, p1, p2

    .line 267
    .line 268
    if-eqz v1, :cond_10

    .line 269
    .line 270
    move v1, v2

    .line 271
    goto :goto_a

    .line 272
    :cond_10
    move v1, v0

    .line 273
    :goto_a
    iget v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 274
    .line 275
    cmpl-float p2, v4, p2

    .line 276
    .line 277
    if-eqz p2, :cond_11

    .line 278
    .line 279
    move v0, v2

    .line 280
    :cond_11
    invoke-interface {v3, v1, p1, v0, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->p(ZFZF)F

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 285
    .line 286
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 287
    .line 288
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 289
    .line 290
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 295
    .line 296
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

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
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 304
    .line 305
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

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
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 313
    .line 314
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 319
    .line 320
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 321
    .line 322
    iget-boolean p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 323
    .line 324
    invoke-interface {v3, p1, p1, p2, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 325
    .line 326
    .line 327
    move-result p1

    .line 328
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 329
    .line 330
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 331
    .line 332
    return-object p0

    .line 333
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;

    .line 334
    .line 335
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink$Builder;-><init>(Ll/h4s;)V

    .line 336
    .line 337
    .line 338
    return-object p0

    .line 339
    :pswitch_5
    return-object v1

    .line 340
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 341
    .line 342
    return-object p0

    .line 343
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    .line 344
    .line 345
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;-><init>()V

    .line 346
    .line 347
    .line 348
    return-object p0

    .line 349
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

.method public getEnableClose()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getIsClientDeal()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getUrl()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

    .line 27
    .line 28
    const-wide/16 v3, 0x0

    .line 29
    .line 30
    cmp-long v3, v1, v3

    .line 31
    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/2addr v0, v1

    .line 40
    :cond_2
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    cmpl-float v3, v1, v2

    .line 44
    .line 45
    if-eqz v3, :cond_3

    .line 46
    .line 47
    const/4 v3, 0x3

    .line 48
    invoke-static {v3, v1}, Lcom/google/protobuf/CodedOutputStream;->q(IF)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    add-int/2addr v0, v1

    .line 53
    :cond_3
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 54
    .line 55
    cmpl-float v2, v1, v2

    .line 56
    .line 57
    if-eqz v2, :cond_4

    .line 58
    .line 59
    const/4 v2, 0x4

    .line 60
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->q(IF)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    add-int/2addr v0, v1

    .line 65
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 66
    .line 67
    if-eqz v1, :cond_5

    .line 68
    .line 69
    const/4 v2, 0x5

    .line 70
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    add-int/2addr v0, v1

    .line 75
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_6

    .line 82
    .line 83
    const/4 v1, 0x6

    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getSchema()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    add-int/2addr v0, v1

    .line 93
    :cond_6
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 94
    .line 95
    if-eqz v1, :cond_7

    .line 96
    .line 97
    const/4 v2, 0x7

    .line 98
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    add-int/2addr v0, v1

    .line 103
    :cond_7
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 104
    .line 105
    return v0
.end method

.method public getShowTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

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

.method public getWidthHighRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 2
    .line 3
    return p0
.end method

.method public getWidthScreenRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 2
    .line 3
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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getUrl()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->showTime_:J

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v2, v0, v2

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthHighRatio_:F

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    cmpl-float v2, v0, v1

    .line 33
    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->o0(IF)V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->widthScreenRatio_:F

    .line 41
    .line 42
    cmpl-float v1, v0, v1

    .line 43
    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->o0(IF)V

    .line 48
    .line 49
    .line 50
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->enableClose_:Z

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 56
    .line 57
    .line 58
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->schema_:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_5

    .line 65
    .line 66
    const/4 v0, 0x6

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->getSchema()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_5
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;->isClientDeal_:Z

    .line 75
    .line 76
    if-eqz p0, :cond_6

    .line 77
    .line 78
    const/4 v0, 0x7

    .line 79
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 80
    .line 81
    .line 82
    :cond_6
    return-void
.end method

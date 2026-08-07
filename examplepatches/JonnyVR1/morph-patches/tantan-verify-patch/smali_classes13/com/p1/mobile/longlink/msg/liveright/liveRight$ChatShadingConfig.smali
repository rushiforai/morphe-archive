.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ChatShadingConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfigOrBuilder;"
    }
.end annotation


# static fields
.field public static final BACKGROUNDCOLORCONFIG_FIELD_NUMBER:I = 0x2

.field public static final BORDERCOLORCONFIG_FIELD_NUMBER:I = 0x1

.field public static final CORNERCONFIG_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

.field private borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

.field private cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->clearBackgroundColorConfig()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->clearBorderColorConfig()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->clearCornerConfig()V

    return-void
.end method

.method private clearBackgroundColorConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearBorderColorConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearCornerConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->mergeBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->mergeBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->mergeCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->setBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->setBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->setCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->setCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)V

    return-void
.end method

.method public static bridge synthetic m()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object v0
.end method

.method private mergeBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

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

.method private setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-void
.end method

.method private setBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-void
.end method

.method private setCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    packed-switch p1, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/l710;->a()V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->PARSER:Ll/ng60;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-class p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 22
    .line 23
    monitor-enter p0

    .line 24
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->PARSER:Ll/ng60;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 29
    .line 30
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 33
    .line 34
    .line 35
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->PARSER:Ll/ng60;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :goto_0
    monitor-exit p0

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p1

    .line 44
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->PARSER:Ll/ng60;

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 48
    .line 49
    check-cast p3, Lcom/google/protobuf/h;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    :cond_2
    :goto_3
    if-nez p1, :cond_a

    .line 53
    .line 54
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    const/4 v2, 0x1

    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    const/16 v3, 0xa

    .line 62
    .line 63
    if-eq v1, v3, :cond_8

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v1, v3, :cond_6

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v1, v3, :cond_4

    .line 72
    .line 73
    invoke-virtual {p2, v1}, Lcom/google/protobuf/e;->R(I)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_2

    .line 78
    .line 79
    :cond_3
    move p1, v2

    .line 80
    goto :goto_3

    .line 81
    :catch_0
    move-exception p1

    .line 82
    goto/16 :goto_7

    .line 83
    .line 84
    :catch_1
    move-exception p1

    .line 85
    goto/16 :goto_8

    .line 86
    .line 87
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 88
    .line 89
    if-eqz v1, :cond_5

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig$Builder;

    .line 96
    .line 97
    goto :goto_4

    .line 98
    :cond_5
    move-object v1, v0

    .line 99
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;->parser()Ll/ng60;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {p2, v2, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 108
    .line 109
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 110
    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 121
    .line 122
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 126
    .line 127
    if-eqz v1, :cond_7

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

    .line 134
    .line 135
    goto :goto_5

    .line 136
    :cond_7
    move-object v1, v0

    .line 137
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->parser()Ll/ng60;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {p2, v2, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 146
    .line 147
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 148
    .line 149
    if-eqz v1, :cond_2

    .line 150
    .line 151
    invoke-virtual {v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 159
    .line 160
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 164
    .line 165
    if-eqz v1, :cond_9

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

    .line 172
    .line 173
    goto :goto_6

    .line 174
    :cond_9
    move-object v1, v0

    .line 175
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->parser()Ll/ng60;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {p2, v2, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 184
    .line 185
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 186
    .line 187
    if-eqz v1, :cond_2

    .line 188
    .line 189
    invoke-virtual {v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 197
    .line 198
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 199
    .line 200
    goto/16 :goto_3

    .line 201
    .line 202
    :catchall_1
    move-exception p0

    .line 203
    throw p0

    .line 204
    :goto_7
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 218
    .line 219
    .line 220
    return-object v0

    .line 221
    :goto_8
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 226
    .line 227
    .line 228
    return-object v0

    .line 229
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 230
    .line 231
    return-object p0

    .line 232
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 233
    .line 234
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 235
    .line 236
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 237
    .line 238
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 239
    .line 240
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 245
    .line 246
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 247
    .line 248
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 249
    .line 250
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 251
    .line 252
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 257
    .line 258
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 259
    .line 260
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 261
    .line 262
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 263
    .line 264
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 269
    .line 270
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 271
    .line 272
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 273
    .line 274
    return-object p0

    .line 275
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;

    .line 276
    .line 277
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;-><init>(Ll/x4r0;)V

    .line 278
    .line 279
    .line 280
    return-object p0

    .line 281
    :pswitch_5
    return-object v0

    .line 282
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 283
    .line 284
    return-object p0

    .line 285
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 286
    .line 287
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;-><init>()V

    .line 288
    .line 289
    .line 290
    return-object p0

    .line 291
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

.method public getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getBorderColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getCornerConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getBorderColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x3

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getCornerConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 51
    .line 52
    return v0
.end method

.method public hasBackgroundColorConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

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

.method public hasBorderColorConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

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

.method public hasCornerConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->borderColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getBorderColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->backgroundColorConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->cornerConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getCornerConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method

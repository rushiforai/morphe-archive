.class public final Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AvatarConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfigOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

.field public static final FRAMECONFIG_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

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

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->clearFrameConfig()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->mergeFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->setFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;)V

    return-void
.end method

.method private clearFrameConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->setFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V

    return-void
.end method

.method public static bridge synthetic e()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object v0
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 2
    .line 3
    return-object v0
.end method

.method private mergeFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

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

.method private setFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->PARSER:Ll/ng60;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-class p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 22
    .line 23
    monitor-enter p0

    .line 24
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->PARSER:Ll/ng60;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 29
    .line 30
    sget-object p2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 33
    .line 34
    .line 35
    sput-object p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_6

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
    if-eq v1, v3, :cond_4

    .line 64
    .line 65
    invoke-virtual {p2, v1}, Lcom/google/protobuf/e;->R(I)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    :cond_3
    move p1, v2

    .line 72
    goto :goto_3

    .line 73
    :catch_0
    move-exception p1

    .line 74
    goto :goto_5

    .line 75
    :catch_1
    move-exception p1

    .line 76
    goto :goto_6

    .line 77
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 86
    .line 87
    goto :goto_4

    .line 88
    :cond_5
    move-object v1, v0

    .line 89
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->parser()Ll/ng60;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {p2, v2, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 98
    .line 99
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 100
    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    check-cast v1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 111
    .line 112
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :catchall_1
    move-exception p0

    .line 116
    throw p0

    .line 117
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 131
    .line 132
    .line 133
    return-object v0

    .line 134
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 139
    .line 140
    .line 141
    return-object v0

    .line 142
    :cond_6
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 143
    .line 144
    return-object p0

    .line 145
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 146
    .line 147
    check-cast p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 148
    .line 149
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 150
    .line 151
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 152
    .line 153
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 158
    .line 159
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 160
    .line 161
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 162
    .line 163
    return-object p0

    .line 164
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

    .line 165
    .line 166
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;-><init>(Ll/c6r0;)V

    .line 167
    .line 168
    .line 169
    return-object p0

    .line 170
    :pswitch_5
    return-object v0

    .line 171
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 172
    .line 173
    return-object p0

    .line 174
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 175
    .line 176
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;-><init>()V

    .line 177
    .line 178
    .line 179
    return-object p0

    .line 180
    nop

    .line 181
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

.method public getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 2

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 23
    .line 24
    return v0
.end method

.method public hasFrameConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

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
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->frameConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

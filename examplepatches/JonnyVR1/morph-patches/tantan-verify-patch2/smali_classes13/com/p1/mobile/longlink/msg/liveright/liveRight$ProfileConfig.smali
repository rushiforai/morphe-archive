.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProfileConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfigOrBuilder;"
    }
.end annotation


# static fields
.field public static final BACKGROUNDPICTURECONFIG_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TOPFRAMECONFIG_FIELD_NUMBER:I = 0x2


# instance fields
.field private backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

.field private topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

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

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->clearBackgroundPictureConfig()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->clearTopFrameConfig()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->mergeBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V

    return-void
.end method

.method private clearBackgroundPictureConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearTopFrameConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->mergeTopFrameConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->setBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->setBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->setTopFrameConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->setTopFrameConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V

    return-void
.end method

.method public static bridge synthetic i()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object v0
.end method

.method private mergeBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeTopFrameConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 33
    .line 34
    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

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

.method private setBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setBackgroundPictureConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    return-void
.end method

.method private setTopFrameConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setTopFrameConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->PARSER:Ll/ng60;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-class p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 22
    .line 23
    monitor-enter p0

    .line 24
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->PARSER:Ll/ng60;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 29
    .line 30
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 33
    .line 34
    .line 35
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_8

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
    if-eq v1, v3, :cond_6

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v1, v3, :cond_4

    .line 68
    .line 69
    invoke-virtual {p2, v1}, Lcom/google/protobuf/e;->R(I)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_2

    .line 74
    .line 75
    :cond_3
    move p1, v2

    .line 76
    goto :goto_3

    .line 77
    :catch_0
    move-exception p1

    .line 78
    goto :goto_6

    .line 79
    :catch_1
    move-exception p1

    .line 80
    goto :goto_7

    .line 81
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_5
    move-object v1, v0

    .line 93
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->parser()Ll/ng60;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {p2, v2, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 102
    .line 103
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 104
    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 120
    .line 121
    if-eqz v1, :cond_7

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig$Builder;

    .line 128
    .line 129
    goto :goto_5

    .line 130
    :cond_7
    move-object v1, v0

    .line 131
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->parser()Ll/ng60;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {p2, v2, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 140
    .line 141
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 142
    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 153
    .line 154
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :catchall_1
    move-exception p0

    .line 158
    throw p0

    .line 159
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 160
    .line 161
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 173
    .line 174
    .line 175
    return-object v0

    .line 176
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 181
    .line 182
    .line 183
    return-object v0

    .line 184
    :cond_8
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 185
    .line 186
    return-object p0

    .line 187
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 188
    .line 189
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 192
    .line 193
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 194
    .line 195
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 200
    .line 201
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 202
    .line 203
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 204
    .line 205
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 206
    .line 207
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 212
    .line 213
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 214
    .line 215
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 216
    .line 217
    return-object p0

    .line 218
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;

    .line 219
    .line 220
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;-><init>(Ll/x4r0;)V

    .line 221
    .line 222
    .line 223
    return-object p0

    .line 224
    :pswitch_5
    return-object v0

    .line 225
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 226
    .line 227
    return-object p0

    .line 228
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 229
    .line 230
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;-><init>()V

    .line 231
    .line 232
    .line 233
    return-object p0

    .line 234
    nop

    .line 235
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

.method public getBackgroundPictureConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->getBackgroundPictureConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->getTopFrameConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

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
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 37
    .line 38
    return v0
.end method

.method public getTopFrameConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasBackgroundPictureConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

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

.method public hasTopFrameConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->backgroundPictureConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->getBackgroundPictureConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->topFrameConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->getTopFrameConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

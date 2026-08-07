.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ColorConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfigOrBuilder;"
    }
.end annotation


# static fields
.field public static final COLORS_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

.field public static final GRADIENTDIRECTION_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRANSPARENCY_FIELD_NUMBER:I = 0x3


# instance fields
.field private bitField0_:I

.field private colors_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private gradientDirection_:I

.field private transparency_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

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
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->addAllColors(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllColors(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->ensureColorsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addColors(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->ensureColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addColorsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->ensureColorsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->addColors(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->addColorsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearColors()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearGradientDirection()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearTransparency()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->clearColors()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->clearGradientDirection()V

    return-void
.end method

.method private ensureColorsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->clearTransparency()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->setColors(ILjava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->setGradientDirection(Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->setGradientDirectionValue(I)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->setTransparency(J)V

    return-void
.end method

.method public static bridge synthetic k()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

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

.method private setColors(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->ensureColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setGradientDirection(Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 9
    .line 10
    return-void
.end method

.method private setGradientDirectionValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 2
    .line 3
    return-void
.end method

.method private setTransparency(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->PARSER:Ll/ng60;

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
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/16 p3, 0x8

    .line 63
    .line 64
    if-eq p1, p3, :cond_7

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_5

    .line 69
    .line 70
    const/16 p3, 0x18

    .line 71
    .line 72
    if-eq p1, p3, :cond_4

    .line 73
    .line 74
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    :cond_3
    move v0, v2

    .line 81
    goto :goto_3

    .line 82
    :catch_0
    move-exception v0

    .line 83
    move-object p1, v0

    .line 84
    goto :goto_4

    .line 85
    :catch_1
    move-exception v0

    .line 86
    move-object p1, v0

    .line 87
    goto :goto_5

    .line 88
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 100
    .line 101
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 102
    .line 103
    .line 104
    move-result p3

    .line 105
    if-nez p3, :cond_6

    .line 106
    .line 107
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 108
    .line 109
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    iput-object p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 114
    .line 115
    :cond_6
    iget-object p3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 116
    .line 117
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :catchall_1
    move-exception v0

    .line 129
    move-object p0, v0

    .line 130
    throw p0

    .line 131
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 132
    .line 133
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 145
    .line 146
    .line 147
    return-object v1

    .line 148
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    return-object v1

    .line 156
    :cond_8
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 157
    .line 158
    return-object p0

    .line 159
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 160
    .line 161
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 162
    .line 163
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 164
    .line 165
    if-eqz p1, :cond_9

    .line 166
    .line 167
    move v1, v2

    .line 168
    goto :goto_6

    .line 169
    :cond_9
    move v1, v0

    .line 170
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 171
    .line 172
    if-eqz v3, :cond_a

    .line 173
    .line 174
    move v4, v2

    .line 175
    goto :goto_7

    .line 176
    :cond_a
    move v4, v0

    .line 177
    :goto_7
    invoke-interface {p2, v1, p1, v4, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 182
    .line 183
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 184
    .line 185
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 186
    .line 187
    invoke-interface {p2, p1, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 192
    .line 193
    move p1, v2

    .line 194
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 195
    .line 196
    const-wide/16 v4, 0x0

    .line 197
    .line 198
    cmp-long v1, v2, v4

    .line 199
    .line 200
    if-eqz v1, :cond_b

    .line 201
    .line 202
    move v1, p1

    .line 203
    :goto_8
    move-wide v7, v4

    .line 204
    goto :goto_9

    .line 205
    :cond_b
    move v1, v0

    .line 206
    goto :goto_8

    .line 207
    :goto_9
    iget-wide v5, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 208
    .line 209
    cmp-long v4, v5, v7

    .line 210
    .line 211
    if-eqz v4, :cond_c

    .line 212
    .line 213
    move v4, p1

    .line 214
    :goto_a
    move-object v0, p2

    .line 215
    goto :goto_b

    .line 216
    :cond_c
    move v4, v0

    .line 217
    goto :goto_a

    .line 218
    :goto_b
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 219
    .line 220
    .line 221
    move-result-wide p1

    .line 222
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 223
    .line 224
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 225
    .line 226
    if-ne v0, p1, :cond_d

    .line 227
    .line 228
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->bitField0_:I

    .line 229
    .line 230
    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->bitField0_:I

    .line 231
    .line 232
    or-int/2addr p1, p2

    .line 233
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->bitField0_:I

    .line 234
    .line 235
    :cond_d
    return-object p0

    .line 236
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;

    .line 237
    .line 238
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;-><init>(Ll/x4r0;)V

    .line 239
    .line 240
    .line 241
    return-object p0

    .line 242
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 243
    .line 244
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 245
    .line 246
    .line 247
    return-object v1

    .line 248
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 249
    .line 250
    return-object p0

    .line 251
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 252
    .line 253
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;-><init>()V

    .line 254
    .line 255
    .line 256
    return-object p0

    .line 257
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

.method public getColors(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getColorsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getColorsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

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

.method public getColorsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGradientDirection()Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getGradientDirectionValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 2
    .line 3
    return p0
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;->unknownDirection:Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;->getNumber()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v2

    .line 27
    :goto_0
    move v1, v2

    .line 28
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 29
    .line 30
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-ge v2, v3, :cond_2

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 37
    .line 38
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    add-int/2addr v1, v3

    .line 49
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    add-int/2addr v0, v1

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->getColorsList()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/2addr v0, v1

    .line 62
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 63
    .line 64
    const-wide/16 v3, 0x0

    .line 65
    .line 66
    cmp-long v3, v1, v3

    .line 67
    .line 68
    if-eqz v3, :cond_3

    .line 69
    .line 70
    const/4 v3, 0x3

    .line 71
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_3
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 77
    .line 78
    return v0
.end method

.method public getTransparency()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;->unknownDirection:Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$GradientDirection;->getNumber()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->gradientDirection_:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-ge v0, v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->colors_:Lcom/google/protobuf/l$h;

    .line 27
    .line 28
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ljava/lang/String;

    .line 33
    .line 34
    const/4 v2, 0x2

    .line 35
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;->transparency_:J

    .line 42
    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    cmp-long p0, v0, v2

    .line 46
    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    const/4 p0, 0x3

    .line 50
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

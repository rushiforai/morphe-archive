.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSideOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SwitchSide"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSideOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

.field public static final MUTE_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;",
            ">;"
        }
    .end annotation
.end field

.field public static final TOSIDE_FIELD_NUMBER:I = 0x1


# instance fields
.field private mute_:Z

.field private toSide_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

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

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->clearMute()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->clearToSide()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->setMute(Z)V

    return-void
.end method

.method private clearMute()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearToSide()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->setToSide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->setToSideValue(I)V

    return-void
.end method

.method public static bridge synthetic f()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object v0
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 2
    .line 3
    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

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

.method private setMute(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setToSide(Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 9
    .line 10
    return-void
.end method

.method private setToSideValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 2
    .line 3
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->PARSER:Ll/ng60;

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
    if-nez v1, :cond_6

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
    if-eq p1, p3, :cond_5

    .line 64
    .line 65
    const/16 p3, 0x10

    .line 66
    .line 67
    if-eq p1, p3, :cond_4

    .line 68
    .line 69
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_2

    .line 74
    .line 75
    :cond_3
    move v1, v2

    .line 76
    goto :goto_3

    .line 77
    :catch_0
    move-exception p1

    .line 78
    goto :goto_4

    .line 79
    :catch_1
    move-exception p1

    .line 80
    goto :goto_5

    .line 81
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :catchall_1
    move-exception p0

    .line 96
    throw p0

    .line 97
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    return-object v0

    .line 114
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    return-object v0

    .line 122
    :cond_6
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 123
    .line 124
    return-object p0

    .line 125
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 126
    .line 127
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 128
    .line 129
    iget p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 130
    .line 131
    if-eqz p1, :cond_7

    .line 132
    .line 133
    move v0, v2

    .line 134
    goto :goto_6

    .line 135
    :cond_7
    move v0, v1

    .line 136
    :goto_6
    iget v3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 137
    .line 138
    if-eqz v3, :cond_8

    .line 139
    .line 140
    move v1, v2

    .line 141
    :cond_8
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    iput p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 146
    .line 147
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 148
    .line 149
    iget-boolean p3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 150
    .line 151
    invoke-interface {p2, p1, p1, p3, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 156
    .line 157
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 158
    .line 159
    return-object p0

    .line 160
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;

    .line 161
    .line 162
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide$Builder;-><init>(Ll/a2w;)V

    .line 163
    .line 164
    .line 165
    return-object p0

    .line 166
    :pswitch_5
    return-object v0

    .line 167
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 168
    .line 169
    return-object p0

    .line 170
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;

    .line 171
    .line 172
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;-><init>()V

    .line 173
    .line 174
    .line 175
    return-object p0

    .line 176
    nop

    .line 177
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

.method public getMute()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 2
    .line 3
    return p0
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

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
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

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

.method public getToSide()Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->forNumber(I)Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getToSideValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 2
    .line 3
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->APP_STAY_SIDE_FOREGROUND:Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$AppStaySideEnum;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->toSide_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkAuthMessage$SwitchSide;->mute_:Z

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

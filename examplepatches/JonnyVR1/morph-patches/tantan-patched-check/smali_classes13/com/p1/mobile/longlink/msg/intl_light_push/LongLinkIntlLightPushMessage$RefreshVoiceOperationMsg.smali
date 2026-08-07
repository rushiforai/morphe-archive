.class public final Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RefreshVoiceOperationMsg"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;",
        "Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsgOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

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

.method public static bridge synthetic a()Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object v0
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

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


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->PARSER:Ll/ng60;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-class p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 22
    .line 23
    monitor-enter p0

    .line 24
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->PARSER:Ll/ng60;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 29
    .line 30
    sget-object p2, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 33
    .line 34
    .line 35
    sput-object p1, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_4

    .line 53
    .line 54
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    const/4 v1, 0x1

    .line 59
    if-eqz p3, :cond_3

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->R(I)Z

    .line 62
    .line 63
    .line 64
    move-result p3
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 65
    if-nez p3, :cond_2

    .line 66
    .line 67
    :cond_3
    move p1, v1

    .line 68
    goto :goto_3

    .line 69
    :catch_0
    move-exception p1

    .line 70
    goto :goto_4

    .line 71
    :catch_1
    move-exception p1

    .line 72
    goto :goto_5

    .line 73
    :catchall_1
    move-exception p0

    .line 74
    throw p0

    .line 75
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    return-object v0

    .line 92
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    return-object v0

    .line 100
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 101
    .line 102
    return-object p0

    .line 103
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 104
    .line 105
    check-cast p3, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 106
    .line 107
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 108
    .line 109
    return-object p0

    .line 110
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;

    .line 111
    .line 112
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg$Builder;-><init>(Ll/q2w;)V

    .line 113
    .line 114
    .line 115
    return-object p0

    .line 116
    :pswitch_5
    return-object v0

    .line 117
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 118
    .line 119
    return-object p0

    .line 120
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;

    .line 121
    .line 122
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshVoiceOperationMsg;-><init>()V

    .line 123
    .line 124
    .line 125
    return-object p0

    .line 126
    nop

    .line 127
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
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 9
    .line 10
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

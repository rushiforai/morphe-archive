.class public final Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReadedOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ChatReaded"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReadedOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;",
            ">;"
        }
    .end annotation
.end field

.field public static final SEQ_FIELD_NUMBER:I = 0x1


# instance fields
.field private seq_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

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

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->clearSeq()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->setSeq(J)V

    return-void
.end method

.method public static bridge synthetic c()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object v0
.end method

.method private clearSeq()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J

    .line 4
    .line 5
    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 2
    .line 3
    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

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

.method private setSeq(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_5

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
    if-eq p1, p3, :cond_4

    .line 65
    .line 66
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_2

    .line 71
    .line 72
    :cond_3
    move v0, v2

    .line 73
    goto :goto_3

    .line 74
    :catch_0
    move-exception v0

    .line 75
    move-object p1, v0

    .line 76
    goto :goto_4

    .line 77
    :catch_1
    move-exception v0

    .line 78
    move-object p1, v0

    .line 79
    goto :goto_5

    .line 80
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->O()J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :catchall_1
    move-exception v0

    .line 88
    move-object p0, v0

    .line 89
    throw p0

    .line 90
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    return-object v1

    .line 107
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 112
    .line 113
    .line 114
    return-object v1

    .line 115
    :cond_5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 116
    .line 117
    return-object p0

    .line 118
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 119
    .line 120
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 121
    .line 122
    move p1, v2

    .line 123
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J

    .line 124
    .line 125
    const-wide/16 v4, 0x0

    .line 126
    .line 127
    cmp-long v1, v2, v4

    .line 128
    .line 129
    if-eqz v1, :cond_6

    .line 130
    .line 131
    move v1, p1

    .line 132
    goto :goto_6

    .line 133
    :cond_6
    move v1, v0

    .line 134
    :goto_6
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J

    .line 135
    .line 136
    cmp-long p3, v6, v4

    .line 137
    .line 138
    if-eqz p3, :cond_7

    .line 139
    .line 140
    move v4, p1

    .line 141
    move-object v0, p2

    .line 142
    move-wide v5, v6

    .line 143
    goto :goto_7

    .line 144
    :cond_7
    move v4, v0

    .line 145
    move-wide v5, v6

    .line 146
    move-object v0, p2

    .line 147
    :goto_7
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 148
    .line 149
    .line 150
    move-result-wide p1

    .line 151
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J

    .line 152
    .line 153
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 154
    .line 155
    return-object p0

    .line 156
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;

    .line 157
    .line 158
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded$Builder;-><init>(Ll/w4r0;)V

    .line 159
    .line 160
    .line 161
    return-object p0

    .line 162
    :pswitch_5
    return-object v1

    .line 163
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 164
    .line 165
    return-object p0

    .line 166
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;

    .line 167
    .line 168
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;-><init>()V

    .line 169
    .line 170
    .line 171
    return-object p0

    .line 172
    nop

    .line 173
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

.method public getSeq()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSerializedSize()I
    .locals 4

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J

    .line 8
    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmp-long v2, v0, v2

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->P(IJ)I

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

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$ChatReaded;->seq_:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->I0(IJ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.class public final Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$LocationOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Location"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$LocationOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

.field public static final LAT_FIELD_NUMBER:I = 0x2

.field public static final LON_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private lat_:F

.field private lon_:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

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

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->clearLat()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->clearLon()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->setLat(F)V

    return-void
.end method

.method private clearLat()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 3
    .line 4
    return-void
.end method

.method private clearLon()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->setLon(F)V

    return-void
.end method

.method public static bridge synthetic e()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object v0
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 2
    .line 3
    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

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

.method private setLat(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 2
    .line 3
    return-void
.end method

.method private setLon(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->PARSER:Ll/ng60;

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
    const/16 p3, 0xd

    .line 62
    .line 63
    if-eq p1, p3, :cond_5

    .line 64
    .line 65
    const/16 p3, 0x15

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
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 123
    .line 124
    return-object p0

    .line 125
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 126
    .line 127
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 128
    .line 129
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F

    .line 130
    .line 131
    const/4 v0, 0x0

    .line 132
    cmpl-float v3, p1, v0

    .line 133
    .line 134
    if-eqz v3, :cond_7

    .line 135
    .line 136
    move v3, v2

    .line 137
    goto :goto_6

    .line 138
    :cond_7
    move v3, v1

    .line 139
    :goto_6
    iget v4, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F

    .line 140
    .line 141
    cmpl-float v5, v4, v0

    .line 142
    .line 143
    if-eqz v5, :cond_8

    .line 144
    .line 145
    move v5, v2

    .line 146
    goto :goto_7

    .line 147
    :cond_8
    move v5, v1

    .line 148
    :goto_7
    invoke-interface {p2, v3, p1, v5, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->p(ZFZF)F

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F

    .line 153
    .line 154
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 155
    .line 156
    cmpl-float v3, p1, v0

    .line 157
    .line 158
    if-eqz v3, :cond_9

    .line 159
    .line 160
    move v3, v2

    .line 161
    goto :goto_8

    .line 162
    :cond_9
    move v3, v1

    .line 163
    :goto_8
    iget p3, p3, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 164
    .line 165
    cmpl-float v0, p3, v0

    .line 166
    .line 167
    if-eqz v0, :cond_a

    .line 168
    .line 169
    move v1, v2

    .line 170
    :cond_a
    invoke-interface {p2, v3, p1, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->p(ZFZF)F

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 175
    .line 176
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 177
    .line 178
    return-object p0

    .line 179
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;

    .line 180
    .line 181
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location$Builder;-><init>(Ll/w4r0;)V

    .line 182
    .line 183
    .line 184
    return-object p0

    .line 185
    :pswitch_5
    return-object v0

    .line 186
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 187
    .line 188
    return-object p0

    .line 189
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;

    .line 190
    .line 191
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;-><init>()V

    .line 192
    .line 193
    .line 194
    return-object p0

    .line 195
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

.method public getLat()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 2
    .line 3
    return p0
.end method

.method public getLon()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    cmpl-float v2, v0, v1

    .line 11
    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->q(IF)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 22
    .line 23
    cmpl-float v1, v2, v1

    .line 24
    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->q(IF)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    add-int/2addr v0, v1

    .line 33
    :cond_2
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 34
    .line 35
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lon_:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v2, v0, v1

    .line 5
    .line 6
    if-eqz v2, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/CodedOutputStream;->o0(IF)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$Location;->lat_:F

    .line 13
    .line 14
    cmpl-float v0, p0, v1

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->o0(IF)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.class public final enum Lorg/fourthline/cling/support/model/Protocol;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/model/Protocol;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/model/Protocol;

.field public static final enum ALL:Lorg/fourthline/cling/support/model/Protocol;

.field public static final enum HTTP_GET:Lorg/fourthline/cling/support/model/Protocol;

.field public static final enum IEC61883:Lorg/fourthline/cling/support/model/Protocol;

.field public static final enum INTERNAL:Lorg/fourthline/cling/support/model/Protocol;

.field private static final LOG:Ljava/util/logging/Logger;

.field public static final enum OTHER:Lorg/fourthline/cling/support/model/Protocol;

.field public static final enum RTSP_RTP_UDP:Lorg/fourthline/cling/support/model/Protocol;

.field public static final enum XBMC_GET:Lorg/fourthline/cling/support/model/Protocol;


# instance fields
.field private protocolString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/Protocol;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "*"

    .line 5
    .line 6
    const-string v3, "ALL"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lorg/fourthline/cling/support/model/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lorg/fourthline/cling/support/model/Protocol;->ALL:Lorg/fourthline/cling/support/model/Protocol;

    .line 12
    .line 13
    new-instance v1, Lorg/fourthline/cling/support/model/Protocol;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "http-get"

    .line 17
    .line 18
    const-string v4, "HTTP_GET"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lorg/fourthline/cling/support/model/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lorg/fourthline/cling/support/model/Protocol;->HTTP_GET:Lorg/fourthline/cling/support/model/Protocol;

    .line 24
    .line 25
    new-instance v2, Lorg/fourthline/cling/support/model/Protocol;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "rtsp-rtp-udp"

    .line 29
    .line 30
    const-string v5, "RTSP_RTP_UDP"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lorg/fourthline/cling/support/model/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lorg/fourthline/cling/support/model/Protocol;->RTSP_RTP_UDP:Lorg/fourthline/cling/support/model/Protocol;

    .line 36
    .line 37
    new-instance v3, Lorg/fourthline/cling/support/model/Protocol;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const-string v5, "internal"

    .line 41
    .line 42
    const-string v6, "INTERNAL"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lorg/fourthline/cling/support/model/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lorg/fourthline/cling/support/model/Protocol;->INTERNAL:Lorg/fourthline/cling/support/model/Protocol;

    .line 48
    .line 49
    new-instance v4, Lorg/fourthline/cling/support/model/Protocol;

    .line 50
    .line 51
    const/4 v5, 0x4

    .line 52
    const-string v6, "iec61883"

    .line 53
    .line 54
    const-string v7, "IEC61883"

    .line 55
    .line 56
    invoke-direct {v4, v7, v5, v6}, Lorg/fourthline/cling/support/model/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v4, Lorg/fourthline/cling/support/model/Protocol;->IEC61883:Lorg/fourthline/cling/support/model/Protocol;

    .line 60
    .line 61
    new-instance v5, Lorg/fourthline/cling/support/model/Protocol;

    .line 62
    .line 63
    const/4 v6, 0x5

    .line 64
    const-string v7, "xbmc-get"

    .line 65
    .line 66
    const-string v8, "XBMC_GET"

    .line 67
    .line 68
    invoke-direct {v5, v8, v6, v7}, Lorg/fourthline/cling/support/model/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v5, Lorg/fourthline/cling/support/model/Protocol;->XBMC_GET:Lorg/fourthline/cling/support/model/Protocol;

    .line 72
    .line 73
    new-instance v6, Lorg/fourthline/cling/support/model/Protocol;

    .line 74
    .line 75
    const/4 v7, 0x6

    .line 76
    const-string v8, "other"

    .line 77
    .line 78
    const-string v9, "OTHER"

    .line 79
    .line 80
    invoke-direct {v6, v9, v7, v8}, Lorg/fourthline/cling/support/model/Protocol;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v6, Lorg/fourthline/cling/support/model/Protocol;->OTHER:Lorg/fourthline/cling/support/model/Protocol;

    .line 84
    .line 85
    filled-new-array/range {v0 .. v6}, [Lorg/fourthline/cling/support/model/Protocol;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sput-object v0, Lorg/fourthline/cling/support/model/Protocol;->$VALUES:[Lorg/fourthline/cling/support/model/Protocol;

    .line 90
    .line 91
    const-class v0, Lorg/fourthline/cling/support/model/Protocol;

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sput-object v0, Lorg/fourthline/cling/support/model/Protocol;->LOG:Ljava/util/logging/Logger;

    .line 102
    .line 103
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/fourthline/cling/support/model/Protocol;->protocolString:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static value(Ljava/lang/String;)Lorg/fourthline/cling/support/model/Protocol;
    .locals 5

    .line 1
    invoke-static {}, Lorg/fourthline/cling/support/model/Protocol;->values()[Lorg/fourthline/cling/support/model/Protocol;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lorg/fourthline/cling/support/model/Protocol;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    return-object v3

    .line 22
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget-object v0, Lorg/fourthline/cling/support/model/Protocol;->LOG:Ljava/util/logging/Logger;

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v2, "Unsupported OTHER protocol string: "

    .line 30
    .line 31
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Lorg/fourthline/cling/support/model/Protocol;->OTHER:Lorg/fourthline/cling/support/model/Protocol;

    .line 45
    .line 46
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/Protocol;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/Protocol;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/model/Protocol;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/model/Protocol;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/model/Protocol;->$VALUES:[Lorg/fourthline/cling/support/model/Protocol;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/model/Protocol;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/model/Protocol;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/Protocol;->protocolString:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

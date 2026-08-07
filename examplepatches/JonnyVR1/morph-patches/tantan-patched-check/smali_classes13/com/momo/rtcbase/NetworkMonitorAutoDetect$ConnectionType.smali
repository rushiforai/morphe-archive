.class public final enum Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/NetworkMonitorAutoDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ConnectionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_2G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_3G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_4G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_BLUETOOTH:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_ETHERNET:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_NONE:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_UNKNOWN:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_UNKNOWN_CELLULAR:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_VPN:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

.field public static final enum CONNECTION_WIFI:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    const-string v1, "CONNECTION_UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_UNKNOWN:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 10
    .line 11
    new-instance v1, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 12
    .line 13
    const-string v2, "CONNECTION_ETHERNET"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_ETHERNET:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 20
    .line 21
    new-instance v2, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 22
    .line 23
    const-string v3, "CONNECTION_WIFI"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_WIFI:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 30
    .line 31
    new-instance v3, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 32
    .line 33
    const-string v4, "CONNECTION_4G"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_4G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 40
    .line 41
    new-instance v4, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 42
    .line 43
    const-string v5, "CONNECTION_3G"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_3G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 50
    .line 51
    new-instance v5, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 52
    .line 53
    const-string v6, "CONNECTION_2G"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_2G:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 60
    .line 61
    new-instance v6, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 62
    .line 63
    const-string v7, "CONNECTION_UNKNOWN_CELLULAR"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_UNKNOWN_CELLULAR:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 70
    .line 71
    new-instance v7, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 72
    .line 73
    const-string v8, "CONNECTION_BLUETOOTH"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v7, v8, v9}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    sput-object v7, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_BLUETOOTH:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 80
    .line 81
    new-instance v8, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 82
    .line 83
    const-string v9, "CONNECTION_VPN"

    .line 84
    .line 85
    const/16 v10, 0x8

    .line 86
    .line 87
    invoke-direct {v8, v9, v10}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 88
    .line 89
    .line 90
    sput-object v8, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_VPN:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 91
    .line 92
    new-instance v9, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 93
    .line 94
    const-string v10, "CONNECTION_NONE"

    .line 95
    .line 96
    const/16 v11, 0x9

    .line 97
    .line 98
    invoke-direct {v9, v10, v11}, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;-><init>(Ljava/lang/String;I)V

    .line 99
    .line 100
    .line 101
    sput-object v9, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->CONNECTION_NONE:Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 102
    .line 103
    filled-new-array/range {v0 .. v9}, [Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sput-object v0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->$VALUES:[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 108
    .line 109
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->$VALUES:[Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/rtcbase/NetworkMonitorAutoDetect$ConnectionType;

    .line 8
    .line 9
    return-object v0
.end method

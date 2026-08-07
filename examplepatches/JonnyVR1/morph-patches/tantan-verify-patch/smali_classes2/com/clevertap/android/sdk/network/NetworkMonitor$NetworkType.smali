.class public final enum Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/network/NetworkMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NetworkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\n\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "WIFI",
        "CELLULAR",
        "ETHERNET",
        "VPN",
        "UNKNOWN",
        "DISCONNECTED",
        "UNDETECTED",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

.field public static final enum CELLULAR:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

.field public static final enum DISCONNECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

.field public static final enum ETHERNET:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

.field public static final enum UNDETECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

.field public static final enum UNKNOWN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

.field public static final enum VPN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

.field public static final enum WIFI:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
    .locals 7

    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->WIFI:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    sget-object v1, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->CELLULAR:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    sget-object v2, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->ETHERNET:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    sget-object v3, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->VPN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    sget-object v4, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->UNKNOWN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    sget-object v5, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->DISCONNECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    sget-object v6, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->UNDETECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    filled-new-array/range {v0 .. v6}, [Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 2
    .line 3
    const-string v1, "WIFI"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->WIFI:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 10
    .line 11
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 12
    .line 13
    const-string v1, "CELLULAR"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->CELLULAR:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 20
    .line 21
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 22
    .line 23
    const-string v1, "ETHERNET"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->ETHERNET:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 30
    .line 31
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 32
    .line 33
    const-string v1, "VPN"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->VPN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 40
    .line 41
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 42
    .line 43
    const-string v1, "UNKNOWN"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->UNKNOWN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 50
    .line 51
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 52
    .line 53
    const-string v1, "DISCONNECTED"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->DISCONNECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 60
    .line 61
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 62
    .line 63
    const-string v1, "UNDETECTED"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->UNDETECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 70
    .line 71
    invoke-static {}, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->$values()[Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->$VALUES:[Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 76
    .line 77
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    sput-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 82
    .line 83
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

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->$VALUES:[Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 8
    .line 9
    return-object v0
.end method

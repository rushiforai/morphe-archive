.class public final enum Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/network/NetworkTrackInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ReportType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

.field public static final enum API:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

.field public static final enum AV:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

.field public static final enum MEDIA:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

.field public static final enum PING:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

.field public static final enum UNKNOWN:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;


# instance fields
.field private mMessage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 2
    .line 3
    const-string v1, "MEDIA"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "media"

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v3}, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->MEDIA:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 12
    .line 13
    new-instance v1, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v4, "api"

    .line 17
    .line 18
    const-string v5, "API"

    .line 19
    .line 20
    invoke-direct {v1, v5, v2, v4}, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->API:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 24
    .line 25
    new-instance v2, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 26
    .line 27
    const/4 v4, 0x2

    .line 28
    const-string v5, "ping"

    .line 29
    .line 30
    const-string v6, "PING"

    .line 31
    .line 32
    invoke-direct {v2, v6, v4, v5}, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->PING:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 36
    .line 37
    new-instance v4, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 38
    .line 39
    const-string v5, "AV"

    .line 40
    .line 41
    const/4 v6, 0x3

    .line 42
    invoke-direct {v4, v5, v6, v3}, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sput-object v4, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->AV:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 46
    .line 47
    new-instance v3, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 48
    .line 49
    const/4 v5, 0x4

    .line 50
    const-string v6, "unknown"

    .line 51
    .line 52
    const-string v7, "UNKNOWN"

    .line 53
    .line 54
    invoke-direct {v3, v7, v5, v6}, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sput-object v3, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->UNKNOWN:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 58
    .line 59
    filled-new-array {v0, v1, v2, v4, v3}, [Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sput-object v0, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->$VALUES:[Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 64
    .line 65
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
    iput-object p3, p0, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->mMessage:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;
    .locals 1

    .line 1
    const-class v0, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->$VALUES:[Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getTypeStr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->mMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

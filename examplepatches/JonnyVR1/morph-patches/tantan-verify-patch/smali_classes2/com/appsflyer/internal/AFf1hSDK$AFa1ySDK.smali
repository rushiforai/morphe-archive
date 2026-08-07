.class public final synthetic Lcom/appsflyer/internal/AFf1hSDK$AFa1ySDK;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFf1hSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1001
    name = "AFa1ySDK"
.end annotation


# static fields
.field public static final synthetic getCurrencyIso4217Code:[I

.field public static final synthetic getMonetizationNetwork:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/appsflyer/internal/AFe1dSDK;->values()[Lcom/appsflyer/internal/AFe1dSDK;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    sget-object v1, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    aput v2, v0, v1

    .line 16
    .line 17
    sget-object v1, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v3, 0x2

    .line 24
    aput v3, v0, v1

    .line 25
    .line 26
    sput-object v0, Lcom/appsflyer/internal/AFf1hSDK$AFa1ySDK;->getMonetizationNetwork:[I

    .line 27
    .line 28
    invoke-static {}, Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;->values()[Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    array-length v0, v0

    .line 33
    new-array v0, v0, [I

    .line 34
    .line 35
    sget-object v1, Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    aput v2, v0, v1

    .line 42
    .line 43
    sget-object v1, Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    aput v3, v0, v1

    .line 50
    .line 51
    sput-object v0, Lcom/appsflyer/internal/AFf1hSDK$AFa1ySDK;->getCurrencyIso4217Code:[I

    .line 52
    .line 53
    return-void
.end method

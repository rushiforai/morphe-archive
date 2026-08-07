.class public abstract Lcom/appsflyer/internal/AFi1hSDK;
.super Lcom/appsflyer/internal/AFj1zSDK;
.source "SourceFile"


# instance fields
.field private getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1pSDK;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/appsflyer/internal/AFd1pSDK;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p4}, Lcom/appsflyer/internal/AFj1zSDK;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/appsflyer/internal/AFi1hSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1pSDK;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final getMonetizationNetwork()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFi1hSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1pSDK;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 4
    .line 5
    const-string v0, "appsFlyerCount"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    const-string p0, "Install referrer will not load, the counter > 1, "

    .line 15
    .line 16
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afRDLog(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.class public final Lcom/appsflyer/internal/AFj1wSDK;
.super Lcom/appsflyer/internal/AFi1iSDK;
.source "SourceFile"


# instance fields
.field private final AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;Lcom/appsflyer/internal/AFd1fSDK;)V
    .locals 2

    .line 1
    const-string v0, "store"

    .line 2
    .line 3
    const-string v1, "samsung"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1, p1}, Lcom/appsflyer/internal/AFi1iSDK;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Lcom/appsflyer/internal/AFj1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final getMonetizationNetwork(Landroid/content/Context;)V
    .locals 6

    .line 1
    new-instance v0, Lcom/appsflyer/internal/AFj1wSDK$3;

    .line 2
    .line 3
    iget-object v3, p0, Lcom/appsflyer/internal/AFj1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 4
    .line 5
    const-string v1, "FBA3AF4E7757D9016E953FB3EE4671CA2BD9AF725F9A53D52ED4A38EAAA08901"

    .line 6
    .line 7
    filled-new-array {v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    const-string v4, "com.sec.android.app.samsungapps.referrer"

    .line 12
    .line 13
    move-object v1, p0

    .line 14
    move-object v2, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/appsflyer/internal/AFj1wSDK$3;-><init>(Lcom/appsflyer/internal/AFj1wSDK;Landroid/content/Context;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, v1, Lcom/appsflyer/internal/AFj1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->getRevenue()Lcom/appsflyer/internal/AFd1rSDK;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFb1tSDK;

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFd1rSDK;Z)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-gtz p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFc1cSDK;->getRevenue()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object p0, v0, Lcom/appsflyer/internal/AFc1cSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1fSDK;

    .line 42
    .line 43
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->AFAdRevenueData()Ljava/util/concurrent/ExecutorService;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p1, v0, Lcom/appsflyer/internal/AFc1cSDK;->getRevenue:Ljava/util/concurrent/FutureTask;

    .line 48
    .line 49
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide p0

    .line 56
    iput-wide p0, v1, Lcom/appsflyer/internal/AFj1zSDK;->component4:J

    .line 57
    .line 58
    sget-object p0, Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 59
    .line 60
    iput-object p0, v1, Lcom/appsflyer/internal/AFj1zSDK;->component3:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 61
    .line 62
    new-instance p0, Lcom/appsflyer/internal/AFj1zSDK$4;

    .line 63
    .line 64
    invoke-direct {p0, v1}, Lcom/appsflyer/internal/AFj1zSDK$4;-><init>(Lcom/appsflyer/internal/AFj1zSDK;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, p0}, Ljava/util/Observable;->addObserver(Ljava/util/Observer;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

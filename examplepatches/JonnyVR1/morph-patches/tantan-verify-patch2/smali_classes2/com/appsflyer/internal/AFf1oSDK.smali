.class public abstract Lcom/appsflyer/internal/AFf1oSDK;
.super Lcom/appsflyer/internal/AFf1wSDK;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Result:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/appsflyer/internal/AFf1wSDK<",
        "Lcom/appsflyer/internal/AFe1kSDK<",
        "TResult;>;>;"
    }
.end annotation


# instance fields
.field public final areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

.field public component1:Lcom/appsflyer/internal/AFe1kSDK;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/appsflyer/internal/AFe1kSDK<",
            "TResult;>;"
        }
    .end annotation
.end field

.field protected final component2:Lcom/appsflyer/internal/AFb1bSDK;

.field private component3:Lcom/appsflyer/internal/AFb1uSDK;

.field protected final component4:Lcom/appsflyer/internal/AFe1sSDK;

.field private copydefault:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V
    .locals 8
    .param p1    # Lcom/appsflyer/internal/AFf1zSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/appsflyer/internal/AFf1zSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 27
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1sSDK;

    move-result-object v3

    .line 28
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    move-result-object v4

    .line 29
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    move-result-object v5

    .line 30
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->AFInAppEventType()Lcom/appsflyer/internal/AFb1uSDK;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v7, p4

    .line 31
    invoke-direct/range {v0 .. v7}, Lcom/appsflyer/internal/AFf1oSDK;-><init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFe1sSDK;Lcom/appsflyer/internal/AFg1rSDK;Lcom/appsflyer/internal/AFb1bSDK;Lcom/appsflyer/internal/AFb1uSDK;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1    # Lcom/appsflyer/internal/AFf1zSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/appsflyer/internal/AFf1zSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1sSDK;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->AFKeystoreWrapper()Lcom/appsflyer/internal/AFg1rSDK;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 10
    .line 11
    .line 12
    move-result-object v5

    .line 13
    invoke-interface {p3}, Lcom/appsflyer/internal/AFd1fSDK;->AFInAppEventType()Lcom/appsflyer/internal/AFb1uSDK;

    .line 14
    .line 15
    .line 16
    move-result-object v6

    .line 17
    move-object v0, p0

    .line 18
    move-object v1, p1

    .line 19
    move-object v2, p2

    .line 20
    move-object v7, p4

    .line 21
    invoke-direct/range {v0 .. v7}, Lcom/appsflyer/internal/AFf1oSDK;-><init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFe1sSDK;Lcom/appsflyer/internal/AFg1rSDK;Lcom/appsflyer/internal/AFb1bSDK;Lcom/appsflyer/internal/AFb1uSDK;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iput-object p5, v0, Lcom/appsflyer/internal/AFf1oSDK;->copydefault:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method private constructor <init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFe1sSDK;Lcom/appsflyer/internal/AFg1rSDK;Lcom/appsflyer/internal/AFb1bSDK;Lcom/appsflyer/internal/AFb1uSDK;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/appsflyer/internal/AFf1zSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/appsflyer/internal/AFf1zSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/appsflyer/internal/AFe1sSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/appsflyer/internal/AFg1rSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/appsflyer/internal/AFb1bSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Lcom/appsflyer/internal/AFb1uSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0, p1, p2, p7}, Lcom/appsflyer/internal/AFf1wSDK;-><init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Ljava/lang/String;)V

    .line 33
    iput-object p3, p0, Lcom/appsflyer/internal/AFf1oSDK;->component4:Lcom/appsflyer/internal/AFe1sSDK;

    .line 34
    iput-object p4, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 35
    iput-object p5, p0, Lcom/appsflyer/internal/AFf1oSDK;->component2:Lcom/appsflyer/internal/AFb1bSDK;

    .line 36
    iput-object p6, p0, Lcom/appsflyer/internal/AFf1oSDK;->component3:Lcom/appsflyer/internal/AFb1uSDK;

    return-void
.end method

.method private AFAdRevenueData(Lcom/appsflyer/internal/AFe1jSDK;)V
    .locals 5
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->copydefault:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Lcom/appsflyer/internal/AFb1qSDK;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/appsflyer/internal/AFe1jSDK;->getRevenue:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/appsflyer/internal/AFe1jSDK;->getMediationNetwork()[B

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v3, "6.15.0"

    .line 12
    .line 13
    iget-object v4, p0, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 14
    .line 15
    invoke-direct {v1, v2, p1, v3, v4}, Lcom/appsflyer/internal/AFb1qSDK;-><init>(Ljava/lang/String;[BLjava/lang/String;Lcom/appsflyer/internal/AFf1zSDK;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/appsflyer/internal/AFf1oSDK;->component3:Lcom/appsflyer/internal/AFb1uSDK;

    .line 19
    .line 20
    invoke-interface {p1, v1}, Lcom/appsflyer/internal/AFb1uSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFb1qSDK;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1oSDK;->copydefault:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1oSDK;->component3:Lcom/appsflyer/internal/AFb1uSDK;

    .line 29
    .line 30
    invoke-interface {p0, v0}, Lcom/appsflyer/internal/AFb1uSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method public abstract AFAdRevenueData(Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "TResult;>;"
        }
    .end annotation
.end method

.method public AFAdRevenueData()Z
    .locals 4

    .line 34
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1wSDK;->component2()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Lcom/appsflyer/internal/AFf1uSDK;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 36
    sget-object v2, Lcom/appsflyer/internal/AFe1dSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1dSDK;

    const/4 v3, 0x1

    if-ne v0, v2, :cond_1

    return v3

    .line 37
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1wSDK;->component2()Ljava/lang/Throwable;

    move-result-object p0

    .line 38
    instance-of v0, p0, Ljava/io/IOException;

    if-eqz v0, :cond_2

    instance-of p0, p0, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    if-nez p0, :cond_2

    return v3

    :cond_2
    return v1
.end method

.method public a_()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public abstract component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract equals()Z
.end method

.method public getCurrencyIso4217Code()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 2
    .line 3
    sget-object v1, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->copydefault:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1oSDK;->component3:Lcom/appsflyer/internal/AFb1uSDK;

    .line 12
    .line 13
    invoke-interface {p0, v0}, Lcom/appsflyer/internal/AFb1uSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->AFAdRevenueData()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->copydefault:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1oSDK;->component3:Lcom/appsflyer/internal/AFb1uSDK;

    .line 28
    .line 29
    invoke-interface {p0, v0}, Lcom/appsflyer/internal/AFb1uSDK;->AFAdRevenueData(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final getMediationNetwork()V
    .locals 2

    .line 63
    invoke-super {p0}, Lcom/appsflyer/internal/AFf1wSDK;->getMediationNetwork()V

    .line 64
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->equals()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 66
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 68
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFf1oSDK;->AFAdRevenueData(Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1rSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1jSDK;

    .line 70
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/AFf1oSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFe1jSDK;)V

    return-void

    .line 71
    :cond_0
    new-instance p0, Lcom/appsflyer/internal/components/queue/exceptions/CreateHttpCallException;

    const-string v0, "createHttpCall returned null"

    invoke-direct {p0, v0}, Lcom/appsflyer/internal/components/queue/exceptions/CreateHttpCallException;-><init>(Ljava/lang/String;)V

    const-string v0, "Failed to create a cached HTTP call"

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method

.method public final getMediationNetwork(Ljava/lang/Throwable;)V
    .locals 8
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;

    .line 2
    .line 3
    xor-int/lit8 v7, v0, 0x1

    .line 4
    .line 5
    instance-of v0, p1, Lcom/appsflyer/internal/AFf1uSDK;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 10
    .line 11
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->component3:Lcom/appsflyer/internal/AFg1cSDK;

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    const/4 v6, 0x0

    .line 15
    const-string v3, "AppsFlyer SDK is stopped: the request was not sent to the server"

    .line 16
    .line 17
    move-object v4, p1

    .line 18
    invoke-virtual/range {v1 .. v6}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZ)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move-object v4, p1

    .line 23
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 24
    .line 25
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->component3:Lcom/appsflyer/internal/AFg1cSDK;

    .line 26
    .line 27
    const-string p1, "Error while sending request to server: "

    .line 28
    .line 29
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const/4 v5, 0x1

    .line 38
    const/4 v6, 0x1

    .line 39
    invoke-virtual/range {v1 .. v7}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZ)V

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    invoke-virtual {v4}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    const-string p1, ""

    .line 56
    .line 57
    :goto_1
    const/16 v0, 0x28

    .line 58
    .line 59
    invoke-interface {p0, v0, p1}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method public getMonetizationNetwork()Lcom/appsflyer/internal/AFe1dSDK;
    .locals 5
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->a_()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFg1rSDK;->getMonetizationNetwork()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/16 v0, 0xb

    .line 22
    .line 23
    const-string v1, "Skipping event because \'isStopped\' is true"

    .line 24
    .line 25
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    new-instance p0, Lcom/appsflyer/internal/AFf1uSDK;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/appsflyer/internal/AFf1uSDK;-><init>()V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1oSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1rSDK;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_8

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/AFf1oSDK;->AFAdRevenueData(Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    new-instance p0, Lcom/appsflyer/internal/components/queue/exceptions/CreateHttpCallException;

    .line 58
    .line 59
    const-string v0, "createHttpCall returned null"

    .line 60
    .line 61
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/components/queue/exceptions/CreateHttpCallException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string v0, "Failed to create a cached HTTP call"

    .line 65
    .line 66
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    sget-object p0, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_3
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->equals()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    iget-object v1, v0, Lcom/appsflyer/internal/AFe1rSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1jSDK;

    .line 79
    .line 80
    invoke-direct {p0, v1}, Lcom/appsflyer/internal/AFf1oSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFe1jSDK;)V

    .line 81
    .line 82
    .line 83
    :cond_4
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFe1rSDK;->getRevenue()Lcom/appsflyer/internal/AFe1kSDK;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, p0, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFe1kSDK;->getBody()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iget-object v3, p0, Lcom/appsflyer/internal/AFf1oSDK;->component2:Lcom/appsflyer/internal/AFb1bSDK;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1rSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1jSDK;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1jSDK;->getRevenue:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFe1kSDK;->getStatusCode()I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    invoke-interface {v3, v0, v4, v2}, Lcom/appsflyer/internal/AFb1bSDK;->getMonetizationNetwork(Ljava/lang/String;ILjava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    if-eqz p0, :cond_6

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFe1kSDK;->isSuccessful()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_5

    .line 121
    .line 122
    invoke-interface {p0}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onSuccess()V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v2, "Status code failure "

    .line 129
    .line 130
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFe1kSDK;->getStatusCode()I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    const/16 v2, 0x32

    .line 145
    .line 146
    invoke-interface {p0, v2, v0}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :cond_6
    :goto_0
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFe1kSDK;->isSuccessful()Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-eqz p0, :cond_7

    .line 154
    .line 155
    sget-object p0, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 156
    .line 157
    return-object p0

    .line 158
    :cond_7
    sget-object p0, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;

    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_8
    :goto_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1oSDK;->component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    if-eqz p0, :cond_9

    .line 166
    .line 167
    const/16 v0, 0x29

    .line 168
    .line 169
    const-string v1, "No dev key"

    .line 170
    .line 171
    invoke-interface {p0, v0, v1}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    :cond_9
    new-instance p0, Lcom/appsflyer/internal/AFf1ySDK;

    .line 175
    .line 176
    invoke-direct {p0}, Lcom/appsflyer/internal/AFf1ySDK;-><init>()V

    .line 177
    .line 178
    .line 179
    throw p0
.end method

.method public getRevenue()J
    .locals 2

    const-wide/32 v0, 0xea60

    return-wide v0
.end method

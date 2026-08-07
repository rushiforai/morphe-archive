.class final Lcom/appsflyer/internal/AFa1cSDK$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/attribution/AppsFlyerRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/AFa1cSDK;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic getCurrencyIso4217Code:Lcom/appsflyer/internal/AFa1cSDK;

.field private synthetic getMediationNetwork:Lcom/appsflyer/internal/AFf1gSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFa1cSDK;Lcom/appsflyer/internal/AFf1gSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFa1cSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFa1cSDK;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/appsflyer/internal/AFa1cSDK$3;->getMediationNetwork:Lcom/appsflyer/internal/AFf1gSDK;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onError(ILjava/lang/String;)V
    .locals 2
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/16 v0, 0x32

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/appsflyer/internal/AFa1cSDK$3;->getMediationNetwork:Lcom/appsflyer/internal/AFf1gSDK;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1cSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFa1cSDK;

    .line 16
    .line 17
    iget-object p1, p0, Lcom/appsflyer/internal/AFa1cSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/appsflyer/internal/AFa1cSDK;->getMediationNetwork:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1cSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-static {v1, p1, v0, p0, p2}, Lcom/appsflyer/internal/AFa1cSDK;->getMediationNetwork(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final onSuccess()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFa1cSDK$3;->getMediationNetwork:Lcom/appsflyer/internal/AFf1gSDK;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFe1kSDK;->getBody()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/String;

    .line 10
    .line 11
    new-instance v1, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "Validate response ok: "

    .line 17
    .line 18
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v0, "result"

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v2, p0, Lcom/appsflyer/internal/AFa1cSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFa1cSDK;

    .line 36
    .line 37
    iget-object v3, v2, Lcom/appsflyer/internal/AFa1cSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v4, v2, Lcom/appsflyer/internal/AFa1cSDK;->getMediationNetwork:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/appsflyer/internal/AFa1cSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v0, v3, v4, v2, v1}, Lcom/appsflyer/internal/AFa1cSDK;->getMediationNetwork(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catch_0
    move-exception v0

    .line 52
    const-string v1, "Failed Validate request: "

    .line 53
    .line 54
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1cSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFa1cSDK;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/appsflyer/internal/AFa1cSDK;->getCurrencyIso4217Code:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v2, p0, Lcom/appsflyer/internal/AFa1cSDK;->getMediationNetwork:Ljava/lang/String;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/appsflyer/internal/AFa1cSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v3, 0x0

    .line 78
    invoke-static {v3, v1, v2, p0, v0}, Lcom/appsflyer/internal/AFa1cSDK;->getMediationNetwork(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

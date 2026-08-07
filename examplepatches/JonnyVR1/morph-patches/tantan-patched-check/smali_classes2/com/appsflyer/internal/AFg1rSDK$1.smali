.class public final Lcom/appsflyer/internal/AFg1rSDK$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFg1sSDK$AFa1ySDK;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFg1rSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFg1rSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFg1rSDK$1;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final AFAdRevenueData(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1rSDK$1;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;

    .line 2
    .line 3
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v1, v0, Lcom/appsflyer/internal/AFg1rSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const-string v0, "unknown"

    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/AFg1rSDK$1;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFg1rSDK;->getMediationNetwork()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1rSDK$1;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1rSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 26
    .line 27
    const-string v1, "error"

    .line 28
    .line 29
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-static {p1, p2, v0, v0, p0}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;ZZZ)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final getCurrencyIso4217Code(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1rSDK$1;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;

    .line 2
    .line 3
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v1, v0, Lcom/appsflyer/internal/AFg1rSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/appsflyer/internal/AFg1rSDK$1;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/appsflyer/internal/AFg1rSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 13
    .line 14
    const-string v1, "signedData"

    .line 15
    .line 16
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/appsflyer/internal/AFg1rSDK$1;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/appsflyer/internal/AFg1rSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 22
    .line 23
    const-string v0, "signature"

    .line 24
    .line 25
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/appsflyer/internal/AFg1rSDK$1;->AFAdRevenueData:Lcom/appsflyer/internal/AFg1rSDK;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFg1rSDK;->getMediationNetwork()V

    .line 31
    .line 32
    .line 33
    const-string p0, "Successfully retrieved Google LVL data."

    .line 34
    .line 35
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.class final Lcom/appsflyer/internal/AFj1tSDK$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFj1tSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFj1tSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/appsflyer/internal/AFj1tSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFj1tSDK;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/appsflyer/internal/AFj1tSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFj1tSDK;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/appsflyer/internal/AFj1tSDK;->H_(Lcom/appsflyer/internal/AFj1tSDK;)Landroid/os/Handler;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 23
    .line 24
    invoke-static {v2}, Lcom/appsflyer/internal/AFj1tSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFj1tSDK;)Ljava/lang/Runnable;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/appsflyer/internal/AFj1tSDK;->H_(Lcom/appsflyer/internal/AFj1tSDK;)Landroid/os/Handler;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v2, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/appsflyer/internal/AFj1tSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFj1tSDK;)Ljava/lang/Runnable;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFj1tSDK;->AFAdRevenueData()V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/appsflyer/internal/AFj1tSDK$5;->getMediationNetwork:Lcom/appsflyer/internal/AFj1tSDK;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-static {p0, v1}, Lcom/appsflyer/internal/AFj1tSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFj1tSDK;Z)Z

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    return-void

    .line 62
    :goto_1
    monitor-exit v0

    .line 63
    throw p0
.end method

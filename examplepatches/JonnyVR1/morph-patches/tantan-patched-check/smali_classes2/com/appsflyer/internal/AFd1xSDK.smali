.class public final Lcom/appsflyer/internal/AFd1xSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFd1wSDK;


# instance fields
.field private final AFAdRevenueData:Ljava/util/concurrent/ScheduledExecutorService;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getCurrencyIso4217Code:Lcom/appsflyer/internal/AFc1sSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getMediationNetwork:Ljava/util/concurrent/Executor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getMonetizationNetwork:Lcom/appsflyer/internal/AFi1pSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private getRevenue:Lcom/appsflyer/internal/AFd1ySDK;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Lcom/appsflyer/internal/AFc1sSDK;Lcom/appsflyer/internal/AFi1pSDK;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/ScheduledExecutorService;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/appsflyer/internal/AFc1sSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lcom/appsflyer/internal/AFi1pSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1xSDK;->getMediationNetwork:Ljava/util/concurrent/Executor;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/appsflyer/internal/AFd1xSDK;->AFAdRevenueData:Ljava/util/concurrent/ScheduledExecutorService;

    .line 19
    .line 20
    iput-object p3, p0, Lcom/appsflyer/internal/AFd1xSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFc1sSDK;

    .line 21
    .line 22
    iput-object p4, p0, Lcom/appsflyer/internal/AFd1xSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFi1pSDK;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final AFAdRevenueData()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1xSDK;->getRevenue:Lcom/appsflyer/internal/AFd1ySDK;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1ySDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFd1wSDK$AFa1zSDK;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1wSDK$AFa1zSDK;->getMonetizationNetwork()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final getCurrencyIso4217Code(Landroid/content/Context;Lcom/appsflyer/internal/AFd1wSDK$AFa1zSDK;)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFd1wSDK$AFa1zSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/appsflyer/internal/AFd1xSDK;->getRevenue:Lcom/appsflyer/internal/AFd1ySDK;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    check-cast v0, Landroid/app/Application;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/appsflyer/internal/AFd1xSDK;->getRevenue:Lcom/appsflyer/internal/AFd1ySDK;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p0, "null cannot be cast to non-null type android.app.Application"

    .line 29
    .line 30
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/appsflyer/internal/AFd1xSDK;->getRevenue:Lcom/appsflyer/internal/AFd1ySDK;

    .line 36
    .line 37
    new-instance v1, Lcom/appsflyer/internal/AFd1ySDK;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/appsflyer/internal/AFd1xSDK;->getMediationNetwork:Ljava/util/concurrent/Executor;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/appsflyer/internal/AFd1xSDK;->AFAdRevenueData:Ljava/util/concurrent/ScheduledExecutorService;

    .line 42
    .line 43
    iget-object v4, p0, Lcom/appsflyer/internal/AFd1xSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFc1sSDK;

    .line 44
    .line 45
    iget-object v5, p0, Lcom/appsflyer/internal/AFd1xSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFi1pSDK;

    .line 46
    .line 47
    move-object v6, p2

    .line 48
    invoke-direct/range {v1 .. v6}, Lcom/appsflyer/internal/AFd1ySDK;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Lcom/appsflyer/internal/AFc1sSDK;Lcom/appsflyer/internal/AFi1pSDK;Lcom/appsflyer/internal/AFd1wSDK$AFa1zSDK;)V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lcom/appsflyer/internal/AFd1xSDK;->getRevenue:Lcom/appsflyer/internal/AFd1ySDK;

    .line 52
    .line 53
    instance-of p2, p1, Landroid/app/Activity;

    .line 54
    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    move-object p2, p1

    .line 58
    check-cast p2, Landroid/app/Activity;

    .line 59
    .line 60
    invoke-virtual {v1, p2}, Lcom/appsflyer/internal/AFd1ySDK;->onActivityResumed(Landroid/app/Activity;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    invoke-static {p1}, Lcom/appsflyer/internal/AFb1vSDK;->f_(Landroid/content/Context;)Landroid/app/Application;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1xSDK;->getRevenue:Lcom/appsflyer/internal/AFd1ySDK;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    return-void
.end method

.method public final getCurrencyIso4217Code()Z
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1xSDK;->getRevenue:Lcom/appsflyer/internal/AFd1ySDK;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

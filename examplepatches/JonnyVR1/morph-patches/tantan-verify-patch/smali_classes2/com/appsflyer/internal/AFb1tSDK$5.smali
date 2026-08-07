.class final Lcom/appsflyer/internal/AFb1tSDK$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFd1wSDK$AFa1zSDK;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/AFb1tSDK;->start(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic AFAdRevenueData:Lcom/appsflyer/internal/AFh1qSDK;

.field private synthetic getMonetizationNetwork:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

.field private synthetic getRevenue:Lcom/appsflyer/internal/AFb1tSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFb1tSDK;Lcom/appsflyer/internal/AFh1qSDK;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->AFAdRevenueData:Lcom/appsflyer/internal/AFh1qSDK;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getMonetizationNetwork:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final getMediationNetwork(Lcom/appsflyer/internal/AFh1sSDK;)V
    .locals 5
    .param p1    # Lcom/appsflyer/internal/AFh1sSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->AFAdRevenueData:Lcom/appsflyer/internal/AFh1qSDK;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFh1qSDK;->getRevenue()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->component2()Lcom/appsflyer/internal/AFg1wSDK;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 17
    .line 18
    invoke-static {v2}, Lcom/appsflyer/internal/AFb1tSDK;->AFAdRevenueData(Lcom/appsflyer/internal/AFb1tSDK;)Lcom/appsflyer/internal/AFg1ySDK;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Lcom/appsflyer/internal/AFg1wSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFg1ySDK;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getRevenue(Lcom/appsflyer/internal/AFb1tSDK;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1pSDK;->getRevenue:Lcom/appsflyer/internal/AFd1rSDK;

    .line 35
    .line 36
    const-string v2, "appsFlyerCount"

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-interface {v1, v2, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getMonetizationNetwork(Ljava/lang/String;I)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const-string v2, "onBecameForeground"

    .line 44
    .line 45
    invoke-static {v2}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    if-ge v1, v2, :cond_0

    .line 50
    .line 51
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->component1()Lcom/appsflyer/internal/AFj1uSDK;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {v1}, Lcom/appsflyer/internal/AFj1uSDK;->getRevenue()V

    .line 62
    .line 63
    .line 64
    :cond_0
    new-instance v1, Lcom/appsflyer/internal/AFh1mSDK;

    .line 65
    .line 66
    invoke-direct {v1}, Lcom/appsflyer/internal/AFh1mSDK;-><init>()V

    .line 67
    .line 68
    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    iget-object v2, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-interface {v2}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {v1}, Lcom/appsflyer/internal/AFc1kSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFa1mSDK;)Lcom/appsflyer/internal/AFc1kSDK;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    iget-object v4, p1, Lcom/appsflyer/internal/AFh1sSDK;->getRevenue:Landroid/content/Intent;

    .line 86
    .line 87
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 92
    .line 93
    invoke-virtual {v2, v3, v4, v0}, Lcom/appsflyer/internal/AFc1sSDK;->p_(Lcom/appsflyer/internal/AFc1kSDK;Landroid/content/Intent;Landroid/content/Context;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getMonetizationNetwork:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 99
    .line 100
    iput-object p0, v1, Lcom/appsflyer/internal/AFa1mSDK;->getRevenue:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 101
    .line 102
    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/internal/AFb1tSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFh1sSDK;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final getMonetizationNetwork()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 12
    .line 13
    const-string v1, "onBecameBackground"

    .line 14
    .line 15
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->AFAdRevenueData:Lcom/appsflyer/internal/AFh1qSDK;

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    iget-wide v4, v1, Lcom/appsflyer/internal/AFh1qSDK;->component1:J

    .line 25
    .line 26
    const-wide/16 v6, 0x0

    .line 27
    .line 28
    cmp-long v8, v4, v6

    .line 29
    .line 30
    if-eqz v8, :cond_1

    .line 31
    .line 32
    sub-long/2addr v2, v4

    .line 33
    cmp-long v4, v2, v6

    .line 34
    .line 35
    const-wide/16 v5, 0x3e8

    .line 36
    .line 37
    if-lez v4, :cond_0

    .line 38
    .line 39
    cmp-long v4, v2, v5

    .line 40
    .line 41
    if-gez v4, :cond_0

    .line 42
    .line 43
    move-wide v2, v5

    .line 44
    :cond_0
    div-long/2addr v2, v5

    .line 45
    iput-wide v2, v1, Lcom/appsflyer/internal/AFh1qSDK;->hashCode:J

    .line 46
    .line 47
    iget-object v1, v1, Lcom/appsflyer/internal/AFh1qSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 48
    .line 49
    const-string v4, "prev_session_dur"

    .line 50
    .line 51
    invoke-interface {v1, v4, v2, v3}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;J)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const-string v1, "Metrics: fg ts is missing"

    .line 56
    .line 57
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    const-string v1, "callStatsBackground background call"

    .line 61
    .line 62
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->afDebugLog()Lcom/appsflyer/internal/AFd1bSDK;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1bSDK;->getMonetizationNetwork()V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->copydefault()Lcom/appsflyer/internal/AFb1bSDK;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-interface {v1}, Lcom/appsflyer/internal/AFb1bSDK;->component2()Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-eqz v2, :cond_3

    .line 93
    .line 94
    invoke-interface {v1}, Lcom/appsflyer/internal/AFb1bSDK;->getMonetizationNetwork()V

    .line 95
    .line 96
    .line 97
    if-eqz v0, :cond_2

    .line 98
    .line 99
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-nez v2, :cond_2

    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-interface {v1, v2, v0}, Lcom/appsflyer/internal/AFb1bSDK;->m_(Ljava/lang/String;Landroid/content/pm/PackageManager;)V

    .line 118
    .line 119
    .line 120
    :cond_2
    invoke-interface {v1}, Lcom/appsflyer/internal/AFb1bSDK;->AFAdRevenueData()V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    const-string v0, "RD status is OFF"

    .line 125
    .line 126
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->afDebugLog(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    :goto_1
    iget-object v0, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->component1()Lcom/appsflyer/internal/AFj1uSDK;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0}, Lcom/appsflyer/internal/AFj1uSDK;->getCurrencyIso4217Code()V

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Lcom/appsflyer/internal/AFb1tSDK$5;->getRevenue:Lcom/appsflyer/internal/AFb1tSDK;

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFb1tSDK;->getCurrencyIso4217Code()Lcom/appsflyer/internal/AFd1fSDK;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-interface {p0}, Lcom/appsflyer/internal/AFd1fSDK;->w()Lcom/appsflyer/internal/AFc1oSDK;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-interface {p0}, Lcom/appsflyer/internal/AFc1oSDK;->getCurrencyIso4217Code()V

    .line 153
    .line 154
    .line 155
    return-void
.end method

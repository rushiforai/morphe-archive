.class public final Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/appsflyer/internal/AFa1rSDK$AFa1tSDK;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/AFd1zSDK;->getRevenue()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private synthetic getMediationNetwork:J

.field private synthetic getRevenue:Lcom/appsflyer/internal/AFd1zSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFd1zSDK;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFd1zSDK;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getMediationNetwork:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final getMonetizationNetwork(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "link"

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    const-string v1, "Facebook Deferred AppLink data received: "

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->afInfoLog(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFd1zSDK;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/appsflyer/internal/AFd1zSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    :cond_0
    if-eqz p2, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFd1zSDK;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/appsflyer/internal/AFd1zSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    const-string v0, "target_url"

    .line 32
    .line 33
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    :cond_1
    if-eqz p3, :cond_3

    .line 37
    .line 38
    iget-object p1, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFd1zSDK;

    .line 39
    .line 40
    new-instance p2, Ljava/util/LinkedHashMap;

    .line 41
    .line 42
    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v1, "promo_code"

    .line 51
    .line 52
    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    const-string p3, "deeplink_context"

    .line 56
    .line 57
    invoke-interface {p2, p3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    iget-object p1, p1, Lcom/appsflyer/internal/AFd1zSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    const-string p3, "extras"

    .line 65
    .line 66
    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    iget-object p1, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFd1zSDK;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/appsflyer/internal/AFd1zSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 73
    .line 74
    if-eqz p1, :cond_3

    .line 75
    .line 76
    const-string p2, ""

    .line 77
    .line 78
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 82
    .line 83
    .line 84
    move-result-wide p1

    .line 85
    iget-wide v0, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getMediationNetwork:J

    .line 86
    .line 87
    sub-long/2addr p1, v0

    .line 88
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFd1zSDK;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1zSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 95
    .line 96
    if-eqz p0, :cond_4

    .line 97
    .line 98
    const-string p2, "ttr"

    .line 99
    .line 100
    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    :cond_4
    return-void
.end method

.method public final getRevenue(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1zSDK$AFa1ySDK;->getRevenue:Lcom/appsflyer/internal/AFd1zSDK;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/appsflyer/internal/AFd1zSDK;->getMonetizationNetwork:Ljava/util/Map;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string v0, "error"

    .line 8
    .line 9
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

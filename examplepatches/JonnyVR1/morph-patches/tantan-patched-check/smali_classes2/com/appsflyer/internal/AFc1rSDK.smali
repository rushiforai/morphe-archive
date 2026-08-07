.class public final Lcom/appsflyer/internal/AFc1rSDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final AFAdRevenueData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final getMediationNetwork:Lcom/appsflyer/internal/AFa1mSDK;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFd1fSDK;Lcom/appsflyer/internal/AFa1mSDK;Ljava/util/Map;)V
    .locals 0
    .param p1    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFa1mSDK;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/AFd1fSDK;",
            "Lcom/appsflyer/internal/AFa1mSDK;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/appsflyer/internal/AFc1rSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/appsflyer/internal/AFc1rSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1rSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFa1mSDK;->AFAdRevenueData()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/appsflyer/internal/AFf1dSDK;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/appsflyer/internal/AFc1rSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Lcom/appsflyer/internal/AFf1dSDK;-><init>(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/appsflyer/internal/AFc1rSDK;->AFAdRevenueData:Ljava/util/Map;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/appsflyer/internal/AFf1dSDK;->hashCode:Ljava/util/Map;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1rSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

    .line 24
    .line 25
    instance-of v0, v0, Lcom/appsflyer/internal/AFh1rSDK;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Lcom/appsflyer/internal/AFf1eSDK;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/appsflyer/internal/AFc1rSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

    .line 32
    .line 33
    check-cast v1, Lcom/appsflyer/internal/AFh1rSDK;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 36
    .line 37
    invoke-direct {v0, v1, v2}, Lcom/appsflyer/internal/AFf1eSDK;-><init>(Lcom/appsflyer/internal/AFh1rSDK;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    new-instance v0, Lcom/appsflyer/internal/AFf1gSDK;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/appsflyer/internal/AFc1rSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFa1mSDK;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 46
    .line 47
    invoke-direct {v0, v1, v2}, Lcom/appsflyer/internal/AFf1gSDK;-><init>(Lcom/appsflyer/internal/AFa1mSDK;Lcom/appsflyer/internal/AFd1fSDK;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object v1, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 51
    .line 52
    invoke-interface {v1}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v2, v1, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 57
    .line 58
    new-instance v3, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 59
    .line 60
    invoke-direct {v3, v1, v0}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, v0, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 67
    .line 68
    sget-object v1, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 69
    .line 70
    if-ne v0, v1, :cond_2

    .line 71
    .line 72
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 73
    .line 74
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->values()Lcom/appsflyer/internal/AFe1fSDK;

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/appsflyer/internal/AFe1fSDK;->AFAdRevenueData()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 84
    .line 85
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->valueOf()Lcom/appsflyer/internal/AFd1kSDK;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v0, v0, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/appsflyer/internal/AFb1vSDK;->AFAdRevenueData(Landroid/content/Context;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 98
    .line 99
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->copy()Lcom/appsflyer/internal/AFe1aSDK;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Lcom/appsflyer/internal/AFf1jSDK;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/appsflyer/internal/AFc1rSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFd1fSDK;

    .line 106
    .line 107
    const-string v2, "install"

    .line 108
    .line 109
    invoke-direct {v1, p0, v2}, Lcom/appsflyer/internal/AFf1jSDK;-><init>(Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, v0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 113
    .line 114
    new-instance v2, Lcom/appsflyer/internal/AFe1aSDK$5;

    .line 115
    .line 116
    invoke-direct {v2, v0, v1}, Lcom/appsflyer/internal/AFe1aSDK$5;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 117
    .line 118
    .line 119
    invoke-interface {p0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    return-void
.end method

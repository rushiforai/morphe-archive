.class final Lcom/appsflyer/internal/AFe1aSDK$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/AFe1aSDK;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

.field private synthetic getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

.field private synthetic getRevenue:Lcom/appsflyer/internal/AFe1aSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;Lcom/appsflyer/internal/AFe1dSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 2
    .line 3
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "execution finished for "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v3, ", result: "

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1aSDK;->component3:Ljava/util/Set;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 39
    .line 40
    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1aSDK;->getCurrencyIso4217Code:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lcom/appsflyer/internal/AFe1eSDK;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 64
    .line 65
    iget-object v3, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 66
    .line 67
    invoke-interface {v1, v2, v3}, Lcom/appsflyer/internal/AFe1eSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFf1wSDK;Lcom/appsflyer/internal/AFe1dSDK;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 72
    .line 73
    sget-object v1, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 74
    .line 75
    if-ne v0, v1, :cond_1

    .line 76
    .line 77
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1aSDK;->getMediationNetwork:Ljava/util/Set;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 84
    .line 85
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 89
    .line 90
    invoke-static {p0}, Lcom/appsflyer/internal/AFe1aSDK;->getRevenue(Lcom/appsflyer/internal/AFe1aSDK;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 101
    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/appsflyer/internal/AFe1aSDK;->getMediationNetwork(Lcom/appsflyer/internal/AFf1wSDK;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_3

    .line 111
    .line 112
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 115
    .line 116
    monitor-enter v0

    .line 117
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/appsflyer/internal/AFe1aSDK;->component4:Ljava/util/List;

    .line 120
    .line 121
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 122
    .line 123
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 127
    .line 128
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK;->getCurrencyIso4217Code:Ljava/util/List;

    .line 129
    .line 130
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-eqz v1, :cond_2

    .line 139
    .line 140
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Lcom/appsflyer/internal/AFe1eSDK;

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :catchall_0
    move-exception p0

    .line 148
    goto :goto_2

    .line 149
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    return-void

    .line 151
    :goto_2
    monitor-exit v0

    .line 152
    throw p0

    .line 153
    :cond_3
    return-void

    .line 154
    :cond_4
    iget-object v0, v1, Lcom/appsflyer/internal/AFe1aSDK;->getMediationNetwork:Ljava/util/Set;

    .line 155
    .line 156
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getMediationNetwork:Lcom/appsflyer/internal/AFf1wSDK;

    .line 157
    .line 158
    iget-object v1, v1, Lcom/appsflyer/internal/AFf1wSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 159
    .line 160
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$4;->getRevenue:Lcom/appsflyer/internal/AFe1aSDK;

    .line 164
    .line 165
    invoke-static {p0}, Lcom/appsflyer/internal/AFe1aSDK;->getRevenue(Lcom/appsflyer/internal/AFe1aSDK;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

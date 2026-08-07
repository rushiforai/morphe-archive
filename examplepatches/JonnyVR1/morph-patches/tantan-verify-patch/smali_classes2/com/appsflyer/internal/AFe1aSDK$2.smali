.class final Lcom/appsflyer/internal/AFe1aSDK$2;
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
.field private synthetic getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFe1aSDK;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

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
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/NavigableSet;->pollFirst()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/appsflyer/internal/AFf1wSDK;

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/appsflyer/internal/AFe1aSDK;->component3:Ljava/util/Set;

    .line 26
    .line 27
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFf1wSDK;->getRevenue()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    new-instance v0, Lcom/appsflyer/internal/AFf1xSDK;

    .line 36
    .line 37
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-direct {v0, v4}, Lcom/appsflyer/internal/AFf1xSDK;-><init>(Ljava/lang/Thread;)V

    .line 42
    .line 43
    .line 44
    const-wide/16 v4, 0x0

    .line 45
    .line 46
    cmp-long v4, v2, v4

    .line 47
    .line 48
    if-lez v4, :cond_1

    .line 49
    .line 50
    iget-object v4, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 51
    .line 52
    iget-object v4, v4, Lcom/appsflyer/internal/AFe1aSDK;->getRevenue:Ljava/util/Timer;

    .line 53
    .line 54
    invoke-virtual {v4, v0, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 58
    .line 59
    iget-object v3, v2, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 60
    .line 61
    new-instance v4, Lcom/appsflyer/internal/AFe1aSDK$1;

    .line 62
    .line 63
    invoke-direct {v4, v2, v1}, Lcom/appsflyer/internal/AFe1aSDK$1;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {v3, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 70
    .line 71
    iget-object v2, v2, Lcom/appsflyer/internal/AFe1aSDK;->component1:Ljava/util/NavigableSet;

    .line 72
    .line 73
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_2

    .line 78
    .line 79
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 80
    .line 81
    iget-object v3, v2, Lcom/appsflyer/internal/AFe1aSDK;->getMonetizationNetwork:Ljava/util/concurrent/ExecutorService;

    .line 82
    .line 83
    new-instance v4, Lcom/appsflyer/internal/AFe1aSDK$2;

    .line 84
    .line 85
    invoke-direct {v4, v2}, Lcom/appsflyer/internal/AFe1aSDK$2;-><init>(Lcom/appsflyer/internal/AFe1aSDK;)V

    .line 86
    .line 87
    .line 88
    invoke-interface {v3, v4}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 89
    .line 90
    .line 91
    :cond_2
    :try_start_1
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 92
    .line 93
    sget-object v3, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 94
    .line 95
    const-string v4, "starting task execution: "

    .line 96
    .line 97
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-virtual {v2, v3, v4}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFf1wSDK;->component4()Lcom/appsflyer/internal/AFe1dSDK;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 113
    .line 114
    .line 115
    iget-object v3, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 116
    .line 117
    iget-object v4, v3, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 118
    .line 119
    new-instance v5, Lcom/appsflyer/internal/AFe1aSDK$4;

    .line 120
    .line 121
    invoke-direct {v5, v3, v1, v2}, Lcom/appsflyer/internal/AFe1aSDK$4;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;Lcom/appsflyer/internal/AFe1dSDK;)V

    .line 122
    .line 123
    .line 124
    invoke-interface {v4, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/InterruptedIOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :catchall_1
    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 129
    .line 130
    .line 131
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 132
    .line 133
    sget-object v0, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;

    .line 134
    .line 135
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 136
    .line 137
    new-instance v3, Lcom/appsflyer/internal/AFe1aSDK$4;

    .line 138
    .line 139
    invoke-direct {v3, p0, v1, v0}, Lcom/appsflyer/internal/AFe1aSDK$4;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;Lcom/appsflyer/internal/AFe1dSDK;)V

    .line 140
    .line 141
    .line 142
    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :catch_0
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 147
    .line 148
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->component1:Lcom/appsflyer/internal/AFg1cSDK;

    .line 149
    .line 150
    const-string v3, "task was interrupted: "

    .line 151
    .line 152
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-virtual {v0, v2, v3}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    sget-object v0, Lcom/appsflyer/internal/AFe1dSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1dSDK;

    .line 164
    .line 165
    iput-object v0, v1, Lcom/appsflyer/internal/AFf1wSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/appsflyer/internal/AFe1aSDK$2;->getMediationNetwork:Lcom/appsflyer/internal/AFe1aSDK;

    .line 168
    .line 169
    iget-object v2, p0, Lcom/appsflyer/internal/AFe1aSDK;->AFAdRevenueData:Ljava/util/concurrent/Executor;

    .line 170
    .line 171
    new-instance v3, Lcom/appsflyer/internal/AFe1aSDK$4;

    .line 172
    .line 173
    invoke-direct {v3, p0, v1, v0}, Lcom/appsflyer/internal/AFe1aSDK$4;-><init>(Lcom/appsflyer/internal/AFe1aSDK;Lcom/appsflyer/internal/AFf1wSDK;Lcom/appsflyer/internal/AFe1dSDK;)V

    .line 174
    .line 175
    .line 176
    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :goto_0
    monitor-exit v0

    .line 181
    throw p0
.end method

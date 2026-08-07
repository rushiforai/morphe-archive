.class Lcom/immomo/mmdns/DNSLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mmdns/DNSLogger$Jsonable;,
        Lcom/immomo/mmdns/DNSLogger$RequestLog;,
        Lcom/immomo/mmdns/DNSLogger$RateLog;,
        Lcom/immomo/mmdns/DNSLogger$ParseLog;,
        Lcom/immomo/mmdns/DNSLogger$LogCallback;
    }
.end annotation


# static fields
.field private static final BUSINESS_DNS_PARSETIME:Ljava/lang/String; = "dns-time"

.field private static final BUSINESS_DNS_RATE:Ljava/lang/String; = "dns-rate"

.field private static final BUSINESS_DNS_REQUEST:Ljava/lang/String; = "dns-request"

.field private static final BUSINESS_DNS_RESULT:Ljava/lang/String; = "dns-result"

.field private static final PARSE_DOZEN_COUNT:I = 0x6

.field private static final REQUEST_DOZEN_COUNT:I = 0x5


# instance fields
.field private logCallback:Lcom/immomo/mmdns/DNSLogger$LogCallback;

.field private final parseLock:Ljava/lang/Object;

.field private parseLogs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mmdns/DNSLogger$ParseLog;",
            ">;"
        }
    .end annotation
.end field

.field private final rateLock:Ljava/lang/Object;

.field private rateLogs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mmdns/DNSLogger$RateLog;",
            ">;"
        }
    .end annotation
.end field

.field private final requestLock:Ljava/lang/Object;

.field private requestLogs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/mmdns/DNSLogger$RequestLog;",
            ">;"
        }
    .end annotation
.end field

.field private smartCount:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/16 v1, 0x14

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->parseLogs:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->rateLogs:Ljava/util/List;

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->requestLogs:Ljava/util/List;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/Object;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->parseLock:Ljava/lang/Object;

    .line 33
    .line 34
    new-instance v0, Ljava/lang/Object;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->rateLock:Ljava/lang/Object;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/Object;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->requestLock:Ljava/lang/Object;

    .line 47
    .line 48
    return-void
.end method

.method private processLogUpload(ILjava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "+",
            "Lcom/immomo/mmdns/DNSLogger$Jsonable;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lt v0, p1, :cond_1

    .line 6
    .line 7
    :try_start_0
    new-instance p1, Lorg/json/JSONArray;

    .line 8
    .line 9
    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/immomo/mmdns/DNSLogger$Jsonable;

    .line 27
    .line 28
    invoke-interface {v1}, Lcom/immomo/mmdns/DNSLogger$Jsonable;->toJson()Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_2

    .line 38
    :catch_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    iget-object p0, p0, Lcom/immomo/mmdns/DNSLogger;->logCallback:Lcom/immomo/mmdns/DNSLogger$LogCallback;

    .line 41
    .line 42
    invoke-interface {p0, p3, p1}, Lcom/immomo/mmdns/DNSLogger$LogCallback;->onLogOverflow(Ljava/lang/String;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    .line 45
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :goto_1
    :try_start_1
    const-string p1, "MMDNS"

    .line 50
    .line 51
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .line 53
    .line 54
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :goto_2
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 59
    .line 60
    .line 61
    throw p0

    .line 62
    :cond_1
    return-void
.end method


# virtual methods
.method public recordDnsResult(JLjava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->logCallback:Lcom/immomo/mmdns/DNSLogger$LogCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-wide v0, p0, Lcom/immomo/mmdns/DNSLogger;->smartCount:J

    .line 7
    .line 8
    const-wide v2, 0x7fffffffffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    const-wide/16 v1, 0x0

    .line 16
    .line 17
    if-ltz v0, :cond_1

    .line 18
    .line 19
    iput-wide v1, p0, Lcom/immomo/mmdns/DNSLogger;->smartCount:J

    .line 20
    .line 21
    :cond_1
    iget-wide v3, p0, Lcom/immomo/mmdns/DNSLogger;->smartCount:J

    .line 22
    .line 23
    const-wide/16 v5, 0x1

    .line 24
    .line 25
    add-long/2addr v3, v5

    .line 26
    iput-wide v3, p0, Lcom/immomo/mmdns/DNSLogger;->smartCount:J

    .line 27
    .line 28
    const-string v0, "live"

    .line 29
    .line 30
    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-wide v3, p0, Lcom/immomo/mmdns/DNSLogger;->smartCount:J

    .line 37
    .line 38
    const-wide/16 v5, 0x4

    .line 39
    .line 40
    rem-long/2addr v3, v5

    .line 41
    cmp-long v0, v3, v1

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    :goto_0
    return-void

    .line 46
    :cond_2
    new-instance v1, Lcom/immomo/mmdns/DNSLogger$ParseLog;

    .line 47
    .line 48
    move-object v2, p0

    .line 49
    move-wide v5, p1

    .line 50
    move-object v3, p3

    .line 51
    move-object v4, p4

    .line 52
    invoke-direct/range {v1 .. v6}, Lcom/immomo/mmdns/DNSLogger$ParseLog;-><init>(Lcom/immomo/mmdns/DNSLogger;Ljava/lang/String;Ljava/lang/String;J)V

    .line 53
    .line 54
    .line 55
    iget-object p0, v2, Lcom/immomo/mmdns/DNSLogger;->parseLock:Ljava/lang/Object;

    .line 56
    .line 57
    monitor-enter p0

    .line 58
    :try_start_0
    iget-object p1, v2, Lcom/immomo/mmdns/DNSLogger;->parseLogs:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    iget-object p1, v2, Lcom/immomo/mmdns/DNSLogger;->parseLogs:Ljava/util/List;

    .line 64
    .line 65
    const-string p2, "dns-time"

    .line 66
    .line 67
    const/4 p3, 0x6

    .line 68
    invoke-direct {v2, p3, p1, p2}, Lcom/immomo/mmdns/DNSLogger;->processLogUpload(ILjava/util/List;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 72
    iget-object p1, v2, Lcom/immomo/mmdns/DNSLogger;->rateLock:Ljava/lang/Object;

    .line 73
    .line 74
    monitor-enter p1

    .line 75
    :try_start_1
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    iget-object p2, v2, Lcom/immomo/mmdns/DNSLogger;->rateLogs:Ljava/util/List;

    .line 80
    .line 81
    if-eqz p0, :cond_3

    .line 82
    .line 83
    :try_start_2
    new-instance p0, Lcom/immomo/mmdns/DNSLogger$RateLog;

    .line 84
    .line 85
    const/4 p4, 0x0

    .line 86
    invoke-direct {p0, v2, v3, v4, p4}, Lcom/immomo/mmdns/DNSLogger$RateLog;-><init>(Lcom/immomo/mmdns/DNSLogger;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :catchall_0
    move-exception v0

    .line 94
    move-object p0, v0

    .line 95
    goto :goto_2

    .line 96
    :cond_3
    new-instance p0, Lcom/immomo/mmdns/DNSLogger$RateLog;

    .line 97
    .line 98
    const/4 p4, 0x1

    .line 99
    invoke-direct {p0, v2, v3, v4, p4}, Lcom/immomo/mmdns/DNSLogger$RateLog;-><init>(Lcom/immomo/mmdns/DNSLogger;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 100
    .line 101
    .line 102
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :goto_1
    iget-object p0, v2, Lcom/immomo/mmdns/DNSLogger;->rateLogs:Ljava/util/List;

    .line 106
    .line 107
    const-string p2, "dns-rate"

    .line 108
    .line 109
    invoke-direct {v2, p3, p0, p2}, Lcom/immomo/mmdns/DNSLogger;->processLogUpload(ILjava/util/List;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    monitor-exit p1

    .line 113
    return-void

    .line 114
    :goto_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 115
    throw p0

    .line 116
    :catchall_1
    move-exception v0

    .line 117
    move-object p1, v0

    .line 118
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 119
    throw p1
.end method

.method public recordRequestLog(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->logCallback:Lcom/immomo/mmdns/DNSLogger$LogCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/immomo/mmdns/DNSLogger;->requestLock:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->requestLogs:Ljava/util/List;

    .line 10
    .line 11
    new-instance v2, Lcom/immomo/mmdns/DNSLogger$RequestLog;

    .line 12
    .line 13
    move-object v3, p0

    .line 14
    move-object v4, p1

    .line 15
    move-object v5, p2

    .line 16
    move-wide v6, p3

    .line 17
    invoke-direct/range {v2 .. v7}, Lcom/immomo/mmdns/DNSLogger$RequestLog;-><init>(Lcom/immomo/mmdns/DNSLogger;Ljava/lang/String;Ljava/lang/String;J)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object p0, v3, Lcom/immomo/mmdns/DNSLogger;->requestLogs:Ljava/util/List;

    .line 24
    .line 25
    const-string p1, "dns-request"

    .line 26
    .line 27
    const/4 p2, 0x5

    .line 28
    invoke-direct {v3, p2, p0, p1}, Lcom/immomo/mmdns/DNSLogger;->processLogUpload(ILjava/util/List;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    monitor-exit v1

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method

.method public recordSingleLog(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/mmdns/DNSLogger;->logCallback:Lcom/immomo/mmdns/DNSLogger$LogCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/util/Map$Entry;

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object p0, p0, Lcom/immomo/mmdns/DNSLogger;->logCallback:Lcom/immomo/mmdns/DNSLogger$LogCallback;

    .line 46
    .line 47
    invoke-interface {p0, p1, v0}, Lcom/immomo/mmdns/DNSLogger$LogCallback;->onLog(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catch_0
    move-exception p0

    .line 52
    const-string p1, "MMDNS"

    .line 53
    .line 54
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public setLogCallback(Lcom/immomo/mmdns/DNSLogger$LogCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mmdns/DNSLogger;->logCallback:Lcom/immomo/mmdns/DNSLogger$LogCallback;

    .line 2
    .line 3
    return-void
.end method

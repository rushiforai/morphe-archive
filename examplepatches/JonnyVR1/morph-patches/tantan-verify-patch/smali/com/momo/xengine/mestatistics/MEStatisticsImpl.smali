.class final Lcom/momo/xengine/mestatistics/MEStatisticsImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/mestatistics/MEStatistics;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xengine/mestatistics/MEStatisticsImpl$Holder;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private final reportCache:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xengine/mestatistics/StatisticalValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->reportCache:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static getInstance()Lcom/momo/xengine/mestatistics/MEStatisticsImpl;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl$Holder;->instance:Lcom/momo/xengine/mestatistics/MEStatisticsImpl;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public flush()V
    .locals 3

    return-void

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->context:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v0, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->reportCache:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Lcom/momo/xengine/mestatistics/StatisticalEvent;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/momo/xengine/mestatistics/StatisticalEvent;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->reportCache:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/momo/xengine/mestatistics/StatisticalValue;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->addValue(Lcom/momo/xengine/mestatistics/StatisticalValue;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    goto :goto_2

    .line 43
    :cond_0
    iget-object v1, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->reportCache:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    const/4 v0, 0x0

    .line 50
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-static {v0}, Lcom/momo/xengine/mestatistics/Server;->send(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    throw v0

    .line 59
    :cond_2
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->context:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->setup(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public realTimeReport(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V
    .locals 6

    return-void

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->realTimeReport(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method public realTimeReport(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V
    .locals 6

    return-void

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->context:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/xengine/mestatistics/StatisticalEvent;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momo/xengine/mestatistics/StatisticalEvent;-><init>()V

    .line 8
    .line 9
    .line 10
    move-object v1, p1

    .line 11
    move-object v2, p2

    .line 12
    move-wide v3, p3

    .line 13
    move-object v5, p5

    .line 14
    invoke-virtual/range {v0 .. v5}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->addValue(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lcom/momo/xengine/mestatistics/Server;->send(Lcom/momo/xengine/mestatistics/StatisticalEvent;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public report(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V
    .locals 6

    return-void

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    .line 31
    invoke-virtual/range {v0 .. v5}, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->report(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method public report(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V
    .locals 1

    return-void

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->context:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Lcom/momo/xengine/mestatistics/StatisticalValue;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/momo/xengine/mestatistics/StatisticalValue;-><init>(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V

    .line 8
    .line 9
    .line 10
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, p5}, Lcom/momo/xengine/mestatistics/StatisticalValue;->setExtend(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    monitor-enter p0

    .line 20
    :try_start_0
    iget-object p1, p0, Lcom/momo/xengine/mestatistics/MEStatisticsImpl;->reportCache:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p1

    .line 30
    :cond_1
    return-void
.end method

.method public setMMCVVersion(I)V
    .locals 0

    return-void

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->setMmcvVersion(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMagicEffectVersion(I)V
    .locals 0

    return-void

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->setMagicEffectVersion(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setRecorderSDKVersion(I)V
    .locals 0

    return-void

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->setRecorderSDKVersion(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setUID(Ljava/lang/String;)V
    .locals 0

    return-void

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->setUid(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setXEngineVersion(I)V
    .locals 0

    return-void

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->setEngineVersion(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

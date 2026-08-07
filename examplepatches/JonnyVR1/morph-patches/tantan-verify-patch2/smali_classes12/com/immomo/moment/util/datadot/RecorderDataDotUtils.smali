.class public Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static volatile instance:Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;
    .locals 2

    .line 1
    sget-object v0, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->instance:Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->instance:Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->instance:Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->instance:Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/momo/xengine/mestatistics/MEStatistics;->getInstance()Lcom/momo/xengine/mestatistics/MEStatistics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/momo/xengine/mestatistics/MEStatistics;->flush()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public realTimeReport(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 9
    invoke-static {}, Lcom/momo/xengine/mestatistics/MEStatistics;->getInstance()Lcom/momo/xengine/mestatistics/MEStatistics;

    move-result-object p0

    invoke-interface/range {p0 .. p5}, Lcom/momo/xengine/mestatistics/MEStatistics;->realTimeReport(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method public realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/momo/xengine/mestatistics/MEStatistics;->getInstance()Lcom/momo/xengine/mestatistics/MEStatistics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p4, p1, p2, p3}, Lcom/momo/xengine/mestatistics/MEStatistics;->realTimeReport(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public report(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/momo/xengine/mestatistics/MEStatistics;->getInstance()Lcom/momo/xengine/mestatistics/MEStatistics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p4, p1, p2, p3}, Lcom/momo/xengine/mestatistics/MEStatistics;->report(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

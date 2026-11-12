.class public final Lw9p;
.super Lexg;
.source "SourceFile"


# instance fields
.field public b:J

.field public c:J


# virtual methods
.method public final declared-synchronized C()V
    .registers 7

    monitor-enter p0

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lw9p;->b:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_f

    iput-wide v0, p0, Lw9p;->b:J

    :cond_f
    iput-wide v0, p0, Lw9p;->c:J
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_15

    monitor-exit p0

    return-void

    :goto_13
    :try_start_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_15

    throw v0

    :catchall_15
    move-exception v0

    goto :goto_13
.end method

.class public abstract Lcom/google/common/util/concurrent/RateLimiter;
.super Ljava/lang/Object;
.source "RateLimiter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;
    }
.end annotation


# instance fields
.field private volatile mutexDoNotUseDirectly:Ljava/lang/Object;

.field private final stopwatch:Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stopwatch"
        }
    .end annotation

    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 238
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    iput-object p1, p0, Lcom/google/common/util/concurrent/RateLimiter;->stopwatch:Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    return-void
.end method

.method private canAcquire(JJ)Z
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "nowMicros",
            "timeoutMicros"
        }
    .end annotation

    .line 430
    invoke-virtual {p0, p1, p2}, Lcom/google/common/util/concurrent/RateLimiter;->queryEarliestAvailable(J)J

    move-result-wide v0

    sub-long/2addr v0, p3

    cmp-long p0, v0, p1

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static checkPermits(I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permits"
        }
    .end annotation

    if-lez p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 498
    :goto_0
    const-string v1, "Requested permits (%s) must be positive"

    invoke-static {v0, v1, p0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    return-void
.end method

.method public static create(D)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permitsPerSecond"
        }
    .end annotation

    .line 133
    invoke-static {}, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;->createFromSystemTimer()Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/google/common/util/concurrent/RateLimiter;->create(DLcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;)Lcom/google/common/util/concurrent/RateLimiter;

    move-result-object p0

    return-object p0
.end method

.method public static create(DJLjava/util/concurrent/TimeUnit;)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 15
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "permitsPerSecond",
            "warmupPeriod",
            "unit"
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 198
    :goto_0
    const-string v1, "warmupPeriod must not be negative: %s"

    invoke-static {v0, v1, p2, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    const-wide/high16 v7, 0x4008000000000000L    # 3.0

    .line 200
    invoke-static {}, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;->createFromSystemTimer()Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    move-result-object v9

    move-wide v2, p0

    move-wide v4, p2

    move-object v6, p4

    .line 199
    invoke-static/range {v2 .. v9}, Lcom/google/common/util/concurrent/RateLimiter;->create(DJLjava/util/concurrent/TimeUnit;DLcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;)Lcom/google/common/util/concurrent/RateLimiter;

    move-result-object p0

    return-object p0
.end method

.method static create(DJLjava/util/concurrent/TimeUnit;DLcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 15
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "permitsPerSecond",
            "warmupPeriod",
            "unit",
            "coldFactor",
            "stopwatch"
        }
    .end annotation

    .line 210
    new-instance v0, Lcom/google/common/util/concurrent/SmoothRateLimiter$SmoothWarmingUp;

    move-wide v2, p2

    move-object v4, p4

    move-wide v5, p5

    move-object v1, p7

    invoke-direct/range {v0 .. v6}, Lcom/google/common/util/concurrent/SmoothRateLimiter$SmoothWarmingUp;-><init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;JLjava/util/concurrent/TimeUnit;D)V

    .line 211
    invoke-virtual {v0, p0, p1}, Lcom/google/common/util/concurrent/RateLimiter;->setRate(D)V

    return-object v0
.end method

.method static create(DLcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "permitsPerSecond",
            "stopwatch"
        }
    .end annotation

    .line 138
    new-instance v0, Lcom/google/common/util/concurrent/SmoothRateLimiter$SmoothBursty;

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-direct {v0, p2, v1, v2}, Lcom/google/common/util/concurrent/SmoothRateLimiter$SmoothBursty;-><init>(Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;D)V

    .line 139
    invoke-virtual {v0, p0, p1}, Lcom/google/common/util/concurrent/RateLimiter;->setRate(D)V

    return-object v0
.end method

.method public static create(DLjava/time/Duration;)Lcom/google/common/util/concurrent/RateLimiter;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "permitsPerSecond",
            "warmupPeriod"
        }
    .end annotation

    .line 169
    invoke-static {p2}, Lcom/google/common/util/concurrent/Internal;->toNanosSaturated(Ljava/time/Duration;)J

    move-result-wide v0

    sget-object p2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0, v1, p2}, Lcom/google/common/util/concurrent/RateLimiter;->create(DJLjava/util/concurrent/TimeUnit;)Lcom/google/common/util/concurrent/RateLimiter;

    move-result-object p0

    return-object p0
.end method

.method private mutex()Ljava/lang/Object;
    .registers 2

    .line 225
    iget-object v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->mutexDoNotUseDirectly:Ljava/lang/Object;

    if-nez v0, :cond_1

    .line 227
    monitor-enter p0

    .line 228
    :try_start_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->mutexDoNotUseDirectly:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 230
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->mutexDoNotUseDirectly:Ljava/lang/Object;

    .line 232
    :cond_0
    monitor-exit p0

    return-object v0

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public acquire()D
    .registers 3

    const/4 v0, 0x1

    .line 293
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/RateLimiter;->acquire(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public acquire(I)D
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permits"
        }
    .end annotation

    .line 307
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/RateLimiter;->reserve(I)J

    move-result-wide v0

    .line 308
    iget-object p0, p0, Lcom/google/common/util/concurrent/RateLimiter;->stopwatch:Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;->sleepMicrosUninterruptibly(J)V

    const-wide/high16 p0, 0x3ff0000000000000L    # 1.0

    long-to-double v0, v0

    mul-double/2addr v0, p0

    .line 309
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide p0, 0x412e848000000000L    # 1000000.0

    div-double/2addr v0, p0

    return-wide v0
.end method

.method abstract doGetRate()D
.end method

.method abstract doSetRate(DJ)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "permitsPerSecond",
            "nowMicros"
        }
    .end annotation
.end method

.method public final getRate()D
    .registers 4

    .line 275
    invoke-direct {p0}, Lcom/google/common/util/concurrent/RateLimiter;->mutex()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 276
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/RateLimiter;->doGetRate()D

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    .line 277
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method abstract queryEarliestAvailable(J)J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "nowMicros"
        }
    .end annotation
.end method

.method final reserve(I)J
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permits"
        }
    .end annotation

    .line 319
    invoke-static {p1}, Lcom/google/common/util/concurrent/RateLimiter;->checkPermits(I)V

    .line 320
    invoke-direct {p0}, Lcom/google/common/util/concurrent/RateLimiter;->mutex()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 321
    :try_start_0
    iget-object v1, p0, Lcom/google/common/util/concurrent/RateLimiter;->stopwatch:Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;->readMicros()J

    move-result-wide v1

    invoke-virtual {p0, p1, v1, v2}, Lcom/google/common/util/concurrent/RateLimiter;->reserveAndGetWaitLength(IJ)J

    move-result-wide p0

    monitor-exit v0

    return-wide p0

    .line 322
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method final reserveAndGetWaitLength(IJ)J
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "permits",
            "nowMicros"
        }
    .end annotation

    .line 439
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/util/concurrent/RateLimiter;->reserveEarliestAvailable(IJ)J

    move-result-wide p0

    sub-long/2addr p0, p2

    const-wide/16 p2, 0x0

    .line 440
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method abstract reserveEarliestAvailable(IJ)J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "permits",
            "nowMicros"
        }
    .end annotation
.end method

.method public final setRate(D)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permitsPerSecond"
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmpl-double v0, p1, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 260
    :goto_0
    const-string v1, "rate must be positive"

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 261
    invoke-direct {p0}, Lcom/google/common/util/concurrent/RateLimiter;->mutex()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 262
    :try_start_0
    iget-object v1, p0, Lcom/google/common/util/concurrent/RateLimiter;->stopwatch:Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    invoke-virtual {v1}, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;->readMicros()J

    move-result-wide v1

    invoke-virtual {p0, p1, p2, v1, v2}, Lcom/google/common/util/concurrent/RateLimiter;->doSetRate(DJ)V

    .line 263
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_1
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    .line 462
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/RateLimiter;->getRate()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "RateLimiter[stableRate=%3.1fqps]"

    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public tryAcquire()Z
    .registers 5

    const-wide/16 v0, 0x0

    .line 383
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v3, 0x1

    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/google/common/util/concurrent/RateLimiter;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    return p0
.end method

.method public tryAcquire(I)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permits"
        }
    .end annotation

    const-wide/16 v0, 0x0

    .line 370
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/google/common/util/concurrent/RateLimiter;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    return p0
.end method

.method public tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "permits",
            "timeout",
            "unit"
        }
    .end annotation

    .line 415
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide p2

    const-wide/16 v0, 0x0

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    .line 416
    invoke-static {p1}, Lcom/google/common/util/concurrent/RateLimiter;->checkPermits(I)V

    .line 418
    invoke-direct {p0}, Lcom/google/common/util/concurrent/RateLimiter;->mutex()Ljava/lang/Object;

    move-result-object p4

    monitor-enter p4

    .line 419
    :try_start_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/RateLimiter;->stopwatch:Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;->readMicros()J

    move-result-wide v0

    .line 420
    invoke-direct {p0, v0, v1, p2, p3}, Lcom/google/common/util/concurrent/RateLimiter;->canAcquire(JJ)Z

    move-result p2

    if-nez p2, :cond_0

    const/4 p0, 0x0

    .line 421
    monitor-exit p4

    return p0

    .line 423
    :cond_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/util/concurrent/RateLimiter;->reserveAndGetWaitLength(IJ)J

    move-result-wide p1

    .line 424
    monitor-exit p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 425
    iget-object p0, p0, Lcom/google/common/util/concurrent/RateLimiter;->stopwatch:Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/util/concurrent/RateLimiter$SleepingStopwatch;->sleepMicrosUninterruptibly(J)V

    const/4 p0, 0x1

    return p0

    .line 424
    :goto_0
    :try_start_1
    monitor-exit p4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public tryAcquire(ILjava/time/Duration;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "permits",
            "timeout"
        }
    .end annotation

    .line 399
    invoke-static {p2}, Lcom/google/common/util/concurrent/Internal;->toNanosSaturated(Ljava/time/Duration;)J

    move-result-wide v0

    sget-object p2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/google/common/util/concurrent/RateLimiter;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    return p0
.end method

.method public tryAcquire(JLjava/util/concurrent/TimeUnit;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "timeout",
            "unit"
        }
    .end annotation

    const/4 v0, 0x1

    .line 356
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/google/common/util/concurrent/RateLimiter;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    return p0
.end method

.method public tryAcquire(Ljava/time/Duration;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "timeout"
        }
    .end annotation

    .line 339
    invoke-static {p1}, Lcom/google/common/util/concurrent/Internal;->toNanosSaturated(Ljava/time/Duration;)J

    move-result-wide v0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v2, 0x1

    invoke-virtual {p0, v2, v0, v1, p1}, Lcom/google/common/util/concurrent/RateLimiter;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    return p0
.end method

.class public final Lnicoid/network238/okio/Throttler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0011\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0004\u0010\u0006J$\u0010\u0007\u001a\u00020\u00122\u0006\u0010\u0007\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00032\u0008\u0008\u0002\u0010\t\u001a\u00020\u0003H\u0007J\u0015\u0010\u0013\u001a\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u0003H\u0000\u00a2\u0006\u0002\u0008\u0015J\u001d\u0010\u0016\u001a\u00020\u00032\u0006\u0010\u0017\u001a\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u0003H\u0000\u00a2\u0006\u0002\u0008\u0018J\u000c\u0010\u0019\u001a\u00020\u0003*\u00020\u0003H\u0002J\u000c\u0010\u001a\u001a\u00020\u0003*\u00020\u0003H\u0002J\u000e\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001b\u001a\u00020\u001cJ\u000e\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001d\u001a\u00020\u001eR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u001f"
    }
    d2 = {
        "Lnicoid/network238/okio/Throttler;",
        "",
        "allocatedUntil",
        "",
        "<init>",
        "(J)V",
        "()V",
        "bytesPerSecond",
        "waitByteCount",
        "maxByteCount",
        "lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "getLock",
        "()Ljava/util/concurrent/locks/ReentrantLock;",
        "condition",
        "Ljava/util/concurrent/locks/Condition;",
        "getCondition",
        "()Ljava/util/concurrent/locks/Condition;",
        "",
        "take",
        "byteCount",
        "take$okio",
        "byteCountOrWaitNanos",
        "now",
        "byteCountOrWaitNanos$okio",
        "nanosToBytes",
        "bytesToNanos",
        "source",
        "Lnicoid/network238/okio/Source;",
        "sink",
        "Lnicoid/network238/okio/Sink;",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private allocatedUntil:J

.field private bytesPerSecond:J

.field private final condition:Ljava/util/concurrent/locks/Condition;

.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private maxByteCount:J

.field private waitByteCount:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 55
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lnicoid/network238/okio/Throttler;-><init>(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .registers 3

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-wide p1, p0, Lnicoid/network238/okio/Throttler;->allocatedUntil:J

    const-wide/16 p1, 0x2000

    iput-wide p1, p0, Lnicoid/network238/okio/Throttler;->waitByteCount:J

    const-wide/32 p1, 0x40000

    iput-wide p1, p0, Lnicoid/network238/okio/Throttler;->maxByteCount:J

    .line 52
    new-instance p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/Throttler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 53
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lnicoid/network238/okio/Throttler;->condition:Ljava/util/concurrent/locks/Condition;

    return-void
.end method

.method public static synthetic bytesPerSecond$default(Lnicoid/network238/okio/Throttler;JJJILjava/lang/Object;)V
    .registers 16

    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_0

    .line 61
    iget-wide p3, p0, Lnicoid/network238/okio/Throttler;->waitByteCount:J

    move-wide v3, p3

    goto :goto_0

    .line 0
    :cond_0
    move-wide v3, p3

    .line 61
    :goto_0
    and-int/lit8 p7, p7, 0x4

    if-eqz p7, :cond_1

    .line 62
    iget-wide p5, p0, Lnicoid/network238/okio/Throttler;->maxByteCount:J

    move-wide v5, p5

    goto :goto_1

    .line 61
    :cond_1
    move-wide v5, p5

    .line 59
    :goto_1
    move-object v0, p0

    move-wide v1, p1

    invoke-virtual/range {v0 .. v6}, Lnicoid/network238/okio/Throttler;->bytesPerSecond(JJJ)V

    return-void
.end method

.method private final bytesToNanos(J)J
    .registers 5

    const-wide/32 v0, 0x3b9aca00

    mul-long/2addr p1, v0

    .line 131
    iget-wide v0, p0, Lnicoid/network238/okio/Throttler;->bytesPerSecond:J

    div-long/2addr p1, v0

    return-wide p1
.end method

.method private final nanosToBytes(J)J
    .registers 5

    .line 129
    iget-wide v0, p0, Lnicoid/network238/okio/Throttler;->bytesPerSecond:J

    mul-long/2addr p1, v0

    const-wide/32 v0, 0x3b9aca00

    div-long/2addr p1, v0

    return-wide p1
.end method


# virtual methods
.method public final byteCountOrWaitNanos$okio(JJ)J
    .registers 16

    .line 99
    iget-wide v0, p0, Lnicoid/network238/okio/Throttler;->bytesPerSecond:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-wide p3

    .line 101
    :cond_0
    iget-wide v0, p0, Lnicoid/network238/okio/Throttler;->allocatedUntil:J

    sub-long/2addr v0, p1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 102
    iget-wide v4, p0, Lnicoid/network238/okio/Throttler;->maxByteCount:J

    invoke-direct {p0, v0, v1}, Lnicoid/network238/okio/Throttler;->nanosToBytes(J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    cmp-long v6, v4, p3

    if-ltz v6, :cond_1

    add-long/2addr p1, v0

    .line 106
    invoke-direct {p0, p3, p4}, Lnicoid/network238/okio/Throttler;->bytesToNanos(J)J

    move-result-wide v0

    add-long/2addr p1, v0

    iput-wide p1, p0, Lnicoid/network238/okio/Throttler;->allocatedUntil:J

    return-wide p3

    .line 111
    :cond_1
    iget-wide v6, p0, Lnicoid/network238/okio/Throttler;->waitByteCount:J

    cmp-long v8, v4, v6

    .line 118
    iget-wide v9, p0, Lnicoid/network238/okio/Throttler;->maxByteCount:J

    if-ltz v8, :cond_2

    .line 112
    invoke-direct {p0, v9, v10}, Lnicoid/network238/okio/Throttler;->bytesToNanos(J)J

    move-result-wide p3

    add-long/2addr p1, p3

    iput-wide p1, p0, Lnicoid/network238/okio/Throttler;->allocatedUntil:J

    return-wide v4

    .line 117
    :cond_2
    invoke-static {v6, v7, p3, p4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p3

    sub-long v4, p3, v9

    .line 118
    invoke-direct {p0, v4, v5}, Lnicoid/network238/okio/Throttler;->bytesToNanos(J)J

    move-result-wide v4

    add-long/2addr v0, v4

    cmp-long v2, v0, v2

    if-nez v2, :cond_3

    .line 122
    iget-wide v0, p0, Lnicoid/network238/okio/Throttler;->maxByteCount:J

    invoke-direct {p0, v0, v1}, Lnicoid/network238/okio/Throttler;->bytesToNanos(J)J

    move-result-wide v0

    add-long/2addr p1, v0

    iput-wide p1, p0, Lnicoid/network238/okio/Throttler;->allocatedUntil:J

    return-wide p3

    :cond_3
    neg-long p1, v0

    return-wide p1
.end method

.method public final bytesPerSecond(J)V
    .registers 12

    const/4 v7, 0x6

    const/4 v8, 0x0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    invoke-static/range {v0 .. v8}, Lnicoid/network238/okio/Throttler;->bytesPerSecond$default(Lnicoid/network238/okio/Throttler;JJJILjava/lang/Object;)V

    return-void
.end method

.method public final bytesPerSecond(JJ)V
    .registers 14

    const/4 v7, 0x4

    const/4 v8, 0x0

    const-wide/16 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    invoke-static/range {v0 .. v8}, Lnicoid/network238/okio/Throttler;->bytesPerSecond$default(Lnicoid/network238/okio/Throttler;JJJILjava/lang/Object;)V

    return-void
.end method

.method public final bytesPerSecond(JJJ)V
    .registers 12

    .line 64
    iget-object v0, p0, Lnicoid/network238/okio/Throttler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    const-string v4, "Failed requirement."

    if-ltz v3, :cond_2

    cmp-long v1, p3, v1

    if-lez v1, :cond_1

    cmp-long v1, p5, p3

    if-ltz v1, :cond_0

    .line 69
    :try_start_0
    iput-wide p1, p0, Lnicoid/network238/okio/Throttler;->bytesPerSecond:J

    .line 70
    iput-wide p3, p0, Lnicoid/network238/okio/Throttler;->waitByteCount:J

    .line 71
    iput-wide p5, p0, Lnicoid/network238/okio/Throttler;->maxByteCount:J

    .line 72
    iget-object p1, p0, Lnicoid/network238/okio/Throttler;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 73
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 67
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 66
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 65
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 64
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public final getCondition()Ljava/util/concurrent/locks/Condition;
    .registers 2

    .line 53
    iget-object v0, p0, Lnicoid/network238/okio/Throttler;->condition:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method public final getLock()Ljava/util/concurrent/locks/ReentrantLock;
    .registers 2

    .line 52
    iget-object v0, p0, Lnicoid/network238/okio/Throttler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method public final sink(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/Sink;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    new-instance v0, Lnicoid/network238/okio/Throttler$sink$1;

    invoke-direct {v0, p1, p0}, Lnicoid/network238/okio/Throttler$sink$1;-><init>(Lnicoid/network238/okio/Sink;Lnicoid/network238/okio/Throttler;)V

    return-object v0
.end method

.method public final source(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/Source;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    new-instance v0, Lnicoid/network238/okio/Throttler$source$1;

    invoke-direct {v0, p1, p0}, Lnicoid/network238/okio/Throttler$source$1;-><init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okio/Throttler;)V

    return-object v0
.end method

.method public final take$okio(J)J
    .registers 9

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_1

    .line 83
    iget-object v2, p0, Lnicoid/network238/okio/Throttler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 85
    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 86
    invoke-virtual {p0, v3, v4, p1, p2}, Lnicoid/network238/okio/Throttler;->byteCountOrWaitNanos$okio(JJ)J

    move-result-wide v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v5, v3, v0

    if-ltz v5, :cond_0

    .line 83
    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-wide v3

    .line 88
    :cond_0
    :try_start_1
    iget-object v5, p0, Lnicoid/network238/okio/Throttler;->condition:Ljava/util/concurrent/locks/Condition;

    neg-long v3, v3

    invoke-interface {v5, v3, v4}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1

    .line 81
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Failed requirement."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

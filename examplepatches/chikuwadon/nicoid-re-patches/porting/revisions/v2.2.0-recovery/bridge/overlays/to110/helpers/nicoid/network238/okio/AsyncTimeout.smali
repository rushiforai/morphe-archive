.class public Lnicoid/network238/okio/AsyncTimeout;
.super Lnicoid/network238/okio/Timeout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/AsyncTimeout$Companion;,
        Lnicoid/network238/okio/AsyncTimeout$Watchdog;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0016\u0018\u0000 %2\u00020\u0001:\u0002$%B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\u000c\u001a\u00020\rJ\u0006\u0010\u000e\u001a\u00020\u000fJ\u0008\u0010\u0010\u001a\u00020\rH\u0016J\u0015\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u0008H\u0000\u00a2\u0006\u0002\u0008\u0013J\u0017\u0010\u0014\u001a\u00020\r2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u0008H\u0000\u00a2\u0006\u0002\u0008\u0015J\u0008\u0010\u0016\u001a\u00020\rH\u0014J\u000e\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0017\u001a\u00020\u0018J\u000e\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0019\u001a\u00020\u001aJ%\u0010\u001b\u001a\u0002H\u001c\"\u0004\u0008\u0000\u0010\u001c2\u000c\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u0002H\u001c0\u001eH\u0086\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u001fJ\u0012\u0010 \u001a\u00020!2\u0008\u0010\"\u001a\u0004\u0018\u00010!H\u0001J\u0012\u0010#\u001a\u00020!2\u0008\u0010\"\u001a\u0004\u0018\u00010!H\u0014R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00020\u00058\u0000@\u0000X\u0081\u000e\u00a2\u0006\u0002\n\u0000R\u001e\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0008@BX\u0080\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006&"
    }
    d2 = {
        "Lnicoid/network238/okio/AsyncTimeout;",
        "Lnicoid/network238/okio/Timeout;",
        "<init>",
        "()V",
        "state",
        "",
        "index",
        "value",
        "",
        "timeoutAt",
        "getTimeoutAt$okio",
        "()J",
        "enter",
        "",
        "exit",
        "",
        "cancel",
        "remainingNanos",
        "now",
        "remainingNanos$okio",
        "setTimeoutAt",
        "setTimeoutAt$okio",
        "timedOut",
        "sink",
        "Lnicoid/network238/okio/Sink;",
        "source",
        "Lnicoid/network238/okio/Source;",
        "withTimeout",
        "T",
        "block",
        "Lnicoid/network238/kotlin/Function0;",
        "(Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "access$newTimeoutException",
        "Ljava/io/IOException;",
        "cause",
        "newTimeoutException",
        "Watchdog",
        "Companion",
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


# static fields
.field private static final Companion:Lnicoid/network238/okio/AsyncTimeout$Companion;

.field private static final IDLE_TIMEOUT_MILLIS:J

.field private static final IDLE_TIMEOUT_NANOS:J

.field private static final STATE_CANCELED:I = 0x3

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_IN_QUEUE:I = 0x1

.field private static final STATE_TIMED_OUT:I = 0x2

.field private static final TIMEOUT_WRITE_SIZE:I = 0x10000

.field private static final condition:Ljava/util/concurrent/locks/Condition;

.field private static idleSentinel:Lnicoid/network238/okio/AsyncTimeout;

.field private static final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private static final queue:Lnicoid/network238/okio/PriorityQueue;


# instance fields
.field public index:I

.field private state:I

.field private timeoutAt:J


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lnicoid/network238/okio/AsyncTimeout$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/AsyncTimeout$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/AsyncTimeout;->Companion:Lnicoid/network238/okio/AsyncTimeout$Companion;

    .line 263
    new-instance v0, Lnicoid/network238/okio/PriorityQueue;

    invoke-direct {v0}, Lnicoid/network238/okio/PriorityQueue;-><init>()V

    sput-object v0, Lnicoid/network238/okio/AsyncTimeout;->queue:Lnicoid/network238/okio/PriorityQueue;

    .line 265
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    sput-object v0, Lnicoid/network238/okio/AsyncTimeout;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 266
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sput-object v0, Lnicoid/network238/okio/AsyncTimeout;->condition:Ljava/util/concurrent/locks/Condition;

    .line 276
    const-wide/32 v0, 0xea60

    sput-wide v0, Lnicoid/network238/okio/AsyncTimeout;->IDLE_TIMEOUT_MILLIS:J

    .line 277
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    sput-wide v0, Lnicoid/network238/okio/AsyncTimeout;->IDLE_TIMEOUT_NANOS:J

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 45
    invoke-direct {p0}, Lnicoid/network238/okio/Timeout;-><init>()V

    .line 49
    const/4 v0, -0x1

    iput v0, p0, Lnicoid/network238/okio/AsyncTimeout;->index:I

    return-void
.end method

.method public static final synthetic access$getCompanion$p()Lnicoid/network238/okio/AsyncTimeout$Companion;
    .registers 1

    .line 45
    sget-object v0, Lnicoid/network238/okio/AsyncTimeout;->Companion:Lnicoid/network238/okio/AsyncTimeout$Companion;

    return-object v0
.end method

.method public static final synthetic access$getCondition$cp()Ljava/util/concurrent/locks/Condition;
    .registers 1

    .line 45
    sget-object v0, Lnicoid/network238/okio/AsyncTimeout;->condition:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method public static final synthetic access$getIDLE_TIMEOUT_MILLIS$cp()J
    .registers 2

    .line 45
    sget-wide v0, Lnicoid/network238/okio/AsyncTimeout;->IDLE_TIMEOUT_MILLIS:J

    return-wide v0
.end method

.method public static final synthetic access$getIDLE_TIMEOUT_NANOS$cp()J
    .registers 2

    .line 45
    sget-wide v0, Lnicoid/network238/okio/AsyncTimeout;->IDLE_TIMEOUT_NANOS:J

    return-wide v0
.end method

.method public static final synthetic access$getIdleSentinel$cp()Lnicoid/network238/okio/AsyncTimeout;
    .registers 1

    .line 45
    sget-object v0, Lnicoid/network238/okio/AsyncTimeout;->idleSentinel:Lnicoid/network238/okio/AsyncTimeout;

    return-object v0
.end method

.method public static final synthetic access$getLock$cp()Ljava/util/concurrent/locks/ReentrantLock;
    .registers 1

    .line 45
    sget-object v0, Lnicoid/network238/okio/AsyncTimeout;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method public static final synthetic access$getQueue$cp()Lnicoid/network238/okio/PriorityQueue;
    .registers 1

    .line 45
    sget-object v0, Lnicoid/network238/okio/AsyncTimeout;->queue:Lnicoid/network238/okio/PriorityQueue;

    return-object v0
.end method

.method public static final synthetic access$setIdleSentinel$cp(Lnicoid/network238/okio/AsyncTimeout;)V
    .registers 1

    .line 45
    sput-object p0, Lnicoid/network238/okio/AsyncTimeout;->idleSentinel:Lnicoid/network238/okio/AsyncTimeout;

    return-void
.end method

.method public static final synthetic access$setState$p(Lnicoid/network238/okio/AsyncTimeout;I)V
    .registers 2

    .line 45
    iput p1, p0, Lnicoid/network238/okio/AsyncTimeout;->state:I

    return-void
.end method

.method public static synthetic setTimeoutAt$okio$default(Lnicoid/network238/okio/AsyncTimeout;JILjava/lang/Object;)V
    .registers 5

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    .line 104
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide p1

    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/AsyncTimeout;->setTimeoutAt$okio(J)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: setTimeoutAt"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 2

    .line 210
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/AsyncTimeout;->newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    return-object p1
.end method

.method public cancel()V
    .registers 4

    .line 85
    invoke-super {p0}, Lnicoid/network238/okio/Timeout;->cancel()V

    .line 87
    sget-object v0, Lnicoid/network238/okio/AsyncTimeout;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 88
    :try_start_0
    iget v1, p0, Lnicoid/network238/okio/AsyncTimeout;->state:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 89
    sget-object v1, Lnicoid/network238/okio/AsyncTimeout;->queue:Lnicoid/network238/okio/PriorityQueue;

    invoke-virtual {v1, p0}, Lnicoid/network238/okio/PriorityQueue;->remove(Lnicoid/network238/okio/AsyncTimeout;)V

    .line 90
    const/4 v1, 0x3

    iput v1, p0, Lnicoid/network238/okio/AsyncTimeout;->state:I

    .line 92
    :cond_0
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final enter()V
    .registers 6

    .line 56
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v0

    .line 57
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v2

    const-wide/16 v3, 0x0

    cmp-long v0, v0, v3

    if-nez v0, :cond_0

    if-nez v2, :cond_0

    return-void

    .line 62
    :cond_0
    sget-object v0, Lnicoid/network238/okio/AsyncTimeout;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 63
    :try_start_0
    iget v1, p0, Lnicoid/network238/okio/AsyncTimeout;->state:I

    if-nez v1, :cond_1

    .line 64
    const/4 v1, 0x1

    iput v1, p0, Lnicoid/network238/okio/AsyncTimeout;->state:I

    .line 65
    sget-object v1, Lnicoid/network238/okio/AsyncTimeout;->Companion:Lnicoid/network238/okio/AsyncTimeout$Companion;

    # invokes: Lnicoid/network238/okio/AsyncTimeout$Companion;->insertIntoQueue(Lnicoid/network238/okio/AsyncTimeout;)V
    invoke-static {v1, p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->access$insertIntoQueue(Lnicoid/network238/okio/AsyncTimeout$Companion;Lnicoid/network238/okio/AsyncTimeout;)V

    .line 66
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 63
    :cond_1
    :try_start_1
    const-string v1, "Unbalanced enter/exit"

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 62
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final exit()Z
    .registers 6

    .line 71
    sget-object v0, Lnicoid/network238/okio/AsyncTimeout;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 72
    :try_start_0
    iget v1, p0, Lnicoid/network238/okio/AsyncTimeout;->state:I

    .line 73
    const/4 v2, 0x0

    iput v2, p0, Lnicoid/network238/okio/AsyncTimeout;->state:I

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    .line 76
    sget-object v1, Lnicoid/network238/okio/AsyncTimeout;->queue:Lnicoid/network238/okio/PriorityQueue;

    invoke-virtual {v1, p0}, Lnicoid/network238/okio/PriorityQueue;->remove(Lnicoid/network238/okio/AsyncTimeout;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 71
    :cond_0
    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    move v2, v3

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final getTimeoutAt$okio()J
    .registers 3

    .line 52
    iget-wide v0, p0, Lnicoid/network238/okio/AsyncTimeout;->timeoutAt:J

    return-wide v0
.end method

.method protected newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;
    .registers 4

    .line 218
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 220
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    :cond_0
    return-object v0
.end method

.method public final remainingNanos$okio(J)J
    .registers 5

    .line 99
    iget-wide v0, p0, Lnicoid/network238/okio/AsyncTimeout;->timeoutAt:J

    sub-long/2addr v0, p1

    return-wide v0
.end method

.method public final setTimeoutAt$okio(J)V
    .registers 10

    .line 105
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v0

    .line 106
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v2

    .line 107
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 110
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v2

    sub-long/2addr v2, p1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    add-long/2addr p1, v0

    iput-wide p1, p0, Lnicoid/network238/okio/AsyncTimeout;->timeoutAt:J

    return-void

    :cond_0
    cmp-long v3, v0, v5

    if-eqz v3, :cond_1

    add-long/2addr p1, v0

    .line 112
    iput-wide p1, p0, Lnicoid/network238/okio/AsyncTimeout;->timeoutAt:J

    return-void

    :cond_1
    if-eqz v2, :cond_2

    .line 114
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide p1

    iput-wide p1, p0, Lnicoid/network238/okio/AsyncTimeout;->timeoutAt:J

    return-void

    .line 116
    :cond_2
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1
.end method

.method public final sink(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/Sink;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    new-instance v0, Lnicoid/network238/okio/AsyncTimeout$sink$1;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okio/AsyncTimeout$sink$1;-><init>(Lnicoid/network238/okio/AsyncTimeout;Lnicoid/network238/okio/Sink;)V

    return-object v0
.end method

.method public final source(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/Source;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 175
    new-instance v0, Lnicoid/network238/okio/AsyncTimeout$source$1;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okio/AsyncTimeout$source$1;-><init>(Lnicoid/network238/okio/AsyncTimeout;Lnicoid/network238/okio/Source;)V

    return-object v0
.end method

.method protected timedOut()V
    .registers 1

    return-void
.end method

.method public final withTimeout(Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 7
    .param p1, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 195
    .local v0, "$i$f$withTimeout":I
    const/4 v1, 0x0

    .line 196
    .local v1, "throwOnTimeout":Z
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 197
    nop

    .line 198
    const/4 v2, 0x0

    :try_start_0
    invoke-interface {p1}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    .local v3, "result":Ljava/lang/Object;
    const/4 v1, 0x1

    .line 200
    nop

    .line 204
    .end local v3    # "result":Ljava/lang/Object;
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v4

    .line 205
    .local v4, "timedOut":Z
    if-nez v4, :cond_1

    .end local v4    # "timedOut":Z
    move-object v2, v3

    .line 200
    .local v2, "result":Ljava/lang/Object;
    return-object v3

    .line 201
    .end local v2    # "result":Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 202
    .local v3, "e":Ljava/io/IOException;
    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v4

    if-nez v4, :cond_0

    move-object v4, v3

    check-cast v4, Ljava/lang/Throwable;

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v3}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v4

    check-cast v4, Ljava/lang/Throwable;

    .end local v0    # "$i$f$withTimeout":I
    .end local v1    # "throwOnTimeout":Z
    .end local p1    # "block":Lnicoid/network238/kotlin/jvm/functions/Function0;
    :goto_0
    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 204
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v0    # "$i$f$withTimeout":I
    .restart local v1    # "throwOnTimeout":Z
    .restart local p1    # "block":Lnicoid/network238/kotlin/jvm/functions/Function0;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v4

    .line 205
    .restart local v4    # "timedOut":Z
    if-eqz v4, :cond_2

    if-eqz v1, :cond_2

    :cond_1
    invoke-virtual {p0, v2}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .end local v4    # "timedOut":Z
    :cond_2
    throw v3
.end method

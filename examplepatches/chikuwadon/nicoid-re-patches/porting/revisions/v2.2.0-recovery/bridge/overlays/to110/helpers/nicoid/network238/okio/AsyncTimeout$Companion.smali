.class final Lnicoid/network238/okio/AsyncTimeout$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/AsyncTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u0082\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\tH\u0002J\u0008\u0010\"\u001a\u0004\u0018\u00010\tR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u001c\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u0011\u0010\u0012\u001a\u00020\u0013\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0017X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0017X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0017X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0017X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006#"
    }
    d2 = {
        "Lnicoid/network238/okio/AsyncTimeout$Companion;",
        "",
        "<init>",
        "()V",
        "queue",
        "Lnicoid/network238/okio/PriorityQueue;",
        "getQueue",
        "()Lnicoid/network238/okio/PriorityQueue;",
        "idleSentinel",
        "Lnicoid/network238/okio/AsyncTimeout;",
        "getIdleSentinel",
        "()Lnicoid/network238/okio/AsyncTimeout;",
        "setIdleSentinel",
        "(Lnicoid/network238/okio/AsyncTimeout;)V",
        "lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "getLock",
        "()Ljava/util/concurrent/locks/ReentrantLock;",
        "condition",
        "Ljava/util/concurrent/locks/Condition;",
        "getCondition",
        "()Ljava/util/concurrent/locks/Condition;",
        "TIMEOUT_WRITE_SIZE",
        "",
        "IDLE_TIMEOUT_MILLIS",
        "",
        "IDLE_TIMEOUT_NANOS",
        "STATE_IDLE",
        "STATE_IN_QUEUE",
        "STATE_TIMED_OUT",
        "STATE_CANCELED",
        "insertIntoQueue",
        "",
        "node",
        "awaitTimeout",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$insertIntoQueue(Lnicoid/network238/okio/AsyncTimeout$Companion;Lnicoid/network238/okio/AsyncTimeout;)V
    .registers 2

    .line 253
    invoke-direct {p0, p1}, Lnicoid/network238/okio/AsyncTimeout$Companion;->insertIntoQueue(Lnicoid/network238/okio/AsyncTimeout;)V

    return-void
.end method

.method private final insertIntoQueue(Lnicoid/network238/okio/AsyncTimeout;)V
    .registers 6

    .line 318
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getIdleSentinel()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v0

    if-nez v0, :cond_0

    .line 319
    new-instance v0, Lnicoid/network238/okio/AsyncTimeout;

    invoke-direct {v0}, Lnicoid/network238/okio/AsyncTimeout;-><init>()V

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->setIdleSentinel(Lnicoid/network238/okio/AsyncTimeout;)V

    .line 320
    new-instance v0, Lnicoid/network238/okio/AsyncTimeout$Watchdog;

    invoke-direct {v0}, Lnicoid/network238/okio/AsyncTimeout$Watchdog;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_0
    nop

    .line 322
    const-wide/16 v0, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lnicoid/network238/okio/AsyncTimeout;->setTimeoutAt$okio$default(Lnicoid/network238/okio/AsyncTimeout;JILjava/lang/Object;)V

    .line 324
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getQueue()Lnicoid/network238/okio/PriorityQueue;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/PriorityQueue;->add(Lnicoid/network238/okio/AsyncTimeout;)V

    .line 325
    iget p1, p1, Lnicoid/network238/okio/AsyncTimeout;->index:I

    if-ne p1, v2, :cond_1

    .line 327
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signal()V

    :cond_1
    return-void
.end method


# virtual methods
.method public final awaitTimeout()Lnicoid/network238/okio/AsyncTimeout;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 342
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getQueue()Lnicoid/network238/okio/PriorityQueue;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/PriorityQueue;->first()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 346
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 347
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    # getter for: Lnicoid/network238/okio/AsyncTimeout;->IDLE_TIMEOUT_MILLIS:J
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getIDLE_TIMEOUT_MILLIS$cp()J

    move-result-wide v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v4, v5, v6}, Ljava/util/concurrent/locks/Condition;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 348
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getQueue()Lnicoid/network238/okio/PriorityQueue;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/PriorityQueue;->first()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long/2addr v4, v2

    # getter for: Lnicoid/network238/okio/AsyncTimeout;->IDLE_TIMEOUT_NANOS:J
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getIDLE_TIMEOUT_NANOS$cp()J

    move-result-wide v2

    cmp-long v0, v4, v2

    if-ltz v0, :cond_0

    .line 349
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getIdleSentinel()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1

    .line 355
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lnicoid/network238/okio/AsyncTimeout;->remainingNanos$okio(J)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_2

    .line 359
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v2, v3, v4}, Ljava/util/concurrent/locks/Condition;->await(JLjava/util/concurrent/TimeUnit;)Z

    return-object v1

    .line 364
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getQueue()Lnicoid/network238/okio/PriorityQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lnicoid/network238/okio/PriorityQueue;->remove(Lnicoid/network238/okio/AsyncTimeout;)V

    .line 365
    const/4 v1, 0x2

    invoke-static {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$setState$p(Lnicoid/network238/okio/AsyncTimeout;I)V

    return-object v0
.end method

.method public final getCondition()Ljava/util/concurrent/locks/Condition;
    .registers 2

    .line 266
    # getter for: Lnicoid/network238/okio/AsyncTimeout;->condition:Ljava/util/concurrent/locks/Condition;
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getCondition$cp()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    return-object v0
.end method

.method public final getIdleSentinel()Lnicoid/network238/okio/AsyncTimeout;
    .registers 2

    .line 264
    # getter for: Lnicoid/network238/okio/AsyncTimeout;->idleSentinel:Lnicoid/network238/okio/AsyncTimeout;
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getIdleSentinel$cp()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v0

    return-object v0
.end method

.method public final getLock()Ljava/util/concurrent/locks/ReentrantLock;
    .registers 2

    .line 265
    # getter for: Lnicoid/network238/okio/AsyncTimeout;->lock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getLock$cp()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    return-object v0
.end method

.method public final getQueue()Lnicoid/network238/okio/PriorityQueue;
    .registers 2

    .line 263
    # getter for: Lnicoid/network238/okio/AsyncTimeout;->queue:Lnicoid/network238/okio/PriorityQueue;
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getQueue$cp()Lnicoid/network238/okio/PriorityQueue;

    move-result-object v0

    return-object v0
.end method

.method public final setIdleSentinel(Lnicoid/network238/okio/AsyncTimeout;)V
    .registers 2

    .line 264
    invoke-static {p1}, Lnicoid/network238/okio/AsyncTimeout;->access$setIdleSentinel$cp(Lnicoid/network238/okio/AsyncTimeout;)V

    return-void
.end method

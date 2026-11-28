.class public Lnicoid/network238/okio/Timeout;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/Timeout$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0016\u0018\u0000 \u001f2\u00020\u0001:\u0001\u001fB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\n\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u000cH\u0016J\u0008\u0010\u0008\u001a\u00020\u0007H\u0016J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0006\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0016\u0010\r\u001a\u00020\u00002\u0006\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000b\u001a\u00020\u000cJ\u0008\u0010\u000f\u001a\u00020\u0000H\u0016J\u0008\u0010\u0010\u001a\u00020\u0000H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016J\u0008\u0010\u0013\u001a\u00020\u0012H\u0016J\u0010\u0010\u0014\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0016H\u0016J\u0010\u0010\u0017\u001a\u00020\u00122\u0006\u0010\u0018\u001a\u00020\u0001H\u0016J-\u0010\u0019\u001a\u0002H\u001a\"\u0004\u0008\u0000\u0010\u001a2\u0006\u0010\u001b\u001a\u00020\u00002\u000c\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u0002H\u001a0\u001dH\u0086\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u001eR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\u0001X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006 "
    }
    d2 = {
        "Lnicoid/network238/okio/Timeout;",
        "",
        "<init>",
        "()V",
        "hasDeadline",
        "",
        "deadlineNanoTime",
        "",
        "timeoutNanos",
        "cancelMark",
        "timeout",
        "unit",
        "Ljava/util/concurrent/TimeUnit;",
        "deadline",
        "duration",
        "clearTimeout",
        "clearDeadline",
        "throwIfReached",
        "",
        "cancel",
        "awaitSignal",
        "condition",
        "Ljava/util/concurrent/locks/Condition;",
        "waitUntilNotified",
        "monitor",
        "intersectWith",
        "T",
        "other",
        "block",
        "Lnicoid/network238/kotlin/Function0;",
        "(Lnicoid/network238/okio/Timeout;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
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
.field public static final Companion:Lnicoid/network238/okio/Timeout$Companion;

.field public static final NONE:Lnicoid/network238/okio/Timeout;


# instance fields
.field private volatile cancelMark:Ljava/lang/Object;

.field private deadlineNanoTime:J

.field private hasDeadline:Z

.field private timeoutNanos:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okio/Timeout$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/Timeout$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/Timeout;->Companion:Lnicoid/network238/okio/Timeout$Companion;

    .line 334
    new-instance v0, Lnicoid/network238/okio/Timeout$Companion$NONE$1;

    invoke-direct {v0}, Lnicoid/network238/okio/Timeout$Companion$NONE$1;-><init>()V

    sput-object v0, Lnicoid/network238/okio/Timeout;->NONE:Lnicoid/network238/okio/Timeout;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public awaitSignal(Ljava/util/concurrent/locks/Condition;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    .line 178
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    if-nez v0, :cond_0

    cmp-long v0, v1, v3

    if-nez v0, :cond_2

    .line 181
    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->await()V

    return-void

    :cond_0
    cmp-long v0, v1, v3

    if-eqz v0, :cond_1

    .line 187
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    sub-long/2addr v5, v7

    .line 188
    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    goto :goto_0

    .line 190
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    sub-long v1, v0, v5

    :cond_2
    :goto_0
    cmp-long v0, v1, v3

    const-string v5, "timeout"

    if-lez v0, :cond_5

    .line 197
    :try_start_1
    iget-object v0, p0, Lnicoid/network238/okio/Timeout;->cancelMark:Ljava/lang/Object;

    .line 200
    invoke-interface {p1, v1, v2}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J

    move-result-wide v1

    cmp-long p1, v1, v3

    if-lez p1, :cond_3

    goto :goto_1

    .line 207
    :cond_3
    iget-object p1, p0, Lnicoid/network238/okio/Timeout;->cancelMark:Ljava/lang/Object;

    if-eq p1, v0, :cond_4

    :goto_1
    return-void

    .line 209
    :cond_4
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1, v5}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 195
    :cond_5
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1, v5}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception p1

    .line 211
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 212
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string v0, "interrupted"

    invoke-direct {p1, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public cancel()V
    .registers 2

    .line 128
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okio/Timeout;->cancelMark:Ljava/lang/Object;

    return-void
.end method

.method public clearDeadline()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 96
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnicoid/network238/okio/Timeout;->hasDeadline:Z

    return-object p0
.end method

.method public clearTimeout()Lnicoid/network238/okio/Timeout;
    .registers 3

    .line 90
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lnicoid/network238/okio/Timeout;->timeoutNanos:J

    return-object p0
.end method

.method public final deadline(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;
    .registers 6

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 85
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    add-long/2addr v0, p1

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    move-result-object p1

    return-object p1

    .line 84
    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "duration <= 0: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public deadlineNanoTime()J
    .registers 3

    .line 67
    iget-boolean v0, p0, Lnicoid/network238/okio/Timeout;->hasDeadline:Z

    if-eqz v0, :cond_0

    .line 68
    iget-wide v0, p0, Lnicoid/network238/okio/Timeout;->deadlineNanoTime:J

    return-wide v0

    .line 67
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No deadline"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;
    .registers 4

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/Timeout;->hasDeadline:Z

    .line 78
    iput-wide p1, p0, Lnicoid/network238/okio/Timeout;->deadlineNanoTime:J

    return-object p0
.end method

.method public hasDeadline()Z
    .registers 2

    .line 59
    iget-boolean v0, p0, Lnicoid/network238/okio/Timeout;->hasDeadline:Z

    return v0
.end method

.method public final intersectWith(Lnicoid/network238/okio/Timeout;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 12
    .param p1, "other"    # Lnicoid/network238/okio/Timeout;
    .param p2, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/okio/Timeout;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation

    const-string v0, "other"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 302
    .local v0, "$i$f$intersectWith":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v1

    .line 303
    .local v1, "originalTimeout":J
    sget-object v3, Lnicoid/network238/okio/Timeout;->Companion:Lnicoid/network238/okio/Timeout$Companion;

    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v4

    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v6

    invoke-virtual {v3, v4, v5, v6, v7}, Lnicoid/network238/okio/Timeout$Companion;->minTimeout(JJ)J

    move-result-wide v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v3, v4, v5}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 305
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 306
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v3

    .line 307
    .local v3, "originalDeadline":J
    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 308
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    invoke-virtual {p0, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 310
    :cond_0
    nop

    .line 311
    :try_start_0
    invoke-interface {p2}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 313
    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v1, v2, v6}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 314
    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 315
    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    :cond_1
    nop

    .line 311
    return-object v5

    .line 313
    :catchall_0
    move-exception v5

    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v1, v2, v6}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 314
    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 315
    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    :cond_2
    throw v5

    .line 319
    .end local v3    # "originalDeadline":J
    :cond_3
    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 320
    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 322
    :cond_4
    nop

    .line 323
    :try_start_1
    invoke-interface {p2}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 325
    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v1, v2, v4}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 326
    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 327
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    :cond_5
    nop

    .line 323
    return-object v3

    .line 325
    :catchall_1
    move-exception v3

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v1, v2, v4}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 326
    invoke-virtual {p1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 327
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    :cond_6
    throw v3
.end method

.method public throwIfReached()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 107
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_1

    .line 112
    iget-boolean v0, p0, Lnicoid/network238/okio/Timeout;->hasDeadline:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lnicoid/network238/okio/Timeout;->deadlineNanoTime:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 113
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "deadline reached"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void

    .line 109
    :cond_1
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "interrupted"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;
    .registers 6

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 51
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p1

    iput-wide p1, p0, Lnicoid/network238/okio/Timeout;->timeoutNanos:J

    return-object p0

    .line 50
    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "timeout < 0: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public timeoutNanos()J
    .registers 3

    .line 56
    iget-wide v0, p0, Lnicoid/network238/okio/Timeout;->timeoutNanos:J

    return-wide v0
.end method

.method public waitUntilNotified(Ljava/lang/Object;)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 255
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    .line 256
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    if-nez v0, :cond_0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    .line 259
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V

    return-void

    .line 264
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    if-eqz v0, :cond_2

    cmp-long v0, v1, v3

    if-eqz v0, :cond_1

    .line 266
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v7

    sub-long/2addr v7, v5

    .line 267
    invoke-static {v1, v2, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    goto :goto_0

    .line 269
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    sub-long v1, v0, v5

    :cond_2
    :goto_0
    cmp-long v0, v1, v3

    const-string v3, "timeout"

    if-lez v0, :cond_5

    .line 276
    :try_start_1
    iget-object v0, p0, Lnicoid/network238/okio/Timeout;->cancelMark:Ljava/lang/Object;

    .line 279
    const-wide/32 v7, 0xf4240

    div-long v9, v1, v7

    mul-long/2addr v7, v9

    sub-long v7, v1, v7

    long-to-int v4, v7

    .line 280
    invoke-virtual {p1, v9, v10, v4}, Ljava/lang/Object;->wait(JI)V

    .line 281
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    sub-long/2addr v7, v5

    cmp-long p1, v7, v1

    if-gez p1, :cond_3

    goto :goto_1

    .line 288
    :cond_3
    iget-object p1, p0, Lnicoid/network238/okio/Timeout;->cancelMark:Ljava/lang/Object;

    if-eq p1, v0, :cond_4

    :goto_1
    return-void

    .line 290
    :cond_4
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1, v3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 274
    :cond_5
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1, v3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception p1

    .line 292
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 293
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string v0, "interrupted"

    invoke-direct {p1, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

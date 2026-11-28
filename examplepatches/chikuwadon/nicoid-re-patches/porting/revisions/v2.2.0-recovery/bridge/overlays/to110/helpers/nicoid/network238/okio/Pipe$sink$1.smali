.class public final Lnicoid/network238/okio/Pipe$sink$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/Pipe;-><init>(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u0008\u0010\n\u001a\u00020\u0005H\u0016J\u0008\u0010\u000b\u001a\u00020\u0005H\u0016J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "nicoid/network238/okio/Pipe$sink$1",
        "Lnicoid/network238/okio/Sink;",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "flush",
        "close",
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
.field final synthetic this$0:Lnicoid/network238/okio/Pipe;

.field private final timeout:Lnicoid/network238/okio/Timeout;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Pipe;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance p1, Lnicoid/network238/okio/Timeout;

    invoke-direct {p1}, Lnicoid/network238/okio/Timeout;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/Pipe$sink$1;->timeout:Lnicoid/network238/okio/Timeout;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 13

    .line 111
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->getLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 112
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getSinkClosed$okio()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v2, :cond_0

    .line 111
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 114
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getFoldedSink$okio()Lnicoid/network238/okio/Sink;

    move-result-object v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 119
    :cond_1
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getSourceClosed$okio()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getBuffer$okio()Lnicoid/network238/okio/Buffer;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    new-instance v1, Ljava/io/IOException;

    const-string v2, "source is closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 120
    :cond_2
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lnicoid/network238/okio/Pipe;->setSinkClosed$okio(Z)V

    .line 121
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    const/4 v2, 0x0

    .line 122
    :goto_0
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 111
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    if-eqz v2, :cond_8

    .line 124
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    .line 320
    invoke-interface {v2}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v1

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->sink()Lnicoid/network238/okio/Sink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    .line 321
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v3

    .line 322
    sget-object v5, Lnicoid/network238/okio/Timeout;->Companion:Lnicoid/network238/okio/Timeout$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v6

    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v8

    invoke-virtual {v5, v6, v7, v8, v9}, Lnicoid/network238/okio/Timeout$Companion;->minTimeout(JJ)J

    move-result-wide v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v5, v6, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 324
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 325
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    .line 326
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 327
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v8

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v10

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    invoke-virtual {v1, v8, v9}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 124
    :cond_3
    :try_start_2
    invoke-interface {v2}, Lnicoid/network238/okio/Sink;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 332
    invoke-virtual {v1, v3, v4, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 333
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 334
    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    return-void

    :catchall_0
    move-exception v2

    .line 332
    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 333
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 334
    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    :cond_4
    throw v2

    .line 338
    :cond_5
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 339
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 124
    :cond_6
    :try_start_3
    invoke-interface {v2}, Lnicoid/network238/okio/Sink;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 344
    invoke-virtual {v1, v3, v4, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 345
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 346
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    return-void

    :catchall_1
    move-exception v2

    .line 344
    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, v5}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 345
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 346
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    :cond_7
    throw v2

    :cond_8
    return-void

    :catchall_2
    move-exception v1

    .line 111
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public flush()V
    .registers 13

    .line 92
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->getLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 93
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getSinkClosed$okio()Z

    move-result v2

    if-nez v2, :cond_9

    .line 94
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCanceled$okio()Z

    move-result v2

    if-nez v2, :cond_8

    .line 96
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getFoldedSink$okio()Lnicoid/network238/okio/Sink;

    move-result-object v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getSourceClosed$okio()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getBuffer$okio()Lnicoid/network238/okio/Buffer;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_1

    .line 102
    new-instance v1, Ljava/io/IOException;

    const-string v2, "source is closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 104
    :cond_1
    const/4 v2, 0x0

    :goto_0
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 92
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    if-eqz v2, :cond_7

    .line 106
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    .line 292
    invoke-interface {v2}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v1

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->sink()Lnicoid/network238/okio/Sink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    .line 293
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v3

    .line 294
    sget-object v5, Lnicoid/network238/okio/Timeout;->Companion:Lnicoid/network238/okio/Timeout$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v6

    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v8

    invoke-virtual {v5, v6, v7, v8, v9}, Lnicoid/network238/okio/Timeout$Companion;->minTimeout(JJ)J

    move-result-wide v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v5, v6, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 296
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 297
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    .line 298
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 299
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v8

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v10

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    invoke-virtual {v1, v8, v9}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 106
    :cond_2
    :try_start_1
    invoke-interface {v2}, Lnicoid/network238/okio/Sink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 304
    invoke-virtual {v1, v3, v4, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 305
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 306
    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    return-void

    :catchall_0
    move-exception v2

    .line 304
    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 305
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 306
    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    :cond_3
    throw v2

    .line 310
    :cond_4
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 311
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 106
    :cond_5
    :try_start_2
    invoke-interface {v2}, Lnicoid/network238/okio/Sink;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 316
    invoke-virtual {v1, v3, v4, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 317
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 318
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    return-void

    :catchall_1
    move-exception v2

    .line 316
    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, v5}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 317
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 318
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    :cond_6
    throw v2

    :cond_7
    return-void

    .line 94
    :cond_8
    :try_start_3
    new-instance v1, Ljava/io/IOException;

    const-string v2, "canceled"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 93
    :cond_9
    const-string v1, "closed"

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :catchall_2
    move-exception v1

    .line 92
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 127
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$sink$1;->timeout:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 16

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->getLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 62
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getSinkClosed$okio()Z

    move-result v2

    if-nez v2, :cond_c

    .line 63
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCanceled$okio()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const-string v3, "canceled"

    if-nez v2, :cond_b

    :goto_0
    const-wide/16 v4, 0x0

    cmp-long v2, p2, v4

    if-lez v2, :cond_4

    .line 66
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getFoldedSink$okio()Lnicoid/network238/okio/Sink;

    move-result-object v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 71
    :cond_0
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getSourceClosed$okio()Z

    move-result v2

    if-nez v2, :cond_3

    .line 73
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getMaxBufferSize$okio()J

    move-result-wide v6

    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getBuffer$okio()Lnicoid/network238/okio/Buffer;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    sub-long/2addr v6, v8

    cmp-long v2, v6, v4

    if-nez v2, :cond_2

    .line 75
    iget-object v2, p0, Lnicoid/network238/okio/Pipe$sink$1;->timeout:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v4

    invoke-virtual {v2, v4}, Lnicoid/network238/okio/Timeout;->awaitSignal(Ljava/util/concurrent/locks/Condition;)V

    .line 76
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCanceled$okio()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 80
    :cond_2
    invoke-static {v6, v7, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 81
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getBuffer$okio()Lnicoid/network238/okio/Buffer;

    move-result-object v2

    invoke-virtual {v2, p1, v4, v5}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    sub-long/2addr p2, v4

    .line 83
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    goto :goto_0

    .line 71
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "source is closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 63
    :cond_4
    const/4 v2, 0x0

    .line 85
    :goto_1
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 61
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    if-eqz v2, :cond_a

    .line 87
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$sink$1;->this$0:Lnicoid/network238/okio/Pipe;

    .line 264
    invoke-interface {v2}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v1

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->sink()Lnicoid/network238/okio/Sink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    .line 265
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v3

    .line 266
    sget-object v5, Lnicoid/network238/okio/Timeout;->Companion:Lnicoid/network238/okio/Timeout$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v6

    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v8

    invoke-virtual {v5, v6, v7, v8, v9}, Lnicoid/network238/okio/Timeout$Companion;->minTimeout(JJ)J

    move-result-wide v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v5, v6, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 268
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 269
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    .line 270
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 271
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v8

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v10

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    invoke-virtual {v1, v8, v9}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 87
    :cond_5
    :try_start_2
    invoke-interface {v2, p1, p2, p3}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 276
    invoke-virtual {v1, v3, v4, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 277
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 278
    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    return-void

    :catchall_0
    move-exception p1

    .line 276
    sget-object p2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, p2}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 277
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result p2

    if-eqz p2, :cond_6

    .line 278
    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    :cond_6
    throw p1

    .line 282
    :cond_7
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 283
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v5

    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    .line 87
    :cond_8
    :try_start_3
    invoke-interface {v2, p1, p2, p3}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 288
    invoke-virtual {v1, v3, v4, v7}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 289
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 290
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    return-void

    :catchall_1
    move-exception p1

    .line 288
    sget-object p2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, p2}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 289
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result p2

    if-eqz p2, :cond_9

    .line 290
    invoke-virtual {v1}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    :cond_9
    throw p1

    :cond_a
    return-void

    .line 63
    :cond_b
    :try_start_4
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 62
    :cond_c
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p1

    .line 61
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

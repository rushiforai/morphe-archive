.class abstract Lcom/google/common/util/concurrent/InterruptibleTask;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "InterruptibleTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;,
        Lcom/google/common/util/concurrent/InterruptibleTask$DoNothingRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference<",
        "Ljava/lang/Runnable;",
        ">;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final DONE:Ljava/lang/Runnable;

.field private static final MAX_BUSY_WAIT_SPINS:I = 0x3e8

.field private static final PARKED:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 39
    const-class v0, Ljava/util/concurrent/locks/LockSupport;

    .line 49
    new-instance v0, Lcom/google/common/util/concurrent/InterruptibleTask$DoNothingRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/InterruptibleTask$DoNothingRunnable;-><init>(Lcom/google/common/util/concurrent/InterruptibleTask$1;)V

    sput-object v0, Lcom/google/common/util/concurrent/InterruptibleTask;->DONE:Ljava/lang/Runnable;

    .line 50
    new-instance v0, Lcom/google/common/util/concurrent/InterruptibleTask$DoNothingRunnable;

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/InterruptibleTask$DoNothingRunnable;-><init>(Lcom/google/common/util/concurrent/InterruptibleTask$1;)V

    sput-object v0, Lcom/google/common/util/concurrent/InterruptibleTask;->PARKED:Ljava/lang/Runnable;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    return-void
.end method

.method private waitForInterrupt(Ljava/lang/Thread;)V
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "currentThread"
        }
    .end annotation

    .line 118
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/InterruptibleTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v1

    move v4, v3

    .line 120
    :goto_0
    instance-of v5, v0, Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;

    if-nez v5, :cond_1

    sget-object v5, Lcom/google/common/util/concurrent/InterruptibleTask;->PARKED:Ljava/lang/Runnable;

    if-eq v0, v5, :cond_2

    if-eqz v3, :cond_0

    .line 154
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    :cond_0
    return-void

    .line 122
    :cond_1
    move-object v2, v0

    check-cast v2, Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;

    :cond_2
    const/4 v5, 0x1

    add-int/2addr v4, v5

    const/16 v6, 0x3e8

    if-le v4, v6, :cond_5

    .line 133
    sget-object v6, Lcom/google/common/util/concurrent/InterruptibleTask;->PARKED:Ljava/lang/Runnable;

    if-eq v0, v6, :cond_3

    invoke-virtual {p0, v0, v6}, Lcom/google/common/util/concurrent/InterruptibleTask;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 145
    :cond_3
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_4

    if-nez v3, :cond_4

    move v3, v1

    goto :goto_1

    :cond_4
    move v3, v5

    .line 146
    :goto_1
    invoke-static {v2}, Ljava/util/concurrent/locks/LockSupport;->park(Ljava/lang/Object;)V

    goto :goto_2

    .line 149
    :cond_5
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 151
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/InterruptibleTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    goto :goto_0
.end method


# virtual methods
.method abstract afterRanInterruptiblyFailure(Ljava/lang/Throwable;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "error"
        }
    .end annotation
.end method

.method abstract afterRanInterruptiblySuccess(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method final interruptTask()V
    .registers 4

    .line 197
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/InterruptibleTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 198
    instance-of v1, v0, Ljava/lang/Thread;

    if-eqz v1, :cond_1

    .line 199
    new-instance v1, Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;-><init>(Lcom/google/common/util/concurrent/InterruptibleTask;Lcom/google/common/util/concurrent/InterruptibleTask$1;)V

    .line 200
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    # invokes: Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;->setOwner(Ljava/lang/Thread;)V
    invoke-static {v1, v2}, Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;->access$200(Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;Ljava/lang/Thread;)V

    .line 201
    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/InterruptibleTask;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 207
    :try_start_0
    move-object v1, v0

    check-cast v1, Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    sget-object v1, Lcom/google/common/util/concurrent/InterruptibleTask;->DONE:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/google/common/util/concurrent/InterruptibleTask;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    .line 210
    sget-object v1, Lcom/google/common/util/concurrent/InterruptibleTask;->PARKED:Ljava/lang/Runnable;

    if-ne p0, v1, :cond_1

    .line 211
    check-cast v0, Ljava/lang/Thread;

    invoke-static {v0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    return-void

    :catchall_0
    move-exception v1

    .line 209
    sget-object v2, Lcom/google/common/util/concurrent/InterruptibleTask;->DONE:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/google/common/util/concurrent/InterruptibleTask;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    .line 210
    sget-object v2, Lcom/google/common/util/concurrent/InterruptibleTask;->PARKED:Ljava/lang/Runnable;

    if-ne p0, v2, :cond_0

    .line 211
    check-cast v0, Ljava/lang/Thread;

    invoke-static {v0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 213
    :cond_0
    throw v1

    :cond_1
    return-void
.end method

.method abstract isDone()Z
.end method

.method public final run()V
    .registers 5

    .line 62
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    const/4 v1, 0x0

    .line 63
    invoke-virtual {p0, v1, v0}, Lcom/google/common/util/concurrent/InterruptibleTask;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 67
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/InterruptibleTask;->isDone()Z

    move-result v2

    if-nez v2, :cond_2

    .line 72
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/InterruptibleTask;->runInterruptibly()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    .line 75
    :try_start_1
    invoke-static {v2}, Lcom/google/common/util/concurrent/Platform;->restoreInterruptIfIsInterruptedException(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 79
    sget-object v1, Lcom/google/common/util/concurrent/InterruptibleTask;->DONE:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/InterruptibleTask;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 80
    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/InterruptibleTask;->waitForInterrupt(Ljava/lang/Thread;)V

    .line 87
    :cond_0
    invoke-virtual {p0, v2}, Lcom/google/common/util/concurrent/InterruptibleTask;->afterRanInterruptiblyFailure(Ljava/lang/Throwable;)V

    return-void

    :catchall_1
    move-exception v2

    .line 79
    sget-object v3, Lcom/google/common/util/concurrent/InterruptibleTask;->DONE:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, v3}, Lcom/google/common/util/concurrent/InterruptibleTask;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 80
    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/InterruptibleTask;->waitForInterrupt(Ljava/lang/Thread;)V

    .line 85
    :cond_1
    invoke-static {v1}, Lcom/google/common/util/concurrent/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/InterruptibleTask;->afterRanInterruptiblySuccess(Ljava/lang/Object;)V

    .line 90
    throw v2

    .line 79
    :cond_2
    :goto_0
    sget-object v3, Lcom/google/common/util/concurrent/InterruptibleTask;->DONE:Ljava/lang/Runnable;

    invoke-virtual {p0, v0, v3}, Lcom/google/common/util/concurrent/InterruptibleTask;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 80
    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/InterruptibleTask;->waitForInterrupt(Ljava/lang/Thread;)V

    :cond_3
    if-nez v2, :cond_4

    .line 85
    invoke-static {v1}, Lcom/google/common/util/concurrent/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/InterruptibleTask;->afterRanInterruptiblySuccess(Ljava/lang/Object;)V

    :cond_4
    return-void
.end method

.method abstract runInterruptibly()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method abstract toPendingString()Ljava/lang/String;
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    .line 251
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/InterruptibleTask;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 253
    sget-object v1, Lcom/google/common/util/concurrent/InterruptibleTask;->DONE:Ljava/lang/Runnable;

    if-ne v0, v1, :cond_0

    .line 254
    const-string v0, "running=[DONE]"

    goto :goto_0

    .line 255
    :cond_0
    instance-of v1, v0, Lcom/google/common/util/concurrent/InterruptibleTask$Blocker;

    if-eqz v1, :cond_1

    .line 256
    const-string v0, "running=[INTERRUPTED]"

    goto :goto_0

    .line 257
    :cond_1
    instance-of v1, v0, Ljava/lang/Thread;

    if-eqz v1, :cond_2

    .line 259
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "running=[RUNNING ON "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 261
    :cond_2
    const-string v0, "running=[NOT STARTED YET]"

    .line 263
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/InterruptibleTask;->toPendingString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

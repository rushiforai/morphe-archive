.class final Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ExecutionSequencer.java"

# interfaces
.implements Ljava/util/concurrent/Executor;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ExecutionSequencer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TaskNonReentrantExecutor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReference<",
        "Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;",
        ">;",
        "Ljava/util/concurrent/Executor;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field delegate:Ljava/util/concurrent/Executor;

.field sequencer:Lcom/google/common/util/concurrent/ExecutionSequencer;

.field submitting:Ljava/lang/Thread;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation
.end field

.field task:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/TrustedListenableFutureTask<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/ExecutionSequencer;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "delegate",
            "sequencer"
        }
    .end annotation

    .line 318
    sget-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    invoke-direct {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 319
    iput-object p1, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->delegate:Ljava/util/concurrent/Executor;

    .line 320
    iput-object p2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->sequencer:Lcom/google/common/util/concurrent/ExecutionSequencer;

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/ExecutionSequencer;Lcom/google/common/util/concurrent/ExecutionSequencer$1;)V
    .registers 4

    .line 293
    invoke-direct {p0, p1, p2}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;-><init>(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/ExecutionSequencer;)V

    return-void
.end method

.method static synthetic access$200(Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;)Z
    .registers 1

    .line 293
    invoke-direct {p0}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->trySetStarted()Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;)Z
    .registers 1

    .line 293
    invoke-direct {p0}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->trySetCancelled()Z

    move-result p0

    return p0
.end method

.method private trySetCancelled()Z
    .registers 3

    .line 475
    sget-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    sget-object v1, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->WILL_NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private trySetStarted()Z
    .registers 3

    .line 471
    sget-object v0, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    sget-object v1, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->STARTED:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "task"
        }
    .end annotation

    .line 334
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;->WILL_NOT_RUN:Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 335
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->delegate:Ljava/util/concurrent/Executor;

    .line 336
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->sequencer:Lcom/google/common/util/concurrent/ExecutionSequencer;

    return-void

    .line 339
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->submitting:Ljava/lang/Thread;

    .line 340
    check-cast p1, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    .line 352
    :try_start_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->sequencer:Lcom/google/common/util/concurrent/ExecutionSequencer;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ExecutionSequencer;

    # getter for: Lcom/google/common/util/concurrent/ExecutionSequencer;->latestTaskQueue:Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;
    invoke-static {v0}, Lcom/google/common/util/concurrent/ExecutionSequencer;->access$400(Lcom/google/common/util/concurrent/ExecutionSequencer;)Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;

    move-result-object v0

    .line 353
    iget-object v1, v0, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->thread:Ljava/lang/Thread;

    iget-object v3, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->submitting:Ljava/lang/Thread;

    if-ne v1, v3, :cond_2

    .line 354
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->sequencer:Lcom/google/common/util/concurrent/ExecutionSequencer;

    .line 359
    iget-object v1, v0, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->nextTask:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    if-nez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 360
    iput-object p1, v0, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->nextTask:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    .line 362
    iget-object p1, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->delegate:Ljava/util/concurrent/Executor;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Executor;

    iput-object p1, v0, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->nextExecutor:Ljava/util/concurrent/Executor;

    .line 363
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->delegate:Ljava/util/concurrent/Executor;

    goto :goto_1

    .line 366
    :cond_2
    iget-object v0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->delegate:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    .line 367
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->delegate:Ljava/util/concurrent/Executor;

    .line 368
    iput-object p1, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->task:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 370
    :try_start_1
    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 378
    :try_start_2
    invoke-direct {p0}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->trySetCancelled()Z

    .line 379
    invoke-virtual {p1, v0}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->setExceptionInternal(Ljava/lang/Throwable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 391
    :goto_1
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->submitting:Ljava/lang/Thread;

    return-void

    :catchall_0
    move-exception p1

    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->submitting:Ljava/lang/Thread;

    .line 392
    throw p1
.end method

.method public run()V
    .registers 4

    .line 398
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 399
    iget-object v1, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->submitting:Ljava/lang/Thread;

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 404
    iget-object v0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->task:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 405
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->task:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    .line 406
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    .line 412
    :cond_0
    new-instance v1, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;

    invoke-direct {v1, v2}, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;-><init>(Lcom/google/common/util/concurrent/ExecutionSequencer$1;)V

    .line 413
    iput-object v0, v1, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->thread:Ljava/lang/Thread;

    .line 435
    iget-object v0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->sequencer:Lcom/google/common/util/concurrent/ExecutionSequencer;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ExecutionSequencer;

    # setter for: Lcom/google/common/util/concurrent/ExecutionSequencer;->latestTaskQueue:Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/ExecutionSequencer;->access$402(Lcom/google/common/util/concurrent/ExecutionSequencer;Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;)Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;

    .line 436
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->sequencer:Lcom/google/common/util/concurrent/ExecutionSequencer;

    .line 439
    :try_start_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->task:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 440
    iput-object v2, p0, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->task:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    .line 441
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 449
    :goto_0
    iget-object p0, v1, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->nextTask:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    if-eqz p0, :cond_1

    iget-object v0, v1, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->nextExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_1

    .line 451
    iput-object v2, v1, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->nextTask:Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    .line 452
    iput-object v2, v1, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->nextExecutor:Ljava/util/concurrent/Executor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 454
    :try_start_1
    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 456
    :try_start_2
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->setExceptionInternal(Ljava/lang/Throwable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 466
    :cond_1
    iput-object v2, v1, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->thread:Ljava/lang/Thread;

    return-void

    :catchall_0
    move-exception p0

    iput-object v2, v1, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;->thread:Ljava/lang/Thread;

    .line 467
    throw p0
.end method

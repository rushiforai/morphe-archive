.class public final Lcom/google/common/util/concurrent/ExecutionSequencer;
.super Ljava/lang/Object;
.source "ExecutionSequencer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;,
        Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;,
        Lcom/google/common/util/concurrent/ExecutionSequencer$RunningState;
    }
.end annotation


# instance fields
.field private latestTaskQueue:Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation
.end field

.field private final ref:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 103
    invoke-static {}, Lcom/google/common/util/concurrent/Futures;->immediateVoidFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer;->ref:Ljava/util/concurrent/atomic/AtomicReference;

    .line 105
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;-><init>(Lcom/google/common/util/concurrent/ExecutionSequencer$1;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer;->latestTaskQueue:Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;

    return-void
.end method

.method static synthetic access$400(Lcom/google/common/util/concurrent/ExecutionSequencer;)Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;
    .registers 1

    .line 92
    iget-object p0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer;->latestTaskQueue:Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;

    return-object p0
.end method

.method static synthetic access$402(Lcom/google/common/util/concurrent/ExecutionSequencer;Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;)Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;
    .registers 2

    .line 92
    iput-object p1, p0, Lcom/google/common/util/concurrent/ExecutionSequencer;->latestTaskQueue:Lcom/google/common/util/concurrent/ExecutionSequencer$ThreadConfinedTaskQueue;

    return-object p1
.end method

.method public static create()Lcom/google/common/util/concurrent/ExecutionSequencer;
    .registers 1

    .line 98
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionSequencer;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/ExecutionSequencer;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$submitAsync$0(Lcom/google/common/util/concurrent/TrustedListenableFutureTask;Lcom/google/common/util/concurrent/SettableFuture;Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;)V
    .registers 6

    .line 225
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->isDone()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 229
    invoke-virtual {p1, p2}, Lcom/google/common/util/concurrent/SettableFuture;->setFutureInternal(Lcom/google/common/util/concurrent/ListenableFuture;)Z

    return-void

    .line 230
    :cond_0
    invoke-interface {p3}, Lcom/google/common/util/concurrent/ListenableFuture;->isCancelled()Z

    move-result p1

    if-eqz p1, :cond_1

    # invokes: Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->trySetCancelled()Z
    invoke-static {p4}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;->access$300(Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    .line 257
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->cancel(Z)Z

    :cond_1
    return-void
.end method


# virtual methods
.method public submit(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "callable",
            "executor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TT;>;"
        }
    .end annotation

    .line 154
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionSequencer$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/util/concurrent/ExecutionSequencer$1;-><init>(Lcom/google/common/util/concurrent/ExecutionSequencer;Ljava/util/concurrent/Callable;)V

    invoke-virtual {p0, v0, p2}, Lcom/google/common/util/concurrent/ExecutionSequencer;->submitAsync(Lcom/google/common/util/concurrent/AsyncCallable;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0
.end method

.method public submitAsync(Lcom/google/common/util/concurrent/AsyncCallable;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "callable",
            "executor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/util/concurrent/AsyncCallable<",
            "TT;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TT;>;"
        }
    .end annotation

    .line 180
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    new-instance v5, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;

    const/4 v0, 0x0

    invoke-direct {v5, p2, p0, v0}, Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;-><init>(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/ExecutionSequencer;Lcom/google/common/util/concurrent/ExecutionSequencer$1;)V

    .line 183
    new-instance p2, Lcom/google/common/util/concurrent/ExecutionSequencer$2;

    invoke-direct {p2, p0, v5, p1}, Lcom/google/common/util/concurrent/ExecutionSequencer$2;-><init>(Lcom/google/common/util/concurrent/ExecutionSequencer;Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;Lcom/google/common/util/concurrent/AsyncCallable;)V

    .line 209
    invoke-static {}, Lcom/google/common/util/concurrent/SettableFuture;->create()Lcom/google/common/util/concurrent/SettableFuture;

    move-result-object v2

    .line 211
    iget-object p0, p0, Lcom/google/common/util/concurrent/ExecutionSequencer;->ref:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v3, p0

    check-cast v3, Lcom/google/common/util/concurrent/ListenableFuture;

    .line 214
    invoke-static {p2}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->create(Lcom/google/common/util/concurrent/AsyncCallable;)Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    move-result-object v1

    .line 215
    invoke-interface {v3, v1, v5}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 217
    invoke-static {v1}, Lcom/google/common/util/concurrent/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    .line 223
    new-instance v0, Lcom/google/common/util/concurrent/ExecutionSequencer$0;

    invoke-direct/range {v0 .. v5}, Lcom/google/common/util/concurrent/ExecutionSequencer$0;-><init>(Lcom/google/common/util/concurrent/TrustedListenableFutureTask;Lcom/google/common/util/concurrent/SettableFuture;Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/util/concurrent/ExecutionSequencer$TaskNonReentrantExecutor;)V

    .line 263
    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object p0

    invoke-interface {v4, v0, p0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 264
    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object p0

    invoke-virtual {v1, v0, p0}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-object v4
.end method

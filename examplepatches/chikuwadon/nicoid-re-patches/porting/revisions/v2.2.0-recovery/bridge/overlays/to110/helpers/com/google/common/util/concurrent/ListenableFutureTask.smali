.class public final Lcom/google/common/util/concurrent/ListenableFutureTask;
.super Ljava/util/concurrent/FutureTask;
.source "ListenableFutureTask.java"

# interfaces
.implements Lcom/google/common/util/concurrent/ListenableFuture;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/FutureTask<",
        "TV;>;",
        "Lcom/google/common/util/concurrent/ListenableFuture<",
        "TV;>;"
    }
.end annotation


# instance fields
.field private final executionList:Lcom/google/common/util/concurrent/ExecutionList;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "runnable",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "TV;)V"
        }
    .end annotation

    .line 80
    invoke-direct {p0, p1, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 47
    new-instance p1, Lcom/google/common/util/concurrent/ExecutionList;

    invoke-direct {p1}, Lcom/google/common/util/concurrent/ExecutionList;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/ListenableFutureTask;->executionList:Lcom/google/common/util/concurrent/ExecutionList;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Callable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callable"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "TV;>;)V"
        }
    .end annotation

    .line 76
    invoke-direct {p0, p1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 47
    new-instance p1, Lcom/google/common/util/concurrent/ExecutionList;

    invoke-direct {p1}, Lcom/google/common/util/concurrent/ExecutionList;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/ListenableFutureTask;->executionList:Lcom/google/common/util/concurrent/ExecutionList;

    return-void
.end method

.method public static create(Ljava/lang/Runnable;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFutureTask;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "runnable",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Runnable;",
            "TV;)",
            "Lcom/google/common/util/concurrent/ListenableFutureTask<",
            "TV;>;"
        }
    .end annotation

    .line 72
    new-instance v0, Lcom/google/common/util/concurrent/ListenableFutureTask;

    invoke-direct {v0, p0, p1}, Lcom/google/common/util/concurrent/ListenableFutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    return-object v0
.end method

.method public static create(Ljava/util/concurrent/Callable;)Lcom/google/common/util/concurrent/ListenableFutureTask;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callable"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TV;>;)",
            "Lcom/google/common/util/concurrent/ListenableFutureTask<",
            "TV;>;"
        }
    .end annotation

    .line 57
    new-instance v0, Lcom/google/common/util/concurrent/ListenableFutureTask;

    invoke-direct {v0, p0}, Lcom/google/common/util/concurrent/ListenableFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    return-object v0
.end method


# virtual methods
.method public addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "listener",
            "exec"
        }
    .end annotation

    .line 85
    iget-object p0, p0, Lcom/google/common/util/concurrent/ListenableFutureTask;->executionList:Lcom/google/common/util/concurrent/ExecutionList;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/util/concurrent/ExecutionList;->add(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method protected done()V
    .registers 1

    .line 106
    iget-object p0, p0, Lcom/google/common/util/concurrent/ListenableFutureTask;->executionList:Lcom/google/common/util/concurrent/ExecutionList;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ExecutionList;->execute()V

    return-void
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 9
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 94
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    const-wide v2, 0x1dcd64ffffffffffL    # 3.98785104510193E-165

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 96
    invoke-super {p0, p1, p2, p3}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 100
    :cond_0
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    sget-object p3, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 99
    invoke-super {p0, p1, p2, p3}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

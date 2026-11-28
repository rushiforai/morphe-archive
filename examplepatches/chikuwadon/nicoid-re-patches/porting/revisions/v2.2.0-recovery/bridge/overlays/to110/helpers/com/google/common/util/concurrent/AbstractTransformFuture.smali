.class abstract Lcom/google/common/util/concurrent/AbstractTransformFuture;
.super Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture;
.source "AbstractTransformFuture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/AbstractTransformFuture$AsyncTransformFuture;,
        Lcom/google/common/util/concurrent/AbstractTransformFuture$TransformFuture;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "O:",
        "Ljava/lang/Object;",
        "F:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture<",
        "TO;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field function:Ljava/lang/Object;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TF;"
        }
    .end annotation
.end field

.field inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TI;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/ListenableFuture;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "inputFuture",
            "function"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TI;>;TF;)V"
        }
    .end annotation

    .line 62
    invoke-direct {p0}, Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture;-><init>()V

    .line 63
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/util/concurrent/ListenableFuture;

    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 64
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->function:Ljava/lang/Object;

    return-void
.end method

.method static create(Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/base/Function;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "input",
            "function",
            "executor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TI;>;",
            "Lcom/google/common/base/Function<",
            "-TI;+TO;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TO;>;"
        }
    .end annotation

    .line 50
    new-instance v0, Lcom/google/common/util/concurrent/AbstractTransformFuture$TransformFuture;

    invoke-direct {v0, p0, p1}, Lcom/google/common/util/concurrent/AbstractTransformFuture$TransformFuture;-><init>(Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/base/Function;)V

    .line 51
    invoke-static {p2, v0}, Lcom/google/common/util/concurrent/MoreExecutors;->rejectionPropagatingExecutor(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/AbstractFuture;)Ljava/util/concurrent/Executor;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-object v0
.end method

.method static createAsync(Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/util/concurrent/AsyncFunction;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "input",
            "function",
            "executor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TI;>;",
            "Lcom/google/common/util/concurrent/AsyncFunction<",
            "-TI;+TO;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TO;>;"
        }
    .end annotation

    .line 43
    new-instance v0, Lcom/google/common/util/concurrent/AbstractTransformFuture$AsyncTransformFuture;

    invoke-direct {v0, p0, p1}, Lcom/google/common/util/concurrent/AbstractTransformFuture$AsyncTransformFuture;-><init>(Lcom/google/common/util/concurrent/ListenableFuture;Lcom/google/common/util/concurrent/AsyncFunction;)V

    .line 44
    invoke-static {p2, v0}, Lcom/google/common/util/concurrent/MoreExecutors;->rejectionPropagatingExecutor(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/AbstractFuture;)Ljava/util/concurrent/Executor;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-object v0
.end method


# virtual methods
.method protected final afterDone()V
    .registers 2

    .line 186
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 187
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->maybePropagateCancellationTo(Ljava/util/concurrent/Future;)V

    const/4 v0, 0x0

    .line 188
    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 189
    iput-object v0, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->function:Ljava/lang/Object;

    return-void
.end method

.method abstract doTransform(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "function",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TF;TI;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected pendingToString()Ljava/lang/String;
    .registers 5

    .line 194
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 195
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->function:Ljava/lang/Object;

    .line 196
    invoke-super {p0}, Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture;->pendingToString()Ljava/lang/String;

    move-result-object p0

    if-eqz v0, :cond_0

    .line 199
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "inputFuture=["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "], "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 198
    :cond_0
    const-string v0, ""

    :goto_0
    if-eqz v1, :cond_1

    .line 202
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "function=["

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    if-eqz p0, :cond_2

    .line 204
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public final run()V
    .registers 7

    .line 73
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 74
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->function:Ljava/lang/Object;

    .line 75
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->isCancelled()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v0, :cond_0

    move v5, v3

    goto :goto_0

    :cond_0
    move v5, v4

    :goto_0
    or-int/2addr v2, v5

    if-eqz v1, :cond_1

    move v3, v4

    :cond_1
    or-int/2addr v2, v3

    if-eqz v2, :cond_2

    return-void

    :cond_2
    const/4 v2, 0x0

    .line 78
    iput-object v2, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->inputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 80
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 83
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->setFuture(Lcom/google/common/util/concurrent/ListenableFuture;)Z

    return-void

    .line 97
    :cond_3
    :try_start_0
    invoke-static {v0}, Lcom/google/common/util/concurrent/Futures;->getDone(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    :try_start_1
    invoke-virtual {p0, v1, v0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->doTransform(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    iput-object v2, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->function:Ljava/lang/Object;

    .line 172
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->setResult(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    .line 128
    :try_start_2
    invoke-static {v0}, Lcom/google/common/util/concurrent/Platform;->restoreInterruptIfIsInterruptedException(Ljava/lang/Throwable;)V

    .line 130
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->setException(Ljava/lang/Throwable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 133
    iput-object v2, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->function:Ljava/lang/Object;

    return-void

    :catchall_1
    move-exception v0

    iput-object v2, p0, Lcom/google/common/util/concurrent/AbstractTransformFuture;->function:Ljava/lang/Object;

    .line 134
    throw v0

    :catch_0
    move-exception v0

    .line 120
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->setException(Ljava/lang/Throwable;)Z

    return-void

    :catch_1
    move-exception v0

    .line 112
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->setException(Ljava/lang/Throwable;)Z

    return-void

    :catch_2
    move-exception v0

    .line 108
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->setException(Ljava/lang/Throwable;)Z

    return-void

    .line 104
    :catch_3
    invoke-virtual {p0, v4}, Lcom/google/common/util/concurrent/AbstractTransformFuture;->cancel(Z)Z

    return-void
.end method

.method abstract setResult(Ljava/lang/Object;)V
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

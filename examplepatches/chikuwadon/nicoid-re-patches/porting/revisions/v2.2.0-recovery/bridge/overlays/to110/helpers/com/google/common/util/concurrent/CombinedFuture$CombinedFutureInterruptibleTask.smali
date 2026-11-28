.class abstract Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;
.super Lcom/google/common/util/concurrent/InterruptibleTask;
.source "CombinedFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/CombinedFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "CombinedFutureInterruptibleTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/InterruptibleTask<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final listenerExecutor:Ljava/util/concurrent/Executor;

.field final synthetic this$0:Lcom/google/common/util/concurrent/CombinedFuture;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/CombinedFuture;Ljava/util/concurrent/Executor;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "listenerExecutor"
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->this$0:Lcom/google/common/util/concurrent/CombinedFuture;

    invoke-direct {p0}, Lcom/google/common/util/concurrent/InterruptibleTask;-><init>()V

    .line 98
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Executor;

    iput-object p1, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->listenerExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method


# virtual methods
.method final afterRanInterruptiblyFailure(Ljava/lang/Throwable;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "error"
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->this$0:Lcom/google/common/util/concurrent/CombinedFuture;

    const/4 v1, 0x0

    # setter for: Lcom/google/common/util/concurrent/CombinedFuture;->task:Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/CombinedFuture;->access$002(Lcom/google/common/util/concurrent/CombinedFuture;Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;)Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;

    .line 137
    instance-of v0, p1, Ljava/util/concurrent/ExecutionException;

    if-eqz v0, :cond_0

    .line 142
    iget-object p0, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->this$0:Lcom/google/common/util/concurrent/CombinedFuture;

    check-cast p1, Ljava/util/concurrent/ExecutionException;

    invoke-virtual {p1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/CombinedFuture;->setException(Ljava/lang/Throwable;)Z

    return-void

    .line 143
    :cond_0
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    .line 146
    iget-object p0, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->this$0:Lcom/google/common/util/concurrent/CombinedFuture;

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    .line 144
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/CombinedFuture;->cancel(Z)Z

    return-void

    .line 146
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/CombinedFuture;->setException(Ljava/lang/Throwable;)Z

    return-void
.end method

.method final afterRanInterruptiblySuccess(Ljava/lang/Object;)V
    .registers 4
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

    .line 127
    iget-object v0, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->this$0:Lcom/google/common/util/concurrent/CombinedFuture;

    const/4 v1, 0x0

    # setter for: Lcom/google/common/util/concurrent/CombinedFuture;->task:Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/CombinedFuture;->access$002(Lcom/google/common/util/concurrent/CombinedFuture;Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;)Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;

    .line 129
    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method final execute()V
    .registers 2

    .line 108
    :try_start_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->listenerExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 110
    iget-object p0, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->this$0:Lcom/google/common/util/concurrent/CombinedFuture;

    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/CombinedFuture;->setException(Ljava/lang/Throwable;)Z

    return-void
.end method

.method final isDone()Z
    .registers 1

    .line 103
    iget-object p0, p0, Lcom/google/common/util/concurrent/CombinedFuture$CombinedFutureInterruptibleTask;->this$0:Lcom/google/common/util/concurrent/CombinedFuture;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/CombinedFuture;->isDone()Z

    move-result p0

    return p0
.end method

.method abstract setValue(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

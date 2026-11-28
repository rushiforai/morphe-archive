.class Lcom/google/common/util/concurrent/TrustedListenableFutureTask;
.super Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture;
.source "TrustedListenableFutureTask.java"

# interfaces
.implements Ljava/util/concurrent/RunnableFuture;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/TrustedListenableFutureTask$TrustedFutureInterruptibleTask;,
        Lcom/google/common/util/concurrent/TrustedListenableFutureTask$TrustedFutureInterruptibleAsyncTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture<",
        "TV;>;",
        "Ljava/util/concurrent/RunnableFuture<",
        "TV;>;"
    }
.end annotation


# instance fields
.field private volatile task:Lcom/google/common/util/concurrent/InterruptibleTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/InterruptibleTask<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/AsyncCallable;)V
    .registers 3
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
            "Lcom/google/common/util/concurrent/AsyncCallable<",
            "TV;>;)V"
        }
    .end annotation

    .line 72
    invoke-direct {p0}, Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture;-><init>()V

    .line 73
    new-instance v0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask$TrustedFutureInterruptibleAsyncTask;

    invoke-direct {v0, p0, p1}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask$TrustedFutureInterruptibleAsyncTask;-><init>(Lcom/google/common/util/concurrent/TrustedListenableFutureTask;Lcom/google/common/util/concurrent/AsyncCallable;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->task:Lcom/google/common/util/concurrent/InterruptibleTask;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Callable;)V
    .registers 3
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

    .line 68
    invoke-direct {p0}, Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture;-><init>()V

    .line 69
    new-instance v0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask$TrustedFutureInterruptibleTask;

    invoke-direct {v0, p0, p1}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask$TrustedFutureInterruptibleTask;-><init>(Lcom/google/common/util/concurrent/TrustedListenableFutureTask;Ljava/util/concurrent/Callable;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->task:Lcom/google/common/util/concurrent/InterruptibleTask;

    return-void
.end method

.method static create(Lcom/google/common/util/concurrent/AsyncCallable;)Lcom/google/common/util/concurrent/TrustedListenableFutureTask;
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
            "Lcom/google/common/util/concurrent/AsyncCallable<",
            "TV;>;)",
            "Lcom/google/common/util/concurrent/TrustedListenableFutureTask<",
            "TV;>;"
        }
    .end annotation

    .line 38
    new-instance v0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    invoke-direct {v0, p0}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;-><init>(Lcom/google/common/util/concurrent/AsyncCallable;)V

    return-object v0
.end method

.method static create(Ljava/lang/Runnable;Ljava/lang/Object;)Lcom/google/common/util/concurrent/TrustedListenableFutureTask;
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
            "Lcom/google/common/util/concurrent/TrustedListenableFutureTask<",
            "TV;>;"
        }
    .end annotation

    .line 56
    new-instance v0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    invoke-static {p0, p1}, Ljava/util/concurrent/Executors;->callable(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Callable;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    return-object v0
.end method

.method static create(Ljava/util/concurrent/Callable;)Lcom/google/common/util/concurrent/TrustedListenableFutureTask;
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
            "Lcom/google/common/util/concurrent/TrustedListenableFutureTask<",
            "TV;>;"
        }
    .end annotation

    .line 42
    new-instance v0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;

    invoke-direct {v0, p0}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    return-object v0
.end method


# virtual methods
.method protected afterDone()V
    .registers 2

    .line 91
    invoke-super {p0}, Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture;->afterDone()V

    .line 93
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->wasInterrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->task:Lcom/google/common/util/concurrent/InterruptibleTask;

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {v0}, Lcom/google/common/util/concurrent/InterruptibleTask;->interruptTask()V

    :cond_0
    const/4 v0, 0x0

    .line 100
    iput-object v0, p0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->task:Lcom/google/common/util/concurrent/InterruptibleTask;

    return-void
.end method

.method protected pendingToString()Ljava/lang/String;
    .registers 3

    .line 105
    iget-object v0, p0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->task:Lcom/google/common/util/concurrent/InterruptibleTask;

    if-eqz v0, :cond_0

    .line 107
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "task=["

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 109
    :cond_0
    invoke-super {p0}, Lcom/google/common/util/concurrent/FluentFuture$TrustedFuture;->pendingToString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public run()V
    .registers 2

    .line 78
    iget-object v0, p0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->task:Lcom/google/common/util/concurrent/InterruptibleTask;

    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {v0}, Lcom/google/common/util/concurrent/InterruptibleTask;->run()V

    :cond_0
    const/4 v0, 0x0

    .line 86
    iput-object v0, p0, Lcom/google/common/util/concurrent/TrustedListenableFutureTask;->task:Lcom/google/common/util/concurrent/InterruptibleTask;

    return-void
.end method

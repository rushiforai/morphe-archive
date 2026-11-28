.class Lcom/google/common/util/concurrent/ClosingFuture$3;
.super Ljava/lang/Object;
.source "ClosingFuture.java"

# interfaces
.implements Lcom/google/common/util/concurrent/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/util/concurrent/ClosingFuture;->eventuallyClosing(Lcom/google/common/util/concurrent/ListenableFuture;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/util/concurrent/FutureCallback<",
        "Ljava/lang/AutoCloseable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$closingExecutor:Ljava/util/concurrent/Executor;

.field final synthetic val$closingFuture:Lcom/google/common/util/concurrent/ClosingFuture;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/ClosingFuture;Ljava/util/concurrent/Executor;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "val$closingFuture",
            "val$closingExecutor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 477
    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$3;->val$closingFuture:Lcom/google/common/util/concurrent/ClosingFuture;

    iput-object p2, p0, Lcom/google/common/util/concurrent/ClosingFuture$3;->val$closingExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "t"
        }
    .end annotation

    return-void
.end method

.method public onSuccess(Ljava/lang/AutoCloseable;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 480
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$3;->val$closingFuture:Lcom/google/common/util/concurrent/ClosingFuture;

    # getter for: Lcom/google/common/util/concurrent/ClosingFuture;->state:Lcom/google/common/util/concurrent/ClosingFuture$State;
    invoke-static {v0}, Lcom/google/common/util/concurrent/ClosingFuture;->access$300(Lcom/google/common/util/concurrent/ClosingFuture;)Lcom/google/common/util/concurrent/ClosingFuture$State;

    move-result-object v0

    iget-object v0, v0, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    # getter for: Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->closer:Lcom/google/common/util/concurrent/ClosingFuture$DeferredCloser;
    invoke-static {v0}, Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->access$100(Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)Lcom/google/common/util/concurrent/ClosingFuture$DeferredCloser;

    move-result-object v0

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$3;->val$closingExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, p1, p0}, Lcom/google/common/util/concurrent/ClosingFuture$DeferredCloser;->eventuallyClose(Ljava/lang/Object;Ljava/util/concurrent/Executor;)Ljava/lang/Object;

    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "result"
        }
    .end annotation

    .line 477
    check-cast p1, Ljava/lang/AutoCloseable;

    invoke-virtual {p0, p1}, Lcom/google/common/util/concurrent/ClosingFuture$3;->onSuccess(Ljava/lang/AutoCloseable;)V

    return-void
.end method

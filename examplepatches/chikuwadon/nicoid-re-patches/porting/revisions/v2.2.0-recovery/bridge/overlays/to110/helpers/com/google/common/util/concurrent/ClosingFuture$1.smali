.class Lcom/google/common/util/concurrent/ClosingFuture$1;
.super Ljava/lang/Object;
.source "ClosingFuture.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/util/concurrent/ClosingFuture;->submit(Lcom/google/common/util/concurrent/ClosingFuture$ClosingCallable;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic val$callable:Lcom/google/common/util/concurrent/ClosingFuture$ClosingCallable;

.field final synthetic val$closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/ClosingFuture$ClosingCallable;Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "val$callable",
            "val$closeables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 387
    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$1;->val$callable:Lcom/google/common/util/concurrent/ClosingFuture$ClosingCallable;

    iput-object p2, p0, Lcom/google/common/util/concurrent/ClosingFuture$1;->val$closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 391
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$1;->val$callable:Lcom/google/common/util/concurrent/ClosingFuture$ClosingCallable;

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$1;->val$closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    # getter for: Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->closer:Lcom/google/common/util/concurrent/ClosingFuture$DeferredCloser;
    invoke-static {p0}, Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->access$100(Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)Lcom/google/common/util/concurrent/ClosingFuture$DeferredCloser;

    move-result-object p0

    invoke-interface {v0, p0}, Lcom/google/common/util/concurrent/ClosingFuture$ClosingCallable;->call(Lcom/google/common/util/concurrent/ClosingFuture$DeferredCloser;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 396
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$1;->val$callable:Lcom/google/common/util/concurrent/ClosingFuture$ClosingCallable;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.class Lcom/google/common/util/concurrent/ClosingFuture$Combiner$1;
.super Ljava/lang/Object;
.source "ClosingFuture.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/util/concurrent/ClosingFuture$Combiner;->call(Lcom/google/common/util/concurrent/ClosingFuture$Combiner$CombiningCallable;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ClosingFuture;
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
.field final synthetic this$0:Lcom/google/common/util/concurrent/ClosingFuture$Combiner;

.field final synthetic val$combiningCallable:Lcom/google/common/util/concurrent/ClosingFuture$Combiner$CombiningCallable;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/ClosingFuture$Combiner;Lcom/google/common/util/concurrent/ClosingFuture$Combiner$CombiningCallable;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$combiningCallable"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1234
    iput-object p2, p0, Lcom/google/common/util/concurrent/ClosingFuture$Combiner$1;->val$combiningCallable:Lcom/google/common/util/concurrent/ClosingFuture$Combiner$CombiningCallable;

    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$Combiner$1;->this$0:Lcom/google/common/util/concurrent/ClosingFuture$Combiner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .registers 4
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

    .line 1238
    new-instance v0, Lcom/google/common/util/concurrent/ClosingFuture$Peeker;

    iget-object v1, p0, Lcom/google/common/util/concurrent/ClosingFuture$Combiner$1;->this$0:Lcom/google/common/util/concurrent/ClosingFuture$Combiner;

    # getter for: Lcom/google/common/util/concurrent/ClosingFuture$Combiner;->inputs:Lcom/google/common/collect/ImmutableList;
    invoke-static {v1}, Lcom/google/common/util/concurrent/ClosingFuture$Combiner;->access$1100(Lcom/google/common/util/concurrent/ClosingFuture$Combiner;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/common/util/concurrent/ClosingFuture$Peeker;-><init>(Lcom/google/common/collect/ImmutableList;Lcom/google/common/util/concurrent/ClosingFuture$1;)V

    iget-object v1, p0, Lcom/google/common/util/concurrent/ClosingFuture$Combiner$1;->val$combiningCallable:Lcom/google/common/util/concurrent/ClosingFuture$Combiner$CombiningCallable;

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$Combiner$1;->this$0:Lcom/google/common/util/concurrent/ClosingFuture$Combiner;

    # getter for: Lcom/google/common/util/concurrent/ClosingFuture$Combiner;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;
    invoke-static {p0}, Lcom/google/common/util/concurrent/ClosingFuture$Combiner;->access$1000(Lcom/google/common/util/concurrent/ClosingFuture$Combiner;)Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    move-result-object p0

    # invokes: Lcom/google/common/util/concurrent/ClosingFuture$Peeker;->call(Lcom/google/common/util/concurrent/ClosingFuture$Combiner$CombiningCallable;Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)Ljava/lang/Object;
    invoke-static {v0, v1, p0}, Lcom/google/common/util/concurrent/ClosingFuture$Peeker;->access$1300(Lcom/google/common/util/concurrent/ClosingFuture$Peeker;Lcom/google/common/util/concurrent/ClosingFuture$Combiner$CombiningCallable;Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 1243
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$Combiner$1;->val$combiningCallable:Lcom/google/common/util/concurrent/ClosingFuture$Combiner$CombiningCallable;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.class Lcom/google/common/util/concurrent/ClosingFuture$5;
.super Ljava/lang/Object;
.source "ClosingFuture.java"

# interfaces
.implements Lcom/google/common/util/concurrent/AsyncFunction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/util/concurrent/ClosingFuture;->transformAsync(Lcom/google/common/util/concurrent/ClosingFuture$AsyncClosingFunction;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/util/concurrent/AsyncFunction<",
        "TV;TU;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/util/concurrent/ClosingFuture;

.field final synthetic val$function:Lcom/google/common/util/concurrent/ClosingFuture$AsyncClosingFunction;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/ClosingFuture;Lcom/google/common/util/concurrent/ClosingFuture$AsyncClosingFunction;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$function"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 783
    iput-object p2, p0, Lcom/google/common/util/concurrent/ClosingFuture$5;->val$function:Lcom/google/common/util/concurrent/ClosingFuture$AsyncClosingFunction;

    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$5;->this$0:Lcom/google/common/util/concurrent/ClosingFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TU;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 786
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$5;->this$0:Lcom/google/common/util/concurrent/ClosingFuture;

    # getter for: Lcom/google/common/util/concurrent/ClosingFuture;->state:Lcom/google/common/util/concurrent/ClosingFuture$State;
    invoke-static {v0}, Lcom/google/common/util/concurrent/ClosingFuture;->access$300(Lcom/google/common/util/concurrent/ClosingFuture;)Lcom/google/common/util/concurrent/ClosingFuture$State;

    move-result-object v0

    iget-object v0, v0, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$5;->val$function:Lcom/google/common/util/concurrent/ClosingFuture$AsyncClosingFunction;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->applyAsyncClosingFunction(Lcom/google/common/util/concurrent/ClosingFuture$AsyncClosingFunction;Ljava/lang/Object;)Lcom/google/common/util/concurrent/FluentFuture;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 791
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$5;->val$function:Lcom/google/common/util/concurrent/ClosingFuture$AsyncClosingFunction;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

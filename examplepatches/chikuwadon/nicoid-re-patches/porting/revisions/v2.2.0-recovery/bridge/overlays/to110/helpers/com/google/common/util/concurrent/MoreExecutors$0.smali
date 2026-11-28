.class public final synthetic Lcom/google/common/util/concurrent/MoreExecutors$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Executor;


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/Executor;

.field public final synthetic f$1:Lcom/google/common/util/concurrent/AbstractFuture;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/AbstractFuture;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/MoreExecutors$0;->f$0:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lcom/google/common/util/concurrent/MoreExecutors$0;->f$1:Lcom/google/common/util/concurrent/AbstractFuture;

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/google/common/util/concurrent/MoreExecutors$0;->f$0:Ljava/util/concurrent/Executor;

    iget-object p0, p0, Lcom/google/common/util/concurrent/MoreExecutors$0;->f$1:Lcom/google/common/util/concurrent/AbstractFuture;

    invoke-static {v0, p0, p1}, Lcom/google/common/util/concurrent/MoreExecutors;->lambda$rejectionPropagatingExecutor$0(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/AbstractFuture;Ljava/lang/Runnable;)V

    return-void
.end method

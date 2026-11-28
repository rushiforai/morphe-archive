.class public final synthetic Lcom/google/common/util/concurrent/MoreExecutors$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Executor;


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/Executor;

.field public final synthetic f$1:Lcom/google/common/base/Supplier;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Lcom/google/common/base/Supplier;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/MoreExecutors$3;->f$0:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lcom/google/common/util/concurrent/MoreExecutors$3;->f$1:Lcom/google/common/base/Supplier;

    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/google/common/util/concurrent/MoreExecutors$3;->f$0:Ljava/util/concurrent/Executor;

    iget-object p0, p0, Lcom/google/common/util/concurrent/MoreExecutors$3;->f$1:Lcom/google/common/base/Supplier;

    invoke-static {v0, p0, p1}, Lcom/google/common/util/concurrent/MoreExecutors;->lambda$renamingDecorator$0(Ljava/util/concurrent/Executor;Lcom/google/common/base/Supplier;Ljava/lang/Runnable;)V

    return-void
.end method

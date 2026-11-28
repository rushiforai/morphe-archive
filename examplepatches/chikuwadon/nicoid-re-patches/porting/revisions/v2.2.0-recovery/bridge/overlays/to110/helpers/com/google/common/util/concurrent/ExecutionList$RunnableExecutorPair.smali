.class final Lcom/google/common/util/concurrent/ExecutionList$RunnableExecutorPair;
.super Ljava/lang/Object;
.source "ExecutionList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ExecutionList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RunnableExecutorPair"
.end annotation


# instance fields
.field final executor:Ljava/util/concurrent/Executor;

.field next:Lcom/google/common/util/concurrent/ExecutionList$RunnableExecutorPair;

.field final runnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/ExecutionList$RunnableExecutorPair;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "runnable",
            "executor",
            "next"
        }
    .end annotation

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    iput-object p1, p0, Lcom/google/common/util/concurrent/ExecutionList$RunnableExecutorPair;->runnable:Ljava/lang/Runnable;

    .line 166
    iput-object p2, p0, Lcom/google/common/util/concurrent/ExecutionList$RunnableExecutorPair;->executor:Ljava/util/concurrent/Executor;

    .line 167
    iput-object p3, p0, Lcom/google/common/util/concurrent/ExecutionList$RunnableExecutorPair;->next:Lcom/google/common/util/concurrent/ExecutionList$RunnableExecutorPair;

    return-void
.end method

.class public Lcom/tantanapp/media/ttmediautils/task/TaskManager;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static startRunnableRequestInPool(Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;I)V
    .locals 1

    .line 9
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->getInstance()Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->addTaskIntoPool(Lcom/tantanapp/media/ttmediautils/task/NamedRunnable;I)V

    return-void
.end method

.method public static startRunnableRequestInPool(Ljava/lang/Runnable;I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->getInstance()Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->addTaskIntoPool(Ljava/lang/Runnable;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static startThread(Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->getInstance()Lcom/tantanapp/media/ttmediautils/task/RunnablePool;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool;->startThread(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

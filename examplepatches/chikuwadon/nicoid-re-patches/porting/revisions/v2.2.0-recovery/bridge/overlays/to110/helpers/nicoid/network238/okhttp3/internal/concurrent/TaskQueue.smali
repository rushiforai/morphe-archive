.class public final Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010!\n\u0002\u0008\u0006\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u00020\u0001:\u00014B\u0019\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0018\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\u00132\u0008\u0008\u0002\u0010%\u001a\u00020&J&\u0010\"\u001a\u00020#2\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010%\u001a\u00020&2\u000c\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020&0(J0\u0010)\u001a\u00020#2\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010%\u001a\u00020&2\u0008\u0008\u0002\u0010*\u001a\u00020\r2\u000c\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020#0(J\u0006\u0010+\u001a\u00020,J%\u0010-\u001a\u00020\r2\u0006\u0010$\u001a\u00020\u00132\u0006\u0010%\u001a\u00020&2\u0006\u0010.\u001a\u00020\rH\u0000\u00a2\u0006\u0002\u0008/J\u0006\u00100\u001a\u00020#J\u0006\u0010\u000c\u001a\u00020#J\r\u00101\u001a\u00020\rH\u0000\u00a2\u0006\u0002\u00082J\u0008\u00103\u001a\u00020\u0005H\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u001a\u0010\u000c\u001a\u00020\rX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011R\u001c\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017R\u001a\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u0019X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u001bR\u001a\u0010\u001c\u001a\u00020\rX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001d\u0010\u000f\"\u0004\u0008\u001e\u0010\u0011R\u0017\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u00130 8F\u00a2\u0006\u0006\u001a\u0004\u0008!\u0010\u001b\u00a8\u00065"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "name",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Ljava/lang/String;)V",
        "getTaskRunner$okhttp",
        "()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "getName$okhttp",
        "()Ljava/lang/String;",
        "shutdown",
        "",
        "getShutdown$okhttp",
        "()Z",
        "setShutdown$okhttp",
        "(Z)V",
        "activeTask",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "getActiveTask$okhttp",
        "()Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "setActiveTask$okhttp",
        "(Lnicoid/network238/okhttp3/internal/concurrent/Task;)V",
        "futureTasks",
        "",
        "getFutureTasks$okhttp",
        "()Ljava/util/List;",
        "cancelActiveTask",
        "getCancelActiveTask$okhttp",
        "setCancelActiveTask$okhttp",
        "scheduledTasks",
        "",
        "getScheduledTasks",
        "schedule",
        "",
        "task",
        "delayNanos",
        "",
        "block",
        "Lnicoid/network238/kotlin/Function0;",
        "execute",
        "cancelable",
        "idleLatch",
        "Ljava/util/concurrent/CountDownLatch;",
        "scheduleAndDecide",
        "recurrence",
        "scheduleAndDecide$okhttp",
        "cancelAll",
        "cancelAllAndDecide",
        "cancelAllAndDecide$okhttp",
        "toString",
        "AwaitIdleTask",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private activeTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;

.field private cancelActiveTask:Z

.field private final futureTasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
            ">;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;

.field private shutdown:Z

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 30
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->name:Ljava/lang/String;

    .line 38
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    return-void
.end method

.method public static synthetic execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    .registers 14

    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_0

    const-wide/16 p2, 0x0

    :cond_0
    move-wide v2, p2

    and-int/lit8 p6, p6, 0x4

    if-eqz p6, :cond_1

    const/4 p4, 0x1

    :cond_1
    move v4, p4

    .line 103
    move-object v0, p0

    move-object v1, p1

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute(Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public static synthetic schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    .registers 7

    and-int/lit8 p5, p5, 0x2

    if-eqz p5, :cond_0

    const-wide/16 p2, 0x0

    .line 85
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule(Ljava/lang/String;JLnicoid/network238/kotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public static synthetic schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V
    .registers 6

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const-wide/16 p2, 0x0

    .line 60
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule(Lnicoid/network238/okhttp3/internal/concurrent/Task;J)V

    return-void
.end method


# virtual methods
.method public final cancelAll()V
    .registers 5

    .line 202
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 268
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 269
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Thread "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " MUST NOT hold lock on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 204
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 272
    monitor-enter v0

    .line 205
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelAllAndDecide$okhttp()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 206
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v1, p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->kickCoordinator$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V

    .line 208
    :cond_1
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 272
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public final cancelAllAndDecide$okhttp()Z
    .registers 6

    .line 224
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->activeTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getCancelable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelActiveTask:Z

    :cond_0
    nop

    .line 229
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, -0x1

    if-ge v3, v0, :cond_3

    .line 230
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/internal/concurrent/Task;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getCancelable()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 231
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getLogger$okhttp()Ljava/util/logging/Logger;

    move-result-object v2

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/internal/concurrent/Task;

    .line 278
    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v4}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 279
    const-string v4, "canceled"

    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {v2, v3, p0, v4}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    :cond_1
    nop

    .line 233
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move v2, v1

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    return v2
.end method

.method public final execute(Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "JZ",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    new-instance v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$execute$1;

    invoke-direct {v0, p1, p4, p5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$execute$1;-><init>(Ljava/lang/String;ZLnicoid/network238/kotlin/jvm/functions/Function0;)V

    .line 109
    invoke-virtual {p0, v0, p2, p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule(Lnicoid/network238/okhttp3/internal/concurrent/Task;J)V

    return-void
.end method

.method public final getActiveTask$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/Task;
    .registers 2

    .line 35
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->activeTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;

    return-object v0
.end method

.method public final getCancelActiveTask$okhttp()Z
    .registers 2

    .line 41
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelActiveTask:Z

    return v0
.end method

.method public final getFutureTasks$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
            ">;"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    return-object v0
.end method

.method public final getName$okhttp()Ljava/lang/String;
    .registers 2

    .line 30
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getScheduledTasks()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
            ">;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 242
    monitor-enter v0

    .line 48
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-static {v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public final getShutdown$okhttp()Z
    .registers 2

    .line 32
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown:Z

    return v0
.end method

.method public final getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    .registers 2

    .line 29
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object v0
.end method

.method public final idleLatch()Ljava/util/concurrent/CountDownLatch;
    .registers 6

    .line 122
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 252
    monitor-enter v0

    .line 124
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->activeTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 125
    new-instance v1, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v1, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    goto :goto_0

    .line 130
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->activeTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;

    .line 131
    instance-of v3, v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;

    if-eqz v3, :cond_1

    .line 132
    check-cast v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;->getLatch()Ljava/util/concurrent/CountDownLatch;

    move-result-object v1

    goto :goto_0

    .line 134
    :cond_1
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/internal/concurrent/Task;

    .line 135
    instance-of v4, v3, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;

    if-eqz v4, :cond_2

    .line 136
    check-cast v3, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;->getLatch()Ljava/util/concurrent/CountDownLatch;

    move-result-object v1

    goto :goto_0

    .line 141
    :cond_3
    new-instance v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;-><init>()V

    .line 142
    const-wide/16 v3, 0x0

    invoke-virtual {p0, v1, v3, v4, v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->scheduleAndDecide$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/Task;JZ)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 143
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v2, p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->kickCoordinator$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V

    .line 145
    :cond_4
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;->getLatch()Ljava/util/concurrent/CountDownLatch;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    :goto_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public final schedule(Ljava/lang/String;JLnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    new-instance v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$schedule$2;

    invoke-direct {v0, p1, p4}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$schedule$2;-><init>(Ljava/lang/String;Lnicoid/network238/kotlin/jvm/functions/Function0;)V

    .line 90
    invoke-virtual {p0, v0, p2, p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule(Lnicoid/network238/okhttp3/internal/concurrent/Task;J)V

    return-void
.end method

.method public final schedule(Lnicoid/network238/okhttp3/internal/concurrent/Task;J)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 243
    monitor-enter v0

    .line 65
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown:Z

    if-eqz v1, :cond_2

    .line 66
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getCancelable()Z

    move-result p2

    .line 70
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    if-eqz p2, :cond_0

    .line 67
    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getLogger$okhttp()Ljava/util/logging/Logger;

    move-result-object p2

    .line 244
    sget-object p3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {p2, p3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 67
    const-string p3, "schedule canceled (queue is shutdown)"

    .line 245
    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {p2, p1, p0, p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    goto :goto_0

    .line 70
    :cond_0
    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getLogger$okhttp()Ljava/util/logging/Logger;

    move-result-object p2

    .line 248
    sget-object p3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {p2, p3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 70
    const-string p3, "schedule failed (queue is shutdown)"

    .line 249
    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {p2, p1, p0, p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    .line 71
    :cond_1
    new-instance p1, Ljava/util/concurrent/RejectedExecutionException;

    invoke-direct {p1}, Ljava/util/concurrent/RejectedExecutionException;-><init>()V

    throw p1

    :cond_2
    nop

    .line 74
    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, p3, v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->scheduleAndDecide$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/Task;JZ)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 75
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {p1, p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->kickCoordinator$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V

    .line 77
    :cond_3
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    :cond_4
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public final scheduleAndDecide$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/Task;JZ)Z
    .registers 14

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 164
    invoke-virtual {p1, p0}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->initQueue$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V

    .line 166
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getBackend()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->nanoTime()J

    move-result-wide v0

    add-long v2, v0, p2

    .line 170
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-eq v4, v6, :cond_1

    .line 172
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getNextExecuteNanoTime$okhttp()J

    move-result-wide v7

    cmp-long v7, v7, v2

    if-gtz v7, :cond_0

    .line 173
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getLogger$okhttp()Ljava/util/logging/Logger;

    move-result-object p2

    .line 253
    sget-object p3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {p2, p3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result p3

    if-eqz p3, :cond_7

    .line 254
    const-string p3, "already scheduled"

    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {p2, p1, p0, p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 176
    :cond_0
    iget-object v7, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {v7, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 178
    :cond_1
    invoke-virtual {p1, v2, v3}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->setNextExecuteNanoTime$okhttp(J)V

    .line 179
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getLogger$okhttp()Ljava/util/logging/Logger;

    move-result-object v4

    .line 257
    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v7}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v7

    if-eqz v7, :cond_3

    if-eqz p4, :cond_2

    .line 181
    new-instance p4, Ljava/lang/StringBuilder;

    const-string v7, "run again after "

    invoke-direct {p4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->formatDuration(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    goto :goto_0

    .line 183
    :cond_2
    new-instance p4, Ljava/lang/StringBuilder;

    const-string v7, "scheduled after "

    invoke-direct {p4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->formatDuration(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 258
    :goto_0
    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {v4, p1, p0, p4}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    .line 188
    :cond_3
    iget-object p4, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    .line 262
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    move v2, v5

    :goto_1
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 263
    check-cast v3, Lnicoid/network238/okhttp3/internal/concurrent/Task;

    .line 188
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getNextExecuteNanoTime$okhttp()J

    move-result-wide v3

    sub-long/2addr v3, v0

    cmp-long v3, v3, p2

    if-gtz v3, :cond_5

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    move v2, v6

    :cond_5
    if-ne v2, v6, :cond_6

    .line 189
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    .line 190
    :cond_6
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->futureTasks:Ljava/util/List;

    invoke-interface {p2, v2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    if-nez v2, :cond_7

    const/4 p1, 0x1

    return p1

    :cond_7
    :goto_2
    return v5
.end method

.method public final setActiveTask$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/Task;)V
    .registers 2

    .line 35
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->activeTask:Lnicoid/network238/okhttp3/internal/concurrent/Task;

    return-void
.end method

.method public final setCancelActiveTask$okhttp(Z)V
    .registers 2

    .line 41
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelActiveTask:Z

    return-void
.end method

.method public final setShutdown$okhttp(Z)V
    .registers 2

    .line 32
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown:Z

    return-void
.end method

.method public final shutdown()V
    .registers 5

    .line 212
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 273
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 274
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Thread "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " MUST NOT hold lock on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 214
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 277
    monitor-enter v0

    .line 215
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->shutdown:Z

    .line 216
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelAllAndDecide$okhttp()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 217
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v1, p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->kickCoordinator$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V

    .line 219
    :cond_1
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 277
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 239
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->name:Ljava/lang/String;

    return-object v0
.end method

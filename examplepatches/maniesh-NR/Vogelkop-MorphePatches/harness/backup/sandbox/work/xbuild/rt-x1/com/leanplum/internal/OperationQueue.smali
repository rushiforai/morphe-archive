.class public Lcom/leanplum/internal/OperationQueue;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final OPERATION_QUEUE_NAME:Ljava/lang/String; = "com.leanplum.operation_queue"

.field private static final OPERATION_QUEUE_PRIORITY:I

.field private static instance:Lcom/leanplum/internal/OperationQueue;


# instance fields
.field private executor:Ljava/util/concurrent/Executor;

.field private handler:Landroid/os/Handler;

.field private handlerThread:Landroid/os/HandlerThread;

.field private uiHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/leanplum/internal/OperationQueue;->uiHandler:Landroid/os/Handler;

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/internal/OperationQueue;->executor:Ljava/util/concurrent/Executor;

    invoke-direct {p0}, Lcom/leanplum/internal/OperationQueue;->start()V

    return-void
.end method

.method public static sharedInstance()Lcom/leanplum/internal/OperationQueue;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/OperationQueue;->instance:Lcom/leanplum/internal/OperationQueue;

    if-nez v0, :cond_b

    new-instance v0, Lcom/leanplum/internal/OperationQueue;

    invoke-direct {v0}, Lcom/leanplum/internal/OperationQueue;-><init>()V

    sput-object v0, Lcom/leanplum/internal/OperationQueue;->instance:Lcom/leanplum/internal/OperationQueue;

    :cond_b
    return-object v0
.end method

.method private start()V
    .registers 4

    iget-object v0, p0, Lcom/leanplum/internal/OperationQueue;->handlerThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_11

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "com.leanplum.operation_queue"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/leanplum/internal/OperationQueue;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_11
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/leanplum/internal/OperationQueue;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/leanplum/internal/OperationQueue;->handler:Landroid/os/Handler;

    return-void
.end method

.method private stop()V
    .registers 2

    invoke-virtual {p0}, Lcom/leanplum/internal/OperationQueue;->removeAllOperations()V

    iget-object v0, p0, Lcom/leanplum/internal/OperationQueue;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/leanplum/internal/OperationQueue;->handlerThread:Landroid/os/HandlerThread;

    return-void
.end method


# virtual methods
.method public addOperation(Ljava/lang/Runnable;)Z
    .registers 2

    if-eqz p1, :cond_b

    iget-object p0, p0, Lcom/leanplum/internal/OperationQueue;->handler:Landroid/os/Handler;

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public addOperationAfterDelay(Ljava/lang/Runnable;J)Z
    .registers 4

    if-eqz p1, :cond_b

    iget-object p0, p0, Lcom/leanplum/internal/OperationQueue;->handler:Landroid/os/Handler;

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public addOperationAtFront(Ljava/lang/Runnable;)Z
    .registers 2

    if-eqz p1, :cond_b

    iget-object p0, p0, Lcom/leanplum/internal/OperationQueue;->handler:Landroid/os/Handler;

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public addOperationAtTime(Ljava/lang/Runnable;J)Z
    .registers 4

    if-eqz p1, :cond_b

    iget-object p0, p0, Lcom/leanplum/internal/OperationQueue;->handler:Landroid/os/Handler;

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1, p2, p3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public addParallelOperation(Ljava/lang/Runnable;)V
    .registers 2

    if-eqz p1, :cond_9

    iget-object p0, p0, Lcom/leanplum/internal/OperationQueue;->executor:Ljava/util/concurrent/Executor;

    if-eqz p0, :cond_9

    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_9
    return-void
.end method

.method public addUiOperation(Ljava/lang/Runnable;)V
    .registers 2

    if-eqz p1, :cond_9

    iget-object p0, p0, Lcom/leanplum/internal/OperationQueue;->uiHandler:Landroid/os/Handler;

    if-eqz p0, :cond_9

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_9
    return-void
.end method

.method public removeAllOperations()V
    .registers 2

    iget-object p0, p0, Lcom/leanplum/internal/OperationQueue;->handler:Landroid/os/Handler;

    if-eqz p0, :cond_8

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_8
    return-void
.end method

.method public removeOperation(Ljava/lang/Runnable;)V
    .registers 2

    if-eqz p1, :cond_9

    iget-object p0, p0, Lcom/leanplum/internal/OperationQueue;->handler:Landroid/os/Handler;

    if-eqz p0, :cond_9

    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_9
    return-void
.end method

.class Lcom/tantanapp/media/ttmediautils/task/RunnablePool$RejectExecutorHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/ttmediautils/task/RunnablePool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RejectExecutorHolder"
.end annotation


# static fields
.field private static final rejectQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static final sRejectExecutor:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v6, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$RejectExecutorHolder;->rejectQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 7
    .line 8
    new-instance v0, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;

    .line 9
    .line 10
    new-instance v7, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;

    .line 11
    .line 12
    const-string v1, "ttmeida_reject"

    .line 13
    .line 14
    invoke-direct {v7, v1}, Lcom/tantanapp/media/ttmediautils/task/MyThreadFactory;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v8, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;

    .line 18
    .line 19
    invoke-direct {v8, v1}, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$MyRejectHandler;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v9, "ttmeida_reject"

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    const/4 v2, 0x1

    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    invoke-direct/range {v0 .. v9}, Lcom/tantanapp/media/ttmediautils/task/MonitorThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$RejectExecutorHolder;->sRejectExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 34
    .line 35
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000()Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediautils/task/RunnablePool$RejectExecutorHolder;->sRejectExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    return-object v0
.end method

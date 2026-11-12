.class public Lcom/leanplum/internal/RequestSenderTimer;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final INSTANCE:Lcom/leanplum/internal/RequestSenderTimer;


# instance fields
.field private timerInterval:Lcom/leanplum/EventsUploadInterval;

.field private timerOperation:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/internal/RequestSenderTimer;

    invoke-direct {v0}, Lcom/leanplum/internal/RequestSenderTimer;-><init>()V

    sput-object v0, Lcom/leanplum/internal/RequestSenderTimer;->INSTANCE:Lcom/leanplum/internal/RequestSenderTimer;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/leanplum/EventsUploadInterval;->AT_MOST_15_MINUTES:Lcom/leanplum/EventsUploadInterval;

    iput-object v0, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerInterval:Lcom/leanplum/EventsUploadInterval;

    return-void
.end method

.method public static synthetic access$000(Lcom/leanplum/internal/RequestSenderTimer;)V
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/internal/RequestSenderTimer;->sendAllRequestsWithHeartbeat()V

    return-void
.end method

.method public static synthetic access$100(Lcom/leanplum/internal/RequestSenderTimer;)Ljava/lang/Runnable;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerOperation:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static get()Lcom/leanplum/internal/RequestSenderTimer;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/RequestSenderTimer;->INSTANCE:Lcom/leanplum/internal/RequestSenderTimer;

    return-object v0
.end method

.method private sendAllRequestsWithHeartbeat()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withHeartbeatAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    sget-object v0, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method


# virtual methods
.method public createTimerOperation()Ljava/lang/Runnable;
    .registers 2

    new-instance v0, Lcom/leanplum/internal/RequestSenderTimer$1;

    invoke-direct {v0, p0}, Lcom/leanplum/internal/RequestSenderTimer$1;-><init>(Lcom/leanplum/internal/RequestSenderTimer;)V

    return-object v0
.end method

.method public getIntervalMillis()J
    .registers 3

    iget-object p0, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerInterval:Lcom/leanplum/EventsUploadInterval;

    invoke-virtual {p0}, Lcom/leanplum/EventsUploadInterval;->getMinutes()I

    move-result p0

    const v0, 0xea60

    mul-int/2addr p0, v0

    int-to-long v0, p0

    return-wide v0
.end method

.method public setTimerInterval(Lcom/leanplum/EventsUploadInterval;)V
    .registers 2
    .param p1    # Lcom/leanplum/EventsUploadInterval;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerInterval:Lcom/leanplum/EventsUploadInterval;

    return-void
.end method

.method public declared-synchronized start()V
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerOperation:Ljava/lang/Runnable;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1e

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lcom/leanplum/internal/RequestSenderTimer;->createTimerOperation()Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerOperation:Ljava/lang/Runnable;

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerOperation:Ljava/lang/Runnable;

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestSenderTimer;->getIntervalMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/leanplum/internal/OperationQueue;->addOperationAfterDelay(Ljava/lang/Runnable;J)Z
    :try_end_1a
    .catchall {:try_start_7 .. :try_end_1a} :catchall_1e

    monitor-exit p0

    return-void

    :goto_1c
    :try_start_1c
    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1e

    throw v0

    :catchall_1e
    move-exception v0

    goto :goto_1c
.end method

.method public declared-synchronized stop()V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerOperation:Ljava/lang/Runnable;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_17

    if-nez v0, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    :try_start_7
    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerOperation:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/OperationQueue;->removeOperation(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/leanplum/internal/RequestSenderTimer;->timerOperation:Ljava/lang/Runnable;
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_17

    monitor-exit p0

    return-void

    :goto_15
    :try_start_15
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_17

    throw v0

    :catchall_17
    move-exception v0

    goto :goto_15
.end method

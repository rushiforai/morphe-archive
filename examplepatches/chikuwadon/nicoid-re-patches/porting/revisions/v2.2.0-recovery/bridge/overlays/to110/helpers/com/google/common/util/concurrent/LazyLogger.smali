.class final Lcom/google/common/util/concurrent/LazyLogger;
.super Ljava/lang/Object;
.source "LazyLogger.java"


# instance fields
.field private final lock:Ljava/lang/Object;

.field private volatile logger:Ljava/util/logging/Logger;

.field private final loggerName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ownerOfLogger"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/common/util/concurrent/LazyLogger;->lock:Ljava/lang/Object;

    .line 30
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/util/concurrent/LazyLogger;->loggerName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method get()Ljava/util/logging/Logger;
    .registers 3

    .line 45
    iget-object v0, p0, Lcom/google/common/util/concurrent/LazyLogger;->logger:Ljava/util/logging/Logger;

    if-eqz v0, :cond_0

    return-object v0

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/LazyLogger;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 50
    :try_start_0
    iget-object v1, p0, Lcom/google/common/util/concurrent/LazyLogger;->logger:Ljava/util/logging/Logger;

    if-eqz v1, :cond_1

    .line 52
    monitor-exit v0

    return-object v1

    .line 54
    :cond_1
    iget-object v1, p0, Lcom/google/common/util/concurrent/LazyLogger;->loggerName:Ljava/lang/String;

    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    iput-object v1, p0, Lcom/google/common/util/concurrent/LazyLogger;->logger:Ljava/util/logging/Logger;

    .line 55
    iget-object p0, p0, Lcom/google/common/util/concurrent/LazyLogger;->logger:Ljava/util/logging/Logger;

    monitor-exit v0

    return-object p0

    .line 56
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

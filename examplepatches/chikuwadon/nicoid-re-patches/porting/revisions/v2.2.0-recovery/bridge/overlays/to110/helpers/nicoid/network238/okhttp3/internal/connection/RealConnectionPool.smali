.class public final Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000i\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\t*\u0001\u0016\u0008\u0007\u0018\u0000 22\u00020\u0001:\u00012B1\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0006\u0010\u001b\u001a\u00020\u0005J\u0006\u0010\u001c\u001a\u00020\u0005J?\u0010\u001d\u001a\u0004\u0018\u00010\u001a2\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020#2\u000e\u0010$\u001a\n\u0012\u0004\u0012\u00020&\u0018\u00010%2\u0006\u0010\'\u001a\u00020\u001fH\u0000\u00a2\u0006\u0002\u0008(J\u000e\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020\u001aJ\u000e\u0010,\u001a\u00020\u001f2\u0006\u0010+\u001a\u00020\u001aJ\u0006\u0010-\u001a\u00020*J\u000e\u0010.\u001a\u00020\u00072\u0006\u0010/\u001a\u00020\u0007J\u0018\u00100\u001a\u00020\u00052\u0006\u0010+\u001a\u00020\u001a2\u0006\u0010/\u001a\u00020\u0007H\u0002J\u0006\u00101\u001a\u00020*R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u00020\u000bX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0014\u0010\u0010\u001a\u00020\u0007X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0015\u001a\u00020\u0016X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0017R\u0014\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u001a0\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00063"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "maxIdleConnections",
        "",
        "keepAliveDuration",
        "",
        "timeUnit",
        "Ljava/util/concurrent/TimeUnit;",
        "connectionListener",
        "Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V",
        "getConnectionListener$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;",
        "keepAliveDurationNs",
        "getKeepAliveDurationNs$okhttp",
        "()J",
        "cleanupQueue",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "cleanupTask",
        "nicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;",
        "connections",
        "Ljava/util/concurrent/ConcurrentLinkedQueue;",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "idleConnectionCount",
        "connectionCount",
        "callAcquirePooledConnection",
        "doExtensiveHealthChecks",
        "",
        "address",
        "Lnicoid/network238/okhttp3/Address;",
        "call",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "routes",
        "",
        "Lnicoid/network238/okhttp3/Route;",
        "requireMultiplexed",
        "callAcquirePooledConnection$okhttp",
        "put",
        "",
        "connection",
        "connectionBecameIdle",
        "evictAll",
        "closeConnections",
        "now",
        "pruneAndGetAllocationCount",
        "scheduleCloser",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$Companion;


# instance fields
.field private final cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

.field private final cleanupTask:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;

.field private final connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

.field private final connections:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
            ">;"
        }
    .end annotation
.end field

.field private final keepAliveDurationNs:J

.field private final maxIdleConnections:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->Companion:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->maxIdleConnections:I

    .line 43
    iput-object p6, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    .line 45
    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide p5

    iput-wide p5, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->keepAliveDurationNs:J

    .line 47
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->okHttpName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " ConnectionPool connection closer"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;

    invoke-direct {p2, p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;Ljava/lang/String;)V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->cleanupTask:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;

    .line 58
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    const-wide/16 p1, 0x0

    cmp-long p1, p3, p1

    if-lez p1, :cond_0

    return-void

    .line 62
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "keepAliveDuration <= 0: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private final pruneAndGetAllocationCount(Lnicoid/network238/okhttp3/internal/connection/RealConnection;J)I
    .registers 10

    .line 354
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 355
    new-instance p2, Ljava/lang/AssertionError;

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "Thread "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " MUST hold lock on "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2

    .line 297
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getCalls()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    .line 299
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 300
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/Reference;

    .line 302
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 308
    :cond_2
    check-cast v3, Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;

    .line 310
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "A connection to "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->route()Lnicoid/network238/okhttp3/Route;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " was leaked. Did you forget to close a response body?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 312
    sget-object v5, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v5

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall$CallReference;->getCallStackTrace()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5, v4, v3}, Lnicoid/network238/okhttp3/internal/platform/Platform;->logCloseableLeak(Ljava/lang/String;Ljava/lang/Object;)V

    .line 314
    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 317
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 318
    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->keepAliveDurationNs:J

    sub-long/2addr p2, v2

    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setIdleAtNs(J)V

    return v1

    .line 323
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    return p1
.end method


# virtual methods
.method public final callAcquirePooledConnection$okhttp(ZLnicoid/network238/okhttp3/Address;Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;Z)Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lnicoid/network238/okhttp3/Address;",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;Z)",
            "Lnicoid/network238/okhttp3/internal/connection/RealConnection;"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 94
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 341
    monitor-enter v1

    const/4 v2, 0x1

    if-eqz p5, :cond_1

    .line 96
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->isMultiplexed$okhttp()Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 100
    :cond_1
    invoke-virtual {v1, p2, p4}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->isEligible$okhttp(Lnicoid/network238/okhttp3/Address;Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_2

    :goto_1
    const/4 v3, 0x0

    goto :goto_2

    .line 105
    :cond_2
    invoke-virtual {p3, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->acquireConnectionNoEvents(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move v3, v2

    .line 341
    :goto_2
    monitor-exit v1

    if-eqz v3, :cond_0

    .line 113
    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->isHealthy(Z)Z

    move-result v3

    if-eqz v3, :cond_3

    return-object v1

    .line 342
    :cond_3
    monitor-enter v1

    .line 120
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getNoNewExchanges()Z

    move-result v3

    .line 121
    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setNoNewExchanges(Z)V

    .line 122
    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->releaseConnectionNoEvents$okhttp()Ljava/net/Socket;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 342
    monitor-exit v1

    if-eqz v2, :cond_4

    .line 125
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 126
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionClosed(Lnicoid/network238/okhttp3/Connection;)V

    goto :goto_0

    :cond_4
    if-nez v3, :cond_0

    .line 128
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->noNewExchanges(Lnicoid/network238/okhttp3/Connection;)V

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 342
    monitor-exit v1

    throw p1

    :catchall_1
    move-exception p1

    .line 341
    monitor-exit v1

    throw p1

    :cond_5
    const/4 p1, 0x0

    return-object p1
.end method

.method public final closeConnections(J)J
    .registers 20

    .line 202
    move-object/from16 v1, p0

    move-wide/from16 v2, p1

    iget-wide v4, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->keepAliveDurationNs:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    .line 208
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v6, 0x0

    const-wide v7, 0x7fffffffffffffffL

    const/4 v9, 0x0

    move-object v11, v6

    move-object v12, v11

    move v10, v9

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 209
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 352
    monitor-enter v13

    .line 211
    :try_start_0
    invoke-direct {v1, v13, v2, v3}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->pruneAndGetAllocationCount(Lnicoid/network238/okhttp3/internal/connection/RealConnection;J)I

    move-result v14

    if-lez v14, :cond_0

    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 216
    :cond_0
    invoke-virtual {v13}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getIdleAtNs()J

    move-result-wide v14

    cmp-long v16, v14, v4

    if-gez v16, :cond_1

    move-object v11, v13

    move-wide v4, v14

    :cond_1
    add-int/lit8 v9, v9, 0x1

    cmp-long v16, v14, v7

    if-gez v16, :cond_2

    move-object v12, v13

    move-wide v7, v14

    .line 228
    :cond_2
    :goto_1
    sget-object v14, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 352
    monitor-exit v13

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v13

    throw v0

    :cond_3
    const-wide/16 v13, -0x1

    if-eqz v11, :cond_4

    move-object v6, v11

    goto :goto_2

    .line 241
    :cond_4
    iget v0, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->maxIdleConnections:I

    if-le v9, v0, :cond_5

    move-wide v4, v7

    move-object v6, v12

    goto :goto_2

    :cond_5
    move-wide v4, v13

    :goto_2
    if-eqz v6, :cond_9

    .line 353
    monitor-enter v6

    .line 256
    :try_start_1
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getCalls()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const-wide/16 v2, 0x0

    if-nez v0, :cond_6

    goto :goto_3

    .line 257
    :cond_6
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getIdleAtNs()J

    move-result-wide v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    cmp-long v0, v7, v4

    if-eqz v0, :cond_7

    .line 353
    :goto_3
    monitor-exit v6

    return-wide v2

    :cond_7
    nop

    .line 258
    const/4 v0, 0x1

    :try_start_2
    invoke-virtual {v6, v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setNoNewExchanges(Z)V

    .line 259
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, v6}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 353
    monitor-exit v6

    .line 261
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->socket()Ljava/net/Socket;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 262
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    invoke-virtual {v0, v6}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionClosed(Lnicoid/network238/okhttp3/Connection;)V

    .line 263
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelAll()V

    :cond_8
    return-wide v2

    :catchall_1
    move-exception v0

    .line 353
    monitor-exit v6

    throw v0

    :cond_9
    if-eqz v12, :cond_a

    .line 271
    iget-wide v4, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->keepAliveDurationNs:J

    add-long/2addr v7, v4

    sub-long/2addr v7, v2

    return-wide v7

    :cond_a
    if-lez v10, :cond_b

    .line 276
    iget-wide v2, v1, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->keepAliveDurationNs:J

    return-wide v2

    :cond_b
    return-wide v13
.end method

.method public final connectionBecameIdle(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 347
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 348
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MUST hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 149
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getNoNewExchanges()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->maxIdleConnections:I

    if-eqz v0, :cond_1

    .line 155
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->scheduleCloser()V

    const/4 p1, 0x0

    return p1

    :cond_1
    nop

    .line 150
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setNoNewExchanges(Z)V

    .line 151
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 152
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelAll()V

    :cond_2
    return v0
.end method

.method public final connectionCount()I
    .registers 2

    .line 70
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v0

    return v0
.end method

.method public final evictAll()V
    .registers 4

    .line 161
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 163
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 165
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 351
    monitor-enter v1

    .line 166
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getCalls()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 167
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 168
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setNoNewExchanges(Z)V

    .line 169
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->socket()Ljava/net/Socket;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 351
    :goto_1
    monitor-exit v1

    if-eqz v2, :cond_0

    .line 175
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 176
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionClosed(Lnicoid/network238/okhttp3/Connection;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 351
    monitor-exit v1

    throw v0

    .line 180
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelAll()V

    :cond_3
    return-void
.end method

.method public final getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;
    .registers 2

    .line 43
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    return-object v0
.end method

.method public final getKeepAliveDurationNs$okhttp()J
    .registers 3

    .line 45
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->keepAliveDurationNs:J

    return-wide v0
.end method

.method public final idleConnectionCount()I
    .registers 5

    .line 66
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 336
    instance-of v1, v0, Ljava/util/Collection;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return v2

    .line 338
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 67
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 339
    monitor-enter v1

    .line 67
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getCalls()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 339
    monitor-exit v1

    if-eqz v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    if-gez v2, :cond_1

    .line 338
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->throwCountOverflow()V

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 339
    monitor-exit v1

    throw v0

    :cond_2
    return v2
.end method

.method public final put(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 343
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 344
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MUST hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 137
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connections:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 139
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->scheduleCloser()V

    return-void
.end method

.method public final scheduleCloser()V
    .registers 7

    .line 327
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->cleanupQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->cleanupTask:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V

    return-void
.end method

.class public final Lnicoid/network238/okhttp3/Dispatcher;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003B\u0013\u0008\u0016\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0002\u0010\u0006J\u0019\u0010\u001e\u001a\u00020\u001f2\n\u0010 \u001a\u00060\u001aR\u00020\u001bH\u0000\u00a2\u0006\u0002\u0008!J\u0016\u0010\"\u001a\u0008\u0018\u00010\u001aR\u00020\u001b2\u0006\u0010#\u001a\u00020$H\u0002J\u0006\u0010%\u001a\u00020\u001fJ4\u0010&\u001a\u00020\u001f2\u000e\u0008\u0002\u0010\'\u001a\u0008\u0018\u00010\u001aR\u00020\u001b2\n\u0008\u0002\u0010(\u001a\u0004\u0018\u00010\u001b2\u000e\u0008\u0002\u0010)\u001a\u0008\u0018\u00010\u001aR\u00020\u001bH\u0002J\u0015\u0010*\u001a\u00020+2\u0006\u0010 \u001a\u00020\u001bH\u0000\u00a2\u0006\u0002\u0008,J\u0019\u0010-\u001a\u00020\u001f2\n\u0010 \u001a\u00060\u001aR\u00020\u001bH\u0000\u00a2\u0006\u0002\u0008.J\u0015\u0010-\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u001bH\u0000\u00a2\u0006\u0002\u0008.J\u000c\u0010/\u001a\u0008\u0012\u0004\u0012\u00020100J\u000c\u00102\u001a\u0008\u0012\u0004\u0012\u00020100J\u0006\u00103\u001a\u00020\u0008J\u0006\u00104\u001a\u00020\u0008J\r\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u00085R$\u0010\u0007\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0008@FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR$\u0010\r\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u0008@FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\n\"\u0004\u0008\u000f\u0010\u000cR\u001c\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015R\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u00058G\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0017R\u0018\u0010\u0018\u001a\u000c\u0012\u0008\u0012\u00060\u001aR\u00020\u001b0\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0018\u0010\u001c\u001a\u000c\u0012\u0008\u0012\u00060\u001aR\u00020\u001b0\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00066"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Dispatcher;",
        "",
        "<init>",
        "()V",
        "executorService",
        "Ljava/util/concurrent/ExecutorService;",
        "(Ljava/util/concurrent/ExecutorService;)V",
        "maxRequests",
        "",
        "getMaxRequests",
        "()I",
        "setMaxRequests",
        "(I)V",
        "maxRequestsPerHost",
        "getMaxRequestsPerHost",
        "setMaxRequestsPerHost",
        "idleCallback",
        "Ljava/lang/Runnable;",
        "getIdleCallback",
        "()Ljava/lang/Runnable;",
        "setIdleCallback",
        "(Ljava/lang/Runnable;)V",
        "executorServiceOrNull",
        "()Ljava/util/concurrent/ExecutorService;",
        "readyAsyncCalls",
        "Ljava/util/ArrayDeque;",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "runningAsyncCalls",
        "runningSyncCalls",
        "enqueue",
        "",
        "call",
        "enqueue$okhttp",
        "findExistingCallWithHost",
        "host",
        "",
        "cancelAll",
        "promoteAndExecute",
        "enqueuedCall",
        "finishedCall",
        "finishedAsyncCall",
        "executed",
        "",
        "executed$okhttp",
        "finished",
        "finished$okhttp",
        "queuedCalls",
        "",
        "Lnicoid/network238/okhttp3/Call;",
        "runningCalls",
        "queuedCallsCount",
        "runningCallsCount",
        "-deprecated_executorService",
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
.field private executorServiceOrNull:Ljava/util/concurrent/ExecutorService;

.field private idleCallback:Ljava/lang/Runnable;

.field private maxRequests:I

.field private maxRequestsPerHost:I

.field private final readyAsyncCalls:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
            ">;"
        }
    .end annotation
.end field

.field private final runningAsyncCalls:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
            ">;"
        }
    .end annotation
.end field

.field private final runningSyncCalls:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/16 v0, 0x40

    iput v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->maxRequests:I

    .line 73
    const/4 v0, 0x5

    iput v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->maxRequestsPerHost:I

    .line 118
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    .line 121
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    .line 124
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningSyncCalls:Ljava/util/ArrayDeque;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .registers 2

    .line 126
    invoke-direct {p0}, Lnicoid/network238/okhttp3/Dispatcher;-><init>()V

    .line 127
    iput-object p1, p0, Lnicoid/network238/okhttp3/Dispatcher;->executorServiceOrNull:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private final findExistingCallWithHost(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;
    .registers 5

    .line 135
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    .line 136
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    .line 138
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    .line 139
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object v1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method private final promoteAndExecute(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V
    .registers 13

    .line 175
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertLockNotHeld(Lnicoid/network238/okhttp3/Dispatcher;)V

    .line 176
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    .line 185
    monitor-enter p0

    if-eqz p2, :cond_1

    .line 187
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningSyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v1, p2}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "Call wasn\'t in-flight!"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_1
    :goto_0
    if-eqz p3, :cond_3

    .line 191
    invoke-virtual {p3}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCallsPerHost()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 192
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v1, p3}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const-string p1, "Call wasn\'t in-flight!"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_3
    :goto_1
    if-eqz p1, :cond_4

    .line 196
    iget-object v1, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 200
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getForWebSocket()Z

    move-result v1

    if-nez v1, :cond_4

    .line 201
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/Dispatcher;->findExistingCallWithHost(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 202
    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->reuseCallsPerHostFrom(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V

    :cond_4
    const/4 v1, 0x0

    if-nez p2, :cond_5

    if-nez p3, :cond_5

    goto :goto_2

    :cond_5
    if-nez v0, :cond_6

    .line 208
    iget-object p2, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {p2}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_7

    .line 209
    :cond_6
    iget-object p2, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningSyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {p2}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_7

    .line 210
    iget-object p2, p0, Lnicoid/network238/okhttp3/Dispatcher;->idleCallback:Ljava/lang/Runnable;

    goto :goto_3

    :cond_7
    :goto_2
    move-object p2, v1

    :goto_3
    if-eqz v0, :cond_8

    .line 215
    iget-object p3, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    .line 216
    invoke-static {p3}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p3

    .line 217
    iget-object v2, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->clear()V

    .line 213
    new-instance v2, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;

    invoke-direct {v2, p3, p2}, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;-><init>(Ljava/util/List;Ljava/lang/Runnable;)V

    goto :goto_5

    .line 222
    :cond_8
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 223
    iget-object v2, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 224
    :cond_9
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 225
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    .line 227
    iget-object v4, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->size()I

    move-result v4

    iget v5, p0, Lnicoid/network238/okhttp3/Dispatcher;->maxRequests:I

    if-ge v4, v5, :cond_a

    .line 228
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCallsPerHost()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v4

    iget v5, p0, Lnicoid/network238/okhttp3/Dispatcher;->maxRequestsPerHost:I

    if-ge v4, v5, :cond_9

    .line 230
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 232
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCallsPerHost()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 233
    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    iget-object v4, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v4, v3}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 237
    :cond_a
    new-instance v2, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;

    invoke-direct {v2, p3, p2}, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;-><init>(Ljava/util/List;Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 185
    :goto_5
    monitor-exit p0

    .line 245
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;->getCallsToExecute()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    const/4 p3, 0x0

    const/4 v3, 0x1

    move v4, p3

    move v5, v3

    :goto_6
    if-ge v4, p2, :cond_d

    .line 246
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;->getCallsToExecute()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    if-ne v6, p1, :cond_b

    move v5, p3

    goto :goto_7

    .line 253
    :cond_b
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v7

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v7

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v8

    invoke-virtual {v7, v8, p0}, Lnicoid/network238/okhttp3/EventListener;->dispatcherQueueEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V

    :goto_7
    if-eqz v0, :cond_c

    .line 257
    invoke-static {v6, v1, v3, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->failRejected$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Ljava/util/concurrent/RejectedExecutionException;ILjava/lang/Object;)V

    goto :goto_8

    .line 259
    :cond_c
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v7

    invoke-virtual {v6, v7}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->executeOn(Ljava/util/concurrent/ExecutorService;)V

    :goto_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    :cond_d
    if-eqz v5, :cond_e

    if-eqz p1, :cond_e

    .line 264
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p2

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object p1

    invoke-virtual {p2, p1, p0}, Lnicoid/network238/okhttp3/EventListener;->dispatcherQueueStart(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Dispatcher;)V

    .line 267
    :cond_e
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dispatcher$promoteAndExecute$Effects;->getIdleCallbackToRun()Ljava/lang/Runnable;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_f
    return-void

    :catchall_0
    move-exception p1

    .line 185
    monitor-exit p0

    throw p1
.end method

.method static synthetic promoteAndExecute$default(Lnicoid/network238/okhttp3/Dispatcher;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;ILjava/lang/Object;)V
    .registers 7

    and-int/lit8 p5, p4, 0x1

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move-object p1, v0

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    move-object p2, v0

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    move-object p3, v0

    .line 170
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/Dispatcher;->promoteAndExecute(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V

    return-void
.end method


# virtual methods
.method public final -deprecated_executorService()Ljava/util/concurrent/ExecutorService;
    .registers 2

    .line 304
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public final declared-synchronized cancelAll()V
    .registers 3

    monitor-enter p0

    .line 150
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    .line 151
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->cancel()V

    goto :goto_0

    .line 153
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    .line 154
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->cancel()V

    goto :goto_1

    .line 156
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningSyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 157
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->cancel()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :cond_2
    monitor-exit p0

    return-void

    .line 149
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_3
.end method

.method public final enqueue$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/Dispatcher;->promoteAndExecute$default(Lnicoid/network238/okhttp3/Dispatcher;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;ILjava/lang/Object;)V

    return-void
.end method

.method public final declared-synchronized executed$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall;)Z
    .registers 3

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 272
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningSyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    .line 272
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public final declared-synchronized executorService()Ljava/util/concurrent/ExecutorService;
    .registers 10

    monitor-enter p0

    .line 103
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->executorServiceOrNull:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_0

    .line 105
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 109
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 110
    new-instance v7, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v7}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->okHttpName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " Dispatcher"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v8

    .line 105
    const/4 v2, 0x0

    const v3, 0x7fffffff

    const-wide/16 v4, 0x3c

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 104
    iput-object v1, p0, Lnicoid/network238/okhttp3/Dispatcher;->executorServiceOrNull:Ljava/util/concurrent/ExecutorService;

    .line 114
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->executorServiceOrNull:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 102
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 276
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x3

    const/4 v5, 0x0

    move-object v0, p0

    move-object v3, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/Dispatcher;->promoteAndExecute$default(Lnicoid/network238/okhttp3/Dispatcher;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;ILjava/lang/Object;)V

    return-void
.end method

.method public final finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 281
    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x5

    const/4 v5, 0x0

    move-object v0, p0

    move-object v2, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/Dispatcher;->promoteAndExecute$default(Lnicoid/network238/okhttp3/Dispatcher;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;ILjava/lang/Object;)V

    return-void
.end method

.method public final declared-synchronized getIdleCallback()Ljava/lang/Runnable;
    .registers 2

    monitor-enter p0

    .line 95
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->idleCallback:Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 95
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized getMaxRequests()I
    .registers 2

    monitor-enter p0

    .line 53
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->maxRequests:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 53
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized getMaxRequestsPerHost()I
    .registers 2

    monitor-enter p0

    .line 73
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->maxRequestsPerHost:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 73
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized queuedCalls()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Call;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 286
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    .line 308
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 309
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 310
    check-cast v2, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    .line 286
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v2

    .line 310
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 312
    :cond_0
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 285
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public final declared-synchronized queuedCallsCount()I
    .registers 2

    monitor-enter p0

    .line 293
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->readyAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 293
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized runningCalls()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Call;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 290
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningSyncCalls:Ljava/util/ArrayDeque;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    .line 313
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v1, v3}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 314
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 315
    check-cast v3, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;

    .line 290
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v3

    .line 315
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 290
    :cond_0
    invoke-static {v0, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    .line 317
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 289
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public final declared-synchronized runningCallsCount()I
    .registers 3

    monitor-enter p0

    .line 296
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningAsyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/Dispatcher;->runningSyncCalls:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->size()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/2addr v0, v1

    monitor-exit p0

    return v0

    .line 296
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public final declared-synchronized setIdleCallback(Ljava/lang/Runnable;)V
    .registers 2

    monitor-enter p0

    .line 95
    :try_start_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/Dispatcher;->idleCallback:Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 95
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public final setMaxRequests(I)V
    .registers 9

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    .line 56
    monitor-enter p0

    .line 57
    :try_start_0
    iput p1, p0, Lnicoid/network238/okhttp3/Dispatcher;->maxRequests:I

    .line 58
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    monitor-exit p0

    .line 59
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x7

    const/4 v6, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/Dispatcher;->promoteAndExecute$default(Lnicoid/network238/okhttp3/Dispatcher;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;ILjava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    move-object v1, p0

    move-object p1, v0

    .line 56
    monitor-exit p0

    throw p1

    .line 55
    :cond_0
    move-object v1, p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "max < 1: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setMaxRequestsPerHost(I)V
    .registers 9

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    .line 76
    monitor-enter p0

    .line 77
    :try_start_0
    iput p1, p0, Lnicoid/network238/okhttp3/Dispatcher;->maxRequestsPerHost:I

    .line 78
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    monitor-exit p0

    .line 79
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x7

    const/4 v6, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/Dispatcher;->promoteAndExecute$default(Lnicoid/network238/okhttp3/Dispatcher;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;ILjava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    move-object v1, p0

    move-object p1, v0

    .line 76
    monitor-exit p0

    throw p1

    .line 75
    :cond_0
    move-object v1, p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "max < 1: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

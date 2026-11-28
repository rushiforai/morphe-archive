.class public final Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/RealCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "AsyncCall"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0012\u0010\u000b\u001a\u00020\u000c2\n\u0010\r\u001a\u00060\u0000R\u00020\u000eJ\u000e\u0010\u001a\u001a\u00020\u000c2\u0006\u0010\u001b\u001a\u00020\u001cJ\u0019\u0010\u001d\u001a\u00020\u000c2\n\u0008\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0000\u00a2\u0006\u0002\u0008 J\u0008\u0010!\u001a\u00020\u000cH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0006\u001a\u00020\u0007@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0011\u0010\u000f\u001a\u00020\u00108F\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u0012R\u0011\u0010\u0013\u001a\u00020\u00148F\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0016R\u0011\u0010\u0017\u001a\u00020\u000e8F\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\""
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
        "Ljava/lang/Runnable;",
        "responseCallback",
        "Lnicoid/network238/okhttp3/Callback;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/Callback;)V",
        "value",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "callsPerHost",
        "getCallsPerHost",
        "()Ljava/util/concurrent/atomic/AtomicInteger;",
        "reuseCallsPerHostFrom",
        "",
        "other",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "host",
        "",
        "getHost",
        "()Ljava/lang/String;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "getRequest",
        "()Lnicoid/network238/okhttp3/Request;",
        "call",
        "getCall",
        "()Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "executeOn",
        "executorService",
        "Ljava/util/concurrent/ExecutorService;",
        "failRejected",
        "e",
        "Ljava/util/concurrent/RejectedExecutionException;",
        "failRejected$okhttp",
        "run",
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
.field private volatile callsPerHost:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final responseCallback:Lnicoid/network238/okhttp3/Callback;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/Callback;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Callback;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 531
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 532
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->responseCallback:Lnicoid/network238/okhttp3/Callback;

    .line 534
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->callsPerHost:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public static synthetic failRejected$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;Ljava/util/concurrent/RejectedExecutionException;ILjava/lang/Object;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 570
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->failRejected$okhttp(Ljava/util/concurrent/RejectedExecutionException;)V

    return-void
.end method


# virtual methods
.method public final executeOn(Ljava/util/concurrent/ExecutorService;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 555
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertLockNotHeld(Lnicoid/network238/okhttp3/Dispatcher;)V

    .line 559
    :try_start_0
    invoke-interface {p1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catch_0
    move-exception p1

    .line 562
    :try_start_1
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->failRejected$okhttp(Ljava/util/concurrent/RejectedExecutionException;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 565
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object p1

    invoke-virtual {p1, p0}, Lnicoid/network238/okhttp3/Dispatcher;->finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/Dispatcher;->finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V

    throw p1
.end method

.method public final failRejected$okhttp(Ljava/util/concurrent/RejectedExecutionException;)V
    .registers 4

    .line 571
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "executor rejected"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 572
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 573
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->noMoreExchanges$okhttp(Ljava/io/IOException;)Ljava/io/IOException;

    .line 574
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->responseCallback:Lnicoid/network238/okhttp3/Callback;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-interface {p1, v1, v0}, Lnicoid/network238/okhttp3/Callback;->onFailure(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    return-void
.end method

.method public final getCall()Lnicoid/network238/okhttp3/internal/connection/RealCall;
    .registers 2

    .line 548
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    return-object v0
.end method

.method public final getCallsPerHost()Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 2

    .line 534
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->callsPerHost:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method public final getHost()Ljava/lang/String;
    .registers 2

    .line 542
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getOriginalRequest()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getRequest()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 545
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getOriginalRequest()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    return-object v0
.end method

.method public final reuseCallsPerHostFrom(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 538
    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->callsPerHost:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->callsPerHost:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public run()V
    .registers 9

    .line 578
    const-string v0, "Callback failure for "

    const-string v1, "canceled due to "

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "OkHttp "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->redactedUrl$okhttp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 630
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    .line 631
    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v5

    .line 632
    invoke-virtual {v4, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 580
    :try_start_0
    # getter for: Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeout:Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;
    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->access$getTimeout$p(Lnicoid/network238/okhttp3/internal/connection/RealCall;)Lnicoid/network238/okhttp3/internal/connection/RealCall$timeout$1;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->enter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 582
    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getResponseWithInterceptorChain$okhttp()Lnicoid/network238/okhttp3/Response;

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 584
    const/4 v6, 0x1

    :try_start_2
    iget-object v7, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->responseCallback:Lnicoid/network238/okhttp3/Callback;

    invoke-interface {v7, v3, v2}, Lnicoid/network238/okhttp3/Callback;->onResponse(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    move v2, v6

    goto :goto_0

    :catch_0
    move-exception v1

    move v2, v6

    goto :goto_1

    :catchall_1
    move-exception v0

    .line 593
    :goto_0
    :try_start_3
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->cancel()V

    if-nez v2, :cond_0

    .line 595
    new-instance v2, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 596
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 597
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->responseCallback:Lnicoid/network238/okhttp3/Callback;

    invoke-interface {v1, v3, v2}, Lnicoid/network238/okhttp3/Callback;->onFailure(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 599
    :cond_0
    instance-of v1, v0, Ljava/lang/InterruptedException;

    if-eqz v1, :cond_1

    .line 600
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    goto :goto_2

    .line 602
    :cond_1
    throw v0

    :catch_1
    move-exception v1

    :goto_1
    if-eqz v2, :cond_2

    .line 588
    sget-object v2, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # invokes: Lnicoid/network238/okhttp3/internal/connection/RealCall;->toLoggableString()Ljava/lang/String;
    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->access$toLoggableString(Lnicoid/network238/okhttp3/internal/connection/RealCall;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v6, 0x4

    invoke-virtual {v2, v0, v6, v1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V

    goto :goto_2

    .line 590
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;->responseCallback:Lnicoid/network238/okhttp3/Callback;

    invoke-interface {v0, v3, v1}, Lnicoid/network238/okhttp3/Callback;->onFailure(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 605
    :goto_2
    :try_start_4
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/Dispatcher;->finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 636
    invoke-virtual {v4, v5}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    return-void

    :catchall_2
    move-exception v0

    .line 605
    :try_start_5
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1, p0}, Lnicoid/network238/okhttp3/Dispatcher;->finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :catchall_3
    move-exception v0

    .line 636
    invoke-virtual {v4, v5}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    throw v0
.end method

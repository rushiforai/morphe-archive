.class public final Le/e/a/NicoliveSession;
.super Ljava/lang/Object;
.source "NicoliveSession.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/NicoliveSession$Listener;
    }
.end annotation


# instance fields
.field final accountCookie:Ljava/lang/String;

.field final calls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lnicoid/network238/okhttp3/Call;",
            ">;"
        }
    .end annotation
.end field

.field final client:Lnicoid/network238/okhttp3/OkHttpClient;

.field volatile closeTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field volatile closed:Z

.field commentGeneration:I

.field commentView:Ljava/lang/String;

.field connectionTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field failures:I

.field volatile generation:I

.field final id:Ljava/lang/String;

.field final listener:Le/e/a/NicoliveSession$Listener;

.field postTimeout:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field volatile posting:Z

.field volatile preferred:Ljava/lang/String;

.field volatile program:Le/e/a/NicoliveData$Program;

.field retry:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field seat:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field final seen:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field volatile serverOffset:J

.field volatile socket:Lnicoid/network238/okhttp3/WebSocket;

.field final timers:Ljava/util/concurrent/ScheduledExecutorService;

.field final workers:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveSession$Listener;)V
    .registers 6

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 13
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveSession;->workers:Ljava/util/concurrent/ExecutorService;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveSession;->timers:Ljava/util/concurrent/ScheduledExecutorService;

    .line 14
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    .line 15
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveSession;->seen:Ljava/util/LinkedHashMap;

    .line 16
    const-string v0, "abr"

    iput-object v0, p0, Le/e/a/NicoliveSession;->preferred:Ljava/lang/String;

    const/4 v0, -0x1

    .line 17
    iput v0, p0, Le/e/a/NicoliveSession;->commentGeneration:I

    const-string v0, ""

    iput-object v0, p0, Le/e/a/NicoliveSession;->commentView:Ljava/lang/String;

    .line 18
    invoke-static {p1}, Le/e/a/NicoliveData;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    iput-object p1, p0, Le/e/a/NicoliveSession;->id:Ljava/lang/String;

    if-nez p2, :cond_0

    move-object p2, v0

    :cond_0
    iput-object p2, p0, Le/e/a/NicoliveSession;->accountCookie:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    new-instance p1, Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-direct {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>()V

    const-wide/16 p2, 0xf

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, p2, p3, v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object p1

    const-wide/16 p2, 0x19

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, p2, p3, v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    return-void

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid program"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method active(I)Z
    .registers 3

    .line 19
    iget-boolean v0, p0, Le/e/a/NicoliveSession;->closed:Z

    if-nez v0, :cond_0

    iget p0, p0, Le/e/a/NicoliveSession;->generation:I

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method declared-synchronized cancelTransport(Z)Ljava/util/concurrent/Future;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation

    monitor-enter p0

    .line 92
    :try_start_0
    iget-boolean v0, p0, Le/e/a/NicoliveSession;->posting:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Le/e/a/NicoliveSession;->posting:Z

    iget-object v0, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string/jumbo v2, "\u9001\u4fe1\u7d50\u679c\u3092\u78ba\u8a8d\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u6295\u7a3f\u6e08\u307f\u304b\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {v0, v1, v2}, Le/e/a/NicoliveSession$Listener;->posted(ZLjava/lang/String;)V

    .line 93
    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveSession;->seat:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    iput-object v2, p0, Le/e/a/NicoliveSession;->seat:Ljava/util/concurrent/ScheduledFuture;

    :cond_1
    iget-object v0, p0, Le/e/a/NicoliveSession;->retry:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_2

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    iput-object v2, p0, Le/e/a/NicoliveSession;->retry:Ljava/util/concurrent/ScheduledFuture;

    :cond_2
    iget-object v0, p0, Le/e/a/NicoliveSession;->postTimeout:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_3

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    iput-object v2, p0, Le/e/a/NicoliveSession;->postTimeout:Ljava/util/concurrent/ScheduledFuture;

    .line 94
    :cond_3
    iget-object v0, p0, Le/e/a/NicoliveSession;->socket:Lnicoid/network238/okhttp3/WebSocket;

    iput-object v2, p0, Le/e/a/NicoliveSession;->socket:Lnicoid/network238/okhttp3/WebSocket;

    iget-object v1, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v4, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez p1, :cond_4

    if-nez v0, :cond_4

    .line 95
    :try_start_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_4

    monitor-exit p0

    return-object v2

    .line 96
    :cond_4
    :try_start_3
    new-instance v1, Le/e/a/NicoliveSession$6;

    invoke-direct {v1, p0, p1, v3, v0}, Le/e/a/NicoliveSession$6;-><init>(Le/e/a/NicoliveSession;ZLjava/util/ArrayList;Lnicoid/network238/okhttp3/WebSocket;)V

    invoke-static {v1}, Le/e/a/NicoliveIo;->execute(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    monitor-exit p0

    return-object p1

    .line 94
    :goto_0
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :goto_1
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p1

    :catchall_1
    move-exception p1

    goto :goto_1
.end method

.method declared-synchronized cancelTransport()V
    .registers 2

    monitor-enter p0

    const/4 v0, 0x0

    .line 102
    :try_start_0
    invoke-virtual {p0, v0}, Le/e/a/NicoliveSession;->cancelTransport(Z)Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

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

.method public declared-synchronized close()V
    .registers 3

    monitor-enter p0

    .line 103
    :try_start_0
    iget-boolean v0, p0, Le/e/a/NicoliveSession;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/NicoliveSession;->closed:Z

    iget v1, p0, Le/e/a/NicoliveSession;->generation:I

    add-int/2addr v1, v0

    iput v1, p0, Le/e/a/NicoliveSession;->generation:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/NicoliveSession;->posting:Z

    invoke-virtual {p0, v0}, Le/e/a/NicoliveSession;->cancelTransport(Z)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveSession;->closeTask:Ljava/util/concurrent/Future;

    iget-object v0, p0, Le/e/a/NicoliveSession;->workers:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    iget-object v0, p0, Le/e/a/NicoliveSession;->timers:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    iget-object v0, p0, Le/e/a/NicoliveSession;->seen:Ljava/util/LinkedHashMap;

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v1, p0, Le/e/a/NicoliveSession;->seen:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0

    :goto_1
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_1
.end method

.method comments(Ljava/lang/String;I)V
    .registers 15

    .line 77
    const-string v0, "now"

    const/4 v1, 0x0

    :goto_0
    move v2, v1

    :goto_1
    invoke-virtual {p0, p2}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 78
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "?at="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, p2}, Le/e/a/NicoliveSession;->tracked(Ljava/lang/String;I)Lnicoid/network238/okhttp3/Call;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, 0x0

    :try_start_1
    invoke-interface {v3}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 79
    :try_start_2
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->isSuccessful()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v6

    if-eqz v6, :cond_5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [J

    .line 80
    :cond_0
    :goto_2
    invoke-virtual {p0, p2}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-static {v6}, Le/e/a/NicoliveData;->frame(Ljava/io/InputStream;)[B

    move-result-object v8

    if-eqz v8, :cond_3

    invoke-static {v8, v7}, Le/e/a/NicoliveData;->entry([B[J)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_2

    invoke-static {v8, v1}, Le/e/a/NicoliveData;->secureServiceUri(Ljava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-virtual {p0, v8, p2}, Le/e/a/NicoliveSession;->segment(Ljava/lang/String;I)V

    goto :goto_3

    :cond_1
    new-instance v4, Ljava/io/IOException;

    const-string v6, "INVALID_COMMENT_HOST"

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_2
    :goto_3
    aget-wide v8, v7, v1

    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-lez v10, :cond_0

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :cond_3
    if-eqz v5, :cond_4

    .line 81
    :try_start_3
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_4
    :try_start_4
    iget-object v4, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 79
    :cond_5
    :try_start_5
    new-instance v4, Ljava/io/IOException;

    const-string v6, "COMMENT_HTTP"

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catchall_0
    move-exception v4

    if-eqz v5, :cond_6

    .line 81
    :try_start_6
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->close()V

    :cond_6
    throw v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception v5

    if-eqz v4, :cond_7

    if-eq v4, v5, :cond_8

    :try_start_7
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4

    :cond_7
    move-object v4, v5

    :cond_8
    :goto_4
    throw v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :catchall_2
    move-exception v4

    :try_start_8
    iget-object v5, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {v5, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    throw v4
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 82
    :catch_0
    invoke-virtual {p0, p2}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v3

    if-eqz v3, :cond_9

    iget-object v3, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    invoke-interface {v3, v1}, Le/e/a/NicoliveSession$Listener;->commentState(Z)V

    add-int/lit8 v3, v2, 0x1

    const/4 v4, 0x5

    if-le v3, v4, :cond_a

    :cond_9
    return-void

    :cond_a
    :try_start_9
    invoke-static {v2}, Le/e/a/NicoliveData;->retryDelay(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_1

    move v2, v3

    goto/16 :goto_1

    :catch_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    return-void
.end method

.method declared-synchronized connect()V
    .registers 6

    monitor-enter p0

    .line 21
    :try_start_0
    iget-boolean v0, p0, Le/e/a/NicoliveSession;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget v0, p0, Le/e/a/NicoliveSession;->generation:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Le/e/a/NicoliveSession;->generation:I

    const-string v2, "SOCKET"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "connect gen="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    iput-object v2, p0, Le/e/a/NicoliveSession;->program:Le/e/a/NicoliveData$Program;

    iget-object v2, p0, Le/e/a/NicoliveSession;->connectionTask:Ljava/util/concurrent/Future;

    if-eqz v2, :cond_1

    invoke-interface {v2, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iget-object v1, p0, Le/e/a/NicoliveSession;->workers:Ljava/util/concurrent/ExecutorService;

    check-cast v1, Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->purge()V

    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Le/e/a/NicoliveSession;->cancelTransport(Z)Ljava/util/concurrent/Future;

    move-result-object v2

    iget-object v3, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    iget v4, p0, Le/e/a/NicoliveSession;->failures:I

    if-nez v4, :cond_2

    const-string/jumbo v4, "\u63a5\u7d9a\u4e2d\u2026"

    goto :goto_0

    :cond_2
    const-string v4, "\u518d\u63a5\u7d9a\u4e2d\u2026"

    :goto_0
    invoke-interface {v3, v4, v1}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    .line 22
    iget-object v1, p0, Le/e/a/NicoliveSession;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Le/e/a/NicoliveSession$1;

    invoke-direct {v3, p0, v2, v0}, Le/e/a/NicoliveSession$1;-><init>(Le/e/a/NicoliveSession;Ljava/util/concurrent/Future;I)V

    invoke-interface {v1, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveSession;->connectionTask:Ljava/util/concurrent/Future;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    monitor-exit p0

    return-void

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method declared-synchronized failed(I)V
    .registers 6

    monitor-enter p0

    .line 56
    :try_start_0
    invoke-virtual {p0, p1}, Le/e/a/NicoliveSession;->active(I)Z

    move-result p1

    if-eqz p1, :cond_1

    iget p1, p0, Le/e/a/NicoliveSession;->generation:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Le/e/a/NicoliveSession;->generation:I

    invoke-virtual {p0}, Le/e/a/NicoliveSession;->cancelTransport()V

    iget-object p1, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Le/e/a/NicoliveSession$Listener;->commentState(Z)V

    iget p1, p0, Le/e/a/NicoliveSession;->failures:I

    const/4 v2, 0x5

    if-lt p1, v2, :cond_0

    iget-object p1, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string/jumbo v1, "\u63a5\u7d9a\u304c\u5207\u308c\u307e\u3057\u305f\u3002\u518d\u63a5\u7d9a\u3092\u304a\u8a66\u3057\u304f\u3060\u3055\u3044"

    invoke-interface {p1, v1, v0}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Le/e/a/NicoliveSession;->failures:I

    invoke-static {p1}, Le/e/a/NicoliveData;->retryDelay(I)J

    move-result-wide v2

    iget-object p1, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string v0, "\u518d\u63a5\u7d9a\u4e2d\u2026"

    invoke-interface {p1, v0, v1}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    iget-object p1, p0, Le/e/a/NicoliveSession;->timers:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Le/e/a/NicoliveSession$4;

    invoke-direct {v0, p0}, Le/e/a/NicoliveSession$4;-><init>(Le/e/a/NicoliveSession;)V

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p1, v0, v2, v3, v1}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NicoliveSession;->retry:Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1
.end method

.method getText(Ljava/lang/String;I)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    iget v0, p0, Le/e/a/NicoliveSession;->generation:I

    invoke-virtual {p0, p1, p2, v0}, Le/e/a/NicoliveSession;->getText(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method getText(Ljava/lang/String;II)Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_a

    .line 70
    invoke-virtual {p0, p1, p3}, Le/e/a/NicoliveSession;->tracked(Ljava/lang/String;I)Lnicoid/network238/okhttp3/Call;

    move-result-object v2

    const/4 v3, 0x0

    :try_start_0
    invoke-interface {v2}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 71
    :try_start_1
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v5

    const/16 v6, 0x12c

    if-lt v5, v6, :cond_2

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v5

    const/16 v6, 0x190

    if-ge v5, v6, :cond_2

    const-string v5, "Location"

    invoke-virtual {v4, v5}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v4, :cond_0

    .line 73
    :try_start_2
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    iget-object v3, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 71
    :cond_1
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "INVALID_REDIRECT"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 72
    :cond_2
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->isSuccessful()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    if-eqz p1, :cond_6

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object p1

    new-instance p3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x2000

    new-array v1, v1, [B

    :goto_1
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_4

    new-instance p1, Ljava/lang/String;

    invoke-virtual {p3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p2

    sget-object p3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p1, p2, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v4, :cond_3

    .line 73
    :try_start_4
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_3
    iget-object p0, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {p0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-object p1

    .line 72
    :cond_4
    :try_start_5
    invoke-virtual {p3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v5

    if-gt v6, p2, :cond_5

    invoke-virtual {p3, v1, v0, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string p2, "RESPONSE_TOO_LARGE"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "HTTP_"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catchall_0
    move-exception p1

    move-object v3, p1

    if-eqz v4, :cond_7

    .line 73
    :try_start_6
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V

    :cond_7
    throw v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception p1

    if-eqz v3, :cond_9

    if-eq v3, p1, :cond_8

    :try_start_7
    invoke-virtual {v3, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    move-object p1, v3

    :cond_9
    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :catchall_2
    move-exception p1

    iget-object p0, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {p0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    throw p1

    .line 74
    :cond_a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "TOO_MANY_REDIRECTS"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method declared-synchronized message(Lnicoid/network238/okhttp3/WebSocket;Lorg/json/JSONObject;I)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 37
    :try_start_0
    invoke-virtual {p0, p3}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string v0, "type"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    if-nez p2, :cond_1

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    .line 38
    :cond_1
    const-string v1, "ping"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 39
    const-string p2, "{\"type\":\"pong\"}"

    invoke-interface {p1, p2}, Lnicoid/network238/okhttp3/WebSocket;->send(Ljava/lang/String;)Z

    .line 41
    const-string p2, "{\"type\":\"keepSeat\"}"

    invoke-interface {p1, p2}, Lnicoid/network238/okhttp3/WebSocket;->send(Ljava/lang/String;)Z

    move-result p1

    .line 42
    const-string p2, "nicoid-live"

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "WebSocket ping/keepSeat sent="

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p2, "SOCKET"

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "keepSeat ok="

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 44
    :cond_2
    const-string v1, "seat"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_4

    iget-object v0, p0, Le/e/a/NicoliveSession;->seat:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_3

    invoke-interface {v0, v3}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_3
    const-string v0, "keepIntervalSec"

    const/16 v1, 0x1e

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p2

    const/16 v0, 0xe10

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iget-object v0, p0, Le/e/a/NicoliveSession;->timers:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Le/e/a/NicoliveSession$2;

    invoke-direct {v1, p0, p3, p1}, Le/e/a/NicoliveSession$2;-><init>(Le/e/a/NicoliveSession;ILnicoid/network238/okhttp3/WebSocket;)V

    int-to-long v2, p2

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide v4, v2

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NicoliveSession;->seat:Ljava/util/concurrent/ScheduledFuture;

    goto/16 :goto_0

    .line 45
    :cond_4
    const-string p1, "serverTime"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "currentMs"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Le/e/a/NicoliveSession;->serverOffset:J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    :catch_0
    :try_start_3
    const-string p1, "currentTime"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/time/Instant;->parse(Ljava/lang/CharSequence;)Ljava/time/Instant;

    move-result-object p1

    invoke-virtual {p1}, Ljava/time/Instant;->toEpochMilli()J

    move-result-wide p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr p1, v0

    iput-wide p1, p0, Le/e/a/NicoliveSession;->serverOffset:J
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 46
    :cond_5
    :try_start_4
    const-string p1, "stream"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    const-string p1, "uri"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Le/e/a/NicoliveData;->secureServiceUri(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_6

    iput v3, p0, Le/e/a/NicoliveSession;->failures:I

    iget-object p1, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    invoke-interface {p1, p2}, Le/e/a/NicoliveSession$Listener;->stream(Lorg/json/JSONObject;)V

    iget-object p1, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string p2, "LIVE"

    invoke-interface {p1, p2, v3}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    goto/16 :goto_0

    :cond_6
    new-instance p1, Ljava/io/IOException;

    const-string p2, "INVALID_STREAM_HOST"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 47
    :cond_7
    const-string p1, "messageServer"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    const-string p1, "viewUri"

    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v3}, Le/e/a/NicoliveData;->secureServiceUri(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_9

    iget p2, p0, Le/e/a/NicoliveSession;->commentGeneration:I

    if-ne p2, p3, :cond_8

    iget-object p2, p0, Le/e/a/NicoliveSession;->commentView:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_11

    :cond_8
    iput p3, p0, Le/e/a/NicoliveSession;->commentGeneration:I

    iput-object p1, p0, Le/e/a/NicoliveSession;->commentView:Ljava/lang/String;

    iget-object p2, p0, Le/e/a/NicoliveSession;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Le/e/a/NicoliveSession$3;

    invoke-direct {v0, p0, p3, p1}, Le/e/a/NicoliveSession$3;-><init>(Le/e/a/NicoliveSession;ILjava/lang/String;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    :cond_9
    new-instance p1, Ljava/io/IOException;

    const-string p2, "INVALID_COMMENT_HOST"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 48
    :cond_a
    const-string p1, "postCommentResult"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    iget-boolean p1, p0, Le/e/a/NicoliveSession;->posting:Z

    if-eqz p1, :cond_11

    iput-boolean v3, p0, Le/e/a/NicoliveSession;->posting:Z

    iget-object p1, p0, Le/e/a/NicoliveSession;->postTimeout:Ljava/util/concurrent/ScheduledFuture;

    if-eqz p1, :cond_b

    invoke-interface {p1, v3}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_b
    iget-object p1, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string p2, ""

    invoke-interface {p1, v2, p2}, Le/e/a/NicoliveSession$Listener;->posted(ZLjava/lang/String;)V

    goto/16 :goto_0

    .line 49
    :cond_c
    const-string p1, "error"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_d

    const-string p1, "disconnect"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    .line 50
    :cond_d
    const-string p1, "code"

    const-string v0, "reason"

    const-string v1, "UNKNOWN"

    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 51
    const-string p2, "COMMENT_POST"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_f

    const-string p2, "COMMENT_LOCKED"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_f

    .line 52
    const-string p2, "END_PROGRAM"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_e

    const-string p2, "NOT_ON_AIR"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_e

    const-string p2, "NO_PERMISSION"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_e

    const-string p2, "NOT_FOUND"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_e

    const-string p2, "NO_AUTH"

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_e

    .line 53
    invoke-virtual {p0, p3}, Le/e/a/NicoliveSession;->failed(I)V

    goto :goto_0

    .line 52
    :cond_e
    iget p2, p0, Le/e/a/NicoliveSession;->generation:I

    add-int/2addr p2, v2

    iput p2, p0, Le/e/a/NicoliveSession;->generation:I

    invoke-virtual {p0}, Le/e/a/NicoliveSession;->cancelTransport()V

    iget-object p2, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    invoke-static {p1}, Le/e/a/NicoliveData;->failure(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1, v2}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    goto :goto_0

    .line 51
    :cond_f
    iget-boolean p2, p0, Le/e/a/NicoliveSession;->posting:Z

    if-eqz p2, :cond_11

    iput-boolean v3, p0, Le/e/a/NicoliveSession;->posting:Z

    iget-object p2, p0, Le/e/a/NicoliveSession;->postTimeout:Ljava/util/concurrent/ScheduledFuture;

    if-eqz p2, :cond_10

    invoke-interface {p2, v3}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_10
    iget-object p2, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    invoke-static {p1}, Le/e/a/NicoliveData;->failure(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, v3, p1}, Le/e/a/NicoliveSession$Listener;->posted(ZLjava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 55
    :catch_1
    :cond_11
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_1
.end method

.method public declared-synchronized post(Ljava/lang/String;JZ)Z
    .registers 13

    monitor-enter p0

    .line 60
    :try_start_0
    iget-boolean v0, p0, Le/e/a/NicoliveSession;->closed:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Le/e/a/NicoliveSession;->posting:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveSession;->socket:Lnicoid/network238/okhttp3/WebSocket;

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveSession;->program:Le/e/a/NicoliveData$Program;

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveSession;->program:Le/e/a/NicoliveData$Program;

    iget-boolean v0, v0, Le/e/a/NicoliveData$Program;->loggedIn:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveSession;->program:Le/e/a/NicoliveData$Program;

    invoke-virtual {v0}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v0

    if-eqz v0, :cond_2

    const-wide/16 v2, 0x0

    cmp-long v0, p2, v2

    if-lez v0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->codePointCount(II)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v4, 0x4b

    if-gt v0, v4, :cond_2

    .line 61
    :try_start_1
    iget-object v0, p0, Le/e/a/NicoliveSession;->program:Le/e/a/NicoliveData$Program;

    iget-wide v4, v0, Le/e/a/NicoliveData$Program;->vposBase:J

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    sub-long/2addr p2, v4

    const-wide/16 v4, 0xa

    div-long/2addr p2, v4

    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "text"

    invoke-virtual {v0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "vpos"

    invoke-virtual {p1, v0, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p1

    const/4 p2, 0x1

    if-eqz p4, :cond_0

    const-string p3, "isAnonymous"

    invoke-virtual {p1, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_0
    iput-boolean p2, p0, Le/e/a/NicoliveSession;->posting:Z

    .line 62
    iget-object p3, p0, Le/e/a/NicoliveSession;->socket:Lnicoid/network238/okhttp3/WebSocket;

    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "type"

    const-string v2, "postComment"

    invoke-virtual {p4, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p4

    const-string v0, "data"

    invoke-virtual {p4, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p3, p1}, Lnicoid/network238/okhttp3/WebSocket;->send(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    iput-boolean v1, p0, Le/e/a/NicoliveSession;->posting:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v1

    .line 63
    :cond_1
    :try_start_2
    iget-object p1, p0, Le/e/a/NicoliveSession;->timers:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance p3, Le/e/a/NicoliveSession$5;

    invoke-direct {p3, p0}, Le/e/a/NicoliveSession$5;-><init>(Le/e/a/NicoliveSession;)V

    sget-object p4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p1, p3, v4, v5, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NicoliveSession;->postTimeout:Ljava/util/concurrent/ScheduledFuture;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p2

    .line 64
    :catch_0
    :try_start_3
    iput-boolean v1, p0, Le/e/a/NicoliveSession;->posting:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v1

    .line 60
    :cond_2
    monitor-exit p0

    return v1

    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public declared-synchronized quality(Ljava/lang/String;)Z
    .registers 8

    monitor-enter p0

    .line 58
    :try_start_0
    iget-boolean v0, p0, Le/e/a/NicoliveSession;->closed:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveSession;->socket:Lnicoid/network238/okhttp3/WebSocket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :try_start_1
    iput-object p1, p0, Le/e/a/NicoliveSession;->preferred:Ljava/lang/String;

    iget-object v0, p0, Le/e/a/NicoliveSession;->socket:Lnicoid/network238/okhttp3/WebSocket;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const-string v4, "changeStream"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "data"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "quality"

    invoke-virtual {v4, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v4, "protocol"

    const-string v5, "hls"

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v4, "latency"

    const-string v5, "high"

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v4, "chasePlay"

    invoke-static {p0}, Le/e/a/LiveResumePosition;->chase(Le/e/a/NicoliveSession;)Z

    move-result v5

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string v4, "accessRightMethod"

    const-string v5, "single_cookie"

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lnicoid/network238/okhttp3/WebSocket;->send(Ljava/lang/String;)Z

    move-result p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catch_0
    :cond_0
    monitor-exit p0

    return v1

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public declared-synchronized reconnect()V
    .registers 2

    monitor-enter p0

    .line 57
    :try_start_0
    iget-boolean v0, p0, Le/e/a/NicoliveSession;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/NicoliveSession;->failures:I

    invoke-virtual {p0}, Le/e/a/NicoliveSession;->connect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

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

.method request(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/Request;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    invoke-static {p1, p2}, Le/e/a/NicoliveData;->secureServiceUri(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_2

    new-instance p2, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {p2}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {p2, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p2

    const-string v0, "User-Agent"

    const-string v1, "Mozilla/5.0"

    invoke-virtual {p2, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p2

    const-string v0, "Origin"

    const-string v1, "https://live.nicovideo.jp"

    invoke-virtual {p2, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p2

    const-string v0, "Referer"

    const-string v1, "https://live.nicovideo.jp/"

    invoke-virtual {p2, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p2

    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p1

    const-string v0, "live.nicovideo.jp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "live2.nicovideo.jp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "sp.live.nicovideo.jp"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    iget-object p1, p0, Le/e/a/NicoliveSession;->accountCookie:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "Cookie"

    iget-object p0, p0, Le/e/a/NicoliveSession;->accountCookie:Ljava/lang/String;

    invoke-virtual {p2, p1, p0}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    :cond_1
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    return-object p0

    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "INVALID_SERVICE_HOST"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method segment(Ljava/lang/String;I)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    invoke-virtual {p0, p1, p2}, Le/e/a/NicoliveSession;->tracked(Ljava/lang/String;I)Lnicoid/network238/okhttp3/Call;

    move-result-object p1

    const/4 v0, 0x0

    :try_start_0
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 86
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->isSuccessful()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const/4 v3, 0x1

    invoke-interface {v2, v3}, Le/e/a/NicoliveSession$Listener;->commentState(Z)V

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v2

    .line 87
    :cond_0
    :goto_0
    invoke-virtual {p0, p2}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-static {v2}, Le/e/a/NicoliveData;->frame(Ljava/io/InputStream;)[B

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-static {v3}, Le/e/a/NicoliveData;->chat([B)Le/e/a/NicoliveData$Chat;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v4, v3, Le/e/a/NicoliveData$Chat;->id:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    iget-object v4, v3, Le/e/a/NicoliveData$Chat;->id:Ljava/lang/String;

    goto :goto_1

    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    iget-wide v5, v3, Le/e/a/NicoliveData$Chat;->atMs:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v3, Le/e/a/NicoliveData$Chat;->user:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v3, Le/e/a/NicoliveData$Chat;->text:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 88
    :goto_1
    iget-object v5, p0, Le/e/a/NicoliveSession;->seen:Ljava/util/LinkedHashMap;

    monitor-enter v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v6, p0, Le/e/a/NicoliveSession;->seen:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v4}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    monitor-exit v5

    goto :goto_0

    :cond_2
    iget-object v6, p0, Le/e/a/NicoliveSession;->seen:Ljava/util/LinkedHashMap;

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6, v4, v7}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    iget-object v4, p0, Le/e/a/NicoliveSession;->seen:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->size()I

    move-result v4

    const/16 v6, 0x1000

    if-gt v4, v6, :cond_4

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object v4, v3, Le/e/a/NicoliveData$Chat;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x3e8

    if-le v4, v5, :cond_3

    iget-object v4, v3, Le/e/a/NicoliveData$Chat;->text:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Le/e/a/NicoliveData$Chat;->text:Ljava/lang/String;

    :cond_3
    iget-object v4, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    invoke-interface {v4, v3}, Le/e/a/NicoliveSession$Listener;->comment(Le/e/a/NicoliveData$Chat;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :cond_4
    :try_start_4
    iget-object v4, p0, Le/e/a/NicoliveSession;->seen:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :goto_3
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_0
    move-exception p2

    goto :goto_3

    :cond_5
    if-eqz v1, :cond_6

    .line 90
    :try_start_6
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :cond_6
    iget-object p0, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void

    .line 86
    :cond_7
    :try_start_7
    new-instance p2, Ljava/io/IOException;

    const-string v0, "COMMENT_SEGMENT_HTTP"

    invoke-direct {p2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :catchall_1
    move-exception p2

    move-object v0, p2

    if-eqz v1, :cond_8

    .line 90
    :try_start_8
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    :cond_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception p2

    if-eqz v0, :cond_a

    if-eq v0, p2, :cond_9

    :try_start_9
    invoke-virtual {v0, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9
    move-object p2, v0

    :cond_a
    throw p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    :catchall_3
    move-exception p2

    iget-object p0, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    throw p2
.end method

.method public start()V
    .registers 1

    .line 20
    invoke-virtual {p0}, Le/e/a/NicoliveSession;->connect()V

    return-void
.end method

.method declared-synchronized tracked(Ljava/lang/String;I)Lnicoid/network238/okhttp3/Call;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 67
    :try_start_0
    invoke-virtual {p0, p2}, Le/e/a/NicoliveSession;->active(I)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Le/e/a/NicoliveSession;->request(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p2, p1}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object p1

    iget-object p2, p0, Le/e/a/NicoliveSession;->calls:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "SESSION_CLOSED"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

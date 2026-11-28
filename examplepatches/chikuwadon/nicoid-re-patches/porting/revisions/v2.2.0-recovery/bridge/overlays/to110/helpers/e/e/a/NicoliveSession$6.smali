.class Le/e/a/NicoliveSession$6;
.super Ljava/lang/Object;
.source "NicoliveSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/NicoliveSession;->cancelTransport(Z)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/NicoliveSession;

.field private final synthetic val$dispose:Z

.field private final synthetic val$oldCalls:Ljava/util/ArrayList;

.field private final synthetic val$oldSocket:Lnicoid/network238/okhttp3/WebSocket;


# direct methods
.method constructor <init>(Le/e/a/NicoliveSession;ZLjava/util/ArrayList;Lnicoid/network238/okhttp3/WebSocket;)V
    .registers 5

    .line 96
    iput-object p1, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iput-boolean p2, p0, Le/e/a/NicoliveSession$6;->val$dispose:Z

    iput-object p3, p0, Le/e/a/NicoliveSession$6;->val$oldCalls:Ljava/util/ArrayList;

    iput-object p4, p0, Le/e/a/NicoliveSession$6;->val$oldSocket:Lnicoid/network238/okhttp3/WebSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 97
    :try_start_0
    iget-object v0, p0, Le/e/a/NicoliveSession$6;->val$oldSocket:Lnicoid/network238/okhttp3/WebSocket;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/WebSocket;->cancel()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 98
    :cond_0
    :try_start_1
    iget-object v0, p0, Le/e/a/NicoliveSession$6;->val$oldCalls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_2

    iget-boolean v0, p0, Le/e/a/NicoliveSession$6;->val$dispose:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object v0, v0, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Dispatcher;->cancelAll()V

    iget-object v0, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object v0, v0, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    iget-object p0, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object p0, p0, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ConnectionPool;->evictAll()V

    :cond_1
    return-void

    :cond_2
    :try_start_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/Call;

    invoke-interface {v1}, Lnicoid/network238/okhttp3/Call;->cancel()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-boolean v1, p0, Le/e/a/NicoliveSession$6;->val$dispose:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Dispatcher;->cancelAll()V

    iget-object v1, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    iget-object p0, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object p0, p0, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ConnectionPool;->evictAll()V

    :cond_3
    throw v0

    :catchall_1
    move-exception v0

    :try_start_3
    iget-object v1, p0, Le/e/a/NicoliveSession$6;->val$oldCalls:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-nez v2, :cond_5

    iget-boolean v1, p0, Le/e/a/NicoliveSession$6;->val$dispose:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Dispatcher;->cancelAll()V

    iget-object v1, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    iget-object p0, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object p0, p0, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ConnectionPool;->evictAll()V

    .line 99
    :cond_4
    throw v0

    .line 98
    :cond_5
    :try_start_4
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okhttp3/Call;

    invoke-interface {v2}, Lnicoid/network238/okhttp3/Call;->cancel()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_1

    :catchall_2
    move-exception v0

    iget-boolean v1, p0, Le/e/a/NicoliveSession$6;->val$dispose:Z

    if-eqz v1, :cond_6

    iget-object v1, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Dispatcher;->cancelAll()V

    iget-object v1, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    iget-object p0, p0, Le/e/a/NicoliveSession$6;->this$0:Le/e/a/NicoliveSession;

    iget-object p0, p0, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ConnectionPool;->evictAll()V

    :cond_6
    throw v0
.end method

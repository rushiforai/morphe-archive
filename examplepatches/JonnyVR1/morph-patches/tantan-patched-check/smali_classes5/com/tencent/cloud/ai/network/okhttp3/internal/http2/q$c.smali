.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;
.super Lcom/tencent/cloud/ai/network/okio/c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okio/c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 1

    .line 1
    new-instance p0, Ljava/net/SocketTimeoutException;

    .line 2
    .line 3
    const-string v0, "timeout"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/net/SocketTimeoutException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 11
    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public j()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 11
    .line 12
    monitor-enter p0

    .line 13
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->n:J

    .line 14
    .line 15
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->m:J

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-wide/16 v0, 0x1

    .line 26
    .line 27
    add-long/2addr v2, v0

    .line 28
    iput-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->m:J

    .line 29
    .line 30
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    const-wide/32 v2, 0x3b9aca00

    .line 35
    .line 36
    .line 37
    add-long/2addr v0, v2

    .line 38
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->p:J

    .line 39
    .line 40
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :try_start_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->h:Ljava/util/concurrent/ScheduledExecutorService;

    .line 42
    .line 43
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/g;
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 44
    .line 45
    const-string v2, "OkHttp %s ping"

    .line 46
    .line 47
    :try_start_2
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 48
    .line 49
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-direct {v1, p0, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/g;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2 .. :try_end_2} :catch_0

    .line 57
    .line 58
    .line 59
    :catch_0
    return-void

    .line 60
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 61
    throw v0
.end method

.method public k()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    throw p0
.end method

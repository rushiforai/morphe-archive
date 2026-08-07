.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:Ljava/util/concurrent/Executor;

.field public static final synthetic h:Z = true


# instance fields
.field public final a:I

.field public final b:J

.field public final c:Ljava/lang/Runnable;

.field public final d:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

.field public f:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v6, Ljava/util/concurrent/SynchronousQueue;

    .line 4
    .line 5
    invoke-direct {v6}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "OkHttp ConnectionPool"

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-static {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    const v2, 0x7fffffff

    .line 16
    .line 17
    .line 18
    const-wide/16 v3, 0x3c

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->g:Ljava/util/concurrent/Executor;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/h1r0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/h1r0;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->c:Ljava/lang/Runnable;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->d:Ljava/util/Deque;

    .line 17
    .line 18
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

    .line 24
    .line 25
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a:I

    .line 26
    .line 27
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->b:J

    .line 32
    .line 33
    const-wide/16 p0, 0x0

    .line 34
    .line 35
    cmp-long p0, p2, p0

    .line 36
    .line 37
    if-lez p0, :cond_0

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    const-string p0, "keepAliveDuration <= 0: "

    .line 41
    .line 42
    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    throw p0
.end method

.method private a()V
    .locals 13

    .line 188
    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 189
    monitor-enter p0

    .line 190
    :try_start_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->d:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-wide/high16 v5, -0x8000000000000000L

    move v7, v3

    move v8, v7

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 191
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 192
    invoke-virtual {p0, v9, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;J)I

    move-result v10

    if-lez v10, :cond_2

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 193
    iget-wide v10, v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->q:J

    sub-long v10, v0, v10

    cmp-long v12, v10, v5

    if-lez v12, :cond_1

    move-object v4, v9

    move-wide v5, v10

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_6

    .line 194
    :cond_3
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->b:J

    cmp-long v2, v5, v0

    const-wide/16 v9, 0x0

    const-wide/16 v11, -0x1

    if-gez v2, :cond_7

    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a:I

    if-le v7, v2, :cond_4

    goto :goto_2

    :cond_4
    if-lez v7, :cond_5

    sub-long/2addr v0, v5

    .line 195
    monitor-exit p0

    goto :goto_3

    :cond_5
    if-lez v8, :cond_6

    .line 196
    monitor-exit p0

    goto :goto_3

    .line 197
    :cond_6
    iput-boolean v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->f:Z

    .line 198
    monitor-exit p0

    move-wide v0, v11

    goto :goto_3

    .line 199
    :cond_7
    :goto_2
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->d:Ljava/util/Deque;

    invoke-interface {v0, v4}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    .line 200
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    .line 202
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    move-wide v0, v9

    :goto_3
    cmp-long v2, v0, v11

    if-nez v2, :cond_8

    return-void

    :cond_8
    cmp-long v2, v0, v9

    if-lez v2, :cond_0

    const-wide/32 v2, 0xf4240

    .line 203
    div-long v4, v0, v2

    mul-long/2addr v2, v4

    sub-long/2addr v0, v2

    .line 204
    monitor-enter p0

    long-to-int v0, v0

    .line 205
    :try_start_1
    invoke-virtual {p0, v4, v5, v0}, Ljava/lang/Object;->wait(JI)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception v0

    goto :goto_5

    .line 206
    :catch_0
    :goto_4
    :try_start_2
    monitor-exit p0

    goto :goto_0

    :goto_5
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    .line 207
    :goto_6
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method public static synthetic a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;)V
    .locals 0

    .line 219
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;J)I
    .locals 6

    .line 220
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->p:Ljava/util/List;

    const/4 v1, 0x0

    move v2, v1

    .line 221
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 222
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/Reference;

    .line 223
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 224
    :cond_1
    check-cast v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j$b;

    .line 225
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "A connection to "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    iget-object v5, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 227
    iget-object v5, v5, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 228
    iget-object v5, v5, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 229
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " was leaked. Did you forget to close a response body?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 230
    sget-object v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 231
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j$b;->a:Ljava/lang/Object;

    invoke-virtual {v5, v4, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 232
    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    const/4 v3, 0x1

    .line 233
    iput-boolean v3, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 234
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 235
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->b:J

    sub-long/2addr p2, v2

    iput-wide p2, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->q:J

    return v1

    .line 236
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/s;Ljava/io/IOException;)V
    .locals 3

    .line 208
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;

    .line 209
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_0

    .line 210
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 211
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/a;->g:Ljava/net/ProxySelector;

    .line 212
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 213
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->g()Ljava/net/URI;

    move-result-object v0

    .line 214
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;

    .line 215
    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    .line 216
    invoke-virtual {v1, v0, v2, p2}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    .line 217
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;

    monitor-enter p0

    .line 218
    :try_start_0
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/g;->a:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/a;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Ljava/util/List;Z)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/cloud/ai/network/okhttp3/a;",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/s;",
            ">;Z)Z"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 14
    .line 15
    .line 16
    return v1

    .line 17
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->d:Ljava/util/Deque;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :catch_0
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_b

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 34
    .line 35
    if-eqz p4, :cond_3

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_3

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->p:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->o:I

    .line 51
    .line 52
    if-ge v2, v3, :cond_2

    .line 53
    .line 54
    iget-boolean v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 55
    .line 56
    if-eqz v2, :cond_4

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_4
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    .line 60
    .line 61
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 64
    .line 65
    check-cast v2, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3, p1}, Lcom/tencent/cloud/ai/network/okhttp3/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/a;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-nez v2, :cond_5

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_5
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 78
    .line 79
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 82
    .line 83
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 84
    .line 85
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 86
    .line 87
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_6

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_6
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 97
    .line 98
    if-nez v2, :cond_7

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_7
    if-eqz p3, :cond_2

    .line 102
    .line 103
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    move v3, v1

    .line 108
    :goto_2
    if-ge v3, v2, :cond_2

    .line 109
    .line 110
    invoke-interface {p3, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    check-cast v4, Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 115
    .line 116
    iget-object v5, v4, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;

    .line 117
    .line 118
    invoke-virtual {v5}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    sget-object v6, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 123
    .line 124
    if-ne v5, v6, :cond_a

    .line 125
    .line 126
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 127
    .line 128
    iget-object v5, v5, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;

    .line 129
    .line 130
    invoke-virtual {v5}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    if-ne v5, v6, :cond_a

    .line 135
    .line 136
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 137
    .line 138
    iget-object v5, v5, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 139
    .line 140
    iget-object v4, v4, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 141
    .line 142
    invoke-virtual {v5, v4}, Ljava/net/InetSocketAddress;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    if-eqz v4, :cond_a

    .line 147
    .line 148
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/a;->j:Ljavax/net/ssl/HostnameVerifier;

    .line 149
    .line 150
    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/d;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/d;

    .line 151
    .line 152
    if-eq v2, v3, :cond_8

    .line 153
    .line 154
    goto/16 :goto_1

    .line 155
    .line 156
    :cond_8
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 157
    .line 158
    invoke-virtual {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-nez v2, :cond_9

    .line 163
    .line 164
    goto/16 :goto_1

    .line 165
    .line 166
    :cond_9
    :try_start_0
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/a;->k:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 167
    .line 168
    iget-object v3, p1, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 169
    .line 170
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 171
    .line 172
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->f:Lcom/tencent/cloud/ai/network/okhttp3/n;

    .line 173
    .line 174
    iget-object v4, v4, Lcom/tencent/cloud/ai/network/okhttp3/n;->c:Ljava/util/List;

    .line 175
    .line 176
    invoke-virtual {v2, v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/e;->a(Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    .line 178
    .line 179
    :goto_3
    invoke-virtual {p2, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;)V

    .line 180
    .line 181
    .line 182
    const/4 p0, 0x1

    .line 183
    return p0

    .line 184
    :cond_a
    add-int/lit8 v3, v3, 0x1

    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_b
    return v1
.end method

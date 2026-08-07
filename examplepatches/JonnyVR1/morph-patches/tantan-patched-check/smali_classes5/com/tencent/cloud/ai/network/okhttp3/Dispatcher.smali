.class public final Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic h:Z = true


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/Runnable;

.field public d:Ljava/util/concurrent/ExecutorService;

.field public final e:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/tencent/cloud/ai/network/okhttp3/r$a;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/tencent/cloud/ai/network/okhttp3/r$a;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/tencent/cloud/ai/network/okhttp3/r;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x40

    .line 36
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a:I

    const/4 v0, 0x5

    .line 37
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->b:I

    .line 38
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->e:Ljava/util/Deque;

    .line 39
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    .line 40
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->g:Ljava/util/Deque;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x40

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a:I

    .line 7
    .line 8
    const/4 v0, 0x5

    .line 9
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->b:I

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->e:Ljava/util/Deque;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayDeque;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayDeque;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->g:Ljava/util/Deque;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->d:Ljava/util/concurrent/ExecutorService;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okhttp3/r$a;)V
    .locals 1

    .line 196
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 197
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 198
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    invoke-virtual {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a(Ljava/util/Deque;Ljava/lang/Object;)V

    return-void
.end method

.method public final a(Ljava/util/Deque;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Deque<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 199
    monitor-enter p0

    .line 200
    :try_start_0
    invoke-interface {p1, p2}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 201
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->c:Ljava/lang/Runnable;

    .line 202
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a()Z

    move-result p0

    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    .line 204
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 205
    :cond_1
    :try_start_1
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "Call wasn\'t in-flight!"

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 206
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final a()Z
    .locals 9

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->h:Z

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
    if-nez v0, :cond_0

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
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    monitor-enter p0

    .line 23
    :try_start_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->e:Ljava/util/Deque;

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_4

    .line 34
    .line 35
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 40
    .line 41
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    .line 42
    .line 43
    invoke-interface {v4}, Ljava/util/Deque;->size()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    iget v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a:I

    .line 48
    .line 49
    if-lt v4, v5, :cond_2

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_2
    iget-object v4, v3, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 53
    .line 54
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    iget v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->b:I

    .line 59
    .line 60
    if-lt v4, v5, :cond_3

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 64
    .line 65
    .line 66
    iget-object v4, v3, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    .line 75
    .line 76
    invoke-interface {v4, v3}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :catchall_0
    move-exception v0

    .line 81
    goto/16 :goto_8

    .line 82
    .line 83
    :cond_4
    :goto_2
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->runningCallsCount()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-lez v2, :cond_5

    .line 88
    .line 89
    const/4 v2, 0x1

    .line 90
    goto :goto_3

    .line 91
    :cond_5
    move v2, v1

    .line 92
    :goto_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    move v4, v1

    .line 98
    :goto_4
    if-ge v4, v3, :cond_8

    .line 99
    .line 100
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    check-cast v5, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->executorService()Ljava/util/concurrent/ExecutorService;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    sget-boolean v7, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->e:Z

    .line 114
    .line 115
    if-nez v7, :cond_7

    .line 116
    .line 117
    iget-object v7, v5, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 118
    .line 119
    iget-object v7, v7, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 120
    .line 121
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    invoke-static {v7}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v7

    .line 129
    if-nez v7, :cond_6

    .line 130
    .line 131
    goto :goto_5

    .line 132
    :cond_6
    invoke-static {}, Ll/aqg0;->a()V

    .line 133
    .line 134
    .line 135
    return v1

    .line 136
    :cond_7
    :goto_5
    :try_start_1
    invoke-interface {v6, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 137
    .line 138
    .line 139
    goto :goto_6

    .line 140
    :catchall_1
    move-exception p0

    .line 141
    goto :goto_7

    .line 142
    :catch_0
    move-exception v6

    .line 143
    :try_start_2
    new-instance v7, Ljava/io/InterruptedIOException;

    .line 144
    .line 145
    const-string v8, "executor rejected"

    .line 146
    .line 147
    invoke-direct {v7, v8}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v7, v6}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 151
    .line 152
    .line 153
    iget-object v6, v5, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 154
    .line 155
    iget-object v6, v6, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 156
    .line 157
    invoke-virtual {v6, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 158
    .line 159
    .line 160
    iget-object v6, v5, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->b:Lcom/tencent/cloud/ai/network/okhttp3/Callback;

    .line 161
    .line 162
    iget-object v8, v5, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 163
    .line 164
    invoke-interface {v6, v8, v7}, Lcom/tencent/cloud/ai/network/okhttp3/Callback;->onFailure(Lcom/tencent/cloud/ai/network/okhttp3/Call;Ljava/io/IOException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 165
    .line 166
    .line 167
    iget-object v6, v5, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 168
    .line 169
    iget-object v6, v6, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 170
    .line 171
    invoke-virtual {v6}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 172
    .line 173
    .line 174
    move-result-object v6

    .line 175
    invoke-virtual {v6, v5}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a(Lcom/tencent/cloud/ai/network/okhttp3/r$a;)V

    .line 176
    .line 177
    .line 178
    :goto_6
    add-int/lit8 v4, v4, 0x1

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :goto_7
    iget-object v0, v5, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 182
    .line 183
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0, v5}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a(Lcom/tencent/cloud/ai/network/okhttp3/r$a;)V

    .line 190
    .line 191
    .line 192
    throw p0

    .line 193
    :cond_8
    return v2

    .line 194
    :goto_8
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 195
    throw v0
.end method

.method public declared-synchronized cancelAll()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->e:Ljava/util/Deque;

    .line 3
    .line 4
    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    goto :goto_3

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a()V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->g:Ljava/util/Deque;

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_2
    monitor-exit p0

    .line 81
    return-void

    .line 82
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    throw v0
.end method

.method public declared-synchronized executorService()Ljava/util/concurrent/ExecutorService;
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->d:Ljava/util/concurrent/ExecutorService;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 7
    .line 8
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    new-instance v7, Ljava/util/concurrent/SynchronousQueue;

    .line 11
    .line 12
    invoke-direct {v7}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v0, "OkHttp Dispatcher"

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-static {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    .line 19
    .line 20
    .line 21
    move-result-object v8

    .line 22
    const v3, 0x7fffffff

    .line 23
    .line 24
    .line 25
    const-wide/16 v4, 0x3c

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->d:Ljava/util/concurrent/ExecutorService;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->d:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return-object v0

    .line 40
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw v0
.end method

.method public declared-synchronized getMaxRequests()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public declared-synchronized getMaxRequestsPerHost()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->b:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public declared-synchronized queuedCalls()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Call;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->e:Ljava/util/Deque;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    monitor-exit p0

    .line 38
    return-object v0

    .line 39
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw v0
.end method

.method public declared-synchronized queuedCallsCount()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->e:Ljava/util/Deque;

    .line 3
    .line 4
    invoke-interface {v0}, Ljava/util/Deque;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    monitor-exit p0

    .line 9
    return v0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public declared-synchronized runningCalls()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Call;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->g:Ljava/util/Deque;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    monitor-exit p0

    .line 43
    return-object v0

    .line 44
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw v0
.end method

.method public declared-synchronized runningCallsCount()I
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    .line 3
    .line 4
    invoke-interface {v0}, Ljava/util/Deque;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->g:Ljava/util/Deque;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/Deque;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    add-int/2addr v0, v1

    .line 15
    monitor-exit p0

    .line 16
    return v0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method

.method public declared-synchronized setIdleCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->c:Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public setMaxRequests(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_0

    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a:I

    .line 6
    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a()Z

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1

    .line 15
    :cond_0
    const-string p0, "max < 1: "

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setMaxRequestsPerHost(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_0

    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->b:I

    .line 6
    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a()Z

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1

    .line 15
    :cond_0
    const-string p0, "max < 1: "

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

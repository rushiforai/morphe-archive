.class public final Lcom/tencent/cloud/ai/network/okhttp3/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/Call;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/r$a;
    }
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

.field public b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

.field public final d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->d:Z

    .line 9
    .line 10
    return-void
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)Lcom/tencent/cloud/ai/network/okhttp3/r;
    .locals 1

    .line 169
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/r;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/r;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)V

    .line 170
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    invoke-direct {p1, p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Call;)V

    iput-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    return-object v0
.end method


# virtual methods
.method public a()Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 10

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->interceptors()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 18
    .line 19
    invoke-direct {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/BridgeInterceptor;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->cookieJar()Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/BridgeInterceptor;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/l;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    .line 44
    .line 45
    invoke-direct {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/ConnectInterceptor;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 54
    .line 55
    invoke-direct {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/ConnectInterceptor;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->d:Z

    .line 62
    .line 63
    if-nez v0, :cond_0

    .line 64
    .line 65
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->networkInterceptors()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    :cond_0
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/CallServerInterceptor;

    .line 75
    .line 76
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->d:Z

    .line 77
    .line 78
    invoke-direct {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/CallServerInterceptor;-><init>(Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 87
    .line 88
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 89
    .line 90
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->connectTimeoutMillis()I

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 97
    .line 98
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->readTimeoutMillis()I

    .line 99
    .line 100
    .line 101
    move-result v8

    .line 102
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 103
    .line 104
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->writeTimeoutMillis()I

    .line 105
    .line 106
    .line 107
    move-result v9

    .line 108
    const/4 v3, 0x0

    .line 109
    const/4 v4, 0x0

    .line 110
    move-object v6, p0

    .line 111
    invoke-direct/range {v0 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ILcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Call;III)V

    .line 112
    .line 113
    .line 114
    const/4 p0, 0x0

    .line 115
    :try_start_0
    iget-object v1, v6, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget-object v1, v6, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d()Z

    .line 124
    .line 125
    .line 126
    move-result v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    if-nez v1, :cond_1

    .line 128
    .line 129
    iget-object v1, v6, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 130
    .line 131
    invoke-virtual {v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 132
    .line 133
    .line 134
    return-object v0

    .line 135
    :cond_1
    :try_start_1
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 136
    .line 137
    .line 138
    new-instance v0, Ljava/io/IOException;

    .line 139
    .line 140
    const-string v1, "Canceled"

    .line 141
    .line 142
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    throw v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    :catchall_0
    move-exception v0

    .line 147
    goto :goto_0

    .line 148
    :catch_0
    move-exception v0

    .line 149
    goto :goto_1

    .line 150
    :goto_0
    const/4 v1, 0x0

    .line 151
    goto :goto_2

    .line 152
    :goto_1
    :try_start_2
    iget-object v1, v6, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 153
    .line 154
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 159
    :catchall_1
    move-exception v0

    .line 160
    const/4 v1, 0x1

    .line 161
    :goto_2
    if-nez v1, :cond_2

    .line 162
    .line 163
    iget-object v1, v6, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 164
    .line 165
    invoke-virtual {v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 166
    .line 167
    .line 168
    :cond_2
    throw v0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->f()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clone()Lcom/tencent/cloud/ai/network/okhttp3/Call;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->d:Z

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/r;->a(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .line 12
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->d:Z

    invoke-static {v0, v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/r;->a(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)Lcom/tencent/cloud/ai/network/okhttp3/r;

    move-result-object p0

    return-object p0
.end method

.method public enqueue(Lcom/tencent/cloud/ai/network/okhttp3/Callback;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->e:Z

    .line 3
    .line 4
    if-nez v0, :cond_5

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->e:Z

    .line 8
    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 16
    .line 17
    const-string v2, "response.body().close()"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->f:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/r$a;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/r;Lcom/tencent/cloud/ai/network/okhttp3/Callback;)V

    .line 39
    .line 40
    .line 41
    monitor-enter v0

    .line 42
    :try_start_1
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->e:Ljava/util/Deque;

    .line 43
    .line 44
    invoke-interface {p0, v1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object p0, v1, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 48
    .line 49
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->d:Z

    .line 50
    .line 51
    if-nez p0, :cond_4

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->b()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->f:Ljava/util/Deque;

    .line 58
    .line 59
    invoke-interface {p1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->b()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_0

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :catchall_0
    move-exception p0

    .line 87
    goto :goto_1

    .line 88
    :cond_1
    iget-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->e:Ljava/util/Deque;

    .line 89
    .line 90
    invoke-interface {p1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_3

    .line 99
    .line 100
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Lcom/tencent/cloud/ai/network/okhttp3/r$a;

    .line 105
    .line 106
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->b()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-eqz v3, :cond_2

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    const/4 v2, 0x0

    .line 118
    :goto_0
    if-eqz v2, :cond_4

    .line 119
    .line 120
    iget-object p0, v2, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 121
    .line 122
    iput-object p0, v1, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 123
    .line 124
    :cond_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a()Z

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 130
    throw p0

    .line 131
    :catchall_1
    move-exception p1

    .line 132
    goto :goto_2

    .line 133
    :cond_5
    :try_start_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 134
    .line 135
    const-string v0, "Already Executed"

    .line 136
    .line 137
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw p1

    .line 141
    :goto_2
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 142
    throw p1
.end method

.method public execute()Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->e:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->e:Z

    .line 8
    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 10
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e:Lcom/tencent/cloud/ai/network/okio/c;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/c;->h()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 23
    .line 24
    const-string v2, "response.body().close()"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljava/lang/String;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->f:Ljava/lang/Object;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    :try_start_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    :try_start_2
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->g:Ljava/util/Deque;

    .line 45
    .line 46
    invoke-interface {v1, p0}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 47
    .line 48
    .line 49
    :try_start_3
    monitor-exit v0

    .line 50
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/r;->a()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 51
    .line 52
    .line 53
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 54
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->g:Ljava/util/Deque;

    .line 61
    .line 62
    invoke-virtual {v1, v2, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a(Ljava/util/Deque;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-object v0

    .line 66
    :catchall_0
    move-exception v0

    .line 67
    goto :goto_0

    .line 68
    :catchall_1
    move-exception v1

    .line 69
    :try_start_4
    monitor-exit v0

    .line 70
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 71
    :goto_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->g:Ljava/util/Deque;

    .line 78
    .line 79
    invoke-virtual {v1, v2, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a(Ljava/util/Deque;Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    throw v0

    .line 83
    :catchall_2
    move-exception v0

    .line 84
    goto :goto_1

    .line 85
    :cond_0
    :try_start_5
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 86
    .line 87
    const-string v1, "Already Executed"

    .line 88
    .line 89
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw v0

    .line 93
    :goto_1
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 94
    throw v0
.end method

.method public isCanceled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public declared-synchronized isExecuted()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->e:Z
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

.method public request()Lcom/tencent/cloud/ai/network/okhttp3/Request;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 2
    .line 3
    return-object p0
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e:Lcom/tencent/cloud/ai/network/okio/c;

    .line 4
    .line 5
    return-object p0
.end method

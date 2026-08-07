.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/ConnectInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;


# instance fields
.field public final client:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/ConnectInterceptor;->client:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public intercept(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;)Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 10

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->transmitter()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v3, "GET"

    .line 17
    .line 18
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    xor-int/lit8 v9, v1, 0x1

    .line 23
    .line 24
    iget-object v1, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 25
    .line 26
    monitor-enter v1

    .line 27
    :try_start_0
    iget-boolean v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->o:Z

    .line 28
    .line 29
    if-nez v3, :cond_2

    .line 30
    .line 31
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 32
    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 36
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 37
    .line 38
    iget-object v1, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    invoke-interface {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->connectTimeoutMillis()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-interface {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->readTimeoutMillis()I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    invoke-interface {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->writeTimeoutMillis()I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->pingIntervalMillis()I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->retryOnConnectionFailure()Z

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    :try_start_1
    invoke-virtual/range {v3 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a(IIIIZZ)Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v4, v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;)Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 68
    .line 69
    .line 70
    move-result-object v6
    :try_end_1
    .catch Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 71
    invoke-interface {v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/s;->c:Ljava/net/InetSocketAddress;

    .line 78
    .line 79
    if-eqz p1, :cond_0

    .line 80
    .line 81
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    new-instance v3, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v4, "socketAddress:"

    .line 88
    .line 89
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {v1, p1}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->logInfo(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_0
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 103
    .line 104
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->c:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 105
    .line 106
    iget-object v4, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 107
    .line 108
    iget-object v5, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 109
    .line 110
    invoke-direct/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;)V

    .line 111
    .line 112
    .line 113
    iget-object p1, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 114
    .line 115
    monitor-enter p1

    .line 116
    :try_start_2
    iput-object v1, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 117
    .line 118
    const/4 v3, 0x0

    .line 119
    iput-boolean v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->k:Z

    .line 120
    .line 121
    iput-boolean v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->l:Z

    .line 122
    .line 123
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 124
    invoke-virtual {p0, v0, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    return-object p0

    .line 129
    :catchall_0
    move-exception v0

    .line 130
    move-object p0, v0

    .line 131
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 132
    throw p0

    .line 133
    :catch_0
    move-exception v0

    .line 134
    move-object p0, v0

    .line 135
    goto :goto_0

    .line 136
    :catch_1
    move-exception v0

    .line 137
    move-object p0, v0

    .line 138
    goto :goto_1

    .line 139
    :goto_0
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->d()V

    .line 140
    .line 141
    .line 142
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;

    .line 143
    .line 144
    invoke-direct {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;-><init>(Ljava/io/IOException;)V

    .line 145
    .line 146
    .line 147
    throw p1

    .line 148
    :goto_1
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->d()V

    .line 149
    .line 150
    .line 151
    throw p0

    .line 152
    :catchall_1
    move-exception v0

    .line 153
    move-object p0, v0

    .line 154
    goto :goto_2

    .line 155
    :cond_1
    :try_start_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 156
    .line 157
    const-string p1, "cannot make a new request because the previous response is still open: please call response.close()"

    .line 158
    .line 159
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    throw p0

    .line 163
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 164
    .line 165
    const-string p1, "released"

    .line 166
    .line 167
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    throw p0

    .line 171
    :goto_2
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 172
    throw p0
.end method

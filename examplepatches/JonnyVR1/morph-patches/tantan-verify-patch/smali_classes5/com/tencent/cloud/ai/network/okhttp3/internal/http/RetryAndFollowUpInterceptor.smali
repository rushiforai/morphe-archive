.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Lcom/tencent/cloud/ai/network/okhttp3/Response;I)I
    .locals 0

    const-string p0, "Retry-After"

    .line 88
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    return p2

    :cond_0
    const-string p1, "\\d+"

    .line 89
    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 90
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    :cond_1
    const p0, 0x7fffffff

    return p0
.end method

.method public final a(Ljava/io/IOException;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;ZLcom/tencent/cloud/ai/network/okhttp3/Request;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->retryOnConnectionFailure()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    if-eqz p3, :cond_3

    .line 12
    .line 13
    invoke-virtual {p4}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->isOneShot()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    :cond_1
    instance-of p0, p1, Ljava/io/FileNotFoundException;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    :cond_2
    return v0

    .line 30
    :cond_3
    instance-of p0, p1, Ljava/net/ProtocolException;

    .line 31
    .line 32
    if-eqz p0, :cond_4

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_4
    instance-of p0, p1, Ljava/io/InterruptedIOException;

    .line 36
    .line 37
    if-eqz p0, :cond_5

    .line 38
    .line 39
    instance-of p0, p1, Ljava/net/SocketTimeoutException;

    .line 40
    .line 41
    if-eqz p0, :cond_7

    .line 42
    .line 43
    if-nez p3, :cond_7

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_5
    instance-of p0, p1, Ljavax/net/ssl/SSLHandshakeException;

    .line 47
    .line 48
    if-eqz p0, :cond_6

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    instance-of p0, p0, Ljava/security/cert/CertificateException;

    .line 55
    .line 56
    if-eqz p0, :cond_6

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_6
    instance-of p0, p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 60
    .line 61
    if-eqz p0, :cond_8

    .line 62
    .line 63
    :cond_7
    :goto_0
    return v0

    .line 64
    :cond_8
    :goto_1
    iget-object p0, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 65
    .line 66
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 67
    .line 68
    monitor-enter p1

    .line 69
    :try_start_0
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->i:Z

    .line 70
    .line 71
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    if-eqz p0, :cond_9

    .line 73
    .line 74
    iget-object p0, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->b()Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_9

    .line 81
    .line 82
    const/4 p0, 0x1

    .line 83
    return p0

    .line 84
    :cond_9
    return v0

    .line 85
    :catchall_0
    move-exception p0

    .line 86
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    throw p0
.end method

.method public intercept(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;)Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 28

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-interface/range {p1 .. p1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object/from16 v2, p1

    .line 8
    .line 9
    check-cast v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->transmitter()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const/4 v9, 0x0

    .line 16
    const/4 v10, 0x0

    .line 17
    move-object v11, v0

    .line 18
    move v13, v9

    .line 19
    move-object v12, v10

    .line 20
    :goto_0
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->g:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 21
    .line 22
    const/4 v14, 0x1

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v11}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-static {v0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Lcom/tencent/cloud/ai/network/okhttp3/p;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->b()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    goto/16 :goto_3

    .line 48
    .line 49
    :cond_0
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 50
    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {v4, v10, v14}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Ljava/io/IOException;Z)Ljava/io/IOException;

    .line 58
    .line 59
    .line 60
    iput-object v10, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 64
    .line 65
    .line 66
    return-object v10

    .line 67
    :cond_2
    :goto_1
    iput-object v11, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->g:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 68
    .line 69
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 70
    .line 71
    iget-object v5, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 72
    .line 73
    invoke-virtual {v11}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 78
    .line 79
    const-string v7, "https"

    .line 80
    .line 81
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    if-eqz v6, :cond_3

    .line 86
    .line 87
    iget-object v6, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 88
    .line 89
    invoke-virtual {v6}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 94
    .line 95
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    iget-object v8, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 100
    .line 101
    invoke-virtual {v8}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->certificatePinner()Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    move-object/from16 v20, v6

    .line 106
    .line 107
    move-object/from16 v21, v7

    .line 108
    .line 109
    move-object/from16 v22, v8

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_3
    move-object/from16 v20, v10

    .line 113
    .line 114
    move-object/from16 v21, v20

    .line 115
    .line 116
    move-object/from16 v22, v21

    .line 117
    .line 118
    :goto_2
    new-instance v15, Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 119
    .line 120
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 121
    .line 122
    iget v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 123
    .line 124
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 125
    .line 126
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dns()Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 127
    .line 128
    .line 129
    move-result-object v18

    .line 130
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 131
    .line 132
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->socketFactory()Ljavax/net/SocketFactory;

    .line 133
    .line 134
    .line 135
    move-result-object v19

    .line 136
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 137
    .line 138
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->proxyAuthenticator()Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 139
    .line 140
    .line 141
    move-result-object v23

    .line 142
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 143
    .line 144
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->proxy()Ljava/net/Proxy;

    .line 145
    .line 146
    .line 147
    move-result-object v24

    .line 148
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 149
    .line 150
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->protocols()Ljava/util/List;

    .line 151
    .line 152
    .line 153
    move-result-object v25

    .line 154
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 155
    .line 156
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->connectionSpecs()Ljava/util/List;

    .line 157
    .line 158
    .line 159
    move-result-object v26

    .line 160
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 161
    .line 162
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->proxySelector()Ljava/net/ProxySelector;

    .line 163
    .line 164
    .line 165
    move-result-object v27

    .line 166
    move/from16 v17, v0

    .line 167
    .line 168
    move-object/from16 v16, v6

    .line 169
    .line 170
    invoke-direct/range {v15 .. v27}, Lcom/tencent/cloud/ai/network/okhttp3/a;-><init>(Ljava/lang/String;ILcom/tencent/cloud/ai/network/okhttp3/Dns;Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lcom/tencent/cloud/ai/network/okhttp3/e;Lcom/tencent/cloud/ai/network/okhttp3/b;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V

    .line 171
    .line 172
    .line 173
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->c:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 174
    .line 175
    iget-object v8, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 176
    .line 177
    move-object v6, v15

    .line 178
    invoke-direct/range {v3 .. v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;Lcom/tencent/cloud/ai/network/okhttp3/a;Lcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;)V

    .line 179
    .line 180
    .line 181
    iput-object v3, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 182
    .line 183
    :goto_3
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d()Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-nez v0, :cond_25

    .line 188
    .line 189
    :try_start_0
    invoke-virtual {v2, v11, v4, v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RealInterceptorChain;->proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 190
    .line 191
    .line 192
    move-result-object v0
    :try_end_0
    .catch Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 193
    if-eqz v12, :cond_4

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    invoke-virtual {v3, v10}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body(Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-virtual {v0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->priorResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    :cond_4
    move-object v12, v0

    .line 220
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    .line 221
    .line 222
    check-cast v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 223
    .line 224
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 225
    .line 226
    .line 227
    iget-object v0, v12, Lcom/tencent/cloud/ai/network/okhttp3/Response;->m:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 228
    .line 229
    if-eqz v0, :cond_5

    .line 230
    .line 231
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 232
    .line 233
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 238
    .line 239
    goto :goto_4

    .line 240
    :cond_5
    move-object v3, v10

    .line 241
    :goto_4
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 242
    .line 243
    .line 244
    move-result v5

    .line 245
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 246
    .line 247
    .line 248
    move-result-object v6

    .line 249
    invoke-virtual {v6}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v6

    .line 253
    const/16 v7, 0x133

    .line 254
    .line 255
    const-string v8, "GET"

    .line 256
    .line 257
    if-eq v5, v7, :cond_11

    .line 258
    .line 259
    const/16 v7, 0x134

    .line 260
    .line 261
    if-eq v5, v7, :cond_11

    .line 262
    .line 263
    const/16 v7, 0x191

    .line 264
    .line 265
    if-eq v5, v7, :cond_10

    .line 266
    .line 267
    const/16 v7, 0x1f7

    .line 268
    .line 269
    if-eq v5, v7, :cond_e

    .line 270
    .line 271
    const/16 v7, 0x197

    .line 272
    .line 273
    if-eq v5, v7, :cond_b

    .line 274
    .line 275
    const/16 v3, 0x198

    .line 276
    .line 277
    if-eq v5, v3, :cond_6

    .line 278
    .line 279
    packed-switch v5, :pswitch_data_0

    .line 280
    .line 281
    .line 282
    goto/16 :goto_9

    .line 283
    .line 284
    :cond_6
    iget-object v5, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 285
    .line 286
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->retryOnConnectionFailure()Z

    .line 287
    .line 288
    .line 289
    move-result v5

    .line 290
    if-nez v5, :cond_7

    .line 291
    .line 292
    goto/16 :goto_9

    .line 293
    .line 294
    :cond_7
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 295
    .line 296
    .line 297
    move-result-object v5

    .line 298
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 299
    .line 300
    .line 301
    move-result-object v5

    .line 302
    if-eqz v5, :cond_8

    .line 303
    .line 304
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->isOneShot()Z

    .line 305
    .line 306
    .line 307
    move-result v5

    .line 308
    if-eqz v5, :cond_8

    .line 309
    .line 310
    goto/16 :goto_9

    .line 311
    .line 312
    :cond_8
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->priorResponse()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 313
    .line 314
    .line 315
    move-result-object v5

    .line 316
    if-eqz v5, :cond_9

    .line 317
    .line 318
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->priorResponse()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 319
    .line 320
    .line 321
    move-result-object v5

    .line 322
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 323
    .line 324
    .line 325
    move-result v5

    .line 326
    if-ne v5, v3, :cond_9

    .line 327
    .line 328
    goto/16 :goto_9

    .line 329
    .line 330
    :cond_9
    invoke-virtual {v1, v12, v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;I)I

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    if-lez v3, :cond_a

    .line 335
    .line 336
    goto/16 :goto_9

    .line 337
    .line 338
    :cond_a
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 339
    .line 340
    .line 341
    move-result-object v3

    .line 342
    :goto_5
    move-object v11, v3

    .line 343
    goto/16 :goto_c

    .line 344
    .line 345
    :cond_b
    if-eqz v3, :cond_c

    .line 346
    .line 347
    iget-object v5, v3, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;

    .line 348
    .line 349
    goto :goto_6

    .line 350
    :cond_c
    iget-object v5, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 351
    .line 352
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->proxy()Ljava/net/Proxy;

    .line 353
    .line 354
    .line 355
    move-result-object v5

    .line 356
    :goto_6
    invoke-virtual {v5}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 357
    .line 358
    .line 359
    move-result-object v5

    .line 360
    sget-object v6, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 361
    .line 362
    if-ne v5, v6, :cond_d

    .line 363
    .line 364
    iget-object v5, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 365
    .line 366
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->proxyAuthenticator()Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 367
    .line 368
    .line 369
    move-result-object v5

    .line 370
    invoke-interface {v5, v3, v12}, Lcom/tencent/cloud/ai/network/okhttp3/b;->a(Lcom/tencent/cloud/ai/network/okhttp3/s;Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 371
    .line 372
    .line 373
    move-result-object v3

    .line 374
    goto :goto_5

    .line 375
    :cond_d
    const-string v0, "Received HTTP_PROXY_AUTH (407) code while not using proxy"

    .line 376
    .line 377
    invoke-static {v0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    return-object v10

    .line 381
    :cond_e
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->priorResponse()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 382
    .line 383
    .line 384
    move-result-object v3

    .line 385
    if-eqz v3, :cond_f

    .line 386
    .line 387
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->priorResponse()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 392
    .line 393
    .line 394
    move-result v3

    .line 395
    if-ne v3, v7, :cond_f

    .line 396
    .line 397
    goto/16 :goto_9

    .line 398
    .line 399
    :cond_f
    const v3, 0x7fffffff

    .line 400
    .line 401
    .line 402
    invoke-virtual {v1, v12, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;I)I

    .line 403
    .line 404
    .line 405
    move-result v3

    .line 406
    if-nez v3, :cond_17

    .line 407
    .line 408
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 409
    .line 410
    .line 411
    move-result-object v3

    .line 412
    goto :goto_5

    .line 413
    :cond_10
    iget-object v5, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 414
    .line 415
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->authenticator()Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 416
    .line 417
    .line 418
    move-result-object v5

    .line 419
    invoke-interface {v5, v3, v12}, Lcom/tencent/cloud/ai/network/okhttp3/b;->a(Lcom/tencent/cloud/ai/network/okhttp3/s;Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 420
    .line 421
    .line 422
    move-result-object v3

    .line 423
    goto :goto_5

    .line 424
    :cond_11
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    move-result v3

    .line 428
    if-nez v3, :cond_12

    .line 429
    .line 430
    const-string v3, "HEAD"

    .line 431
    .line 432
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 433
    .line 434
    .line 435
    move-result v3

    .line 436
    if-nez v3, :cond_12

    .line 437
    .line 438
    goto :goto_9

    .line 439
    :cond_12
    :pswitch_0
    iget-object v3, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 440
    .line 441
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->followRedirects()Z

    .line 442
    .line 443
    .line 444
    move-result v3

    .line 445
    if-nez v3, :cond_13

    .line 446
    .line 447
    goto :goto_9

    .line 448
    :cond_13
    const-string v3, "Location"

    .line 449
    .line 450
    invoke-virtual {v12, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v3

    .line 454
    if-nez v3, :cond_14

    .line 455
    .line 456
    goto :goto_9

    .line 457
    :cond_14
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 458
    .line 459
    .line 460
    move-result-object v5

    .line 461
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 462
    .line 463
    .line 464
    move-result-object v5

    .line 465
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 466
    .line 467
    .line 468
    :try_start_1
    new-instance v7, Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 469
    .line 470
    invoke-direct {v7}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;-><init>()V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v7, v5, v3}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 474
    .line 475
    .line 476
    move-result-object v3
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 477
    goto :goto_7

    .line 478
    :catch_0
    move-object v3, v10

    .line 479
    :goto_7
    if-eqz v3, :cond_15

    .line 480
    .line 481
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 482
    .line 483
    .line 484
    move-result-object v3

    .line 485
    goto :goto_8

    .line 486
    :cond_15
    move-object v3, v10

    .line 487
    :goto_8
    if-nez v3, :cond_16

    .line 488
    .line 489
    goto :goto_9

    .line 490
    :cond_16
    iget-object v5, v3, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 491
    .line 492
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 493
    .line 494
    .line 495
    move-result-object v7

    .line 496
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 497
    .line 498
    .line 499
    move-result-object v7

    .line 500
    iget-object v7, v7, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 501
    .line 502
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 503
    .line 504
    .line 505
    move-result v5

    .line 506
    if-nez v5, :cond_18

    .line 507
    .line 508
    iget-object v5, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 509
    .line 510
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->followSslRedirects()Z

    .line 511
    .line 512
    .line 513
    move-result v5

    .line 514
    if-nez v5, :cond_18

    .line 515
    .line 516
    :cond_17
    :goto_9
    move-object v11, v10

    .line 517
    goto :goto_c

    .line 518
    :cond_18
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 519
    .line 520
    .line 521
    move-result-object v5

    .line 522
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 523
    .line 524
    .line 525
    move-result-object v5

    .line 526
    invoke-static {v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/d;->a(Ljava/lang/String;)Z

    .line 527
    .line 528
    .line 529
    move-result v7

    .line 530
    if-eqz v7, :cond_1b

    .line 531
    .line 532
    const-string v7, "PROPFIND"

    .line 533
    .line 534
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 535
    .line 536
    .line 537
    move-result v11

    .line 538
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 539
    .line 540
    .line 541
    move-result v7

    .line 542
    if-nez v7, :cond_19

    .line 543
    .line 544
    invoke-virtual {v5, v8, v10}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 545
    .line 546
    .line 547
    goto :goto_b

    .line 548
    :cond_19
    if-eqz v11, :cond_1a

    .line 549
    .line 550
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 551
    .line 552
    .line 553
    move-result-object v7

    .line 554
    invoke-virtual {v7}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 555
    .line 556
    .line 557
    move-result-object v7

    .line 558
    goto :goto_a

    .line 559
    :cond_1a
    move-object v7, v10

    .line 560
    :goto_a
    invoke-virtual {v5, v6, v7}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->method(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 561
    .line 562
    .line 563
    :goto_b
    if-nez v11, :cond_1b

    .line 564
    .line 565
    const-string v6, "Transfer-Encoding"

    .line 566
    .line 567
    invoke-virtual {v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 568
    .line 569
    .line 570
    const-string v6, "Content-Length"

    .line 571
    .line 572
    invoke-virtual {v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 573
    .line 574
    .line 575
    const-string v6, "Content-Type"

    .line 576
    .line 577
    invoke-virtual {v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 578
    .line 579
    .line 580
    :cond_1b
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 581
    .line 582
    .line 583
    move-result-object v6

    .line 584
    invoke-virtual {v6}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 585
    .line 586
    .line 587
    move-result-object v6

    .line 588
    invoke-static {v6, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Lcom/tencent/cloud/ai/network/okhttp3/p;)Z

    .line 589
    .line 590
    .line 591
    move-result v6

    .line 592
    if-nez v6, :cond_1c

    .line 593
    .line 594
    const-string v6, "Authorization"

    .line 595
    .line 596
    invoke-virtual {v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 597
    .line 598
    .line 599
    :cond_1c
    invoke-virtual {v5, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->url(Lcom/tencent/cloud/ai/network/okhttp3/p;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 600
    .line 601
    .line 602
    move-result-object v3

    .line 603
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 604
    .line 605
    .line 606
    move-result-object v3

    .line 607
    goto/16 :goto_5

    .line 608
    .line 609
    :goto_c
    if-nez v11, :cond_1e

    .line 610
    .line 611
    if-eqz v0, :cond_1f

    .line 612
    .line 613
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->f:Z

    .line 614
    .line 615
    if-eqz v0, :cond_1f

    .line 616
    .line 617
    iget-boolean v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->n:Z

    .line 618
    .line 619
    if-nez v0, :cond_1d

    .line 620
    .line 621
    iput-boolean v14, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->n:Z

    .line 622
    .line 623
    iget-object v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e:Lcom/tencent/cloud/ai/network/okio/c;

    .line 624
    .line 625
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 626
    .line 627
    .line 628
    goto :goto_d

    .line 629
    :cond_1d
    invoke-static {}, Ll/wpg0;->a()V

    .line 630
    .line 631
    .line 632
    return-object v10

    .line 633
    :cond_1e
    invoke-virtual {v11}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 634
    .line 635
    .line 636
    move-result-object v3

    .line 637
    if-eqz v3, :cond_20

    .line 638
    .line 639
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->isOneShot()Z

    .line 640
    .line 641
    .line 642
    move-result v3

    .line 643
    if-eqz v3, :cond_20

    .line 644
    .line 645
    :cond_1f
    :goto_d
    return-object v12

    .line 646
    :cond_20
    invoke-virtual {v12}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 647
    .line 648
    .line 649
    move-result-object v3

    .line 650
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 651
    .line 652
    .line 653
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->c()Z

    .line 654
    .line 655
    .line 656
    move-result v3

    .line 657
    if-eqz v3, :cond_21

    .line 658
    .line 659
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 660
    .line 661
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->cancel()V

    .line 662
    .line 663
    .line 664
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 665
    .line 666
    invoke-virtual {v3, v0, v14, v14, v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ZZLjava/io/IOException;)Ljava/io/IOException;

    .line 667
    .line 668
    .line 669
    :cond_21
    add-int/lit8 v13, v13, 0x1

    .line 670
    .line 671
    const/16 v0, 0x14

    .line 672
    .line 673
    if-gt v13, v0, :cond_22

    .line 674
    .line 675
    goto/16 :goto_0

    .line 676
    .line 677
    :cond_22
    const-string v0, "Too many follow-up requests: "

    .line 678
    .line 679
    invoke-static {v0, v13}, Ll/f7b0;->a(Ljava/lang/String;I)V

    .line 680
    .line 681
    .line 682
    return-object v10

    .line 683
    :catchall_0
    move-exception v0

    .line 684
    goto :goto_f

    .line 685
    :catch_1
    move-exception v0

    .line 686
    :try_start_2
    instance-of v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/a;

    .line 687
    .line 688
    xor-int/2addr v3, v14

    .line 689
    invoke-virtual {v1, v0, v4, v3, v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a(Ljava/io/IOException;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;ZLcom/tencent/cloud/ai/network/okhttp3/Request;)Z

    .line 690
    .line 691
    .line 692
    move-result v3

    .line 693
    if-eqz v3, :cond_23

    .line 694
    .line 695
    goto :goto_e

    .line 696
    :cond_23
    throw v0

    .line 697
    :catch_2
    move-exception v0

    .line 698
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;->b:Ljava/io/IOException;

    .line 699
    .line 700
    invoke-virtual {v1, v3, v4, v9, v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/RetryAndFollowUpInterceptor;->a(Ljava/io/IOException;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;ZLcom/tencent/cloud/ai/network/okhttp3/Request;)Z

    .line 701
    .line 702
    .line 703
    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 704
    if-eqz v3, :cond_24

    .line 705
    .line 706
    :goto_e
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b()V

    .line 707
    .line 708
    .line 709
    goto/16 :goto_0

    .line 710
    .line 711
    :cond_24
    :try_start_3
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/h;->a:Ljava/io/IOException;

    .line 712
    .line 713
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 714
    :goto_f
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b()V

    .line 715
    .line 716
    .line 717
    throw v0

    .line 718
    :cond_25
    const-string v0, "Canceled"

    .line 719
    .line 720
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 721
    .line 722
    .line 723
    return-object v10

    .line 724
    nop

    .line 725
    :pswitch_data_0
    .packed-switch 0x12c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.class final Le/e/a/VideoHttpSource;
.super Landroidx/media3/datasource/BaseDataSource;
.source "VideoHttpSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/VideoHttpSource$Credential;
    }
.end annotation


# static fields
.field private static final CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

.field private static final DOMAND_USER_AGENT:Ljava/lang/String; = "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

.field private static final SITE:Ljava/lang/String; = "https://www.nicovideo.jp"


# instance fields
.field private final credential:Le/e/a/VideoHttpSource$Credential;

.field private remaining:J

.field private response:Lnicoid/network238/okhttp3/Response;

.field private started:Z

.field private stream:Ljava/io/InputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 29
    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>()V

    .line 30
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x8

    invoke-virtual {v0, v2, v3, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 31
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 33
    new-instance v1, Le/e/a/VideoHttpSource$0;

    invoke-direct {v1}, Le/e/a/VideoHttpSource$0;-><init>()V

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->addNetworkInterceptor(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    .line 29
    sput-object v0, Le/e/a/VideoHttpSource;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    return-void
.end method

.method constructor <init>(Le/e/a/VideoHttpSource$Credential;)V
    .registers 3

    const/4 v0, 0x1

    .line 67
    invoke-direct {p0, v0}, Landroidx/media3/datasource/BaseDataSource;-><init>(Z)V

    .line 68
    iput-object p1, p0, Le/e/a/VideoHttpSource;->credential:Le/e/a/VideoHttpSource$Credential;

    return-void
.end method

.method private beginTransfer(Landroidx/media3/datasource/DataSpec;)V
    .registers 3

    const/4 v0, 0x1

    .line 143
    iput-boolean v0, p0, Le/e/a/VideoHttpSource;->started:Z

    .line 144
    invoke-virtual {p0, p1}, Le/e/a/VideoHttpSource;->transferStarted(Landroidx/media3/datasource/DataSpec;)V

    return-void
.end method

.method static synthetic lambda$0(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 7

    .line 34
    invoke-interface {p0}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    const-string v2, "Cookie"

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    .line 36
    const-class v3, Le/e/a/VideoHttpSource$Credential;

    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/Request;->tag(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/VideoHttpSource$Credential;

    .line 37
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    if-eqz v3, :cond_1

    .line 39
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v4

    const/16 v5, 0x1bb

    if-ne v4, v5, :cond_1

    .line 40
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".domand.nicovideo.jp"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 41
    iget-object v4, v3, Le/e/a/VideoHttpSource$Credential;->cookie:Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, v3, Le/e/a/VideoHttpSource$Credential;->cookie:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 42
    iget-object v3, v3, Le/e/a/VideoHttpSource$Credential;->cookie:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 44
    :cond_0
    const-string v2, "delivery.domand.nicovideo.jp"

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 45
    const-string v0, "User-Agent"

    const-string v2, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {v1, v0, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 48
    :cond_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-interface {p0, v0}, Lnicoid/network238/okhttp3/Interceptor$Chain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    return-object p0
.end method

.method static newSessionClient()Lnicoid/network238/okhttp3/OkHttpClient;
    .registers 5

    new-instance v1, Lnicoid/network238/okhttp3/ConnectionPool;

    const/4 v2, 0x4

    const-wide/16 v3, 0x1e

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {v1, v2, v3, v4, v0}, Lnicoid/network238/okhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    sget-object v0, Le/e/a/VideoHttpSource;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectionPool(Lnicoid/network238/okhttp3/ConnectionPool;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 4

    .line 181
    iget-object v0, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    const/4 v1, 0x0

    .line 182
    iput-object v1, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    .line 183
    iput-object v1, p0, Le/e/a/VideoHttpSource;->stream:Ljava/io/InputStream;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 186
    :try_start_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 189
    iget-boolean v2, p0, Le/e/a/VideoHttpSource;->started:Z

    if-eqz v2, :cond_0

    .line 190
    iput-boolean v1, p0, Le/e/a/VideoHttpSource;->started:Z

    .line 191
    invoke-virtual {p0}, Le/e/a/VideoHttpSource;->transferEnded()V

    .line 193
    :cond_0
    throw v0

    .line 189
    :cond_1
    :goto_0
    iget-boolean v0, p0, Le/e/a/VideoHttpSource;->started:Z

    if-eqz v0, :cond_2

    .line 190
    iput-boolean v1, p0, Le/e/a/VideoHttpSource;->started:Z

    .line 191
    invoke-virtual {p0}, Le/e/a/VideoHttpSource;->transferEnded()V

    :cond_2
    return-void
.end method

.method public getResponseHeaders()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 176
    iget-object p0, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    if-nez p0, :cond_0

    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 1

    .line 171
    iget-object p0, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public open(Landroidx/media3/datasource/DataSpec;)J
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    invoke-virtual {p0, p1}, Le/e/a/VideoHttpSource;->transferInitializing(Landroidx/media3/datasource/DataSpec;)V

    .line 74
    iget-object v0, p1, Landroidx/media3/datasource/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 78
    new-instance v1, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 79
    const-class v1, Le/e/a/VideoHttpSource$Credential;

    iget-object v2, p0, Le/e/a/VideoHttpSource;->credential:Le/e/a/VideoHttpSource$Credential;

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Ljava/lang/Class;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 80
    iget-object v1, p1, Landroidx/media3/datasource/DataSpec;->httpRequestHeaders:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_f

    .line 83
    const-string v1, "Referer"

    const-string v2, "https://www.nicovideo.jp/"

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    const-string v2, "Origin"

    const-string v3, "https://www.nicovideo.jp"

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    const/4 v1, 0x1

    .line 84
    invoke-virtual {p1, v1}, Landroidx/media3/datasource/DataSpec;->isFlagSet(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 85
    const-string v1, "Accept-Encoding"

    const-string v2, "identity"

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 87
    :cond_0
    iget-wide v1, p1, Landroidx/media3/datasource/DataSpec;->position:J

    iget-wide v3, p1, Landroidx/media3/datasource/DataSpec;->length:J

    invoke-static {v1, v2, v3, v4}, Landroidx/media3/datasource/HttpUtil;->buildRangeRequestHeader(JJ)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 89
    const-string v2, "Range"

    invoke-virtual {v0, v2, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 91
    :cond_1
    iget-object v1, p1, Landroidx/media3/datasource/DataSpec;->httpBody:[B

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-nez v1, :cond_2

    iget v1, p1, Landroidx/media3/datasource/DataSpec;->httpMethod:I

    const/4 v4, 0x2

    if-eq v1, v4, :cond_2

    move-object v1, v3

    goto :goto_2

    .line 92
    :cond_2
    iget-object v1, p1, Landroidx/media3/datasource/DataSpec;->httpBody:[B

    if-nez v1, :cond_3

    new-array v1, v2, [B

    goto :goto_1

    :cond_3
    iget-object v1, p1, Landroidx/media3/datasource/DataSpec;->httpBody:[B

    :goto_1
    invoke-static {v3, v1}, Lnicoid/network238/okhttp3/RequestBody;->create(Lnicoid/network238/okhttp3/MediaType;[B)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v1

    .line 93
    :goto_2
    invoke-virtual {p1}, Landroidx/media3/datasource/DataSpec;->getHttpMethodString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 96
    :try_start_0
    iget-object v1, p0, Le/e/a/VideoHttpSource;->credential:Le/e/a/VideoHttpSource$Credential;

    iget-object v1, v1, Le/e/a/VideoHttpSource$Credential;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    iput-object v0, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    .line 97
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    const-string v0, "Content-Range"

    const/16 v1, 0x1a0

    const-wide/16 v6, -0x1

    const-wide/16 v8, 0x0

    if-ne v5, v1, :cond_5

    :try_start_1
    iget-wide v10, p1, Landroidx/media3/datasource/DataSpec;->position:J

    iget-object v4, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v4, v0}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroidx/media3/datasource/HttpUtil;->getDocumentSize(Ljava/lang/String;)J

    move-result-wide v12

    cmp-long v4, v10, v12

    if-nez v4, :cond_5

    .line 99
    iput-wide v8, p0, Le/e/a/VideoHttpSource;->remaining:J

    .line 100
    invoke-direct {p0, p1}, Le/e/a/VideoHttpSource;->beginTransfer(Landroidx/media3/datasource/DataSpec;)V

    .line 101
    iget-wide v0, p1, Landroidx/media3/datasource/DataSpec;->length:J

    cmp-long v0, v0, v6

    if-nez v0, :cond_4

    return-wide v8

    :cond_4
    iget-wide p0, p1, Landroidx/media3/datasource/DataSpec;->length:J

    return-wide p0

    .line 103
    :cond_5
    iget-object v4, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->isSuccessful()Z

    move-result v4

    const/16 v10, 0x7d8

    if-nez v4, :cond_7

    if-ne v5, v1, :cond_6

    .line 105
    new-instance v3, Landroidx/media3/datasource/DataSourceException;

    invoke-direct {v3, v10}, Landroidx/media3/datasource/DataSourceException;-><init>(I)V

    :cond_6
    move-object v7, v3

    .line 107
    new-instance v4, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;

    iget-object v0, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v6

    .line 108
    iget-object v0, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object v8

    new-array v10, v2, [B

    move-object v9, p1

    .line 107
    invoke-direct/range {v4 .. v10}, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;-><init>(ILjava/lang/String;Ljava/io/IOException;Ljava/util/Map;Landroidx/media3/datasource/DataSpec;[B)V

    throw v4

    .line 110
    :cond_7
    iget-object v1, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v1

    if-eqz v1, :cond_e

    .line 114
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, p0, Le/e/a/VideoHttpSource;->stream:Ljava/io/InputStream;

    const/16 v1, 0xc8

    if-ne v5, v1, :cond_8

    .line 115
    iget-wide v3, p1, Landroidx/media3/datasource/DataSpec;->position:J

    goto :goto_3

    :cond_8
    move-wide v3, v8

    .line 116
    :goto_3
    iget-object v1, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    const-string v5, "Content-Length"

    invoke-virtual {v1, v5}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 117
    iget-object v5, p0, Le/e/a/VideoHttpSource;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v5, v0}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-static {v1, v0}, Landroidx/media3/datasource/HttpUtil;->getContentLength(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    .line 118
    iget-wide v11, p1, Landroidx/media3/datasource/DataSpec;->length:J

    cmp-long v5, v11, v6

    if-eqz v5, :cond_9

    iget-wide v11, p1, Landroidx/media3/datasource/DataSpec;->length:J

    goto :goto_4

    :cond_9
    cmp-long v5, v0, v6

    if-nez v5, :cond_a

    move-wide v11, v6

    goto :goto_4

    :cond_a
    sub-long v11, v0, v3

    :goto_4
    iput-wide v11, p0, Le/e/a/VideoHttpSource;->remaining:J

    cmp-long v5, v11, v8

    if-gez v5, :cond_b

    cmp-long v0, v0, v6

    if-eqz v0, :cond_b

    .line 121
    new-instance p1, Landroidx/media3/datasource/DataSourceException;

    invoke-direct {p1, v10}, Landroidx/media3/datasource/DataSourceException;-><init>(I)V

    throw p1

    .line 123
    :cond_b
    invoke-direct {p0, p1}, Le/e/a/VideoHttpSource;->beginTransfer(Landroidx/media3/datasource/DataSpec;)V

    cmp-long p1, v3, v8

    if-lez p1, :cond_d

    const/16 p1, 0x2000

    .line 125
    new-array p1, p1, [B

    :goto_5
    cmp-long v0, v3, v8

    if-lez v0, :cond_d

    .line 127
    iget-object v0, p0, Le/e/a/VideoHttpSource;->stream:Ljava/io/InputStream;

    const-wide/16 v5, 0x2000

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v1, v5

    invoke-virtual {v0, p1, v2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_c

    int-to-long v5, v0

    sub-long/2addr v3, v5

    .line 132
    invoke-virtual {p0, v0}, Le/e/a/VideoHttpSource;->bytesTransferred(I)V

    goto :goto_5

    .line 129
    :cond_c
    new-instance p1, Landroidx/media3/datasource/DataSourceException;

    invoke-direct {p1, v10}, Landroidx/media3/datasource/DataSourceException;-><init>(I)V

    throw p1

    .line 135
    :cond_d
    iget-wide p0, p0, Le/e/a/VideoHttpSource;->remaining:J

    return-wide p0

    .line 112
    :cond_e
    new-instance p1, Ljava/io/EOFException;

    const-string v0, "Empty HTTP response"

    invoke-direct {p1, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    :goto_6
    move-object p1, v0

    .line 137
    invoke-virtual {p0}, Le/e/a/VideoHttpSource;->close()V

    .line 138
    throw p1

    .line 80
    :cond_f
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 81
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    goto/16 :goto_0

    .line 76
    :cond_10
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Unsupported video URL"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public read([BII)I
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p3, :cond_0

    const/4 p0, 0x0

    return p0

    .line 152
    :cond_0
    iget-wide v0, p0, Le/e/a/VideoHttpSource;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const/4 v5, -0x1

    if-nez v4, :cond_1

    return v5

    .line 155
    :cond_1
    iget-object v4, p0, Le/e/a/VideoHttpSource;->stream:Ljava/io/InputStream;

    const-wide/16 v6, -0x1

    cmp-long v8, v0, v6

    if-eqz v8, :cond_2

    int-to-long v8, p3

    .line 156
    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p3, v0

    .line 155
    :cond_2
    invoke-virtual {v4, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    if-ne p1, v5, :cond_3

    .line 157
    iget-wide p2, p0, Le/e/a/VideoHttpSource;->remaining:J

    cmp-long p2, p2, v2

    if-lez p2, :cond_3

    .line 158
    new-instance p0, Ljava/io/EOFException;

    const-string p1, "Truncated HTTP response"

    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    if-lez p1, :cond_5

    .line 161
    iget-wide p2, p0, Le/e/a/VideoHttpSource;->remaining:J

    cmp-long v0, p2, v6

    if-eqz v0, :cond_4

    int-to-long v0, p1

    sub-long/2addr p2, v0

    .line 162
    iput-wide p2, p0, Le/e/a/VideoHttpSource;->remaining:J

    .line 164
    :cond_4
    invoke-virtual {p0, p1}, Le/e/a/VideoHttpSource;->bytesTransferred(I)V

    :cond_5
    return p1
.end method

.class public final Lnicoid/network238/MediaConnection257;
.super Ljava/net/HttpURLConnection;
.source "MediaConnection257.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/MediaConnection257$Shared;,
        Lnicoid/network238/MediaConnection257$LockedStream;
    }
.end annotation


# instance fields
.field private call:Lnicoid/network238/okhttp3/Call;

.field private cancelled:Z

.field private final client:Lnicoid/network238/okhttp3/OkHttpClient;

.field private executing:Z

.field private failure:Ljava/io/IOException;

.field private final headers:Lnicoid/network238/okhttp3/Headers;

.field private response:Lnicoid/network238/okhttp3/Response;

.field private stream:Ljava/io/InputStream;

.field private final streamLock:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/net/URL;Ljava/lang/String;Lnicoid/network238/okhttp3/Headers;ZIILnicoid/network238/okhttp3/OkHttpClient;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .line 12
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 10
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/MediaConnection257;->streamLock:Ljava/lang/Object;

    .line 12
    iput-object p2, p0, Lnicoid/network238/MediaConnection257;->method:Ljava/lang/String;

    iput-object p3, p0, Lnicoid/network238/MediaConnection257;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {p0, p4}, Lnicoid/network238/MediaConnection257;->setInstanceFollowRedirects(Z)V

    invoke-virtual {p0, p5}, Lnicoid/network238/MediaConnection257;->setConnectTimeout(I)V

    invoke-virtual {p0, p6}, Lnicoid/network238/MediaConnection257;->setReadTimeout(I)V

    iput-object p7, p0, Lnicoid/network238/MediaConnection257;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    return-void
.end method

.method private body()Ljava/io/InputStream;
    .registers 4

    .line 66
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->stream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    new-instance v0, Lnicoid/network238/MediaConnection257$LockedStream;

    iget-object v1, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/MediaConnection257;->streamLock:Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lnicoid/network238/MediaConnection257$LockedStream;-><init>(Ljava/io/InputStream;Ljava/lang/Object;)V

    iput-object v0, p0, Lnicoid/network238/MediaConnection257;->stream:Ljava/io/InputStream;

    :cond_0
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->stream:Ljava/io/InputStream;

    return-object v0
.end method

.method static eligible(Ljava/net/URL;)Z
    .registers 3

    .line 13
    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getRef()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result p0

    const/16 v0, 0x1bb

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static redirect(I)Z
    .registers 2

    .line 39
    const/16 v0, 0x12c

    if-eq p0, v0, :cond_0

    const/16 v0, 0x12d

    if-eq p0, v0, :cond_0

    const/16 v0, 0x12e

    if-eq p0, v0, :cond_0

    const/16 v0, 0x12f

    if-eq p0, v0, :cond_0

    const/16 v0, 0x133

    if-eq p0, v0, :cond_0

    const/16 v0, 0x134

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    :goto_0
    return p0
.end method

.method private static sameOrigin(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 4

    .line 40
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result p0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result p1

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static select(Ljava/lang/Object;Ljava/net/HttpURLConnection;Ljava/util/Map;)Ljava/net/HttpURLConnection;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/net/HttpURLConnection;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/net/HttpURLConnection;"
        }
    .end annotation

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "androidx.media3.datasource.DefaultHttpDataSource"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    return-object p1

    .line 16
    :cond_0
    invoke-static {p1, p2}, Lnicoid/network238/MediaConnection257;->selectConfigured(Ljava/net/HttpURLConnection;Ljava/util/Map;)Ljava/net/HttpURLConnection;

    move-result-object p0

    return-object p0
.end method

.method static selectConfigured(Ljava/net/HttpURLConnection;)Ljava/net/HttpURLConnection;
    .registers 2

    .line 18
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-static {p0, v0}, Lnicoid/network238/MediaConnection257;->selectConfigured(Ljava/net/HttpURLConnection;Ljava/util/Map;)Ljava/net/HttpURLConnection;

    move-result-object p0

    return-object p0
.end method

.method static selectConfigured(Ljava/net/HttpURLConnection;Ljava/util/Map;)Ljava/net/HttpURLConnection;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/net/HttpURLConnection;"
        }
    .end annotation

    .line 20
    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/MediaConnection257;->eligible(Ljava/net/URL;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {}, Ljava/net/CookieHandler;->getDefault()Ljava/net/CookieHandler;

    move-result-object v0

    if-nez v0, :cond_b

    invoke-static {}, Ljava/net/ResponseCache;->getDefault()Ljava/net/ResponseCache;

    move-result-object v0

    if-nez v0, :cond_b

    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getDoOutput()Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "GET"

    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "HEAD"

    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 22
    :cond_0
    :try_start_0
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 23
    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "Cookie2"

    const-string v4, "Host"

    const-string v5, "Proxy-Authorization"

    const-string v6, "Authorization"

    if-eqz v2, :cond_4

    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 24
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_3

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v5, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 25
    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getInstanceFollowRedirects()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v8, "cookie"

    const-string v9, "user-agent"

    const-string v10, "range"

    const-string v11, "accept-encoding"

    const-string v12, "accept"

    const-string v13, "referer"

    const-string v14, "origin"

    const-string v15, "content-type"

    const-string v16, "cache-control"

    filled-new-array/range {v8 .. v16}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v7, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    return-object p0

    .line 26
    :cond_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v7, v3}, Lnicoid/network238/okhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    goto :goto_1

    .line 27
    :cond_2
    goto :goto_0

    .line 24
    :cond_3
    return-object p0

    .line 30
    :cond_4
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_1 .. :try_end_1} :catch_0

    const-string v7, "User-Agent"

    const-string v8, "Accept-Encoding"

    if-eqz v2, :cond_7

    :try_start_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 31
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    if-eqz v9, :cond_6

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_6

    invoke-virtual {v5, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_6

    invoke-virtual {v4, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_6

    invoke-virtual {v3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 32
    const-string v10, "Range"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_5

    invoke-virtual {v7, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v7

    invoke-virtual {v7, v9}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v7, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    return-object p0

    .line 33
    :cond_5
    goto :goto_2

    .line 31
    :cond_6
    return-object p0

    .line 34
    :cond_7
    invoke-virtual {v0, v8}, Lnicoid/network238/okhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_8

    const-string v1, "identity"

    invoke-virtual {v0, v8, v1}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    .line 35
    :cond_8
    invoke-virtual {v0, v7}, Lnicoid/network238/okhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_a

    const-string v1, "http.agent"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9

    invoke-virtual {v0, v7, v1}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    goto :goto_3

    :cond_9
    return-object p0

    .line 36
    :cond_a
    :goto_3
    new-instance v8, Lnicoid/network238/MediaConnection257;

    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v11

    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getInstanceFollowRedirects()Z

    move-result v12

    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getConnectTimeout()I

    move-result v13

    invoke-virtual/range {p0 .. p0}, Ljava/net/HttpURLConnection;->getReadTimeout()I

    move-result v14

    sget-object v15, Lnicoid/network238/MediaConnection257$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-direct/range {v8 .. v15}, Lnicoid/network238/MediaConnection257;-><init>(Ljava/net/URL;Ljava/lang/String;Lnicoid/network238/okhttp3/Headers;ZIILnicoid/network238/okhttp3/OkHttpClient;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/ProtocolException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v8

    .line 37
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    :goto_4
    return-object p0

    .line 20
    :cond_b
    return-object p0
.end method


# virtual methods
.method public connect()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/MediaConnection257;->cancelled:Z

    if-nez v0, :cond_a

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->failure:Ljava/io/IOException;

    if-nez v0, :cond_9

    iget-boolean v0, p0, Lnicoid/network238/MediaConnection257;->executing:Z

    if-nez v0, :cond_8

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/MediaConnection257;->connected:Z

    iput-boolean v0, p0, Lnicoid/network238/MediaConnection257;->executing:Z

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_9

    .line 43
    nop

    .line 45
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_1
    iget-object v2, p0, Lnicoid/network238/MediaConnection257;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/MediaConnection257;->getConnectTimeout()I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/MediaConnection257;->getReadTimeout()I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v2

    .line 46
    new-instance v3, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v3}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    iget-object v4, p0, Lnicoid/network238/MediaConnection257;->url:Ljava/net/URL;

    invoke-virtual {v3, v4}, Lnicoid/network238/okhttp3/Request$Builder;->url(Ljava/net/URL;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    iget-object v4, p0, Lnicoid/network238/MediaConnection257;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v3, v4}, Lnicoid/network238/okhttp3/Request$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    iget-object v4, p0, Lnicoid/network238/MediaConnection257;->method:Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    .line 47
    move v4, v1

    .line 48
    :goto_0
    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v5

    monitor-enter p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    :try_start_2
    iget-boolean v6, p0, Lnicoid/network238/MediaConnection257;->cancelled:Z

    if-nez v6, :cond_6

    iput-object v5, p0, Lnicoid/network238/MediaConnection257;->call:Lnicoid/network238/okhttp3/Call;

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 49
    :try_start_3
    invoke-interface {v5}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v5
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    :try_start_4
    const-string v6, "Location"

    invoke-virtual {v5, v6}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_1

    move-object v6, v0

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v7

    invoke-virtual {v7, v6}, Lnicoid/network238/okhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v6

    .line 50
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/MediaConnection257;->getInstanceFollowRedirects()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v7

    invoke-static {v7}, Lnicoid/network238/MediaConnection257;->redirect(I)Z

    move-result v7

    if-eqz v7, :cond_4

    if-eqz v6, :cond_4

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v8

    invoke-virtual {v8}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 51
    const/16 v7, 0x14

    if-ge v4, v7, :cond_3

    .line 52
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v7

    invoke-virtual {v7, v6}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v7

    .line 53
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v3

    invoke-static {v3, v6}, Lnicoid/network238/MediaConnection257;->sameOrigin(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "Cookie"

    invoke-virtual {v7, v3}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    const-string v3, "Authorization"

    invoke-virtual {v7, v3}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    const-string v3, "Proxy-Authorization"

    invoke-virtual {v7, v3}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    const-string v3, "Referer"

    invoke-virtual {v7, v3}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    const-string v3, "Origin"

    invoke-virtual {v7, v3}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 54
    :cond_2
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_7

    :try_start_5
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v3
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 47
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 51
    :cond_3
    :try_start_6
    new-instance v0, Ljava/net/ProtocolException;

    const-string v2, "Too many redirects"

    invoke-direct {v0, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_4
    monitor-enter p0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_7

    :try_start_7
    iget-boolean v2, p0, Lnicoid/network238/MediaConnection257;->cancelled:Z

    if-nez v2, :cond_5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v2

    iput-object v2, p0, Lnicoid/network238/MediaConnection257;->url:Ljava/net/URL;

    iput-object v5, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 58
    monitor-enter p0

    :try_start_9
    iput-boolean v1, p0, Lnicoid/network238/MediaConnection257;->executing:Z

    monitor-exit p0

    .line 59
    return-void

    .line 58
    :goto_2
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_c

    :catchall_0
    move-exception v0

    goto :goto_2

    .line 56
    :cond_5
    :try_start_a
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Cancelled"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :catchall_1
    move-exception v2

    move-object v0, v5

    :goto_3
    :try_start_b
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    :try_start_c
    throw v2
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :catchall_2
    move-exception v2

    goto :goto_3

    .line 57
    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    goto :goto_7

    .line 48
    :cond_6
    :try_start_d
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Cancelled"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    :goto_4
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    :try_start_e
    throw v2
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_2
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    :catchall_3
    move-exception v2

    goto :goto_4

    .line 58
    :catchall_4
    move-exception v2

    move-object v5, v0

    move-object v0, v2

    goto :goto_a

    .line 57
    :catch_2
    move-exception v2

    move-object v5, v0

    move-object v0, v2

    :goto_5
    :try_start_f
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Media transport failed"

    invoke-direct {v2, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    monitor-enter p0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    :try_start_10
    iput-object v2, p0, Lnicoid/network238/MediaConnection257;->failure:Ljava/io/IOException;

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    :try_start_11
    throw v2
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    :goto_6
    :try_start_12
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_5

    goto :goto_9

    :catchall_5
    move-exception v0

    goto :goto_6

    :catch_3
    move-exception v2

    move-object v5, v0

    move-object v0, v2

    :goto_7
    :try_start_13
    monitor-enter p0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_7

    :try_start_14
    iput-object v0, p0, Lnicoid/network238/MediaConnection257;->failure:Ljava/io/IOException;

    monitor-exit p0

    goto :goto_9

    :goto_8
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_6

    :goto_9
    :try_start_15
    throw v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_7

    :catchall_6
    move-exception v0

    goto :goto_8

    .line 58
    :catchall_7
    move-exception v0

    :goto_a
    if-eqz v5, :cond_7

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Response;->close()V

    :cond_7
    monitor-enter p0

    :try_start_16
    iput-boolean v1, p0, Lnicoid/network238/MediaConnection257;->executing:Z

    monitor-exit p0

    goto :goto_c

    :goto_b
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_8

    :goto_c
    throw v0

    :catchall_8
    move-exception v0

    goto :goto_b

    .line 42
    :cond_8
    :try_start_17
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Concurrent connect"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_d

    :cond_9
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->failure:Ljava/io/IOException;

    goto :goto_d

    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_d
    throw v0

    :goto_e
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_9

    throw v0

    :catchall_9
    move-exception v0

    goto :goto_e
.end method

.method public disconnect()V
    .registers 4

    .line 69
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/MediaConnection257;->cancelled:Z

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->call:Lnicoid/network238/okhttp3/Call;

    iget-object v1, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    const/4 v2, 0x0

    iput-object v2, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->cancel()V

    :cond_0
    if-eqz v1, :cond_1

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->streamLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    monitor-exit v0

    goto :goto_1

    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0

    :cond_1
    :goto_1
    return-void

    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_2
.end method

.method public getContentEncoding()Ljava/lang/String;
    .registers 2

    .line 65
    const-string v0, "Content-Encoding"

    invoke-virtual {p0, v0}, Lnicoid/network238/MediaConnection257;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .line 64
    const-string v0, "Content-Type"

    invoke-virtual {p0, v0}, Lnicoid/network238/MediaConnection257;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getErrorStream()Ljava/io/InputStream;
    .registers 3

    monitor-enter p0

    .line 68
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x190

    if-lt v0, v1, :cond_0

    invoke-direct {p0}, Lnicoid/network238/MediaConnection257;->body()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    .line 68
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 62
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/MediaConnection257;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    if-nez v1, :cond_0

    monitor-exit p0

    goto :goto_2

    :cond_0
    if-nez p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    monitor-exit p0

    return-object p1

    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :goto_2
    return-object v0
.end method

.method public getHeaderFields()Ljava/util/Map;
    .registers 6
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

    .line 63
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/MediaConnection257;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    goto/16 :goto_1

    :cond_0
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-static {v1}, Ljava/util/Comparator;->nullsFirst(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iget-object v1, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers;->toMultimap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    :goto_1
    monitor-exit p0

    return-object v0

    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    invoke-virtual {p0}, Lnicoid/network238/MediaConnection257;->connect()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x190

    if-ge v0, v1, :cond_0

    invoke-direct {p0}, Lnicoid/network238/MediaConnection257;->body()Ljava/io/InputStream;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "HTTP "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_0
    throw v0

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public getResponseCode()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    invoke-virtual {p0}, Lnicoid/network238/MediaConnection257;->connect()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    monitor-exit p0

    return v0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    invoke-virtual {p0}, Lnicoid/network238/MediaConnection257;->connect()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/MediaConnection257;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public usingProxy()Z
    .registers 2

    .line 70
    const/4 v0, 0x0

    return v0
.end method

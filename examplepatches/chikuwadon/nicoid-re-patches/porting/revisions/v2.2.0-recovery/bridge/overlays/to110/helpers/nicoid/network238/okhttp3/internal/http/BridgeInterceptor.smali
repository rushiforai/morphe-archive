.class public final Lnicoid/network238/okhttp3/internal/http/BridgeInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0016\u0010\u0008\u001a\u00020\t2\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000bH\u0002\u00a8\u0006\r"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http/BridgeInterceptor;",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "<init>",
        "()V",
        "intercept",
        "Lnicoid/network238/okhttp3/Response;",
        "chain",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "cookieHeader",
        "",
        "cookies",
        "",
        "Lnicoid/network238/okhttp3/Cookie;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final cookieHeader(Ljava/util/List;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Cookie;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    if-gez v1, :cond_0

    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->throwIndexOverflow()V

    :cond_0
    check-cast v2, Lnicoid/network238/okhttp3/Cookie;

    if-lez v1, :cond_1

    .line 116
    const-string v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    :cond_1
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v4, 0x3d

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v3

    goto :goto_0

    .line 114
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    .line 40
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v2

    const-string v3, "Content-Type"

    const-wide/16 v4, -0x1

    const-string v6, "Content-Length"

    if-eqz v2, :cond_2

    .line 42
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/RequestBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 44
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/MediaType;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v3, v7}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 47
    :cond_0
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/RequestBody;->contentLength()J

    move-result-wide v7

    cmp-long v2, v7, v4

    const-string v9, "Transfer-Encoding"

    if-eqz v2, :cond_1

    .line 49
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v6, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 50
    invoke-virtual {v1, v9}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    goto :goto_0

    .line 52
    :cond_1
    const-string v2, "chunked"

    invoke-virtual {v1, v9, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 53
    invoke-virtual {v1, v6}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 57
    :cond_2
    :goto_0
    const-string v2, "Host"

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-nez v7, :cond_3

    .line 58
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v7

    invoke-static {v7, v8, v9, v10}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHostHeader$default(Lnicoid/network238/okhttp3/HttpUrl;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v2, v7}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 61
    :cond_3
    const-string v2, "Connection"

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_4

    .line 62
    const-string v7, "Keep-Alive"

    invoke-virtual {v1, v2, v7}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    :cond_4
    nop

    .line 68
    const-string v2, "Accept-Encoding"

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v11, "gzip"

    if-nez v7, :cond_5

    const-string v7, "Range"

    invoke-virtual {v0, v7}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_5

    .line 70
    invoke-virtual {v1, v2, v11}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move v8, v9

    .line 73
    :cond_5
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getCookieJar()Lnicoid/network238/okhttp3/CookieJar;

    move-result-object v2

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v7

    invoke-interface {v2, v7}, Lnicoid/network238/okhttp3/CookieJar;->loadForRequest(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/util/List;

    move-result-object v2

    .line 74
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_6

    .line 75
    invoke-direct {p0, v2}, Lnicoid/network238/okhttp3/internal/http/BridgeInterceptor;->cookieHeader(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    const-string v7, "Cookie"

    invoke-virtual {v1, v7, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 78
    :cond_6
    const-string v2, "User-Agent"

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7

    .line 79
    const-string v0, "okhttp/5.5.1"

    invoke-virtual {v1, v2, v0}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 82
    :cond_7
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 83
    invoke-interface {p1, v0}, Lnicoid/network238/okhttp3/Interceptor$Chain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object v1

    .line 85
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getCookieJar()Lnicoid/network238/okhttp3/CookieJar;

    move-result-object p1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v7

    invoke-static {p1, v2, v7}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->receiveHeaders(Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    .line 89
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 90
    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    if-eqz v8, :cond_8

    .line 93
    const-string v0, "Content-Encoding"

    const/4 v2, 0x2

    invoke-static {v1, v0, v10, v2, v10}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v11, v7, v9}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 94
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->promisesBody(Lnicoid/network238/okhttp3/Response;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 96
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v7

    .line 97
    new-instance v8, Lnicoid/network238/okio/GzipSource;

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v7

    invoke-direct {v8, v7}, Lnicoid/network238/okio/GzipSource;-><init>(Lnicoid/network238/okio/Source;)V

    .line 99
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v7

    .line 100
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Headers;->newBuilder()Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object v7

    .line 101
    invoke-virtual {v7, v0}, Lnicoid/network238/okhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object v0

    .line 102
    invoke-virtual {v0, v6}, Lnicoid/network238/okhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    .line 104
    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Response$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Response$Builder;

    .line 105
    invoke-static {v1, v3, v10, v2, v10}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 106
    new-instance v1, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;

    invoke-static {v8}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v2

    invoke-direct {v1, v0, v4, v5, v2}, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;-><init>(Ljava/lang/String;JLnicoid/network238/okio/BufferedSource;)V

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Response$Builder;->body(Lnicoid/network238/okhttp3/ResponseBody;)Lnicoid/network238/okhttp3/Response$Builder;

    .line 109
    :cond_8
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    return-object p1
.end method

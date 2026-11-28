.class public final Lnicoid/network238/AuthenticatedWrite241;
.super Ljava/lang/Object;
.source "AuthenticatedWrite241.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/AuthenticatedWrite241$SingleSend;,
        Lnicoid/network238/AuthenticatedWrite241$OneShotBody;,
        Lnicoid/network238/AuthenticatedWrite241$Shared;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static allowed(Lnicoid/network238/okhttp3/HttpUrl;Z)Z
    .registers 6

    invoke-static {p0, p1}, Lnicoid/network238/EndpointScope259;->historyDelete(Lnicoid/network238/okhttp3/HttpUrl;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 22
    :cond_0
    invoke-static {p0}, Lnicoid/network238/AuthenticatedGet240;->followEndpoint(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    return v1

    .line 23
    :cond_1
    invoke-static {p0}, Lnicoid/network238/AuthenticatedGet240;->allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_2

    return v2

    .line 24
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    const-string v3, "/v1/users/me/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    return v2

    .line 25
    :cond_3
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 26
    const-string v3, "ng-comments/client"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    return v1

    .line 27
    :cond_4
    const-string v3, "watch/history"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    if-nez p1, :cond_5

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->querySize()I

    move-result p1

    if-ne p1, v1, :cond_5

    const-string p1, "target"

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl;->queryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl;->queryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "[A-Za-z0-9]+"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_0

    :cond_5
    move v1, v2

    :goto_0
    return v1

    .line 28
    :cond_6
    if-eqz p1, :cond_8

    const-string p0, "mylists"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    const-string p0, "mylists/[0-9]+/items"

    invoke-virtual {v0, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_7

    const-string p0, "deflist/items/[A-Za-z0-9]+"

    invoke-virtual {v0, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_7

    const-string p0, "copy-mylist-items"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    const-string p0, "move-mylist-items"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    move v1, v2

    :cond_7
    return v1

    .line 29
    :cond_8
    const-string p0, "mylists/[0-9]+(?:/items)?"

    invoke-virtual {v0, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_9

    const-string p0, "deflist/items"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    move v1, v2

    :cond_9
    return v1
.end method

.method static builder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 4

    .line 45
    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>()V

    const-wide/16 v1, 0x32c8

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide/16 v1, 0x2710

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Lnicoid/network238/okhttp3/Authenticator;->NONE:Lnicoid/network238/okhttp3/Authenticator;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->authenticator(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    sget-object v1, Lnicoid/network238/okhttp3/Authenticator;->NONE:Lnicoid/network238/okhttp3/Authenticator;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->proxyAuthenticator(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    new-instance v1, Lnicoid/network238/AuthenticatedWrite241$SingleSend;

    invoke-direct {v1}, Lnicoid/network238/AuthenticatedWrite241$SingleSend;-><init>()V

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->addNetworkInterceptor(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    return-object v0
.end method

.method public static delete(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;
    .registers 4

    .line 72
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p1}, Lnicoid/network238/AuthenticatedWrite241;->send(Ljava/lang/String;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0
.end method

.method static execute(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/OkHttpClient;",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            "Z",
            "Ljava/util/List<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lorg/apache/http/client/CookieStore;",
            ")",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    if-eqz p4, :cond_b

    invoke-static {p1, p2}, Lnicoid/network238/AuthenticatedWrite241;->allowed(Lnicoid/network238/okhttp3/HttpUrl;Z)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 56
    invoke-static {p1, p2, p3}, Lnicoid/network238/AuthenticatedWrite241;->request(Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    invoke-static {p4, p1}, Lnicoid/network238/AuthenticatedGet240;->matching(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/Cookie;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_0

    const-string v2, "; "

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x3d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_2

    const-string v0, "Cookie"

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, v0, p3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 59
    :cond_2
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    .line 60
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p2

    invoke-static {p4, p1, p2}, Lnicoid/network238/AuthenticatedGet240;->save(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    .line 61
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object p1

    sget-object p2, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    const/4 p3, 0x2

    const/4 p4, 0x1

    if-ne p1, p2, :cond_3

    move p1, p3

    goto :goto_1

    :cond_3
    move p1, p4

    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object p2

    sget-object v0, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    const/4 v1, 0x0

    if-eq p2, v0, :cond_4

    if-ne p1, p3, :cond_5

    :cond_4
    move p4, v1

    .line 62
    :cond_5
    new-instance p2, Lorg/apache/http/message/BasicHttpResponse;

    new-instance p3, Lorg/apache/http/ProtocolVersion;

    const-string v0, "HTTP"

    invoke-direct {p3, v0, p1, p4}, Lorg/apache/http/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result p1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object p4

    invoke-direct {p2, p3, p1, p4}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 63
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ResponseBody;->bytes()[B

    move-result-object p1

    new-instance p3, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {p3, p1}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .line 64
    const-string p4, "Content-Type"

    invoke-virtual {p0, p4}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    if-eqz p4, :cond_6

    invoke-virtual {p3, p4}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 65
    :cond_6
    invoke-virtual {p2, p3}, Lorg/apache/http/message/BasicHttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 66
    nop

    :goto_2
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p3

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string p4, "Content-Length"

    if-ge v1, p3, :cond_8

    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p3

    invoke-virtual {p3, v1}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_7

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p4

    invoke-virtual {p4, v1}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p4}, Lorg/apache/http/message/BasicHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 67
    :cond_8
    array-length p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p4, p1}, Lorg/apache/http/message/BasicHttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    nop

    .line 69
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 68
    :cond_9
    return-object p2

    .line 59
    :catchall_0
    move-exception p1

    if-eqz p0, :cond_a

    :try_start_2
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_3
    throw p1

    .line 55
    :cond_b
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Mutation outside allowed scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static post(Ljava/lang/String;Ljava/util/List;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lorg/apache/http/client/CookieStore;",
            ")",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .line 71
    const/4 v0, 0x1

    invoke-static {p0, v0, p1, p2}, Lnicoid/network238/AuthenticatedWrite241;->send(Ljava/lang/String;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0
.end method

.method static request(Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    const-class v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Ljava/lang/Class;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    .line 49
    const-string v0, "User-Agent"

    const-string v1, "Windows"

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    const-string v0, "X-Frontend-Id"

    const-string v1, "6"

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    const-string v0, "X-Frontend-Version"

    const-string v1, "0"

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    const-string v0, "X-Request-With"

    const-string v1, "https://www.nicovideo.jp"

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    .line 50
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    const/4 p1, 0x0

    new-array p1, p1, [B

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->encodeLegacyForm(Ljava/util/List;)[B

    move-result-object p1

    :goto_0
    new-instance v1, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;

    if-eqz p2, :cond_1

    const-string p2, "application/x-www-form-urlencoded; charset=UTF-8"

    invoke-static {p2}, Lnicoid/network238/okhttp3/MediaType;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    :cond_1
    invoke-direct {v1, p1, v0}, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;-><init>([BLnicoid/network238/okhttp3/MediaType;)V

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->post(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    goto :goto_1

    .line 51
    :cond_2
    const-string p1, "DELETE"

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 52
    :goto_1
    return-object p0
.end method

.method private static send(Ljava/lang/String;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lorg/apache/http/client/CookieStore;",
            ")",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .line 74
    const-string v0, "nicoid-network241"

    :try_start_0
    sget-object v1, Lnicoid/network238/AuthenticatedWrite241$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-static {p0}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p0

    invoke-static {v1, p0, p1, p2, p3}, Lnicoid/network238/AuthenticatedWrite241;->execute(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p1, :cond_0

    const-string p1, "POST"

    goto :goto_0

    :cond_0
    const-string p1, "DELETE"

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " HTTP "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p2

    invoke-interface {p2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 75
    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "mutation failed: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public static supports(Ljava/lang/String;Z)Z
    .registers 2

    .line 29
    if-eqz p0, :cond_0

    invoke-static {p0}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p0

    invoke-static {p0, p1}, Lnicoid/network238/AuthenticatedWrite241;->allowed(Lnicoid/network238/okhttp3/HttpUrl;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

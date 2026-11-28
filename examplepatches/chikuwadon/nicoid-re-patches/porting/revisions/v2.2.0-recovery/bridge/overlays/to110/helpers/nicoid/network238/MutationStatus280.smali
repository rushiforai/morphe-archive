.class public final Lnicoid/network238/MutationStatus280;
.super Ljava/lang/Object;
.source "MutationStatus280.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static delete(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Integer;
    .registers 4

    .line 14
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lnicoid/network238/MutationStatus280;->status(Landroid/content/Context;Ljava/lang/String;ZLjava/util/List;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static deleteExplicit(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;
    .registers 5

    .line 16
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Lnicoid/network238/MutationStatus280;->status(Landroid/content/Context;Ljava/lang/String;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method static encodeNg(Ljava/lang/String;Ljava/lang/String;)[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "source="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "&type="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p1, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method private static exchange(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Request$Builder;Lorg/apache/http/client/CookieStore;)I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p3, p1}, Lnicoid/network238/AuthenticatedGet240;->matching(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okhttp3/Cookie;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    const-string v3, "; "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_2

    const-string v1, "Cookie"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v1, v0}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 53
    :cond_2
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    .line 54
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p2

    invoke-static {p3, p1, p2}, Lnicoid/network238/AuthenticatedGet240;->save(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    .line 55
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result p1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/ResponseBody;->bytes()[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    nop

    .line 57
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 56
    :cond_3
    return p1

    .line 53
    :catchall_0
    move-exception p1

    if-eqz p0, :cond_4

    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_1
    throw p1
.end method

.method static execute(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    if-eqz p4, :cond_0

    invoke-static {p1, p2}, Lnicoid/network238/AuthenticatedWrite241;->allowed(Lnicoid/network238/okhttp3/HttpUrl;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    invoke-static {p1, p2, p3}, Lnicoid/network238/AuthenticatedWrite241;->request(Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p2

    .line 48
    invoke-static {p0, p1, p2, p4}, Lnicoid/network238/MutationStatus280;->exchange(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Request$Builder;Lorg/apache/http/client/CookieStore;)I

    move-result p0

    return p0

    .line 46
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Mutation outside allowed scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static post(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;)Ljava/lang/Integer;
    .registers 4

    .line 13
    const/4 v0, 0x1

    invoke-static {p0, p1, v0, p2}, Lnicoid/network238/MutationStatus280;->status(Landroid/content/Context;Ljava/lang/String;ZLjava/util/List;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static postExplicit(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;
    .registers 5

    .line 15
    const/4 v0, 0x1

    invoke-static {p0, p1, v0, p2, p3}, Lnicoid/network238/MutationStatus280;->status(Landroid/content/Context;Ljava/lang/String;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static postNg(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;
    .registers 9

    .line 18
    if-nez p4, :cond_0

    invoke-static {p0}, Le/e/a/v0;->h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;

    move-result-object p4

    .line 19
    :cond_0
    const/4 p0, 0x0

    if-nez p4, :cond_1

    return-object p0

    .line 20
    :cond_1
    invoke-static {p1}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    .line 21
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nvapi.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/v1/users/me/ng-comments/client"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lnicoid/network238/AuthenticatedWrite241;->allowed(Lnicoid/network238/okhttp3/HttpUrl;Z)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 23
    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    .line 24
    sget-object p0, Lnicoid/network238/AuthenticatedWrite241$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-static {p0, p1, p2, p3, p4}, Lnicoid/network238/MutationStatus280;->sendNg(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 23
    :cond_2
    sget-object p0, Lnicoid/network238/AuthenticatedWrite241$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    const/4 v1, 0x2

    new-array v1, v1, [Lorg/apache/http/message/BasicNameValuePair;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "source"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p2, 0x0

    aput-object v2, v1, p2

    new-instance p2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "type"

    invoke-direct {p2, v2, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object p2, v1, v0

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-static {p0, p1, v0, p2, p4}, Lnicoid/network238/MutationStatus280;->send(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 21
    :cond_3
    return-object p0
.end method

.method static send(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;
    .registers 8

    .line 41
    const-string v0, "nicoid-network241"

    const/4 v1, 0x0

    if-eqz p4, :cond_1

    invoke-static {p1, p2}, Lnicoid/network238/AuthenticatedWrite241;->allowed(Lnicoid/network238/okhttp3/HttpUrl;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 42
    :try_start_0
    invoke-static {p0, p1, p2, p3, p4}, Lnicoid/network238/MutationStatus280;->execute(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)I

    move-result p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p2, :cond_0

    const-string p2, "POST"

    goto :goto_0

    :cond_0
    const-string p2, "DELETE"

    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " HTTP "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 43
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

    return-object v1

    .line 41
    :cond_1
    return-object v1
.end method

.method static sendNg(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;
    .registers 10

    .line 30
    const-string v0, "nicoid-network241"

    const/4 v1, 0x0

    if-eqz p4, :cond_0

    const/4 v2, 0x1

    invoke-static {p1, v2}, Lnicoid/network238/AuthenticatedWrite241;->allowed(Lnicoid/network238/okhttp3/HttpUrl;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/v1/users/me/ng-comments/client"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 31
    :try_start_0
    invoke-static {p1, v2, v1}, Lnicoid/network238/AuthenticatedWrite241;->request(Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v2

    new-instance v3, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;

    invoke-static {p2, p3}, Lnicoid/network238/MutationStatus280;->encodeNg(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object p2

    const-string p3, "application/x-www-form-urlencoded; charset=UTF-8"

    invoke-static {p3}, Lnicoid/network238/okhttp3/MediaType;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object p3

    invoke-direct {v3, p2, p3}, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;-><init>([BLnicoid/network238/okhttp3/MediaType;)V

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Request$Builder;->post(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    invoke-static {p0, p1, v2, p4}, Lnicoid/network238/MutationStatus280;->exchange(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Request$Builder;Lorg/apache/http/client/CookieStore;)I

    move-result p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "POST HTTP "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 32
    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    :goto_0
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

    return-object v1

    .line 30
    :cond_0
    return-object v1
.end method

.method private static status(Landroid/content/Context;Ljava/lang/String;ZLjava/util/List;)Ljava/lang/Integer;
    .registers 5

    .line 34
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lnicoid/network238/MutationStatus280;->status(Landroid/content/Context;Ljava/lang/String;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method private static status(Landroid/content/Context;Ljava/lang/String;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;
    .registers 5

    .line 36
    if-nez p4, :cond_0

    invoke-static {p0}, Le/e/a/v0;->h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;

    move-result-object p4

    .line 37
    :cond_0
    if-nez p4, :cond_1

    const/4 p0, 0x0

    return-object p0

    .line 38
    :cond_1
    sget-object p0, Lnicoid/network238/AuthenticatedWrite241$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-static {p1}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-static {p0, p1, p2, p3, p4}, Lnicoid/network238/MutationStatus280;->send(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;ZLjava/util/List;Lorg/apache/http/client/CookieStore;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

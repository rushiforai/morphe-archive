.class public final Lnicoid/network238/AuthenticatedGet240;
.super Ljava/lang/Object;
.source "AuthenticatedGet240.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/AuthenticatedGet240$PathOrder;,
        Lnicoid/network238/AuthenticatedGet240$Shared;
    }
.end annotation


# static fields
.field private static final HOST:Ljava/lang/String; = "nvapi.nicovideo.jp"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    invoke-static {p0}, Lnicoid/network238/EndpointScope260;->read(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    invoke-static {p0}, Lnicoid/network238/EndpointScope259;->read(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v0

    .line 22
    :cond_1
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "nvapi.nicovideo.jp"

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_2

    .line 23
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 24
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/v1/users/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    .line 22
    :goto_0
    return p0
.end method

.method private static cookieScope(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 2

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->pageScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 31
    :cond_0
    invoke-static {p0}, Lnicoid/network238/AuthenticatedGet240;->allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lnicoid/network238/AuthenticatedGet240;->followEndpoint(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x0

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    :goto_0
    return p0
.end method

.method static execute(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;)Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xa

    if-gt v0, v1, :cond_a

    .line 87
    invoke-static {p1}, Lnicoid/network238/AuthenticatedGet240;->allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    const-string v2, "Redirect outside authenticated GET scope"

    if-eqz v1, :cond_9

    .line 88
    new-instance v1, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    const-string v3, "X-Frontend-Id"

    const-string v4, "6"

    invoke-virtual {v1, v3, v4}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    .line 89
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    invoke-static {p2, p1}, Lnicoid/network238/AuthenticatedGet240;->matching(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnicoid/network238/okhttp3/Cookie;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_0

    const-string v6, "; "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x3d

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 91
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_2

    const-string v4, "Cookie"

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v4, v3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 92
    :cond_2
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v1

    .line 93
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v3

    invoke-static {p2, p1, v3}, Lnicoid/network238/AuthenticatedGet240;->save(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    .line 94
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v3

    const-string v4, "Location"

    invoke-virtual {v1, v4}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 95
    if-eqz v4, :cond_6

    const/16 v5, 0x12d

    if-eq v3, v5, :cond_3

    const/16 v5, 0x12e

    if-eq v3, v5, :cond_3

    const/16 v5, 0x12f

    if-eq v3, v5, :cond_3

    const/16 v5, 0x133

    if-eq v3, v5, :cond_3

    const/16 v5, 0x134

    if-ne v3, v5, :cond_6

    .line 96
    :cond_3
    invoke-virtual {p1, v4}, Lnicoid/network238/okhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/AuthenticatedGet240;->allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_5

    .line 97
    nop

    .line 100
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 86
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 96
    :cond_5
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 99
    :cond_6
    new-instance p0, Ljava/lang/String;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ResponseBody;->bytes()[B

    move-result-object p1

    sget-object p2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, p2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 99
    :cond_7
    return-object p0

    .line 92
    :catchall_0
    move-exception p0

    if-eqz v1, :cond_8

    :try_start_2
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    :goto_2
    throw p0

    .line 87
    :cond_9
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 102
    :cond_a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Too many redirects"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static followEndpoint(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    .line 27
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "user-follow-api.nicovideo.jp"

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_0

    .line 28
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 29
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/v1/user/followees/niconico-users/[0-9]+[.]json"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 27
    :goto_0
    return p0
.end method

.method static matching(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/util/List;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/CookieStore;",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Cookie;",
            ">;"
        }
    .end annotation

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Lnicoid/network238/AuthenticatedGet240;->cookieScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    .line 40
    :cond_0
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 41
    monitor-enter p0

    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/cookie/Cookie;

    .line 43
    if-eqz v2, :cond_1

    invoke-interface {v2, v1}, Lorg/apache/http/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-interface {v2}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lnicoid/network238/AuthenticatedGet240;->safeName(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Lorg/apache/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lnicoid/network238/AuthenticatedGet240;->safeValue(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    :try_start_1
    move-object v3, p1

    invoke-interface {v2}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2}, Lorg/apache/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2}, Lorg/apache/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    instance-of v9, v2, Lorg/apache/http/cookie/ClientCookie;

    if-eqz v9, :cond_2

    move-object v9, v2

    check-cast v9, Lorg/apache/http/cookie/ClientCookie;

    const-string v10, "domain"

    invoke-interface {v9, v10}, Lorg/apache/http/cookie/ClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v8

    :cond_2
    invoke-interface {v2}, Lorg/apache/http/cookie/Cookie;->isSecure()Z

    move-result v9

    invoke-interface {v2}, Lorg/apache/http/cookie/Cookie;->getExpiryDate()Ljava/util/Date;

    move-result-object v10

    invoke-static/range {v3 .. v10}, Lnicoid/network238/CookiePolicy278;->match(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/util/Date;)Lnicoid/network238/okhttp3/Cookie;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    :cond_3
    :goto_1
    goto/16 :goto_0

    .line 57
    :cond_4
    new-instance p0, Lnicoid/network238/AuthenticatedGet240$PathOrder;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lnicoid/network238/AuthenticatedGet240$PathOrder;-><init>(Lnicoid/network238/AuthenticatedGet240$1;)V

    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 58
    return-object v0

    .line 41
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_2
.end method

.method static safeName(Ljava/lang/String;)Z
    .registers 2

    .line 26
    if-eqz p0, :cond_0

    const-string v0, "[!#$%&\'*+.^_`|~0-9A-Za-z-]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static safeValue(Ljava/lang/String;)Z
    .registers 5

    .line 28
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 29
    :cond_0
    move v1, v0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x21

    if-lt v2, v3, :cond_1

    const/16 v3, 0x7e

    if-gt v2, v3, :cond_1

    const/16 v3, 0x22

    if-eq v2, v3, :cond_1

    const/16 v3, 0x2c

    if-eq v2, v3, :cond_1

    const/16 v3, 0x3b

    if-eq v2, v3, :cond_1

    const/16 v3, 0x5c

    if-eq v2, v3, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0

    .line 30
    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method static save(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V
    .registers 11

    .line 62
    invoke-static {p1}, Lnicoid/network238/AuthenticatedGet240;->cookieScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 63
    :cond_0
    invoke-static {p1, p2}, Lnicoid/network238/okhttp3/Cookie;->parseAll(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/Cookie;

    .line 64
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/AuthenticatedGet240;->safeName(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/AuthenticatedGet240;->safeValue(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "nicovideo.jp"

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 65
    :cond_2
    new-instance v1, Lorg/apache/http/impl/cookie/BasicClientCookie;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->hostOnly()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setDomain(Ljava/lang/String;)V

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setPath(Ljava/lang/String;)V

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->secure()Z

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setSecure(Z)V

    .line 67
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->hostOnly()Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "domain"

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    const-string v2, "path"

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->secure()Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v2, "secure"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->httpOnly()Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "httponly"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    :cond_6
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->persistent()Z

    move-result v2

    if-eqz v2, :cond_7

    new-instance v2, Ljava/util/Date;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->expiresAt()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setExpiryDate(Ljava/util/Date;)V

    .line 72
    :cond_7
    monitor-enter p0

    .line 73
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/cookie/Cookie;

    .line 74
    invoke-interface {v3}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Lorg/apache/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 75
    if-eqz v4, :cond_8

    invoke-interface {v3}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object v6

    if-eqz v5, :cond_9

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_a

    :cond_9
    const-string v5, "/"

    :cond_a
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 76
    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 77
    :cond_b
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_c

    goto :goto_2

    .line 78
    :cond_c
    new-instance v4, Lorg/apache/http/impl/cookie/BasicClientCookie;

    invoke-interface {v3}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-direct {v4, v5, v6}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    invoke-interface {v3}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setDomain(Ljava/lang/String;)V

    invoke-interface {v3}, Lorg/apache/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setPath(Ljava/lang/String;)V

    new-instance v3, Ljava/util/Date;

    const-wide/16 v5, 0x0

    invoke-direct {v3, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v3}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setExpiryDate(Ljava/util/Date;)V

    invoke-interface {p0, v4}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    .line 80
    goto :goto_2

    .line 81
    :cond_d
    invoke-interface {p0, v1}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    .line 82
    monitor-exit p0

    .line 83
    goto/16 :goto_0

    .line 82
    :goto_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_3

    .line 84
    :cond_e
    return-void
.end method

.method public static tryGet(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/String;
    .registers 5

    .line 80
    const-string v0, "nicoid-network240"

    const/4 v1, 0x0

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 81
    invoke-static {p0}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p0

    invoke-static {p0}, Lnicoid/network238/AuthenticatedGet240;->allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    .line 83
    :cond_0
    :try_start_0
    sget-object v1, Lnicoid/network238/AuthenticatedGet240$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-static {v1, p0, p1}, Lnicoid/network238/AuthenticatedGet240;->execute(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "authenticated GET completed"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "authenticated GET failed: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

    const-string p0, ""

    return-object p0

    .line 80
    :cond_1
    return-object v1
.end method

.class public final Lnicoid/network238/LegacyGet258;
.super Ljava/lang/Object;
.source "LegacyGet258.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/LegacyGet258$Shared;
    }
.end annotation


# static fields
.field private static final DOWNLOADS:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/util/ArrayDeque<",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Response;",
            ">;>;>;"
        }
    .end annotation
.end field

.field static final MAX:I = 0x800000


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 240
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lnicoid/network238/LegacyGet258;->DOWNLOADS:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beginDownload()V
    .registers 2

    .line 241
    sget-object v0, Lnicoid/network238/LegacyGet258;->DOWNLOADS:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayDeque;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    sget-object v1, Lnicoid/network238/LegacyGet258;->DOWNLOADS:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    return-void
.end method

.method private static checkHistoryRC3(Lorg/apache/http/HttpResponse;)Z
    .registers 7

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    if-eqz v2, :cond_1

    :try_start_0
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lnicoid/network238/LegacyGet258;->readBounded(Ljava/io/InputStream;J)[B

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    invoke-static {v3}, Lnicoid/network238/LegacyGet258;->validHistoryRC3([B)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v2, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v2, v3}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Lorg/apache/http/Header;)V

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/http/entity/ByteArrayEntity;->setContentEncoding(Lorg/apache/http/Header;)V

    invoke-interface {p0, v2}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    :cond_1
    return v0

    :catchall_0
    move-exception v1

    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    if-eq v1, v2, :cond_2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v1
.end method

.method static dmcCookieHeader(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;
    .registers 15

    .line 296
    const/4 v0, 0x0

    if-eqz p0, :cond_12

    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->sessionScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 297
    new-instance v1, Ljava/util/TreeMap;

    invoke-static {}, Ljava/util/Collections;->reverseOrder()Ljava/util/Comparator;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 298
    monitor-enter p0

    :try_start_0
    invoke-interface {p0}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v5, 0x0

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/http/cookie/Cookie;

    .line 299
    if-nez v6, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {v6}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_e

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_e

    .line 300
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 301
    :cond_1
    const-string v9, "api.dmc.nico"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    const-string v9, "api.dmc.nico"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    goto :goto_0

    .line 302
    :cond_2
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-class v9, Lorg/apache/http/impl/cookie/BasicClientCookie;

    if-ne v8, v9, :cond_d

    const-string v8, "api.dmc.nico"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, ".dmc.nico"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, ".api.dmc.nico"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 303
    :cond_3
    move-object v7, v6

    check-cast v7, Lorg/apache/http/impl/cookie/BasicClientCookie;

    .line 304
    invoke-virtual {v7}, Lorg/apache/http/impl/cookie/BasicClientCookie;->getVersion()I

    move-result v8

    if-nez v8, :cond_c

    const-string v8, "port"

    invoke-virtual {v7, v8}, Lorg/apache/http/impl/cookie/BasicClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_c

    const-string v8, "version"

    invoke-virtual {v7, v8}, Lorg/apache/http/impl/cookie/BasicClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c

    .line 305
    invoke-interface {v6}, Lorg/apache/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object v7

    .line 306
    if-eqz v7, :cond_b

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    const-string v8, "/api"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    const-string v8, "/api/sessions"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    const-string v8, "/api/sessions/[A-Za-z0-9_-]{1,256}"

    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 307
    :cond_4
    invoke-interface {v6, v3}, Lorg/apache/http/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v8

    if-eqz v8, :cond_5

    goto/16 :goto_0

    .line 308
    :cond_5
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_6

    goto/16 :goto_0

    .line 309
    :cond_6
    invoke-interface {v6}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6}, Lorg/apache/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v8}, Lnicoid/network238/CookiePolicy278;->safeName(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-static {v6}, Lnicoid/network238/CookiePolicy278;->safeValue(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v2, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 310
    int-to-long v9, v5

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    int-to-long v11, v11

    add-long/2addr v9, v11

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    int-to-long v11, v11

    add-long/2addr v9, v11

    const-wide/16 v11, 0x3

    add-long/2addr v9, v11

    const-wide/16 v11, 0x4000

    cmp-long v9, v9, v11

    if-lez v9, :cond_7

    monitor-exit p0

    return-object v0

    .line 311
    :cond_7
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v10

    add-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x3

    add-int/2addr v5, v9

    .line 312
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/StringBuilder;

    if-nez v9, :cond_8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7, v9}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    :cond_8
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_9

    const-string v7, "; "

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_9
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x3d

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    goto/16 :goto_0

    .line 309
    :cond_a
    monitor-exit p0

    return-object v0

    .line 306
    :cond_b
    monitor-exit p0

    return-object v0

    .line 304
    :cond_c
    monitor-exit p0

    return-object v0

    .line 302
    :cond_d
    monitor-exit p0

    return-object v0

    .line 299
    :cond_e
    monitor-exit p0

    return-object v0

    .line 314
    :cond_f
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_10

    const-string v1, "; "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_10
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 296
    :cond_12
    return-object v0
.end method

.method static downloadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 4

    .line 243
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    const/16 v2, 0x1bb

    if-ne v1, v2, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 244
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const-string v2, "delivery.domand.nicovideo.jp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "/"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ".m3u8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const-string v2, "smile[0-9]*\\.nicovideo\\.jp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "/smile"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "/smile/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0

    .line 243
    :cond_3
    return v0
.end method

.method static eligible(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    .line 48
    invoke-static {p0}, Lnicoid/network238/EndpointScope260;->read(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lnicoid/network238/EndpointScope259;->read(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v1, "nvapi.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

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

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/v1/users/(?:me|[0-9]+)/(?:mylists(?:/[0-9]+(?:/items)?)?|watch-later)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    :cond_0
    const/4 p0, 0x0

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    :goto_0
    return p0
.end method

.method static encodeLegacyForm(Ljava/util/List;)[B
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "UTF-8"

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 36
    check-cast v1, Lorg/apache/http/NameValuePair;

    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_0

    const/16 v3, 0x26

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 38
    :cond_0
    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 39
    invoke-interface {v1}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    :cond_1
    goto :goto_0

    .line 41
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method public static endDownload()V
    .registers 2

    .line 242
    sget-object v0, Lnicoid/network238/LegacyGet258;->DOWNLOADS:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayDeque;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lnicoid/network238/LegacyGet258;->DOWNLOADS:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/Response;

    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-static {p1, v0}, Lnicoid/network238/LegacyGet258;->prepare(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    const/4 v2, 0x0

    if-nez p2, :cond_0

    move-object v3, v2

    goto :goto_0

    :cond_0
    const-string v3, "http.cookie-store"

    invoke-interface {p2, v3}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 61
    :goto_0
    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "org.apache.http.impl.client.DefaultHttpClient"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 62
    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->publicThumb(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v6

    if-eqz v6, :cond_1

    if-nez v3, :cond_1

    const-string p0, "general public-thumb okhttp"

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-static {p0, v1, v0, v2, v5}, Lnicoid/network238/LegacyGet258;->sendPage(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;Z)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0

    .line 63
    :cond_1
    instance-of v6, v3, Lorg/apache/http/client/CookieStore;

    if-eqz v6, :cond_3

    .line 64
    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->pageScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v6

    if-eqz v6, :cond_2

    const-string p0, "general page okhttp"

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    check-cast v3, Lorg/apache/http/client/CookieStore;

    invoke-static {p0, v1, v0, v3, v4}, Lnicoid/network238/LegacyGet258;->sendPage(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;Z)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0

    .line 65
    :cond_2
    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->eligible(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string p0, "general api okhttp"

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    check-cast v3, Lorg/apache/http/client/CookieStore;

    invoke-static {p0, v1, v0, v3}, Lnicoid/network238/LegacyGet258;->send(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0

    .line 68
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    const-string v7, "http.protocol.cookie-policy"

    const-string v8, "best-match"

    if-ne v1, v6, :cond_5

    instance-of v1, v3, Lorg/apache/http/client/CookieStore;

    if-eqz v1, :cond_5

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->sessionScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 69
    move-object v1, p0

    check-cast v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    invoke-interface {v1, v7}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 70
    if-eqz v1, :cond_4

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    move-object v1, v3

    check-cast v1, Lorg/apache/http/client/CookieStore;

    invoke-static {p1, v0, v1}, Lnicoid/network238/LegacyGet258;->prepareSession(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v6

    if-eqz v6, :cond_5

    const-string p0, "general dmc okhttp"

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->SESSION:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-static {p0, v6, v0, v1}, Lnicoid/network238/LegacyGet258;->sendSession(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0

    .line 72
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    if-ne v1, v6, :cond_e

    instance-of v1, v3, Lorg/apache/http/client/CookieStore;

    if-eqz v1, :cond_e

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->legacyCommentScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 73
    move-object v1, p0

    check-cast v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    invoke-interface {v6, v7}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v7

    const-string v9, "http.connection.timeout"

    invoke-interface {v7, v9}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v9

    const-string v10, "http.socket.timeout"

    invoke-interface {v9, v10}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 74
    const/16 v10, 0x4650

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    move v10, v5

    goto :goto_1

    :cond_6
    move v10, v4

    :goto_1
    const/16 v11, 0x32c8

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    const/16 v7, 0x2710

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7, v9}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    move v4, v5

    .line 75
    :cond_7
    if-eqz v6, :cond_8

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    :cond_8
    if-nez v10, :cond_a

    if-nez v4, :cond_a

    :cond_9
    goto :goto_5

    .line 76
    :cond_a
    invoke-static {p1, v0}, Lnicoid/network238/LegacyGet258;->prepareLegacyComment(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    if-eqz v0, :cond_b

    :try_start_0
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieSpecs()Lorg/apache/http/cookie/CookieSpecRegistry;

    move-result-object v4

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    invoke-virtual {v4, v8, v1}, Lorg/apache/http/cookie/CookieSpecRegistry;->getCookieSpec(Ljava/lang/String;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    .line 77
    :cond_b
    :goto_2
    if-eqz v0, :cond_e

    if-eqz v2, :cond_e

    if-eqz v10, :cond_c

    const-string p0, "general comment-read okhttp"

    goto :goto_3

    :cond_c
    const-string p0, "general comment-post okhttp"

    :goto_3
    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    if-eqz v10, :cond_d

    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->COMMENT_READ:Lnicoid/network238/okhttp3/OkHttpClient;

    goto :goto_4

    :cond_d
    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->SESSION:Lnicoid/network238/okhttp3/OkHttpClient;

    :goto_4
    check-cast v3, Lorg/apache/http/client/CookieStore;

    invoke-static {p0, v0, v3, v2}, Lnicoid/network238/LegacyGet258;->sendLegacyComment(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0

    .line 80
    :cond_e
    :goto_5
    const-string v0, "general apache-fallback"

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    invoke-static {p0, p1, p2}, Lnicoid/network238/LegacyGet258;->fallback(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0
.end method

.method public static executeDownload(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 259
    sget-object v0, Lnicoid/network238/LegacyGet258;->DOWNLOADS:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-static {p1, v1}, Lnicoid/network238/LegacyGet258;->prepareDownload(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    .line 260
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "org.apache.http.impl.client.DefaultHttpClient"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 261
    const-string p0, "download okhttp"

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->DOWNLOAD:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {p0, v1, p1, v0}, Lnicoid/network238/LegacyGet258;->sendDownload(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/methods/HttpUriRequest;Ljava/util/List;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0

    .line 260
    :cond_0
    const-string v0, "download apache-fallback"

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    invoke-interface {p0, p1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0
.end method

.method public static executeHistoryRC3(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 8

    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->historyScopeRC3(Lorg/apache/http/client/methods/HttpUriRequest;)Z

    move-result v0

    invoke-static {p0, p1, p2}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    if-eqz v0, :cond_1

    invoke-static {v1}, Lnicoid/network238/LegacyGet258;->checkHistoryRC3(Lorg/apache/http/HttpResponse;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v2, "nicoid-listRC3"

    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v3, "Invalid history JSON; retrying GET once"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1, p2}, Lnicoid/network238/LegacyGet258;->execute(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/LegacyGet258;->checkHistoryRC3(Lorg/apache/http/HttpResponse;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v3, 0xc8

    if-ne v0, v3, :cond_1

    const-string v3, "History GET retry validated"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string v3, "History response rejected (payload omitted)"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x1f6

    invoke-interface {v1, v0}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    const-string v0, "Invalid history response"

    invoke-interface {v1, v0}, Lorg/apache/http/HttpResponse;->setReasonPhrase(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    :cond_1
    :goto_0
    return-object v1
.end method

.method public static executeLegacyRead(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    const/4 v1, 0x0

    if-nez p2, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    const-string v2, "http.cookie-store"

    invoke-interface {p2, v2}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 131
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    if-ne v3, v4, :cond_5

    instance-of v3, v2, Lorg/apache/http/client/CookieStore;

    if-eqz v3, :cond_5

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->legacyReadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 132
    move-object v3, p0

    check-cast v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v4

    const-string v5, "http.protocol.cookie-policy"

    invoke-interface {v4, v5}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    const-string v6, "http.useragent"

    invoke-interface {v5, v6}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 133
    const-string v6, "best-match"

    if-eqz v4, :cond_1

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    if-eqz v5, :cond_3

    instance-of v4, v5, Ljava/lang/String;

    if-nez v4, :cond_3

    :cond_2
    goto :goto_2

    .line 134
    :cond_3
    check-cast v5, Ljava/lang/String;

    invoke-static {p1, v0, v5}, Lnicoid/network238/LegacyGet258;->prepareLegacyRead(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request;

    move-result-object v4

    .line 135
    if-eqz v4, :cond_4

    :try_start_0
    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieSpecs()Lorg/apache/http/cookie/CookieSpecRegistry;

    move-result-object v5

    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    invoke-virtual {v5, v6, v3}, Lorg/apache/http/cookie/CookieSpecRegistry;->getCookieSpec(Ljava/lang/String;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    .line 136
    :cond_4
    :goto_1
    if-eqz v4, :cond_5

    if-eqz v1, :cond_5

    const-string p0, "okhttp-https"

    invoke-static {v0, p0}, Lnicoid/network238/LegacyGet258;->logLegacyRead(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)V

    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    check-cast v2, Lorg/apache/http/client/CookieStore;

    invoke-static {p0, v4, v2, v1}, Lnicoid/network238/LegacyGet258;->sendLegacyRead(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0

    .line 139
    :cond_5
    :goto_2
    const-string v1, "apache-fallback"

    invoke-static {v0, v1}, Lnicoid/network238/LegacyGet258;->logLegacyRead(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)V

    invoke-static {p0, p1, p2}, Lnicoid/network238/LegacyGet258;->fallback(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0
.end method

.method public static executeLogin(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    if-ne v0, v1, :cond_2

    .line 183
    move-object v0, p0

    check-cast v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    const/4 v1, 0x0

    if-nez p2, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    const-string v2, "http.cookie-store"

    invoke-interface {p2, v2}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    :goto_0
    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v3

    .line 184
    if-eqz v3, :cond_2

    if-eqz v2, :cond_1

    if-ne v2, v3, :cond_2

    :cond_1
    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    const-string v4, "http.protocol.cookie-policy"

    invoke-interface {v2, v4}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "lenient"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    const-string v5, "http.useragent"

    invoke-interface {v2, v5}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v5, "Windows"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 185
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v2

    invoke-static {p1, v2}, Lnicoid/network238/LegacyGet258;->prepareLogin(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request;

    move-result-object v2

    .line 186
    if-eqz v2, :cond_2

    :try_start_0
    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getCookieSpecs()Lorg/apache/http/cookie/CookieSpecRegistry;

    move-result-object v5

    invoke-virtual {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    invoke-virtual {v5, v4, v0}, Lorg/apache/http/cookie/CookieSpecRegistry;->getCookieSpec(Ljava/lang/String;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/cookie/CookieSpec;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 187
    :goto_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v4, "e.e.a.v0$l"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "login okhttp"

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    sget-object p0, Lnicoid/network238/LegacyGet258$Shared;->SESSION:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-static {p0, v2, v3, v1}, Lnicoid/network238/LegacyGet258;->sendLogin(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0

    .line 191
    :cond_2
    const-string v0, "login apache-fallback"

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->logRoute(Ljava/lang/String;)V

    invoke-static {p0, p1, p2}, Lnicoid/network238/LegacyGet258;->fallback(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0
.end method

.method private static fallback(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    invoke-interface {p0, p1, p2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    return-object p0
.end method

.method static historyScopeRC3(Lorg/apache/http/client/methods/HttpUriRequest;)Z
    .registers 4

    const/4 v0, 0x0

    const-string v1, "GET"

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okhttp3/HttpUrl;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/LegacyGet258;->eligible(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/v2/users/me/watch/history"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_0
    return v0
.end method

.method static legacyCommentScope(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 4

    .line 146
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    const/16 v2, 0x1bb

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    const-string v2, "nvcomment.nicovideo.jp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 147
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const-string v1, "/legacy/api/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/legacy/api"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/legacy/api.json/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "/legacy/api.json"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 146
    :cond_1
    return v0
.end method

.method static legacyReadKind(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;
    .registers 3

    .line 87
    if-nez p0, :cond_0

    const-string p0, "unknown"

    return-object p0

    .line 88
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    .line 89
    const-string v1, "flapi.nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 90
    const-string v1, "/api/getthreadkey"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p0, "threadkey"

    return-object p0

    .line 91
    :cond_1
    const-string v1, "/api/getpostkey"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string p0, "postkey"

    return-object p0

    .line 92
    :cond_2
    const-string v1, "/api/getflv/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string p0, "getflv"

    return-object p0

    .line 94
    :cond_3
    const-string v1, "sp.nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string p0, "old-watch"

    return-object p0

    .line 95
    :cond_4
    const-string v1, "ext.nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "/thumb_watch/"

    invoke-virtual {v0, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "thumb-watch"

    return-object p0

    .line 96
    :cond_5
    const-string p0, "other"

    return-object p0
.end method

.method static legacyReadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 7

    .line 99
    const/4 v0, 0x0

    if-eqz p0, :cond_b

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    const/16 v2, 0x1bb

    if-ne v1, v2, :cond_b

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_b

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x1000

    if-gt v1, v2, :cond_b

    .line 100
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object v2

    .line 101
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v3

    const-string v4, "flapi.nicovideo.jp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_5

    .line 102
    const-string v3, "/api/getthreadkey"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    if-eqz v2, :cond_0

    const-string p0, "thread=[0-9]{1,20}"

    invoke-virtual {v2, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    move v0, v4

    :cond_0
    return v0

    .line 103
    :cond_1
    const-string v3, "/api/getpostkey"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    if-eqz v2, :cond_2

    const-string p0, "block_no=[0-9]{1,20}&thread=[0-9]{1,20}&device=1&version=1&yugi=&version_sub=2"

    invoke-virtual {v2, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    move v0, v4

    :cond_2
    return v0

    .line 104
    :cond_3
    const-string v3, "/api/getflv/(?:[a-z]{2})?[0-9]{1,20}"

    invoke-virtual {v1, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    if-eqz v2, :cond_4

    const-string p0, "watch_harmful=2(?:&watch_auth_key=[A-Za-z0-9_%.-]{1,512})?(?:&as3=1)?"

    invoke-virtual {v2, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4

    goto :goto_0

    :cond_4
    move v0, v4

    :goto_0
    return v0

    .line 106
    :cond_5
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v3

    const-string v5, "sp.nicovideo.jp"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    const-string p0, "/watch/(?:[a-z]{2})?[0-9]{1,20}"

    invoke-virtual {v1, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_7

    if-eqz v2, :cond_6

    const-string p0, "watch_harmful=2"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7

    :cond_6
    move v0, v4

    :cond_7
    return v0

    .line 107
    :cond_8
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    const-string v3, "ext.nicovideo.jp"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a

    const-string p0, "/thumb_watch/(?:[a-z]{2})?[0-9]{1,20}"

    invoke-virtual {v1, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9

    if-eqz v2, :cond_9

    const-string p0, "watch_harmful=2&k=[A-Za-z0-9_%.-]{1,512}(?:&as3=1)?"

    invoke-virtual {v2, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9

    move v0, v4

    :cond_9
    return v0

    .line 108
    :cond_a
    return v0

    .line 99
    :cond_b
    return v0
.end method

.method static legacyScopedCookies(Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lnicoid/network238/okhttp3/Request;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 197
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->legacyReadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->legacyCommentScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    const-string v0, "Cookie"

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    const-string v1, "Authorization"

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 198
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-static {p1, p2, v1}, Lnicoid/network238/LegacyGet258;->ordinaryLegacyCookieHeader(Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v1

    .line 199
    if-nez v1, :cond_1

    invoke-static {p0, p1, p2}, Lnicoid/network238/LegacyGet258;->loginCookies(Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    return-object p0

    .line 200
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    :cond_2
    return-object p0

    .line 197
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "legacy cookie outside scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static logLegacyRead(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)V
    .registers 5

    .line 127
    :try_start_0
    const-string v0, "nicoid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "legacy-read "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->legacyReadKind(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 128
    :goto_0
    return-void
.end method

.method public static logListErrorRC3(Ljava/lang/Throwable;)V
    .registers 3

    instance-of v0, p0, Lorg/json/JSONException;

    if-eqz v0, :cond_0

    const-string v0, "nicoid-listRC3"

    const-string v1, "List JSON parse failed (payload omitted)"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method private static logRoute(Ljava/lang/String;)V
    .registers 4

    .line 141
    :try_start_0
    const-string v0, "nicoid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "legacy-transport "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void
.end method

.method static loginCookies(Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lnicoid/network238/okhttp3/Request;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 220
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->loginOrigin(Lnicoid/network238/okhttp3/HttpUrl;)Lorg/apache/http/cookie/CookieOrigin;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 221
    monitor-enter p1

    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/cookie/Cookie;

    if-eqz v4, :cond_0

    invoke-interface {v4, v2}, Lorg/apache/http/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-interface {p2, v4, v0}, Lorg/apache/http/cookie/CookieSpec;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    const-string p1, "Cookie"

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3

    invoke-interface {p2, v1}, Lorg/apache/http/cookie/CookieSpec;->formatCookies(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/apache/http/Header;

    const-string v0, "Cookie"

    invoke-interface {p2}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :try_start_1
    invoke-interface {p2}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v0, p2}, Lnicoid/network238/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    new-instance p0, Ljava/io/IOException;

    const-string p1, "invalid login cookie header"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "unexpected login cookie header"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    return-object p0

    .line 221
    :goto_2
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_2
.end method

.method static loginOrigin(Lnicoid/network238/okhttp3/HttpUrl;)Lorg/apache/http/cookie/CookieOrigin;
    .registers 5

    .line 218
    new-instance v0, Lorg/apache/http/cookie/CookieOrigin;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, p0, v3}, Lorg/apache/http/cookie/CookieOrigin;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    return-object v0
.end method

.method static loginRedirect(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 5

    .line 169
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    const/16 v2, 0x1bb

    if-ne v1, v2, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 170
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    const-string v3, "account.nicovideo.jp"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "/"

    if-eqz v2, :cond_0

    const-string v2, "/login"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "/mfa"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "/mfa/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    const-string v2, "www.nicovideo.jp"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "/my"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "/my/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "/my/top"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0

    .line 169
    :cond_3
    return v0
.end method

.method static loginScope(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    .line 167
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v1, "account.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

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

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/api/v1/login"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "site=niconico"

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static mfaScope(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    .line 168
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v1, "account.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

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

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/mfa(?:/[A-Za-z0-9_-]+)*/?"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/16 v0, 0x1000

    if-gt p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static ordinaryLegacyCookieHeader(Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;
    .registers 13

    .line 203
    const/4 v0, 0x0

    if-eqz p0, :cond_7

    if-eqz p1, :cond_7

    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->legacyReadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->legacyCommentScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-eqz v1, :cond_7

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "org.apache.http.impl.cookie.BestMatchSpec"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 204
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    const-string v2, ""

    .line 205
    monitor-enter p0

    :try_start_0
    invoke-interface {p0}, Lorg/apache/http/client/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/cookie/Cookie;

    .line 206
    if-eqz v4, :cond_1

    invoke-interface {v4, v1}, Lorg/apache/http/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 208
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-class v5, Lorg/apache/http/impl/cookie/BasicClientCookie;

    if-ne v2, v5, :cond_5

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v2, "/"

    invoke-interface {v4}, Lorg/apache/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 209
    move-object v2, v4

    check-cast v2, Lorg/apache/http/impl/cookie/BasicClientCookie;

    .line 210
    invoke-virtual {v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->getVersion()I

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "version"

    invoke-virtual {v2, v5}, Lorg/apache/http/impl/cookie/BasicClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "port"

    invoke-virtual {v2, v5}, Lorg/apache/http/impl/cookie/BasicClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "domain"

    invoke-virtual {v2, v5}, Lorg/apache/http/impl/cookie/BasicClientCookie;->containsAttribute(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 211
    invoke-interface {v4}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4}, Lorg/apache/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 212
    invoke-static {v2}, Lnicoid/network238/CookiePolicy278;->safeName(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-static {v5}, Lnicoid/network238/CookiePolicy278;->safeValue(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    int-to-long v8, v8

    add-long/2addr v6, v8

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    const-wide/16 v8, 0x4000

    cmp-long v6, v6, v8

    if-gtz v6, :cond_3

    .line 214
    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->loginOrigin(Lnicoid/network238/okhttp3/HttpUrl;)Lorg/apache/http/cookie/CookieOrigin;

    move-result-object v6

    invoke-interface {p1, v4, v6}, Lorg/apache/http/cookie/CookieSpec;->match(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)Z

    move-result v4

    if-nez v4, :cond_2

    monitor-exit p0

    return-object v0

    .line 215
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 216
    goto/16 :goto_0

    .line 212
    :cond_3
    monitor-exit p0

    return-object v0

    .line 210
    :cond_4
    monitor-exit p0

    return-object v0

    .line 208
    :cond_5
    monitor-exit p0

    return-object v0

    .line 216
    :cond_6
    monitor-exit p0

    return-object v2

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 203
    :cond_7
    return-object v0
.end method

.method static pageScope(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 5

    .line 51
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    const/16 v2, 0x1bb

    if-ne v1, v2, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 52
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    .line 53
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    const-string v3, "www.nicovideo.jp"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    const-string p0, "/watch/(?:[a-z]{2})?[0-9]+"

    invoke-virtual {v1, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "/my"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "/my/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "/my/top"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "/api/recommendations"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    return v0

    .line 54
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p0

    const-string v2, "public.api.nicovideo.jp"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const-string p0, "/v1/timelines/nicorepo/last-1-month/my/pc/entries.json"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    move v0, v3

    :cond_2
    return v0

    .line 51
    :cond_3
    return v0
.end method

.method static prepare(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 9

    .line 58
    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->eligible(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->pageScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->publicThumb(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    const-string v0, "GET"

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object p0

    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, p0, v3

    invoke-interface {v4}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "x-frontend-id"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "x-frontend-version"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "accept-language"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "accept"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "user-agent"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    :cond_1
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    :try_start_0
    invoke-interface {v4}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v5, v4}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_2
    return-object p1

    :cond_3
    :goto_1
    return-object v1
.end method

.method static prepareDownload(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request;
    .registers 11

    .line 245
    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->downloadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, "GET"

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 246
    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 247
    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object p0

    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    const-string v4, "identity"

    if-ge v3, v2, :cond_8

    aget-object v5, p0, v3

    invoke-interface {v5}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    if-eqz v7, :cond_7

    .line 248
    const-string v8, "cookie"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v6, 0x4000

    if-le v4, v6, :cond_4

    return-object v1

    .line 249
    :cond_0
    const-string v8, "connection"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const-string v4, "keep-alive"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    return-object v1

    .line 250
    :cond_1
    const-string v8, "accept-encoding"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const-string v5, "gzip,deflate"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    return-object v1

    .line 251
    :cond_2
    const-string v4, "accept"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v4, "*/*"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    return-object v1

    .line 252
    :cond_3
    const-string v4, "range"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v4, "bytes=[0-9]{1,18}-"

    invoke-virtual {v7, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    return-object v1

    .line 254
    :cond_4
    :try_start_0
    invoke-interface {v5}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4, v7}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 254
    :catch_0
    move-exception p0

    return-object v1

    .line 253
    :cond_6
    return-object v1

    .line 247
    :cond_7
    return-object v1

    .line 256
    :cond_8
    const-string p0, "Accept-Encoding"

    invoke-virtual {p1, p0, v4}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    return-object p0

    .line 245
    :cond_9
    return-object v1
.end method

.method static prepareLegacyComment(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->legacyCommentScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "POST"

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    instance-of v0, p0, Lorg/apache/http/client/methods/HttpPost;

    if-eqz v0, :cond_e

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_e

    .line 151
    check-cast p0, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpPost;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p0

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "org.apache.http.entity.StringEntity"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_d

    .line 152
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v2

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v0

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_c

    const-wide/32 v4, 0x100000

    cmp-long v4, v2, v4

    if-gtz v4, :cond_c

    if-eqz v0, :cond_c

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_c

    .line 153
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/MediaType;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/MediaType;->type()Ljava/lang/String;

    move-result-object v4

    const-string v5, "text"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/MediaType;->subtype()Ljava/lang/String;

    move-result-object v4

    const-string v5, "plain"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/MediaType;->charset()Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 154
    long-to-int v2, v2

    new-array v3, v2, [B

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object p0

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v2, :cond_1

    sub-int v6, v2, v5

    :try_start_0
    invoke-virtual {p0, v3, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    if-lez v6, :cond_0

    add-int/2addr v5, v6

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "short comment entity"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_1
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v5, -0x1

    if-ne v2, v5, :cond_9

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 155
    :cond_2
    new-instance p0, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v3, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v2

    const-string v5, "/legacy/api/"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v2

    const-string v5, "/legacy/api"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    const/4 v4, 0x1

    .line 157
    :goto_1
    if-eqz v4, :cond_7

    const-string v2, "<packet>"

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "</packet>"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    :cond_4
    const-string v2, "<thread "

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "/>"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_6

    :cond_5
    goto :goto_2

    :cond_6
    return-object v1

    .line 158
    :cond_7
    const-string v2, "["

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    const-string v2, "]"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_8

    .line 159
    :goto_2
    new-instance p0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {p0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    const-class p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    invoke-virtual {p0, p1, v1}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Ljava/lang/Class;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    new-instance p1, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;

    invoke-direct {p1, v3, v0}, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;-><init>([BLnicoid/network238/okhttp3/MediaType;)V

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->post(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    return-object p0

    .line 158
    :cond_8
    return-object v1

    .line 154
    :cond_9
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "long comment entity"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_3
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_a

    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_4
    throw p1

    .line 153
    :cond_b
    return-object v1

    .line 152
    :cond_c
    return-object v1

    .line 151
    :cond_d
    return-object v1

    .line 150
    :cond_e
    return-object v1
.end method

.method static prepareLegacyRead(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request;
    .registers 9

    .line 111
    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->legacyReadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "GET"

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 112
    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    .line 113
    if-eqz p2, :cond_1

    const-string v0, "Windows"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    const-string v0, "User-Agent"

    invoke-virtual {p1, v0, p2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 114
    :cond_1
    nop

    .line 115
    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object p0

    array-length p2, p0

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v0, p2, :cond_3

    aget-object v3, p0, v0

    .line 116
    const-string v4, "Accept-Language"

    invoke-interface {v3}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    if-nez v2, :cond_2

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 117
    :try_start_0
    invoke-interface {v3}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    add-int/lit8 v0, v0, 0x1

    const/4 v2, 0x1

    goto :goto_0

    .line 117
    :catch_0
    move-exception p0

    return-object v1

    .line 116
    :cond_2
    return-object v1

    .line 119
    :cond_3
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    return-object p0

    .line 111
    :cond_4
    return-object v1
.end method

.method static prepareLogin(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->mfaScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->loginScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    if-eqz v0, :cond_10

    :cond_0
    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v1

    if-nez v1, :cond_10

    const-string v1, "POST"

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    instance-of v1, p0, Lorg/apache/http/client/methods/HttpPost;

    if-eqz v1, :cond_10

    .line 173
    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    const-string v3, "ja-jp"

    const-string v4, "Accept-Language"

    const/4 v5, 0x0

    if-eqz v0, :cond_1

    array-length v1, v1

    if-eqz v1, :cond_2

    goto/16 :goto_4

    :cond_1
    array-length v6, v1

    const/4 v7, 0x1

    if-ne v6, v7, :cond_f

    aget-object v6, v1, v5

    invoke-interface {v6}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_f

    aget-object v1, v1, v5

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 174
    :cond_2
    check-cast p0, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpPost;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p0

    if-eqz p0, :cond_e

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v6, "org.apache.http.client.entity.UrlEncodedFormEntity"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v1

    if-nez v1, :cond_e

    .line 175
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v1

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v6

    if-eqz v1, :cond_d

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_d

    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_d

    const-wide/32 v8, 0x10000

    cmp-long v8, v6, v8

    if-gtz v8, :cond_d

    .line 176
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okhttp3/MediaType;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v1

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/MediaType;->type()Ljava/lang/String;

    move-result-object v8

    const-string v9, "application"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/MediaType;->subtype()Ljava/lang/String;

    move-result-object v8

    const-string v9, "x-www-form-urlencoded"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    sget-object v8, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/MediaType;->charset()Ljava/nio/charset/Charset;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 177
    long-to-int v6, v6

    new-array v7, v6, [B

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object p0

    :goto_0
    if-ge v5, v6, :cond_4

    sub-int v8, v6, v5

    :try_start_0
    invoke-virtual {p0, v7, v5, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v8

    if-lez v8, :cond_3

    add-int/2addr v5, v8

    goto :goto_0

    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "short login entity"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :cond_4
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v6, -0x1

    if-ne v5, v6, :cond_a

    if-eqz p0, :cond_5

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 178
    :cond_5
    new-instance p0, Ljava/lang/String;

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v7, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    if-eqz v0, :cond_6

    const-string v5, "otp=[0-9]{4,10}&is_mfa_trusted_device=true&device_name=[^&]*"

    invoke-virtual {p0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_7

    goto :goto_1

    :cond_6
    const-string v5, "mail_tel=[^&]+&password=[^&]+"

    invoke-virtual {p0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_8

    :cond_7
    return-object v2

    .line 179
    :cond_8
    :goto_1
    new-instance p0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {p0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    const-string p1, "User-Agent"

    const-string v2, "Windows"

    invoke-virtual {p0, p1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    const-class p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    invoke-virtual {p0, p1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Ljava/lang/Class;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    new-instance p1, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;

    invoke-direct {p1, v7, v1}, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;-><init>([BLnicoid/network238/okhttp3/MediaType;)V

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->post(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    if-nez v0, :cond_9

    invoke-virtual {p0, v4, v3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    :cond_9
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    return-object p0

    .line 177
    :cond_a
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "long login entity"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_2
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_b

    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_b
    :goto_3
    throw p1

    .line 176
    :cond_c
    return-object v2

    .line 175
    :cond_d
    return-object v2

    .line 174
    :cond_e
    return-object v2

    .line 173
    :cond_f
    :goto_4
    return-object v2

    .line 172
    :cond_10
    return-object v2
.end method

.method static prepareSession(Lorg/apache/http/client/methods/HttpUriRequest;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 317
    invoke-static {p1}, Lnicoid/network238/LegacyGet258;->sessionScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v0

    if-nez v0, :cond_a

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_a

    invoke-static {p2, p1}, Lnicoid/network238/LegacyGet258;->dmcCookieHeader(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_a

    .line 318
    new-instance p2, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {p2}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {p2, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    const-class p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    invoke-virtual {p1, p2, v0}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Ljava/lang/Class;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    .line 319
    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object p2

    const-string v0, "OPTIONS"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    return-object p0

    .line 320
    :cond_0
    const-string p2, "POST"

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_9

    instance-of p2, p0, Lorg/apache/http/client/methods/HttpPost;

    if-eqz p2, :cond_9

    .line 321
    check-cast p0, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpPost;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object p0

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    const-string v0, "org.apache.http.entity.StringEntity"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object p2

    if-nez p2, :cond_8

    .line 322
    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v2

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object p2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_7

    const-wide/32 v4, 0x100000

    cmp-long v0, v2, v4

    if-gtz v0, :cond_7

    if-eqz p2, :cond_7

    invoke-interface {p2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 323
    invoke-interface {p2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lnicoid/network238/okhttp3/MediaType;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object p2

    if-eqz p2, :cond_6

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/MediaType;->type()Ljava/lang/String;

    move-result-object v0

    const-string v4, "text"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/MediaType;->subtype()Ljava/lang/String;

    move-result-object v0

    const-string v4, "plain"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/MediaType;->charset()Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 324
    long-to-int v0, v2

    new-array v1, v0, [B

    invoke-interface {p0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    sub-int v3, v0, v2

    :try_start_0
    invoke-virtual {p0, v1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    if-lez v3, :cond_1

    add-int/2addr v2, v3

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "short DMC entity"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_4

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 325
    :cond_3
    new-instance p0, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;

    invoke-direct {p0, v1, p2}, Lnicoid/network238/AuthenticatedWrite241$OneShotBody;-><init>([BLnicoid/network238/okhttp3/MediaType;)V

    invoke-virtual {p1, p0}, Lnicoid/network238/okhttp3/Request$Builder;->post(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    return-object p0

    .line 324
    :cond_4
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "long DMC entity"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_5

    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_2
    throw p1

    .line 323
    :cond_6
    return-object v1

    .line 322
    :cond_7
    return-object v1

    .line 321
    :cond_8
    return-object v1

    .line 320
    :cond_9
    return-object v1

    .line 317
    :cond_a
    return-object v1
.end method

.method static publicThumb(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    .line 57
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ext.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x1bb

    goto :goto_0

    :cond_0
    const/16 v1, 0x50

    :goto_0
    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->query()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/api/getthumbinfo/(?:[a-z]{2})?[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method static readBounded(Ljava/io/InputStream;J)[B
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 372
    const-wide/32 v0, 0x800000

    cmp-long v0, p1, v0

    const-string v1, "legacy GET body too large"

    if-gtz v0, :cond_7

    .line 373
    const-wide/16 v2, -0x1

    cmp-long v0, p1, v2

    if-ltz v0, :cond_6

    .line 374
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    const/16 v3, 0x2000

    if-ltz v2, :cond_0

    const-wide/16 v4, 0x2000

    invoke-static {p1, p2, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v4, v4

    goto :goto_0

    :cond_0
    move v4, v3

    :goto_0
    invoke-direct {v0, v4}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 375
    new-array v4, v3, [B

    .line 376
    :goto_1
    invoke-virtual {p0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_4

    .line 377
    if-lez v5, :cond_3

    if-gt v5, v3, :cond_3

    .line 378
    const/high16 v6, 0x800000

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    sub-int/2addr v6, v7

    if-gt v5, v6, :cond_2

    .line 379
    if-ltz v2, :cond_1

    int-to-long v6, v5

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v8

    int-to-long v8, v8

    sub-long v8, p1, v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_1

    new-instance p0, Ljava/io/IOException;

    const-string p1, "legacy GET body exceeds declared length"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 380
    :cond_1
    const/4 v6, 0x0

    invoke-virtual {v0, v4, v6, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 378
    :cond_2
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 377
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "legacy GET body made no progress or invalid read"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 382
    :cond_4
    if-ltz v2, :cond_5

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    int-to-long v1, p0

    cmp-long p0, v1, p1

    if-eqz p0, :cond_5

    new-instance p0, Ljava/io/IOException;

    const-string p1, "legacy GET body shorter than declared length"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 383
    :cond_5
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    .line 373
    :cond_6
    new-instance p0, Ljava/io/IOException;

    const-string p1, "invalid legacy GET body length"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 372
    :cond_7
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static response(Lnicoid/network238/okhttp3/Response;)Lorg/apache/http/HttpResponse;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 386
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object v0

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object v1

    sget-object v4, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_0:Lnicoid/network238/okhttp3/Protocol;

    const/4 v5, 0x0

    if-eq v1, v4, :cond_1

    if-eq v0, v2, :cond_1

    goto :goto_1

    :cond_1
    move v3, v5

    .line 387
    :goto_1
    new-instance v1, Lorg/apache/http/message/BasicHttpResponse;

    new-instance v2, Lorg/apache/http/ProtocolVersion;

    const-string v4, "HTTP"

    invoke-direct {v2, v4, v0, v3}, Lorg/apache/http/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 388
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    if-nez v0, :cond_2

    new-array v0, v5, [B

    goto :goto_2

    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lnicoid/network238/LegacyGet258;->readBounded(Ljava/io/InputStream;J)[B

    move-result-object v0

    .line 389
    :goto_2
    nop

    :goto_3
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v2

    const-string v3, "Content-Length"

    if-ge v5, v2, :cond_4

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v2

    invoke-virtual {v2, v5}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "Transfer-Encoding"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v3

    invoke-virtual {v3, v5}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/message/BasicHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 390
    :cond_4
    new-instance v2, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v2, v0}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    const-string v4, "Content-Type"

    invoke-virtual {p0, v4}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Content-Encoding"

    invoke-virtual {p0, v5}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz v4, :cond_5

    invoke-virtual {v2, v4}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    :cond_5
    if-eqz p0, :cond_6

    invoke-virtual {v2, p0}, Lorg/apache/http/entity/ByteArrayEntity;->setContentEncoding(Ljava/lang/String;)V

    :cond_6
    invoke-virtual {v1, v2}, Lorg/apache/http/message/BasicHttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    array-length p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, v3, p0}, Lorg/apache/http/message/BasicHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method static saveLoginCookies(Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V
    .registers 7

    .line 224
    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->loginOrigin(Lnicoid/network238/okhttp3/HttpUrl;)Lorg/apache/http/cookie/CookieOrigin;

    move-result-object p2

    const-string v0, "Set-Cookie"

    invoke-virtual {p3, v0}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_0
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :try_start_0
    new-instance v1, Lorg/apache/http/message/BasicHeader;

    const-string v2, "Set-Cookie"

    invoke-direct {v1, v2, v0}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v1, p2}, Lorg/apache/http/cookie/CookieSpec;->parse(Lorg/apache/http/Header;Lorg/apache/http/cookie/CookieOrigin;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/cookie/Cookie;
    :try_end_0
    .catch Lorg/apache/http/cookie/MalformedCookieException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-interface {p1, v1, p2}, Lorg/apache/http/cookie/CookieSpec;->validate(Lorg/apache/http/cookie/Cookie;Lorg/apache/http/cookie/CookieOrigin;)V

    monitor-enter p0
    :try_end_1
    .catch Lorg/apache/http/cookie/MalformedCookieException; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    invoke-interface {p0, v1}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    monitor-exit p0

    goto :goto_1

    :goto_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catch Lorg/apache/http/cookie/MalformedCookieException; {:try_start_3 .. :try_end_3} :catch_0

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0

    :cond_1
    return-void
.end method

.method static saveSessionCookies(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V
    .registers 7

    .line 328
    invoke-static {p1, p2}, Lnicoid/network238/okhttp3/Cookie;->parseAll(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnicoid/network238/okhttp3/Cookie;

    .line 329
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v0

    const-string v1, "api.dmc.nico"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v0

    const-string v1, "dmc.nico"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 330
    :cond_0
    new-instance v0, Lorg/apache/http/impl/cookie/BasicClientCookie;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->hostOnly()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setDomain(Ljava/lang/String;)V

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setPath(Ljava/lang/String;)V

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->secure()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setSecure(Z)V

    .line 331
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->hostOnly()Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "domain"

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    const-string v1, "path"

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->persistent()Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Ljava/util/Date;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Cookie;->expiresAt()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setExpiryDate(Ljava/util/Date;)V

    .line 332
    :cond_3
    monitor-enter p0

    :try_start_0
    invoke-interface {p0, v0}, Lorg/apache/http/client/CookieStore;->addCookie(Lorg/apache/http/cookie/Cookie;)V

    monitor-exit p0

    .line 333
    goto/16 :goto_0

    .line 332
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 334
    :cond_4
    return-void
.end method

.method static send(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 342
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->eligible(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-eqz v1, :cond_5

    if-eqz p3, :cond_5

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {p2, v1}, Lnicoid/network238/okhttp3/HttpUrl;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "GET"

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "Cookie"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_5

    const-string v2, "Authorization"

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5

    .line 343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p3, p2}, Lnicoid/network238/AuthenticatedGet240;->matching(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/Cookie;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_0

    const-string v4, "; "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 344
    :cond_2
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    .line 345
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    invoke-static {p3, p2, p1}, Lnicoid/network238/AuthenticatedGet240;->save(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    .line 346
    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->response(Lnicoid/network238/okhttp3/Response;)Lorg/apache/http/HttpResponse;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 347
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 346
    :cond_3
    return-object p1

    .line 344
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

    .line 342
    :cond_5
    new-instance p0, Ljava/io/IOException;

    const-string p1, "legacy GET outside scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sendDownload(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/methods/HttpUriRequest;Ljava/util/List;)Lorg/apache/http/HttpResponse;
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/OkHttpClient;",
            "Lnicoid/network238/okhttp3/Request;",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Response;",
            ">;)",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 274
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->downloadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-interface/range {p2 .. p2}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v0

    if-nez v0, :cond_e

    .line 275
    invoke-virtual/range {p0 .. p1}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CacheControl110;->request(Ljava/lang/Object;)V

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v1

    .line 276
    :try_start_0
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->isCanceled()Z

    move-result p0

    if-nez p0, :cond_d

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    if-eqz p0, :cond_c

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v2

    const-string v0, "Content-Encoding"

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 277
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_b

    if-eqz v0, :cond_0

    const-string v4, "identity"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 278
    :cond_0
    invoke-static {v1, v2, v3}, Lnicoid/network238/LegacyGet258;->validateMediaHeaders(Lnicoid/network238/okhttp3/Response;J)V

    .line 279
    const-string v4, "Range"

    invoke-virtual {p1, v4}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v5, "Content-Range"

    const/4 v6, 0x1

    if-nez v4, :cond_2

    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v4

    const/16 v7, 0xc8

    if-ne v4, v7, :cond_1

    invoke-virtual {v1, v5}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    goto :goto_0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "unexpected media status"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 280
    :cond_2
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v7

    const/16 v8, 0xce

    if-ne v7, v8, :cond_a

    invoke-virtual {v1, v5}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "bytes ([0-9]{1,18})-([0-9]{1,18})/([0-9]{1,18})"

    invoke-static {v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    if-nez v5, :cond_3

    const-string v5, ""

    :cond_3
    invoke-virtual {v7, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    const/4 v9, 0x2

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    const/4 v11, 0x3

    invoke-virtual {v5, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v6

    const/4 v13, 0x6

    invoke-virtual {v4, v13, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v4, v7, v4

    if-nez v4, :cond_8

    cmp-long v4, v9, v7

    if-ltz v4, :cond_8

    cmp-long v4, v9, v11

    if-gez v4, :cond_8

    sub-long v4, v9, v7

    const-wide/16 v7, 0x1

    add-long/2addr v4, v7

    cmp-long v4, v4, v2

    if-nez v4, :cond_8

    sub-long/2addr v11, v7

    cmp-long v4, v9, v11

    if-nez v4, :cond_8

    .line 281
    :goto_0
    new-instance v4, Lorg/apache/http/message/BasicHttpResponse;

    new-instance v5, Lorg/apache/http/ProtocolVersion;

    const-string v7, "HTTP"

    invoke-direct {v5, v7, v6, v6}, Lorg/apache/http/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v6

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 282
    const/4 v5, 0x0

    :goto_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v7, "Content-Length"

    if-ge v5, v6, :cond_5

    :try_start_2
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v6

    invoke-virtual {v6, v5}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v6

    const-string v8, "Transfer-Encoding"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_4

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string v7, "Connection"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v7

    invoke-virtual {v7, v5}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/apache/http/message/BasicHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 283
    :cond_5
    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v7, v5}, Lorg/apache/http/message/BasicHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Lorg/apache/http/entity/BasicHttpEntity;

    invoke-direct {v5}, Lorg/apache/http/entity/BasicHttpEntity;-><init>()V

    invoke-virtual {v5, v2, v3}, Lorg/apache/http/entity/BasicHttpEntity;->setContentLength(J)V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object p0

    invoke-virtual {v5, p0}, Lorg/apache/http/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    const-string p0, "Content-Type"

    invoke-virtual {v1, p0}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_6

    invoke-virtual {v5, p0}, Lorg/apache/http/entity/BasicHttpEntity;->setContentType(Ljava/lang/String;)V

    :cond_6
    if-eqz v0, :cond_7

    invoke-virtual {v5, v0}, Lorg/apache/http/entity/BasicHttpEntity;->setContentEncoding(Ljava/lang/String;)V

    :cond_7
    invoke-virtual {v4, v5}, Lorg/apache/http/message/BasicHttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    move-object/from16 p0, p3

    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 284
    nop

    .line 283
    return-object v4

    .line 280
    :cond_8
    new-instance p0, Ljava/io/IOException;

    const-string v0, "inconsistent Content-Range"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :cond_9
    new-instance p0, Ljava/io/IOException;

    const-string v0, "invalid Content-Range"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :cond_a
    new-instance p0, Ljava/io/IOException;

    const-string v0, "range not honored"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_2
    throw p0

    .line 277
    :cond_b
    new-instance p0, Ljava/io/IOException;

    const-string v0, "invalid media length or encoding"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 276
    :cond_c
    new-instance p0, Ljava/io/IOException;

    const-string v0, "missing media body"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :cond_d
    new-instance p0, Ljava/io/IOException;

    const-string v0, "download cancelled"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_3
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 284
    :catchall_0
    move-exception v0

    move-object p0, v0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    throw p0

    .line 274
    :cond_e
    new-instance p0, Ljava/io/IOException;

    const-string v0, "download outside scope or cancelled"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sendLegacyComment(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lorg/apache/http/HttpResponse;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->legacyCommentScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "POST"

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    .line 163
    invoke-static {p1, p2, p3}, Lnicoid/network238/LegacyGet258;->legacyScopedCookies(Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    invoke-static {p2, p3, p1, v0}, Lnicoid/network238/LegacyGet258;->saveLoginCookies(Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->response(Lnicoid/network238/okhttp3/Response;)Lorg/apache/http/HttpResponse;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V

    :cond_0
    return-object p1

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_1

    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw p1

    .line 162
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "legacy comment outside scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sendLegacyRead(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lorg/apache/http/HttpResponse;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->legacyReadScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "GET"

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    if-eqz p3, :cond_2

    const-string v0, "Cookie"

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, "Authorization"

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 124
    invoke-static {p1, p2, p3}, Lnicoid/network238/LegacyGet258;->legacyScopedCookies(Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    invoke-static {p2, p3, p1, v0}, Lnicoid/network238/LegacyGet258;->saveLoginCookies(Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->response(Lnicoid/network238/okhttp3/Response;)Lorg/apache/http/HttpResponse;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V

    :cond_0
    return-object p1

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_1

    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw p1

    .line 122
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "legacy read outside scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sendLogin(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lorg/apache/http/HttpResponse;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 226
    const-string v0, "Accept-Language"

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/LegacyGet258;->loginScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/LegacyGet258;->mfaScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-eqz v1, :cond_a

    :cond_0
    const-string v1, "POST"

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    if-eqz p2, :cond_a

    if-eqz p3, :cond_a

    const-string v1, "Cookie"

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_a

    const-string v1, "Authorization"

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_a

    .line 227
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, 0x5

    if-gt v2, v3, :cond_9

    .line 228
    invoke-static {p1, p2, p3}, Lnicoid/network238/LegacyGet258;->loginCookies(Lnicoid/network238/okhttp3/Request;Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;)Lnicoid/network238/okhttp3/Request;

    move-result-object v4

    invoke-virtual {p0, v4}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v4

    invoke-interface {v4}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v4

    .line 229
    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v6

    invoke-static {p2, p3, v5, v6}, Lnicoid/network238/LegacyGet258;->saveLoginCookies(Lorg/apache/http/client/CookieStore;Lorg/apache/http/cookie/CookieSpec;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v5

    const-string v6, "Location"

    invoke-virtual {v4, v6}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 231
    const/16 v7, 0x12f

    if-eq v5, v7, :cond_2

    const-string v7, "GET"

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/16 v7, 0x12d

    if-eq v5, v7, :cond_2

    const/16 v7, 0x12e

    if-eq v5, v7, :cond_2

    const/16 v7, 0x133

    if-eq v5, v7, :cond_2

    :cond_1
    move v5, v1

    goto :goto_1

    :cond_2
    const/4 v5, 0x1

    .line 232
    :goto_1
    if-eqz v5, :cond_6

    if-eqz v6, :cond_6

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v5, v6}, Lnicoid/network238/okhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    .line 233
    invoke-static {v5}, Lnicoid/network238/LegacyGet258;->loginRedirect(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v6

    if-eqz v6, :cond_5

    if-eq v2, v3, :cond_5

    .line 234
    new-instance v3, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v3}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {v3, v5}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    const-string v5, "User-Agent"

    const-string v6, "Windows"

    invoke-virtual {v3, v5, v6}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    const-class v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v6, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    invoke-virtual {v3, v5, v6}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Ljava/lang/Class;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    :cond_3
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 227
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 233
    :cond_5
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "login redirect outside scope or limit"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 232
    :cond_6
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->response(Lnicoid/network238/okhttp3/Response;)Lorg/apache/http/HttpResponse;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 235
    if-eqz v4, :cond_7

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 232
    :cond_7
    return-object p0

    .line 228
    :catchall_0
    move-exception p0

    if-eqz v4, :cond_8

    :try_start_2
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    :goto_2
    throw p0

    .line 236
    :cond_9
    new-instance p0, Ljava/io/IOException;

    const-string p1, "login redirect limit"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 226
    :cond_a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "login outside scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sendPage(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;Z)Lorg/apache/http/HttpResponse;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 351
    const-string v0, "legacy GET outside scope"

    if-eqz p4, :cond_0

    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->publicThumb(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez p3, :cond_1

    :cond_0
    if-nez p4, :cond_2

    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->pageScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez p3, :cond_2

    :cond_1
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 352
    :cond_2
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {p2, v1}, Lnicoid/network238/okhttp3/HttpUrl;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    const-string v1, "GET"

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    const-string v1, "Cookie"

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_12

    const-string v2, "Authorization"

    invoke-virtual {p1, v2}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_12

    .line 353
    const/4 v0, 0x0

    :goto_0
    const-string v2, "legacy GET redirect limit"

    const/4 v3, 0x5

    if-gt v0, v3, :cond_11

    .line 354
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v4

    invoke-virtual {v4, p2}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v4

    invoke-virtual {v4, v1}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v4

    .line 355
    if-nez p4, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p3, p2}, Lnicoid/network238/AuthenticatedGet240;->matching(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnicoid/network238/okhttp3/Cookie;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-lez v8, :cond_3

    const-string v8, "; "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x3d

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_4
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v1, v5}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 356
    :cond_5
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v4

    invoke-virtual {p0, v4}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v4

    invoke-interface {v4}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v4

    .line 357
    if-nez p4, :cond_6

    :try_start_0
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v5

    invoke-static {p3, p2, v5}, Lnicoid/network238/AuthenticatedGet240;->save(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    .line 358
    :cond_6
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v5

    const-string v6, "Location"

    invoke-virtual {v4, v6}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 359
    const/16 v7, 0x12d

    if-eq v5, v7, :cond_7

    const/16 v7, 0x12e

    if-eq v5, v7, :cond_7

    const/16 v7, 0x12f

    if-eq v5, v7, :cond_7

    const/16 v7, 0x133

    if-eq v5, v7, :cond_7

    const/16 v7, 0x134

    if-ne v5, v7, :cond_e

    :cond_7
    if-eqz v6, :cond_e

    .line 360
    invoke-virtual {p2, v6}, Lnicoid/network238/okhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    .line 361
    if-eqz v5, :cond_c

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result p2

    if-eqz p2, :cond_c

    :cond_8
    if-eqz p4, :cond_9

    invoke-static {v5}, Lnicoid/network238/LegacyGet258;->publicThumb(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result p2

    if-eqz p2, :cond_c

    goto :goto_2

    :cond_9
    invoke-static {v5}, Lnicoid/network238/LegacyGet258;->pageScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p2, :cond_c

    .line 362
    :goto_2
    if-eq v0, v3, :cond_b

    .line 363
    nop

    .line 366
    if-eqz v4, :cond_a

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 353
    :cond_a
    add-int/lit8 v0, v0, 0x1

    move-object p2, v5

    goto/16 :goto_0

    .line 362
    :cond_b
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 361
    :cond_c
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->response(Lnicoid/network238/okhttp3/Response;)Lorg/apache/http/HttpResponse;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 366
    if-eqz v4, :cond_d

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 361
    :cond_d
    return-object p0

    .line 365
    :cond_e
    :try_start_2
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->response(Lnicoid/network238/okhttp3/Response;)Lorg/apache/http/HttpResponse;

    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 366
    if-eqz v4, :cond_f

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 365
    :cond_f
    return-object p0

    .line 356
    :catchall_0
    move-exception p0

    if-eqz v4, :cond_10

    :try_start_3
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_10
    :goto_3
    throw p0

    .line 368
    :cond_11
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 352
    :cond_12
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sendSession(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/HttpUrl;Lorg/apache/http/client/CookieStore;)Lorg/apache/http/HttpResponse;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 336
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-static {p2}, Lnicoid/network238/LegacyGet258;->sessionScope(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {p2, v0}, Lnicoid/network238/okhttp3/HttpUrl;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "Cookie"

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_5

    const-string v1, "Authorization"

    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_5

    const-string v1, "POST"

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "OPTIONS"

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 337
    :cond_0
    invoke-static {p3, p2}, Lnicoid/network238/LegacyGet258;->dmcCookieHeader(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 338
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    .line 339
    :cond_1
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object p0

    invoke-interface {p0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    invoke-static {p3, p2, p1}, Lnicoid/network238/LegacyGet258;->saveSessionCookies(Lorg/apache/http/client/CookieStore;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    invoke-static {p0}, Lnicoid/network238/LegacyGet258;->response(Lnicoid/network238/okhttp3/Response;)Lorg/apache/http/HttpResponse;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V

    :cond_2
    return-object p1

    :catchall_0
    move-exception p1

    if-eqz p0, :cond_3

    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    throw p1

    .line 337
    :cond_4
    new-instance p0, Ljava/io/IOException;

    const-string p1, "DMC cookie policy changed before send"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 336
    :cond_5
    new-instance p0, Ljava/io/IOException;

    const-string p1, "DMC outside scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sessionScope(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 4

    .line 289
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    const/16 v2, 0x1bb

    if-ne v1, v2, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    const-string v2, "api.dmc.nico"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    .line 290
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object p0

    .line 291
    const-string v2, "/api/sessions"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "_format=json"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 292
    :cond_0
    const-string v2, "/api/sessions/[A-Za-z0-9_-]{1,256}"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "_format=json&_method=PUT"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    :goto_0
    const/4 v0, 0x1

    .line 291
    :cond_1
    return v0

    .line 289
    :cond_2
    return v0
.end method

.method static validHistoryRC3([B)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, p0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v2, Lorg/json/JSONTokener;

    invoke-direct {v2, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v3, v1, Lorg/json/JSONObject;

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextClean()C

    move-result v2

    if-nez v2, :cond_0

    check-cast v1, Lorg/json/JSONObject;

    const-string v2, "data"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "items"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return v0

    :catch_0
    move-exception v1

    return v0
.end method

.method static validateMediaHeaders(Lnicoid/network238/okhttp3/Response;J)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 265
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p0

    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    const-string v1, "Content-Range"

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    const-string v2, "Content-Encoding"

    invoke-virtual {p0, v2}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    const-string v3, "Transfer-Encoding"

    invoke-virtual {p0, v3}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    .line 266
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-gt v3, v4, :cond_4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-gt v1, v4, :cond_4

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    if-gt v1, v4, :cond_4

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-gt v1, v4, :cond_4

    .line 267
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_3

    .line 268
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2

    .line 269
    const/4 p0, 0x0

    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string v0, "[0-9]{1,19}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "invalid media Content-Length"

    if-eqz v0, :cond_1

    .line 270
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    cmp-long p0, v2, p1

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "inconsistent media Content-Length"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 269
    :cond_1
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 272
    :cond_2
    :goto_0
    return-void

    .line 267
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "unexpected media transfer encoding"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 266
    :cond_4
    new-instance p0, Ljava/io/IOException;

    const-string p1, "ambiguous media headers"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

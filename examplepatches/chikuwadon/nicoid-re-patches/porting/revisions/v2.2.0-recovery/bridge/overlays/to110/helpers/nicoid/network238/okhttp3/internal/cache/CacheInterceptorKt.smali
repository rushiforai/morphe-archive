.class public final Lnicoid/network238/okhttp3/internal/cache/CacheInterceptorKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u000c\u0010\u0000\u001a\u00020\u0001*\u00020\u0001H\u0002\u00a8\u0006\u0002"
    }
    d2 = {
        "requestForCache",
        "Lnicoid/network238/okhttp3/Request;",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic access$requestForCache(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Request;
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptorKt;->requestForCache(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    return-object p0
.end method

.method private static final requestForCache(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Request;
    .registers 4

    .line 297
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->cacheUrlOverride()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 300
    sget-object v1, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->INSTANCE:Lnicoid/network238/okhttp3/internal/http/HttpMethod;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->isCacheable(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v1

    const-string v2, "POST"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 301
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    .line 302
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    .line 303
    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    .line 304
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/Request$Builder;->cacheUrlOverride(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    .line 305
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    :cond_1
    :goto_0
    return-object p0
.end method

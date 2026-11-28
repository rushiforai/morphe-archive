.class public final Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 \u000c2\u00020\u0001:\u0001\u000cB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u001a\u0010\u0008\u001a\u00020\u00052\u0008\u0010\t\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000b\u001a\u00020\u0005H\u0002\u00a8\u0006\r"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "<init>",
        "()V",
        "intercept",
        "Lnicoid/network238/okhttp3/Response;",
        "chain",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "cacheWritingResponse",
        "cacheRequest",
        "Lnicoid/network238/okhttp3/internal/cache/CacheRequest;",
        "response",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;->Companion:Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final cacheWritingResponse(Lnicoid/network238/okhttp3/internal/cache/CacheRequest;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p1, :cond_0

    return-object p2

    .line 178
    :cond_0
    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/cache/CacheRequest;->body()Lnicoid/network238/okio/Sink;

    move-result-object v0

    .line 180
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    .line 181
    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    .line 184
    new-instance v2, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;

    invoke-direct {v2, v1, p1, v0}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$cacheWritingResponse$cacheWritingSource$1;-><init>(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/internal/cache/CacheRequest;Lnicoid/network238/okio/BufferedSink;)V

    .line 230
    const-string p1, "Content-Type"

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-static {p2, p1, v1, v0, v1}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 231
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v0

    .line 233
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p2

    .line 234
    new-instance v3, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;

    invoke-static {v2}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v2

    invoke-direct {v3, p1, v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;-><init>(Ljava/lang/String;JLnicoid/network238/okio/BufferedSource;)V

    invoke-virtual {p2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->body(Lnicoid/network238/okhttp3/ResponseBody;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 235
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->call()Lnicoid/network238/okhttp3/Call;

    move-result-object v0

    .line 47
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getCache()Lnicoid/network238/okhttp3/Cache;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 48
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    # invokes: Lnicoid/network238/okhttp3/internal/cache/CacheInterceptorKt;->requestForCache(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Request;
    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptorKt;->access$requestForCache(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    invoke-virtual {v1, v3}, Lnicoid/network238/okhttp3/Cache;->get$okhttp(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, v2

    .line 50
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 52
    new-instance v6, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;

    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v7

    invoke-direct {v6, v4, v5, v7, v3}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;-><init>(JLnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->compute()Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    move-result-object v4

    .line 53
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->getNetworkRequest()Lnicoid/network238/okhttp3/Request;

    move-result-object v5

    .line 54
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->getCacheResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object v6

    if-eqz v1, :cond_1

    .line 56
    invoke-virtual {v1, v4}, Lnicoid/network238/okhttp3/Cache;->trackResponse$okhttp(Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;)V

    :cond_1
    if-eqz v3, :cond_2

    if-nez v6, :cond_2

    .line 60
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v4

    invoke-static {v4}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_2
    if-nez v5, :cond_4

    if-nez v6, :cond_3

    .line 66
    new-instance v1, Lnicoid/network238/okhttp3/Response$Builder;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/Response$Builder;-><init>()V

    .line 67
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v2

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 68
    sget-object v2, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->protocol(Lnicoid/network238/okhttp3/Protocol;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 69
    const/16 v2, 0x1f8

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->code(I)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 70
    const-string v2, "Unsatisfiable Request (only-if-cached)"

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 71
    const-wide/16 v2, -0x1

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 72
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 73
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v1

    .line 75
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getEventListener()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/EventListener;->satisfactionFailure(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    return-object v1

    .line 81
    :cond_3
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 83
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/UnreadableResponseBodyKt;->stripBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;

    move-result-object v2

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->cacheResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 84
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v1

    .line 86
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getEventListener()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/EventListener;->cacheHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    return-object v1

    :cond_4
    if-eqz v6, :cond_5

    .line 91
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getEventListener()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v4

    invoke-virtual {v4, v0, v6}, Lnicoid/network238/okhttp3/EventListener;->cacheConditionalHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    goto :goto_1

    :cond_5
    if-eqz v1, :cond_6

    .line 93
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getEventListener()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v4

    invoke-virtual {v4, v0}, Lnicoid/network238/okhttp3/EventListener;->cacheMiss(Lnicoid/network238/okhttp3/Call;)V

    .line 98
    :cond_6
    :goto_1
    :try_start_0
    invoke-interface {p1, v5}, Lnicoid/network238/okhttp3/Interceptor$Chain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_7

    if-eqz v3, :cond_7

    .line 102
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v3

    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_7
    if-eqz v6, :cond_9

    if-eqz v4, :cond_8

    .line 108
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v3

    const/16 v7, 0x130

    if-ne v3, v7, :cond_8

    .line 111
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 112
    sget-object v3, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;->Companion:Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v5

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v7

    # invokes: Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;->combine(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers;
    invoke-static {v3, v5, v7}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;->access$combine(Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 113
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->sentRequestAtMillis()J

    move-result-wide v7

    invoke-virtual {v2, v7, v8}, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 114
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->receivedResponseAtMillis()J

    move-result-wide v7

    invoke-virtual {v2, v7, v8}, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 115
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/UnreadableResponseBodyKt;->stripBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->cacheResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 116
    invoke-static {v4}, Lnicoid/network238/okhttp3/internal/UnreadableResponseBodyKt;->stripBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->networkResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 117
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v2

    .line 119
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/ResponseBody;->close()V

    .line 123
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Cache;->trackConditionalCacheHit$okhttp()V

    .line 124
    invoke-virtual {v1, v6, v2}, Lnicoid/network238/okhttp3/Cache;->update$okhttp(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Response;)V

    .line 126
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getEventListener()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Lnicoid/network238/okhttp3/EventListener;->cacheHit(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    return-object v2

    .line 129
    :cond_8
    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v3

    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 134
    :cond_9
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v3

    if-eqz v6, :cond_a

    .line 136
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/UnreadableResponseBodyKt;->stripBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;

    move-result-object v2

    goto :goto_2

    :cond_a
    nop

    :goto_2
    invoke-virtual {v3, v2}, Lnicoid/network238/okhttp3/Response$Builder;->cacheResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 137
    invoke-static {v4}, Lnicoid/network238/okhttp3/internal/UnreadableResponseBodyKt;->stripBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->networkResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 138
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v2

    if-eqz v1, :cond_d

    .line 141
    # invokes: Lnicoid/network238/okhttp3/internal/cache/CacheInterceptorKt;->requestForCache(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Request;
    invoke-static {v5}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptorKt;->access$requestForCache(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    .line 143
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->promisesBody(Lnicoid/network238/okhttp3/Response;)Z

    move-result v4

    if-eqz v4, :cond_c

    sget-object v4, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->Companion:Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;

    invoke-virtual {v4, v2, v3}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;->isCacheable(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 145
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v4

    invoke-virtual {v4, v3}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v3

    invoke-virtual {v1, v3}, Lnicoid/network238/okhttp3/Cache;->put$okhttp(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/internal/cache/CacheRequest;

    move-result-object v1

    .line 146
    invoke-direct {p0, v1, v2}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;->cacheWritingResponse(Lnicoid/network238/okhttp3/internal/cache/CacheRequest;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;

    move-result-object v1

    if-eqz v6, :cond_b

    .line 149
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getEventListener()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/EventListener;->cacheMiss(Lnicoid/network238/okhttp3/Call;)V

    :cond_b
    return-object v1

    .line 154
    :cond_c
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->invalidatesCache(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_d

    .line 156
    :try_start_1
    invoke-virtual {v1, v5}, Lnicoid/network238/okhttp3/Cache;->remove$okhttp(Lnicoid/network238/okhttp3/Request;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    :cond_d
    :goto_3
    return-object v2

    :catchall_0
    move-exception p1

    if-eqz v3, :cond_e

    .line 102
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_e
    throw p1
.end method

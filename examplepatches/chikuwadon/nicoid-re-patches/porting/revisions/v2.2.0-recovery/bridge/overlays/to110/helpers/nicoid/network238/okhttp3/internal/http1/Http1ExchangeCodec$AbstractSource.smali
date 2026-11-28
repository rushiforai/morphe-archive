.class abstract Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "AbstractSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00a2\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0008\u001a\u00020\u0012H\u0016J\u0018\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0014H\u0016J\u000e\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001bR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u00020\tX\u0084\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u001a\u0010\u000c\u001a\u00020\rX\u0084\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;",
        "Lnicoid/network238/okio/Source;",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V",
        "getUrl",
        "()Lnicoid/network238/okhttp3/HttpUrl;",
        "timeout",
        "Lnicoid/network238/okio/ForwardingTimeout;",
        "getTimeout",
        "()Lnicoid/network238/okio/ForwardingTimeout;",
        "closed",
        "",
        "getClosed",
        "()Z",
        "setClosed",
        "(Z)V",
        "Lnicoid/network238/okio/Timeout;",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "responseBodyComplete",
        "",
        "trailers",
        "Lnicoid/network238/okhttp3/Headers;",
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


# instance fields
.field private closed:Z

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

.field private final timeout:Lnicoid/network238/okio/ForwardingTimeout;

.field private final url:Lnicoid/network238/okhttp3/HttpUrl;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 388
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 389
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->url:Lnicoid/network238/okhttp3/HttpUrl;

    .line 391
    new-instance p2, Lnicoid/network238/okio/ForwardingTimeout;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object p1

    invoke-direct {p2, p1}, Lnicoid/network238/okio/ForwardingTimeout;-><init>(Lnicoid/network238/okio/Timeout;)V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    return-void
.end method


# virtual methods
.method protected final getClosed()Z
    .registers 2

    .line 392
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->closed:Z

    return v0
.end method

.method protected final getTimeout()Lnicoid/network238/okio/ForwardingTimeout;
    .registers 2

    .line 391
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    return-object v0
.end method

.method public final getUrl()Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    .line 389
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->url:Lnicoid/network238/okhttp3/HttpUrl;

    return-object v0
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 401
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p1

    :catch_0
    move-exception p1

    .line 403
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object p2

    invoke-interface {p2}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->noNewExchanges()V

    .line 404
    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getTRAILERS_RESPONSE_BODY_TRUNCATED$cp()Lnicoid/network238/okhttp3/Headers;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V

    .line 405
    throw p1
.end method

.method public final responseBodyComplete(Lnicoid/network238/okhttp3/Headers;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 413
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getState$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 414
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getState$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)I

    move-result v0

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    const/4 v3, 0x5

    if-ne v0, v3, :cond_2

    .line 416
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    # invokes: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->detachTimeout(Lnicoid/network238/okio/ForwardingTimeout;)V
    invoke-static {v2, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$detachTimeout(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okio/ForwardingTimeout;)V

    .line 418
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-static {v0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$setTrailers$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/Headers;)V

    .line 419
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$setState$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;I)V

    .line 420
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 421
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->this$0:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->client:Lnicoid/network238/okhttp3/OkHttpClient;
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getClient$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->cookieJar()Lnicoid/network238/okhttp3/CookieJar;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->url:Lnicoid/network238/okhttp3/HttpUrl;

    invoke-static {v0, v1, p1}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->receiveHeaders(Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V

    :cond_1
    :goto_0
    return-void

    .line 414
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    # getter for: Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->access$getState$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected final setClosed(Z)V
    .registers 2

    .line 392
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->closed:Z

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 394
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;->timeout:Lnicoid/network238/okio/ForwardingTimeout;

    return-object v0
.end method

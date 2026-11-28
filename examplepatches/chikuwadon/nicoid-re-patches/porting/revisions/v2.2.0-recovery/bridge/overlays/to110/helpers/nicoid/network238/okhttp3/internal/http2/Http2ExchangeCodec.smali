.class public final Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000v\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 /2\u00020\u0001:\u0001/B\'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0018\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0016J\u0010\u0010 \u001a\u00020!2\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J\u0008\u0010\"\u001a\u00020!H\u0016J\u0008\u0010#\u001a\u00020!H\u0016J\u0012\u0010$\u001a\u0004\u0018\u00010%2\u0006\u0010&\u001a\u00020\u0013H\u0016J\u0010\u0010\'\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020)H\u0016J\u0010\u0010*\u001a\u00020+2\u0006\u0010(\u001a\u00020)H\u0016J\n\u0010,\u001a\u0004\u0018\u00010-H\u0016J\u0008\u0010.\u001a\u00020!H\u0016R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0014\u001a\u00020\u00138VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0014\u0010\u0015R\u0014\u0010\u0016\u001a\u00020\u00178VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0019\u00a8\u00060"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;",
        "Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;",
        "client",
        "Lnicoid/network238/okhttp3/OkHttpClient;",
        "carrier",
        "Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;",
        "chain",
        "Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;",
        "http2Connection",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection;",
        "<init>",
        "(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)V",
        "getCarrier",
        "()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;",
        "stream",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;",
        "protocol",
        "Lnicoid/network238/okhttp3/Protocol;",
        "canceled",
        "",
        "isResponseComplete",
        "()Z",
        "socket",
        "Lnicoid/network238/okio/Socket;",
        "getSocket",
        "()Lnicoid/network238/okio/Socket;",
        "createRequestBody",
        "Lnicoid/network238/okio/Sink;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "contentLength",
        "",
        "writeRequestHeaders",
        "",
        "flushRequest",
        "finishRequest",
        "readResponseHeaders",
        "Lnicoid/network238/okhttp3/Response$Builder;",
        "expectContinue",
        "reportedContentLength",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "openResponseBodySource",
        "Lnicoid/network238/okio/Source;",
        "peekTrailers",
        "Lnicoid/network238/okhttp3/Headers;",
        "cancel",
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
.field private static final CONNECTION:Ljava/lang/String; = "connection"

.field public static final Companion:Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;

.field private static final ENCODING:Ljava/lang/String; = "encoding"

.field private static final HOST:Ljava/lang/String; = "host"

.field private static final HTTP_2_SKIPPED_REQUEST_HEADERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final HTTP_2_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final KEEP_ALIVE:Ljava/lang/String; = "keep-alive"

.field private static final PROXY_CONNECTION:Ljava/lang/String; = "proxy-connection"

.field private static final TE:Ljava/lang/String; = "te"

.field private static final TRANSFER_ENCODING:Ljava/lang/String; = "transfer-encoding"

.field private static final UPGRADE:Ljava/lang/String; = "upgrade"


# instance fields
.field private volatile canceled:Z

.field private final carrier:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

.field private final chain:Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

.field private final http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

.field private final protocol:Lnicoid/network238/okhttp3/Protocol;

.field private volatile stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;


# direct methods
.method static constructor <clinit>()V
    .registers 14

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;

    .line 153
    const-string v12, ":scheme"

    const-string v13, ":authority"

    const-string v2, "connection"

    const-string v3, "host"

    const-string v4, "keep-alive"

    const-string v5, "proxy-connection"

    const-string v6, "te"

    const-string v7, "transfer-encoding"

    const-string v8, "encoding"

    const-string v9, "upgrade"

    const-string v10, ":method"

    const-string v11, ":path"

    filled-new-array/range {v2 .. v13}, [Ljava/lang/String;

    move-result-object v0

    .line 141
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->immutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->HTTP_2_SKIPPED_REQUEST_HEADERS:Ljava/util/List;

    .line 164
    const-string v7, "encoding"

    const-string v8, "upgrade"

    const-string v1, "connection"

    const-string v2, "host"

    const-string v3, "keep-alive"

    const-string v4, "proxy-connection"

    const-string v5, "te"

    const-string v6, "transfer-encoding"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    .line 156
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->immutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->HTTP_2_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->carrier:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    .line 53
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->chain:Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    .line 54
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    .line 59
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->protocols()Ljava/util/List;

    move-result-object p1

    sget-object p2, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 62
    :cond_0
    sget-object p2, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    .line 59
    :goto_0
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->protocol:Lnicoid/network238/okhttp3/Protocol;

    return-void
.end method

.method public static final synthetic access$getHTTP_2_SKIPPED_REQUEST_HEADERS$cp()Ljava/util/List;
    .registers 1

    .line 50
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->HTTP_2_SKIPPED_REQUEST_HEADERS:Ljava/util/List;

    return-object v0
.end method

.method public static final synthetic access$getHTTP_2_SKIPPED_RESPONSE_HEADERS$cp()Ljava/util/List;
    .registers 1

    .line 50
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->HTTP_2_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public cancel()V
    .registers 3

    .line 125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->canceled:Z

    .line 126
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    if-eqz v0, :cond_0

    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->closeLater(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    :cond_0
    return-void
.end method

.method public createRequestBody(Lnicoid/network238/okhttp3/Request;J)Lnicoid/network238/okio/Sink;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object p1

    return-object p1
.end method

.method public finishRequest()V
    .registers 2

    .line 100
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSink()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSink;->close()V

    return-void
.end method

.method public flushRequest()V
    .registers 2

    .line 96
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->flush()V

    return-void
.end method

.method public getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;
    .registers 2

    .line 52
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->carrier:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    return-object v0
.end method

.method public getSocket()Lnicoid/network238/okio/Socket;
    .registers 2

    .line 72
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method public isResponseComplete()Z
    .registers 3

    .line 69
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->isSourceComplete()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public openResponseBodySource(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okio/Source;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getSource()Lnicoid/network238/okhttp3/internal/http2/Http2Stream$FramingSource;

    move-result-object p1

    return-object p1
.end method

.method public peekTrailers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 122
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->peekTrailers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    return-object v0
.end method

.method public readResponseHeaders(Z)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 5

    .line 104
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    if-eqz v0, :cond_1

    .line 105
    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->takeHeaders(Z)Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    .line 106
    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->protocol:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v1, v0, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;->readHttp2HeadersList(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Protocol;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    if-eqz p1, :cond_0

    .line 107
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response$Builder;->getCode$okhttp()I

    move-result p1

    const/16 v1, 0x64

    if-ne p1, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    return-object v0

    .line 104
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "stream wasn\'t created"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public reportedContentLength(Lnicoid/network238/okhttp3/Response;)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->promisesBody(Lnicoid/network238/okhttp3/Response;)Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 117
    :cond_0
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->headersContentLength(Lnicoid/network238/okhttp3/Response;)J

    move-result-wide v0

    return-wide v0
.end method

.method public writeRequestHeaders(Lnicoid/network238/okhttp3/Request;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    if-eqz v0, :cond_0

    return-void

    .line 82
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 83
    :goto_0
    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;->http2HeadersList(Lnicoid/network238/okhttp3/Request;)Ljava/util/List;

    move-result-object p1

    .line 84
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v1, p1, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->newStream(Ljava/util/List;Z)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    .line 87
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->canceled:Z

    .line 88
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    if-nez p1, :cond_2

    .line 91
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->readTimeout()Lnicoid/network238/okio/Timeout;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->chain:Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getReadTimeoutMillis$okhttp()I

    move-result v0

    int-to-long v0, v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 92
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->stream:Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->writeTimeout()Lnicoid/network238/okio/Timeout;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->chain:Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getWriteTimeoutMillis$okhttp()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1, v2}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    return-void

    .line 88
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->closeLater(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    .line 89
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Canceled"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

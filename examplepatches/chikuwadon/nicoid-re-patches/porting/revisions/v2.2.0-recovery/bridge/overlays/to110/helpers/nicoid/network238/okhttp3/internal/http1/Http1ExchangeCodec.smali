.class public final Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$AbstractSource;,
        Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;,
        Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;,
        Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$Companion;,
        Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;,
        Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;,
        Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u0000 D2\u00020\u0001:\u0007>?@ABCDB!\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0018\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u00162\u0006\u0010\u001f\u001a\u00020 H\u0016J\u0008\u0010!\u001a\u00020\"H\u0016J\u0010\u0010#\u001a\u00020\"2\u0006\u0010\u001e\u001a\u00020\u0016H\u0016J\u0010\u0010$\u001a\u00020 2\u0006\u0010%\u001a\u00020\u0014H\u0016J\u0010\u0010&\u001a\u00020\'2\u0006\u0010%\u001a\u00020\u0014H\u0016J\n\u0010(\u001a\u0004\u0018\u00010\u0019H\u0016J\u0008\u0010)\u001a\u00020\"H\u0016J\u0008\u0010*\u001a\u00020\"H\u0016J\u0016\u0010+\u001a\u00020\"2\u0006\u0010,\u001a\u00020\u00192\u0006\u0010-\u001a\u00020.J\u0012\u0010/\u001a\u0004\u0018\u0001002\u0006\u00101\u001a\u00020\u0013H\u0016J\u0008\u00102\u001a\u00020\u001dH\u0002J\u0008\u00103\u001a\u00020\u001dH\u0002J\u0018\u00104\u001a\u00020\'2\u0006\u00105\u001a\u0002062\u0006\u00107\u001a\u00020 H\u0002J\u0010\u00108\u001a\u00020\'2\u0006\u00105\u001a\u000206H\u0002J\u0010\u00109\u001a\u00020\'2\u0006\u00105\u001a\u000206H\u0002J\u0010\u0010:\u001a\u00020\"2\u0006\u0010;\u001a\u00020<H\u0002J\u000e\u0010=\u001a\u00020\"2\u0006\u0010%\u001a\u00020\u0014R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0014\u0010\u0006\u001a\u00020\u0007X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0018\u0010\u0012\u001a\u00020\u0013*\u00020\u00148BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0015R\u0018\u0010\u0012\u001a\u00020\u0013*\u00020\u00168BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0017R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u001a\u001a\u00020\u00138VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001a\u0010\u001b\u00a8\u0006E"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;",
        "Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;",
        "client",
        "Lnicoid/network238/okhttp3/OkHttpClient;",
        "carrier",
        "Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;",
        "socket",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "<init>",
        "(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;)V",
        "getCarrier",
        "()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;",
        "getSocket",
        "()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "state",
        "",
        "headersReader",
        "Lnicoid/network238/okhttp3/internal/http1/HeadersReader;",
        "isChunked",
        "",
        "Lnicoid/network238/okhttp3/Response;",
        "(Lnicoid/network238/okhttp3/Response;)Z",
        "Lnicoid/network238/okhttp3/Request;",
        "(Lnicoid/network238/okhttp3/Request;)Z",
        "trailers",
        "Lnicoid/network238/okhttp3/Headers;",
        "isResponseComplete",
        "()Z",
        "createRequestBody",
        "Lnicoid/network238/okio/Sink;",
        "request",
        "contentLength",
        "",
        "cancel",
        "",
        "writeRequestHeaders",
        "reportedContentLength",
        "response",
        "openResponseBodySource",
        "Lnicoid/network238/okio/Source;",
        "peekTrailers",
        "flushRequest",
        "finishRequest",
        "writeRequest",
        "headers",
        "requestLine",
        "",
        "readResponseHeaders",
        "Lnicoid/network238/okhttp3/Response$Builder;",
        "expectContinue",
        "newChunkedSink",
        "newKnownLengthSink",
        "newFixedLengthSource",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "length",
        "newChunkedSource",
        "newUnknownLengthSource",
        "detachTimeout",
        "timeout",
        "Lnicoid/network238/okio/ForwardingTimeout;",
        "skipConnectBody",
        "KnownLengthSink",
        "ChunkedSink",
        "AbstractSource",
        "FixedLengthSource",
        "ChunkedSource",
        "UnknownLengthSource",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$Companion;

.field private static final NO_CHUNK_YET:J = -0x1L

.field private static final STATE_CLOSED:I = 0x6

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_OPEN_REQUEST_BODY:I = 0x1

.field private static final STATE_OPEN_RESPONSE_BODY:I = 0x4

.field private static final STATE_READING_RESPONSE_BODY:I = 0x5

.field private static final STATE_READ_RESPONSE_HEADERS:I = 0x3

.field private static final STATE_WRITING_REQUEST_BODY:I = 0x2

.field private static final TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;


# instance fields
.field private final carrier:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

.field private final client:Lnicoid/network238/okhttp3/OkHttpClient;

.field private final headersReader:Lnicoid/network238/okhttp3/internal/http1/HeadersReader;

.field private final socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

.field private state:I

.field private trailers:Lnicoid/network238/okhttp3/Headers;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->Companion:Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$Companion;

    .line 585
    sget-object v0, Lnicoid/network238/okhttp3/Headers;->Companion:Lnicoid/network238/okhttp3/Headers$Companion;

    const-string v1, "OkHttp-Response-Body"

    const-string v2, "Truncated"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Headers$Companion;->of([Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;)V
    .registers 4

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    .line 66
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->carrier:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    .line 67
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    .line 70
    new-instance p1, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p2

    invoke-interface {p2}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object p2

    invoke-direct {p1, p2}, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;-><init>(Lnicoid/network238/okio/BufferedSource;)V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->headersReader:Lnicoid/network238/okhttp3/internal/http1/HeadersReader;

    return-void
.end method

.method public static final synthetic access$detachTimeout(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okio/ForwardingTimeout;)V
    .registers 2

    .line 63
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->detachTimeout(Lnicoid/network238/okio/ForwardingTimeout;)V

    return-void
.end method

.method public static final synthetic access$getClient$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)Lnicoid/network238/okhttp3/OkHttpClient;
    .registers 1

    .line 63
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    return-object p0
.end method

.method public static final synthetic access$getHeadersReader$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)Lnicoid/network238/okhttp3/internal/http1/HeadersReader;
    .registers 1

    .line 63
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->headersReader:Lnicoid/network238/okhttp3/internal/http1/HeadersReader;

    return-object p0
.end method

.method public static final synthetic access$getState$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)I
    .registers 1

    .line 63
    iget p0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    return p0
.end method

.method public static final synthetic access$getTRAILERS_RESPONSE_BODY_TRUNCATED$cp()Lnicoid/network238/okhttp3/Headers;
    .registers 1

    .line 63
    sget-object v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public static final synthetic access$setState$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;I)V
    .registers 2

    .line 63
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    return-void
.end method

.method public static final synthetic access$setTrailers$p(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/Headers;)V
    .registers 2

    .line 63
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->trailers:Lnicoid/network238/okhttp3/Headers;

    return-void
.end method

.method private final detachTimeout(Lnicoid/network238/okio/ForwardingTimeout;)V
    .registers 4

    .line 296
    invoke-virtual {p1}, Lnicoid/network238/okio/ForwardingTimeout;->delegate()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    .line 297
    sget-object v1, Lnicoid/network238/okio/Timeout;->NONE:Lnicoid/network238/okio/Timeout;

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/ForwardingTimeout;->setDelegate(Lnicoid/network238/okio/Timeout;)Lnicoid/network238/okio/ForwardingTimeout;

    .line 298
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    .line 299
    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->clearTimeout()Lnicoid/network238/okio/Timeout;

    return-void
.end method

.method private final isChunked(Lnicoid/network238/okhttp3/Request;)Z
    .registers 4

    .line 76
    const-string v0, "Transfer-Encoding"

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "chunked"

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private final isChunked(Lnicoid/network238/okhttp3/Response;)Z
    .registers 5

    .line 73
    const/4 v0, 0x0

    const/4 v1, 0x2

    const-string v2, "Transfer-Encoding"

    invoke-static {p1, v2, v0, v1, v0}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "chunked"

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private final newChunkedSink()Lnicoid/network238/okio/Sink;
    .registers 3

    .line 257
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 258
    const/4 v0, 0x2

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    .line 259
    new-instance v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSink;-><init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)V

    return-object v0

    .line 257
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private final newChunkedSource(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okio/Source;
    .registers 4

    .line 278
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 279
    const/4 v0, 0x5

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    .line 280
    new-instance v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$ChunkedSource;-><init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V

    return-object v0

    .line 278
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "state: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final newFixedLengthSource(Lnicoid/network238/okhttp3/HttpUrl;J)Lnicoid/network238/okio/Source;
    .registers 6

    .line 272
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 273
    const/4 v0, 0x5

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    .line 274
    new-instance v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;

    invoke-direct {v0, p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$FixedLengthSource;-><init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;J)V

    return-object v0

    .line 272
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "state: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private final newKnownLengthSink()Lnicoid/network238/okio/Sink;
    .registers 3

    .line 263
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 264
    const/4 v0, 0x2

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    .line 265
    new-instance v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$KnownLengthSink;-><init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;)V

    return-object v0

    .line 263
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private final newUnknownLengthSource(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okio/Source;
    .registers 4

    .line 284
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 285
    const/4 v0, 0x5

    iput v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    .line 286
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->noNewExchanges()V

    .line 287
    new-instance v0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec$UnknownLengthSource;-><init>(Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;Lnicoid/network238/okhttp3/HttpUrl;)V

    return-object v0

    .line 284
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "state: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 123
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->cancel()V

    return-void
.end method

.method public createRequestBody(Lnicoid/network238/okhttp3/Request;J)Lnicoid/network238/okio/Sink;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/RequestBody;->isDuplex()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 99
    new-instance p1, Ljava/net/ProtocolException;

    const-string p2, "Duplex connections are not supported for HTTP/1"

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 104
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->isChunked(Lnicoid/network238/okhttp3/Request;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 105
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->newChunkedSink()Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1

    :cond_1
    const-wide/16 v0, -0x1

    cmp-long p1, p2, v0

    if-eqz p1, :cond_2

    .line 110
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->newKnownLengthSink()Lnicoid/network238/okio/Sink;

    move-result-object p1

    return-object p1

    .line 116
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot stream a request body without chunked encoding or a known content length!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public finishRequest()V
    .registers 2

    .line 183
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    return-void
.end method

.method public flushRequest()V
    .registers 2

    .line 179
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    return-void
.end method

.method public getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;
    .registers 2

    .line 66
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->carrier:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    return-object v0
.end method

.method public getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;
    .registers 2

    .line 67
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    return-object v0
.end method

.method public bridge synthetic getSocket()Lnicoid/network238/okio/Socket;
    .registers 2

    .line 63
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    return-object v0
.end method

.method public isResponseComplete()Z
    .registers 3

    .line 91
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public openResponseBodySource(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okio/Source;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->promisesBody(Lnicoid/network238/okhttp3/Response;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 151
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->newFixedLengthSource(Lnicoid/network238/okhttp3/HttpUrl;J)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1

    .line 154
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->isChunked(Lnicoid/network238/okhttp3/Response;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 155
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->newChunkedSource(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1

    .line 159
    :cond_1
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->headersContentLength(Lnicoid/network238/okhttp3/Response;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_2

    .line 161
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-direct {p0, p1, v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->newFixedLengthSource(Lnicoid/network238/okhttp3/HttpUrl;J)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1

    .line 163
    :cond_2
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->newUnknownLengthSource(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okio/Source;

    move-result-object p1

    return-object p1
.end method

.method public peekTrailers()Lnicoid/network238/okhttp3/Headers;
    .registers 4

    .line 169
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->trailers:Lnicoid/network238/okhttp3/Headers;

    sget-object v1, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->TRAILERS_RESPONSE_BODY_TRUNCATED:Lnicoid/network238/okhttp3/Headers;

    if-eq v0, v1, :cond_1

    .line 172
    iget v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    const/4 v2, 0x5

    if-eq v1, v2, :cond_0

    const/4 v2, 0x6

    if-eq v1, v2, :cond_0

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Trailers cannot be read because the state is "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 172
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    return-object v0

    .line 170
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Trailers cannot be read because the response body was truncated"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readResponseHeaders(Z)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 6

    .line 206
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    const/4 v1, 0x3

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    if-eq v0, v1, :cond_0

    .line 211
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "state: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 205
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 215
    :cond_0
    :try_start_0
    sget-object v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->Companion:Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->headersReader:Lnicoid/network238/okhttp3/internal/http1/HeadersReader;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->readLine()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/http/StatusLine;

    move-result-object v0

    .line 219
    new-instance v2, Lnicoid/network238/okhttp3/Response$Builder;

    invoke-direct {v2}, Lnicoid/network238/okhttp3/Response$Builder;-><init>()V

    .line 220
    iget-object v3, v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->protocol:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->protocol(Lnicoid/network238/okhttp3/Protocol;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 221
    iget v3, v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->code:I

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->code(I)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 222
    iget-object v3, v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->message:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    .line 223
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->headersReader:Lnicoid/network238/okhttp3/internal/http1/HeadersReader;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/http1/HeadersReader;->readHeaders()Lnicoid/network238/okhttp3/Headers;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v2

    const/16 v3, 0x64

    if-eqz p1, :cond_1

    .line 226
    iget p1, v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->code:I

    if-ne p1, v3, :cond_1

    const/4 p1, 0x0

    return-object p1

    .line 230
    :cond_1
    iget p1, v0, Lnicoid/network238/okhttp3/internal/http/StatusLine;->code:I

    if-ne p1, v3, :cond_2

    .line 231
    iput v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    return-object v2

    :cond_2
    const/16 v0, 0x66

    if-gt v0, p1, :cond_3

    const/16 v0, 0xc8

    if-ge p1, v0, :cond_3

    .line 238
    iput v1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    return-object v2

    :cond_3
    nop

    .line 243
    const/4 p1, 0x4

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception p1

    .line 250
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    .line 251
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->redact()Ljava/lang/String;

    move-result-object v0

    .line 252
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "unexpected end of stream on "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public reportedContentLength(Lnicoid/network238/okhttp3/Response;)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 143
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->promisesBody(Lnicoid/network238/okhttp3/Response;)Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 144
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->isChunked(Lnicoid/network238/okhttp3/Response;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide/16 v0, -0x1

    return-wide v0

    .line 145
    :cond_1
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->headersContentLength(Lnicoid/network238/okhttp3/Response;)J

    move-result-wide v0

    return-wide v0
.end method

.method public final skipConnectBody(Lnicoid/network238/okhttp3/Response;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 307
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->headersContentLength(Lnicoid/network238/okhttp3/Response;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    return-void

    .line 309
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-direct {p0, p1, v0, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->newFixedLengthSource(Lnicoid/network238/okhttp3/HttpUrl;J)Lnicoid/network238/okio/Source;

    move-result-object p1

    .line 310
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const v1, 0x7fffffff

    invoke-static {p1, v1, v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->skipAll(Lnicoid/network238/okio/Source;ILjava/util/concurrent/TimeUnit;)Z

    .line 311
    invoke-interface {p1}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public final writeRequest(Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 191
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    if-nez v0, :cond_1

    .line 192
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0, p2}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p2

    const-string v0, "\r\n"

    invoke-interface {p2, v0}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 193
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_0

    .line 194
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v2

    invoke-interface {v2}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v2

    .line 195
    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v2

    .line 196
    const-string v3, ": "

    invoke-interface {v2, v3}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v2

    .line 197
    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v2

    .line 198
    invoke-interface {v2, v0}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 200
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getSocket()Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    invoke-interface {p1, v0}, Lnicoid/network238/okio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;

    .line 201
    const/4 p1, 0x1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    return-void

    .line 191
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "state: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p2, p0, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->state:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public writeRequestHeaders(Lnicoid/network238/okhttp3/Request;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    sget-object v0, Lnicoid/network238/okhttp3/internal/http/RequestLine;->INSTANCE:Lnicoid/network238/okhttp3/internal/http/RequestLine;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/okhttp3/internal/http/RequestLine;->get(Lnicoid/network238/okhttp3/Request;Ljava/net/Proxy$Type;)Ljava/lang/String;

    move-result-object v0

    .line 138
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->writeRequest(Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;)V

    return-void
.end method

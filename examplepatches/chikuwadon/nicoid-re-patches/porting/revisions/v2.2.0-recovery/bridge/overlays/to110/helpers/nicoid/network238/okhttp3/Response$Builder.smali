.class public Lnicoid/network238/okhttp3/Response$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0010\t\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0008\u0016\u0018\u00002\u00020\u0001B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0002\u0010\u0003B\u0011\u0008\u0010\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0008H\u0016J\u0010\u0010\r\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000eH\u0016J\u0010\u0010\u0013\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0010\u0010\u0019\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\u0012\u0010\u001f\u001a\u00020\u00002\u0008\u0010\u001f\u001a\u0004\u0018\u00010 H\u0016J\u0018\u0010V\u001a\u00020\u00002\u0006\u0010W\u001a\u00020\u001a2\u0006\u0010X\u001a\u00020\u001aH\u0016J\u0018\u0010Y\u001a\u00020\u00002\u0006\u0010W\u001a\u00020\u001a2\u0006\u0010X\u001a\u00020\u001aH\u0016J\u0010\u0010Z\u001a\u00020\u00002\u0006\u0010W\u001a\u00020\u001aH\u0016J\u0010\u0010%\u001a\u00020\u00002\u0006\u0010%\u001a\u00020[H\u0016J\u0010\u0010+\u001a\u00020\u00002\u0006\u0010+\u001a\u00020,H\u0016J\u0010\u00101\u001a\u00020\u00002\u0006\u00101\u001a\u000202H\u0016J\u0012\u00107\u001a\u00020\u00002\u0008\u00107\u001a\u0004\u0018\u00010\u0005H\u0016J\u0012\u0010;\u001a\u00020\u00002\u0008\u0010;\u001a\u0004\u0018\u00010\u0005H\u0016J\u001a\u0010\\\u001a\u00020]2\u0006\u0010W\u001a\u00020\u001a2\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0002J\u0012\u0010>\u001a\u00020\u00002\u0008\u0010>\u001a\u0004\u0018\u00010\u0005H\u0016J\u0010\u0010^\u001a\u00020\u00002\u0006\u0010P\u001a\u00020QH\u0016J\u0010\u0010A\u001a\u00020\u00002\u0006\u0010A\u001a\u00020BH\u0016J\u0010\u0010G\u001a\u00020\u00002\u0006\u0010G\u001a\u00020BH\u0016J\u0015\u0010_\u001a\u00020]2\u0006\u0010J\u001a\u00020KH\u0000\u00a2\u0006\u0002\u0008`J\u0008\u0010a\u001a\u00020\u0005H\u0016R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u001c\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u001a\u0010\u0013\u001a\u00020\u0014X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018R\u001c\u0010\u0019\u001a\u0004\u0018\u00010\u001aX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\u001c\u0010\u001f\u001a\u0004\u0018\u00010 X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008!\u0010\"\"\u0004\u0008#\u0010$R\u001a\u0010%\u001a\u00020&X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\'\u0010(\"\u0004\u0008)\u0010*R\u001a\u0010+\u001a\u00020,X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008-\u0010.\"\u0004\u0008/\u00100R\u001c\u00101\u001a\u0004\u0018\u000102X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00083\u00104\"\u0004\u00085\u00106R\u001c\u00107\u001a\u0004\u0018\u00010\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00088\u00109\"\u0004\u0008:\u0010\u0006R\u001c\u0010;\u001a\u0004\u0018\u00010\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008<\u00109\"\u0004\u0008=\u0010\u0006R\u001c\u0010>\u001a\u0004\u0018\u00010\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008?\u00109\"\u0004\u0008@\u0010\u0006R\u001a\u0010A\u001a\u00020BX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008C\u0010D\"\u0004\u0008E\u0010FR\u001a\u0010G\u001a\u00020BX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008H\u0010D\"\u0004\u0008I\u0010FR\u001c\u0010J\u001a\u0004\u0018\u00010KX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008L\u0010M\"\u0004\u0008N\u0010OR\u001a\u0010P\u001a\u00020QX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008R\u0010S\"\u0004\u0008T\u0010U\u00a8\u0006b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Response$Builder;",
        "",
        "<init>",
        "()V",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "(Lnicoid/network238/okhttp3/Response;)V",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "getRequest$okhttp",
        "()Lnicoid/network238/okhttp3/Request;",
        "setRequest$okhttp",
        "(Lnicoid/network238/okhttp3/Request;)V",
        "protocol",
        "Lnicoid/network238/okhttp3/Protocol;",
        "getProtocol$okhttp",
        "()Lnicoid/network238/okhttp3/Protocol;",
        "setProtocol$okhttp",
        "(Lnicoid/network238/okhttp3/Protocol;)V",
        "code",
        "",
        "getCode$okhttp",
        "()I",
        "setCode$okhttp",
        "(I)V",
        "message",
        "",
        "getMessage$okhttp",
        "()Ljava/lang/String;",
        "setMessage$okhttp",
        "(Ljava/lang/String;)V",
        "handshake",
        "Lnicoid/network238/okhttp3/Handshake;",
        "getHandshake$okhttp",
        "()Lnicoid/network238/okhttp3/Handshake;",
        "setHandshake$okhttp",
        "(Lnicoid/network238/okhttp3/Handshake;)V",
        "headers",
        "Lnicoid/network238/okhttp3/Headers$Builder;",
        "getHeaders$okhttp",
        "()Lnicoid/network238/okhttp3/Headers$Builder;",
        "setHeaders$okhttp",
        "(Lnicoid/network238/okhttp3/Headers$Builder;)V",
        "body",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "getBody$okhttp",
        "()Lnicoid/network238/okhttp3/ResponseBody;",
        "setBody$okhttp",
        "(Lnicoid/network238/okhttp3/ResponseBody;)V",
        "socket",
        "Lnicoid/network238/okio/Socket;",
        "getSocket$okhttp",
        "()Lnicoid/network238/okio/Socket;",
        "setSocket$okhttp",
        "(Lnicoid/network238/okio/Socket;)V",
        "networkResponse",
        "getNetworkResponse$okhttp",
        "()Lnicoid/network238/okhttp3/Response;",
        "setNetworkResponse$okhttp",
        "cacheResponse",
        "getCacheResponse$okhttp",
        "setCacheResponse$okhttp",
        "priorResponse",
        "getPriorResponse$okhttp",
        "setPriorResponse$okhttp",
        "sentRequestAtMillis",
        "",
        "getSentRequestAtMillis$okhttp",
        "()J",
        "setSentRequestAtMillis$okhttp",
        "(J)V",
        "receivedResponseAtMillis",
        "getReceivedResponseAtMillis$okhttp",
        "setReceivedResponseAtMillis$okhttp",
        "exchange",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "getExchange$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "setExchange$okhttp",
        "(Lnicoid/network238/okhttp3/internal/connection/Exchange;)V",
        "trailersSource",
        "Lnicoid/network238/okhttp3/TrailersSource;",
        "getTrailersSource$okhttp",
        "()Lnicoid/network238/okhttp3/TrailersSource;",
        "setTrailersSource$okhttp",
        "(Lnicoid/network238/okhttp3/TrailersSource;)V",
        "header",
        "name",
        "value",
        "addHeader",
        "removeHeader",
        "Lnicoid/network238/okhttp3/Headers;",
        "checkSupportResponse",
        "",
        "trailers",
        "initExchange",
        "initExchange$okhttp",
        "build",
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
.field private body:Lnicoid/network238/okhttp3/ResponseBody;

.field private cacheResponse:Lnicoid/network238/okhttp3/Response;

.field private code:I

.field private exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

.field private handshake:Lnicoid/network238/okhttp3/Handshake;

.field private headers:Lnicoid/network238/okhttp3/Headers$Builder;

.field private message:Ljava/lang/String;

.field private networkResponse:Lnicoid/network238/okhttp3/Response;

.field private priorResponse:Lnicoid/network238/okhttp3/Response;

.field private protocol:Lnicoid/network238/okhttp3/Protocol;

.field private receivedResponseAtMillis:J

.field private request:Lnicoid/network238/okhttp3/Request;

.field private sentRequestAtMillis:J

.field private socket:Lnicoid/network238/okio/Socket;

.field private trailersSource:Lnicoid/network238/okhttp3/TrailersSource;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 370
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 356
    const/4 v0, -0x1

    iput v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->code:I

    .line 360
    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->EMPTY:Lnicoid/network238/okhttp3/ResponseBody;

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->body:Lnicoid/network238/okhttp3/ResponseBody;

    .line 368
    sget-object v0, Lnicoid/network238/okhttp3/TrailersSource;->EMPTY:Lnicoid/network238/okhttp3/TrailersSource;

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    .line 371
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Response;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 374
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 356
    const/4 v0, -0x1

    iput v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->code:I

    .line 360
    sget-object v0, Lnicoid/network238/okhttp3/ResponseBody;->EMPTY:Lnicoid/network238/okhttp3/ResponseBody;

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->body:Lnicoid/network238/okhttp3/ResponseBody;

    .line 368
    sget-object v0, Lnicoid/network238/okhttp3/TrailersSource;->EMPTY:Lnicoid/network238/okhttp3/TrailersSource;

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    .line 375
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->request:Lnicoid/network238/okhttp3/Request;

    .line 376
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->protocol:Lnicoid/network238/okhttp3/Protocol;

    .line 377
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->code:I

    .line 378
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->message:Ljava/lang/String;

    .line 379
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->handshake()Lnicoid/network238/okhttp3/Handshake;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->handshake:Lnicoid/network238/okhttp3/Handshake;

    .line 380
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers;->newBuilder()Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    .line 381
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->body:Lnicoid/network238/okhttp3/ResponseBody;

    .line 382
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->socket()Lnicoid/network238/okio/Socket;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->socket:Lnicoid/network238/okio/Socket;

    .line 383
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->networkResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->networkResponse:Lnicoid/network238/okhttp3/Response;

    .line 384
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->cacheResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    .line 385
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->priorResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->priorResponse:Lnicoid/network238/okhttp3/Response;

    .line 386
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->sentRequestAtMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis:J

    .line 387
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->receivedResponseAtMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis:J

    .line 388
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->exchange()Lnicoid/network238/okhttp3/internal/connection/Exchange;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 389
    # getter for: Lnicoid/network238/okhttp3/Response;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;
    invoke-static {p1}, Lnicoid/network238/okhttp3/Response;->access$getTrailersSource$p(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/TrailersSource;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    return-void
.end method

.method private final checkSupportResponse(Ljava/lang/String;Lnicoid/network238/okhttp3/Response;)V
    .registers 4

    if-eqz p2, :cond_3

    .line 478
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->networkResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    if-nez v0, :cond_2

    .line 479
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->cacheResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    if-nez v0, :cond_1

    .line 480
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->priorResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ".priorResponse != null"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 479
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ".cacheResponse != null"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 478
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ".networkResponse != null"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_3
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 436
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public body(Lnicoid/network238/okhttp3/ResponseBody;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 453
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->body:Lnicoid/network238/okhttp3/ResponseBody;

    return-object p0
.end method

.method public build()Lnicoid/network238/okhttp3/Response;
    .registers 20

    .line 509
    move-object/from16 v0, p0

    iget v5, v0, Lnicoid/network238/okhttp3/Response$Builder;->code:I

    if-ltz v5, :cond_3

    .line 511
    iget-object v2, v0, Lnicoid/network238/okhttp3/Response$Builder;->request:Lnicoid/network238/okhttp3/Request;

    if-eqz v2, :cond_2

    .line 512
    iget-object v3, v0, Lnicoid/network238/okhttp3/Response$Builder;->protocol:Lnicoid/network238/okhttp3/Protocol;

    if-eqz v3, :cond_1

    .line 513
    iget-object v4, v0, Lnicoid/network238/okhttp3/Response$Builder;->message:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 515
    iget-object v6, v0, Lnicoid/network238/okhttp3/Response$Builder;->handshake:Lnicoid/network238/okhttp3/Handshake;

    .line 516
    iget-object v1, v0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v7

    .line 517
    iget-object v8, v0, Lnicoid/network238/okhttp3/Response$Builder;->body:Lnicoid/network238/okhttp3/ResponseBody;

    .line 518
    iget-object v9, v0, Lnicoid/network238/okhttp3/Response$Builder;->socket:Lnicoid/network238/okio/Socket;

    .line 519
    iget-object v10, v0, Lnicoid/network238/okhttp3/Response$Builder;->networkResponse:Lnicoid/network238/okhttp3/Response;

    .line 520
    iget-object v11, v0, Lnicoid/network238/okhttp3/Response$Builder;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    .line 521
    iget-object v12, v0, Lnicoid/network238/okhttp3/Response$Builder;->priorResponse:Lnicoid/network238/okhttp3/Response;

    .line 522
    iget-wide v13, v0, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis:J

    .line 523
    move-object v15, v2

    iget-wide v1, v0, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis:J

    .line 524
    move-wide/from16 v16, v1

    iget-object v1, v0, Lnicoid/network238/okhttp3/Response$Builder;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 525
    iget-object v2, v0, Lnicoid/network238/okhttp3/Response$Builder;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    .line 510
    move-object/from16 v18, v2

    move-object v2, v15

    move-wide/from16 v15, v16

    move-object/from16 v17, v1

    new-instance v1, Lnicoid/network238/okhttp3/Response;

    invoke-direct/range {v1 .. v18}, Lnicoid/network238/okhttp3/Response;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Protocol;Ljava/lang/String;ILnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/ResponseBody;Lnicoid/network238/okio/Socket;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Response;JJLnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/TrailersSource;)V

    return-object v1

    .line 513
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "message == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 512
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "protocol == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 511
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "request == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 509
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "code < 0: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v0, Lnicoid/network238/okhttp3/Response$Builder;->code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public cacheResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 3

    .line 469
    const-string v0, "cacheResponse"

    invoke-direct {p0, v0, p1}, Lnicoid/network238/okhttp3/Response$Builder;->checkSupportResponse(Ljava/lang/String;Lnicoid/network238/okhttp3/Response;)V

    .line 470
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    return-object p0
.end method

.method public code(I)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    .line 404
    iput p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->code:I

    return-object p0
.end method

.method public final getBody$okhttp()Lnicoid/network238/okhttp3/ResponseBody;
    .registers 2

    .line 360
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->body:Lnicoid/network238/okhttp3/ResponseBody;

    return-object v0
.end method

.method public final getCacheResponse$okhttp()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 363
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final getCode$okhttp()I
    .registers 2

    .line 356
    iget v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->code:I

    return v0
.end method

.method public final getExchange$okhttp()Lnicoid/network238/okhttp3/internal/connection/Exchange;
    .registers 2

    .line 367
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    return-object v0
.end method

.method public final getHandshake$okhttp()Lnicoid/network238/okhttp3/Handshake;
    .registers 2

    .line 358
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->handshake:Lnicoid/network238/okhttp3/Handshake;

    return-object v0
.end method

.method public final getHeaders$okhttp()Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 2

    .line 359
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    return-object v0
.end method

.method public final getMessage$okhttp()Ljava/lang/String;
    .registers 2

    .line 357
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final getNetworkResponse$okhttp()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 362
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->networkResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final getPriorResponse$okhttp()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 364
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->priorResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final getProtocol$okhttp()Lnicoid/network238/okhttp3/Protocol;
    .registers 2

    .line 355
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->protocol:Lnicoid/network238/okhttp3/Protocol;

    return-object v0
.end method

.method public final getReceivedResponseAtMillis$okhttp()J
    .registers 3

    .line 366
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis:J

    return-wide v0
.end method

.method public final getRequest$okhttp()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 354
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->request:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method

.method public final getSentRequestAtMillis$okhttp()J
    .registers 3

    .line 365
    iget-wide v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis:J

    return-wide v0
.end method

.method public final getSocket$okhttp()Lnicoid/network238/okio/Socket;
    .registers 2

    .line 361
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->socket:Lnicoid/network238/okio/Socket;

    return-object v0
.end method

.method public final getTrailersSource$okhttp()Lnicoid/network238/okhttp3/TrailersSource;
    .registers 2

    .line 368
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    return-object v0
.end method

.method public handshake(Lnicoid/network238/okhttp3/Handshake;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    .line 414
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->handshake:Lnicoid/network238/okhttp3/Handshake;

    return-object p0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 425
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 448
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->newBuilder()Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public final initExchange$okhttp(Lnicoid/network238/okhttp3/internal/connection/Exchange;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 505
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    return-void
.end method

.method public message(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 409
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->message:Ljava/lang/String;

    return-object p0
.end method

.method public networkResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 3

    .line 463
    const-string v0, "networkResponse"

    invoke-direct {p0, v0, p1}, Lnicoid/network238/okhttp3/Response$Builder;->checkSupportResponse(Ljava/lang/String;Lnicoid/network238/okhttp3/Response;)V

    .line 464
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->networkResponse:Lnicoid/network238/okhttp3/Response;

    return-object p0
.end method

.method public priorResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    .line 486
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->priorResponse:Lnicoid/network238/okhttp3/Response;

    return-object p0
.end method

.method public protocol(Lnicoid/network238/okhttp3/Protocol;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 399
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->protocol:Lnicoid/network238/okhttp3/Protocol;

    return-object p0
.end method

.method public receivedResponseAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 3

    .line 501
    iput-wide p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis:J

    return-object p0
.end method

.method public removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 442
    iget-object v0, p0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 394
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->request:Lnicoid/network238/okhttp3/Request;

    return-object p0
.end method

.method public sentRequestAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 3

    .line 496
    iput-wide p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis:J

    return-object p0
.end method

.method public final setBody$okhttp(Lnicoid/network238/okhttp3/ResponseBody;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 360
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->body:Lnicoid/network238/okhttp3/ResponseBody;

    return-void
.end method

.method public final setCacheResponse$okhttp(Lnicoid/network238/okhttp3/Response;)V
    .registers 2

    .line 363
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    return-void
.end method

.method public final setCode$okhttp(I)V
    .registers 2

    .line 356
    iput p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->code:I

    return-void
.end method

.method public final setExchange$okhttp(Lnicoid/network238/okhttp3/internal/connection/Exchange;)V
    .registers 2

    .line 367
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    return-void
.end method

.method public final setHandshake$okhttp(Lnicoid/network238/okhttp3/Handshake;)V
    .registers 2

    .line 358
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->handshake:Lnicoid/network238/okhttp3/Handshake;

    return-void
.end method

.method public final setHeaders$okhttp(Lnicoid/network238/okhttp3/Headers$Builder;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 359
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    return-void
.end method

.method public final setMessage$okhttp(Ljava/lang/String;)V
    .registers 2

    .line 357
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->message:Ljava/lang/String;

    return-void
.end method

.method public final setNetworkResponse$okhttp(Lnicoid/network238/okhttp3/Response;)V
    .registers 2

    .line 362
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->networkResponse:Lnicoid/network238/okhttp3/Response;

    return-void
.end method

.method public final setPriorResponse$okhttp(Lnicoid/network238/okhttp3/Response;)V
    .registers 2

    .line 364
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->priorResponse:Lnicoid/network238/okhttp3/Response;

    return-void
.end method

.method public final setProtocol$okhttp(Lnicoid/network238/okhttp3/Protocol;)V
    .registers 2

    .line 355
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->protocol:Lnicoid/network238/okhttp3/Protocol;

    return-void
.end method

.method public final setReceivedResponseAtMillis$okhttp(J)V
    .registers 3

    .line 366
    iput-wide p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis:J

    return-void
.end method

.method public final setRequest$okhttp(Lnicoid/network238/okhttp3/Request;)V
    .registers 2

    .line 354
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->request:Lnicoid/network238/okhttp3/Request;

    return-void
.end method

.method public final setSentRequestAtMillis$okhttp(J)V
    .registers 3

    .line 365
    iput-wide p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis:J

    return-void
.end method

.method public final setSocket$okhttp(Lnicoid/network238/okio/Socket;)V
    .registers 2

    .line 361
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->socket:Lnicoid/network238/okio/Socket;

    return-void
.end method

.method public final setTrailersSource$okhttp(Lnicoid/network238/okhttp3/TrailersSource;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 368
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    return-void
.end method

.method public socket(Lnicoid/network238/okio/Socket;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 458
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->socket:Lnicoid/network238/okio/Socket;

    return-object p0
.end method

.method public trailers(Lnicoid/network238/okhttp3/TrailersSource;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 491
    iput-object p1, p0, Lnicoid/network238/okhttp3/Response$Builder;->trailersSource:Lnicoid/network238/okhttp3/TrailersSource;

    return-object p0
.end method

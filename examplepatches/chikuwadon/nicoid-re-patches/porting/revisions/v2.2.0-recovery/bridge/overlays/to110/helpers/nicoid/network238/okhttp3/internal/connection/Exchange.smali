.class public final Lnicoid/network238/okhttp3/internal/connection/Exchange;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;,
        Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000t\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0007\u0008\u0007\u0018\u00002\u00020\u0001:\u0002>?B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000e\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eJ\u0016\u0010\u001f\u001a\u00020 2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010!\u001a\u00020\u000fJ\u0006\u0010\"\u001a\u00020\u001cJ\u0006\u0010#\u001a\u00020\u001cJ\u0006\u0010$\u001a\u00020\u001cJ\u0010\u0010%\u001a\u0004\u0018\u00010&2\u0006\u0010\'\u001a\u00020\u000fJ\u000e\u0010(\u001a\u00020\u001c2\u0006\u0010)\u001a\u00020*J\u000e\u0010+\u001a\u00020,2\u0006\u0010)\u001a\u00020*J\u0008\u0010-\u001a\u0004\u0018\u00010.J\u0006\u0010/\u001a\u000200J\u0006\u00101\u001a\u00020\u001cJ\u0006\u00102\u001a\u00020\u001cJ\u0006\u00103\u001a\u00020\u001cJ\u0010\u00104\u001a\u00020\u001c2\u0006\u00105\u001a\u000206H\u0002J8\u00107\u001a\u0004\u0018\u0001062\u0008\u0008\u0002\u00108\u001a\u0002092\u0006\u0010:\u001a\u00020\u000f2\u0008\u0008\u0002\u0010;\u001a\u00020\u000f2\u0008\u0008\u0002\u0010<\u001a\u00020\u000f2\u0008\u00105\u001a\u0004\u0018\u000106J\u0006\u0010=\u001a\u00020\u001cR\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u000f@BX\u0080\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u001e\u0010\u0013\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u000f@BX\u0080\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0012R\u0014\u0010\u0015\u001a\u00020\u00168@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0017\u0010\u0018R\u0014\u0010\u0019\u001a\u00020\u000f8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001a\u0010\u0012\u00a8\u0006@"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "",
        "call",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "finder",
        "Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;",
        "codec",
        "Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;)V",
        "getCall$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "getFinder$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;",
        "value",
        "",
        "isDuplex",
        "isDuplex$okhttp",
        "()Z",
        "hasFailure",
        "getHasFailure$okhttp",
        "connection",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "getConnection$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "isCoalescedConnection",
        "isCoalescedConnection$okhttp",
        "writeRequestHeaders",
        "",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "createRequestBody",
        "Lnicoid/network238/okio/Sink;",
        "duplex",
        "flushRequest",
        "finishRequest",
        "responseHeadersStart",
        "readResponseHeaders",
        "Lnicoid/network238/okhttp3/Response$Builder;",
        "expectContinue",
        "responseHeadersEnd",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "openResponseBody",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "peekTrailers",
        "Lnicoid/network238/okhttp3/Headers;",
        "upgradeToSocket",
        "Lnicoid/network238/okio/Socket;",
        "noNewExchangesOnConnection",
        "cancel",
        "detachWithViolence",
        "trackFailure",
        "e",
        "Ljava/io/IOException;",
        "bodyComplete",
        "bytesRead",
        "",
        "isSocket",
        "responseDone",
        "requestDone",
        "noRequestBody",
        "RequestBodySink",
        "ResponseBodySource",
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
.field private final call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

.field private final codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

.field private final finder:Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

.field private hasFailure:Z

.field private isDuplex:Z


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 42
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->finder:Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

    .line 43
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    return-void
.end method

.method public static final synthetic access$getCodec$p(Lnicoid/network238/okhttp3/internal/connection/Exchange;)Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;
    .registers 1

    .line 39
    iget-object p0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    return-object p0
.end method

.method public static synthetic bodyComplete$default(Lnicoid/network238/okhttp3/internal/connection/Exchange;JZZZLjava/io/IOException;ILjava/lang/Object;)Ljava/io/IOException;
    .registers 16

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    const-wide/16 p1, -0x1

    :cond_0
    move-wide v1, p1

    and-int/lit8 p1, p7, 0x4

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    move v4, p2

    goto :goto_0

    :cond_1
    move v4, p4

    :goto_0
    and-int/lit8 p7, p7, 0x8

    if-eqz p7, :cond_2

    move v5, p2

    goto :goto_1

    :cond_2
    move v5, p5

    .line 208
    :goto_1
    move-object v0, p0

    move v3, p3

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->bodyComplete(JZZZLjava/io/IOException;)Ljava/io/IOException;

    move-result-object p0

    return-object p0
.end method

.method private final trackFailure(Ljava/io/IOException;)V
    .registers 4

    .line 203
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->hasFailure:Z

    .line 204
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-interface {v0, v1, p1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->trackFailure(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/io/IOException;)V

    return-void
.end method


# virtual methods
.method public final bodyComplete(JZZZLjava/io/IOException;)Ljava/io/IOException;
    .registers 16

    if-eqz p6, :cond_0

    .line 216
    invoke-direct {p0, p6}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->trackFailure(Ljava/io/IOException;)V

    :cond_0
    if-eqz p5, :cond_2

    .line 222
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    if-eqz p6, :cond_1

    .line 220
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p6}, Lnicoid/network238/okhttp3/EventListener;->requestFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    goto :goto_0

    .line 222
    :cond_1
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->requestBodyEnd(Lnicoid/network238/okhttp3/Call;J)V

    :cond_2
    :goto_0
    if-eqz p4, :cond_4

    .line 229
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    if-eqz p6, :cond_3

    .line 227
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p1, p2, p6}, Lnicoid/network238/okhttp3/EventListener;->responseFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    goto :goto_1

    .line 229
    :cond_3
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p1, p2}, Lnicoid/network238/okhttp3/EventListener;->responseBodyEnd(Lnicoid/network238/okhttp3/Call;J)V

    .line 232
    :cond_4
    :goto_1
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    const/4 p1, 0x1

    const/4 p2, 0x0

    if-eqz p5, :cond_5

    if-nez p3, :cond_5

    move v4, p1

    goto :goto_2

    :cond_5
    move v4, p2

    :goto_2
    if-eqz p4, :cond_6

    if-nez p3, :cond_6

    move v5, p1

    goto :goto_3

    :cond_6
    move v5, p2

    :goto_3
    if-eqz p5, :cond_7

    if-eqz p3, :cond_7

    move v7, p1

    goto :goto_4

    :cond_7
    move v7, p2

    :goto_4
    if-eqz p4, :cond_8

    if-eqz p3, :cond_8

    move v6, p1

    goto :goto_5

    :cond_8
    move v6, p2

    :goto_5
    move-object v3, p0

    move-object v8, p6

    invoke-virtual/range {v2 .. v8}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->messageDone$okhttp(Lnicoid/network238/okhttp3/internal/connection/Exchange;ZZZZLjava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    return-object p1
.end method

.method public final cancel()V
    .registers 2

    .line 183
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->cancel()V

    return-void
.end method

.method public final createRequestBody(Lnicoid/network238/okhttp3/Request;Z)Lnicoid/network238/okio/Sink;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->isDuplex:Z

    .line 78
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/RequestBody;->contentLength()J

    move-result-wide v3

    .line 79
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p2, v0}, Lnicoid/network238/okhttp3/EventListener;->requestBodyStart(Lnicoid/network238/okhttp3/Call;)V

    .line 80
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {p2, p1, v3, v4}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->createRequestBody(Lnicoid/network238/okhttp3/Request;J)Lnicoid/network238/okio/Sink;

    move-result-object v2

    .line 81
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/connection/Exchange$RequestBodySink;-><init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okio/Sink;JZ)V

    return-object v0
.end method

.method public final detachWithViolence()V
    .registers 9

    .line 191
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->cancel()V

    .line 192
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v2, p0

    invoke-virtual/range {v1 .. v7}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->messageDone$okhttp(Lnicoid/network238/okhttp3/internal/connection/Exchange;ZZZZLjava/io/IOException;)Ljava/io/IOException;

    return-void
.end method

.method public final finishRequest()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->finishRequest()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 104
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1, v2, v0}, Lnicoid/network238/okhttp3/EventListener;->requestFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 105
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->trackFailure(Ljava/io/IOException;)V

    .line 106
    throw v0
.end method

.method public final flushRequest()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->flushRequest()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 93
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1, v2, v0}, Lnicoid/network238/okhttp3/EventListener;->requestFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 94
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->trackFailure(Ljava/io/IOException;)V

    .line 95
    throw v0
.end method

.method public final getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;
    .registers 2

    .line 41
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    return-object v0
.end method

.method public final getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 3

    .line 54
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    instance-of v1, v0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    if-eqz v1, :cond_0

    check-cast v0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no connection for CONNECT tunnels"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getFinder$okhttp()Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;
    .registers 2

    .line 42
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->finder:Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

    return-object v0
.end method

.method public final getHasFailure$okhttp()Z
    .registers 2

    .line 50
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->hasFailure:Z

    return v0
.end method

.method public final isCoalescedConnection$okhttp()Z
    .registers 3

    .line 57
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->finder:Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;->getRoutePlanner()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;->getAddress()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public final isDuplex$okhttp()Z
    .registers 2

    .line 46
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->isDuplex:Z

    return v0
.end method

.method public final noNewExchangesOnConnection()V
    .registers 2

    .line 179
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;->noNewExchanges()V

    return-void
.end method

.method public final noRequestBody()V
    .registers 10

    .line 243
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    const/16 v7, 0x1c

    const/4 v8, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    invoke-static/range {v0 .. v8}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->messageDone$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/Exchange;ZZZZLjava/io/IOException;ILjava/lang/Object;)Ljava/io/IOException;

    return-void
.end method

.method public final openResponseBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    :try_start_0
    const-string v0, "Content-Type"

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p1, v0, v2, v1, v2}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 135
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v1, p1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->reportedContentLength(Lnicoid/network238/okhttp3/Response;)J

    move-result-wide v5

    .line 136
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v1, p1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->openResponseBodySource(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okio/Source;

    move-result-object v4

    .line 138
    new-instance v2, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;

    const/4 v7, 0x0

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/connection/Exchange$ResponseBodySource;-><init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okio/Source;JZ)V

    .line 143
    new-instance p1, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;

    invoke-static {v2}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    invoke-direct {p1, v0, v5, v6, v1}, Lnicoid/network238/okhttp3/internal/http/RealResponseBody;-><init>(Ljava/lang/String;JLnicoid/network238/okio/BufferedSource;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 145
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/okhttp3/EventListener;->responseFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 146
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->trackFailure(Ljava/io/IOException;)V

    .line 147
    throw p1
.end method

.method public final peekTrailers()Lnicoid/network238/okhttp3/Headers;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->peekTrailers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    return-object v0
.end method

.method public final readResponseHeaders(Z)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0, p1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->readResponseHeaders(Z)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 118
    invoke-virtual {p1, p0}, Lnicoid/network238/okhttp3/Response$Builder;->initExchange$okhttp(Lnicoid/network238/okhttp3/internal/connection/Exchange;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-object p1

    :catch_0
    move-exception p1

    .line 121
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/okhttp3/EventListener;->responseFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 122
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->trackFailure(Ljava/io/IOException;)V

    .line 123
    throw p1
.end method

.method public final responseHeadersEnd(Lnicoid/network238/okhttp3/Response;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/okhttp3/EventListener;->responseHeadersEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V

    return-void
.end method

.method public final responseHeadersStart()V
    .registers 3

    .line 111
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/EventListener;->responseHeadersStart(Lnicoid/network238/okhttp3/Call;)V

    return-void
.end method

.method public final upgradeToSocket()Lnicoid/network238/okio/Socket;
    .registers 2

    .line 155
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->upgradeToSocket()V

    .line 156
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->getCarrier()Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->useAsSocket$okhttp()V

    .line 158
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/internal/connection/Exchange$upgradeToSocket$1;-><init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;)V

    return-object v0
.end method

.method public final writeRequestHeaders(Lnicoid/network238/okhttp3/Request;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/EventListener;->requestHeadersStart(Lnicoid/network238/okhttp3/Call;)V

    .line 63
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->codec:Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;

    invoke-interface {v0, p1}, Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;->writeRequestHeaders(Lnicoid/network238/okhttp3/Request;)V

    .line 64
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/okhttp3/EventListener;->requestHeadersEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Request;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 66
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/Exchange;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/okhttp3/EventListener;->requestFailed(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 67
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->trackFailure(Ljava/io/IOException;)V

    .line 68
    throw p1
.end method

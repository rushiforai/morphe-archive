.class public final Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0002\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "<init>",
        "()V",
        "intercept",
        "Lnicoid/network238/okhttp3/Response;",
        "chain",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "shouldIgnoreAndWaitForRealResponse",
        "",
        "code",
        "",
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
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;->INSTANCE:Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final shouldIgnoreAndWaitForRealResponse(I)Z
    .registers 3

    const/16 v0, 0x64

    if-eq p1, v0, :cond_0

    const/16 v0, 0x66

    if-gt v0, p1, :cond_1

    const/16 v0, 0xc8

    if-ge p1, v0, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v1, "close"

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    move-object/from16 v0, p1

    check-cast v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    .line 34
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getExchange$okhttp()Lnicoid/network238/okhttp3/internal/connection/Exchange;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getRequest$okhttp()Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    .line 36
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v0

    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 42
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eqz v6, :cond_0

    if-eqz v0, :cond_0

    move v6, v8

    goto :goto_0

    :cond_0
    move v6, v7

    .line 43
    :goto_0
    const-string v9, "Connection"

    invoke-virtual {v3, v9}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "upgrade"

    invoke-static {v11, v10, v8}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v10

    .line 45
    const/4 v12, 0x0

    :try_start_0
    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->writeRequestHeaders(Lnicoid/network238/okhttp3/Request;)V

    if-eqz v6, :cond_4

    .line 51
    const-string v6, "100-continue"

    const-string v13, "Expect"

    invoke-virtual {v3, v13}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v6, v13, v8}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 52
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->flushRequest()V

    .line 53
    invoke-virtual {v2, v8}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->readResponseHeaders(Z)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 54
    :try_start_1
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->responseHeadersStart()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move v13, v7

    goto :goto_1

    .line 83
    :catch_0
    move-exception v0

    move v13, v8

    goto :goto_3

    .line 51
    :cond_1
    move v13, v8

    move-object v6, v12

    .line 54
    :goto_1
    if-nez v6, :cond_3

    .line 58
    :try_start_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/RequestBody;->isDuplex()Z

    move-result v14

    if-eqz v14, :cond_2

    .line 60
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->flushRequest()V

    .line 61
    invoke-virtual {v2, v3, v8}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->createRequestBody(Lnicoid/network238/okhttp3/Request;Z)Lnicoid/network238/okio/Sink;

    move-result-object v14

    invoke-static {v14}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v14

    .line 62
    invoke-virtual {v0, v14}, Lnicoid/network238/okhttp3/RequestBody;->writeTo(Lnicoid/network238/okio/BufferedSink;)V

    goto :goto_2

    :cond_2
    nop

    .line 65
    invoke-virtual {v2, v3, v7}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->createRequestBody(Lnicoid/network238/okhttp3/Request;Z)Lnicoid/network238/okio/Sink;

    move-result-object v14

    invoke-static {v14}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object v14

    .line 66
    invoke-virtual {v0, v14}, Lnicoid/network238/okhttp3/RequestBody;->writeTo(Lnicoid/network238/okio/BufferedSink;)V

    .line 67
    invoke-interface {v14}, Lnicoid/network238/okio/Sink;->close()V

    goto :goto_2

    .line 70
    :cond_3
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->noRequestBody()V

    .line 71
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v14

    invoke-virtual {v14}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->isMultiplexed$okhttp()Z

    move-result v14

    if-nez v14, :cond_5

    .line 75
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->noNewExchangesOnConnection()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 79
    :cond_4
    :try_start_3
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->noRequestBody()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    move v13, v8

    move-object v6, v12

    :cond_5
    :goto_2
    if-eqz v0, :cond_6

    .line 82
    :try_start_4
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/RequestBody;->isDuplex()Z

    move-result v0

    if-nez v0, :cond_7

    .line 83
    :cond_6
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->finishRequest()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 89
    :cond_7
    move-object v0, v6

    move-object v6, v12

    goto :goto_4

    .line 83
    :catch_1
    move-exception v0

    goto :goto_3

    :catch_2
    move-exception v0

    move v13, v8

    move-object v6, v12

    .line 86
    :goto_3
    instance-of v14, v0, Lnicoid/network238/okhttp3/internal/http2/ConnectionShutdownException;

    if-nez v14, :cond_15

    .line 89
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getHasFailure$okhttp()Z

    move-result v14

    if-eqz v14, :cond_14

    move-object/from16 v17, v6

    move-object v6, v0

    move-object/from16 v0, v17

    :goto_4
    if-nez v0, :cond_8

    .line 97
    :try_start_5
    invoke-virtual {v2, v7}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->readResponseHeaders(Z)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v13, :cond_8

    .line 99
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->responseHeadersStart()V

    move v13, v7

    .line 105
    :cond_8
    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 106
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v14

    invoke-virtual {v14}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->handshake()Lnicoid/network238/okhttp3/Handshake;

    move-result-object v14

    invoke-virtual {v0, v14}, Lnicoid/network238/okhttp3/Response$Builder;->handshake(Lnicoid/network238/okhttp3/Handshake;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 107
    invoke-virtual {v0, v4, v5}, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 108
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-virtual {v0, v14, v15}, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    .line 110
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v14
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 124
    :goto_5
    nop

    .line 112
    move-object/from16 v15, p0

    :try_start_6
    invoke-direct {v15, v14}, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor;->shouldIgnoreAndWaitForRealResponse(I)Z

    move-result v16

    if-eqz v16, :cond_a

    .line 113
    invoke-virtual {v2, v7}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->readResponseHeaders(Z)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v13, :cond_9

    .line 115
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->responseHeadersStart()V

    .line 119
    :cond_9
    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 120
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v14

    invoke-virtual {v14}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->handshake()Lnicoid/network238/okhttp3/Handshake;

    move-result-object v14

    invoke-virtual {v0, v14}, Lnicoid/network238/okhttp3/Response$Builder;->handshake(Lnicoid/network238/okhttp3/Handshake;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 121
    invoke-virtual {v0, v4, v5}, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 122
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v0, v7, v8}, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 123
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v14

    const/4 v7, 0x0

    const/4 v8, 0x1

    goto :goto_5

    .line 127
    :cond_a
    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->responseHeadersEnd(Lnicoid/network238/okhttp3/Response;)V

    const/16 v3, 0x65

    if-ne v14, v3, :cond_b

    const/4 v3, 0x1

    goto :goto_6

    :cond_b
    const/4 v3, 0x0

    :goto_6
    const/4 v4, 0x2

    if-eqz v3, :cond_d

    .line 130
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->isMultiplexed$okhttp()Z

    move-result v3

    if-nez v3, :cond_c

    .line 136
    invoke-static {v0, v9, v12, v4, v12}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    invoke-static {v11, v3, v5}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_d

    const/4 v7, 0x1

    goto :goto_7

    .line 131
    :cond_c
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Unexpected 101 code on HTTP/2 connection"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    const/4 v7, 0x0

    :goto_7
    if-eqz v10, :cond_e

    if-eqz v7, :cond_e

    .line 143
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v3

    .line 145
    new-instance v5, Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;

    .line 146
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v7

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/ResponseBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object v7

    .line 147
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v10

    .line 145
    invoke-direct {v5, v7, v10, v11}, Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;-><init>(Lnicoid/network238/okhttp3/MediaType;J)V

    .line 144
    invoke-virtual {v3, v5}, Lnicoid/network238/okhttp3/Response$Builder;->body(Lnicoid/network238/okhttp3/ResponseBody;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 149
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->upgradeToSocket()Lnicoid/network238/okio/Socket;

    move-result-object v3

    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/Response$Builder;->socket(Lnicoid/network238/okio/Socket;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 150
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    goto :goto_8

    .line 155
    :cond_e
    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->openResponseBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v3

    .line 157
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 158
    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/Response$Builder;->body(Lnicoid/network238/okhttp3/ResponseBody;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 160
    new-instance v5, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1;

    invoke-direct {v5, v2, v3}, Lnicoid/network238/okhttp3/internal/http/CallServerInterceptor$intercept$1;-><init>(Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/ResponseBody;)V

    .line 159
    invoke-virtual {v0, v5}, Lnicoid/network238/okhttp3/Response$Builder;->trailers(Lnicoid/network238/okhttp3/TrailersSource;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 171
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    :goto_8
    nop

    .line 174
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    invoke-virtual {v3, v9}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    invoke-static {v1, v3, v5}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_f

    .line 175
    invoke-static {v0, v9, v12, v4, v12}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    invoke-static {v1, v3, v5}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 177
    :cond_f
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->noNewExchangesOnConnection()V

    :cond_10
    const/16 v1, 0xcc

    if-eq v14, v1, :cond_11

    const/16 v1, 0xcd

    if-eq v14, v1, :cond_11

    goto :goto_9

    .line 179
    :cond_11
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_12

    :goto_9
    return-object v0

    .line 180
    :cond_12
    new-instance v1, Ljava/net/ProtocolException;

    .line 181
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HTTP "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " had non-zero Content-Length: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 180
    invoke-direct {v1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    :catch_3
    move-exception v0

    goto :goto_a

    :catch_4
    move-exception v0

    move-object/from16 v15, p0

    :goto_a
    if-eqz v6, :cond_13

    .line 187
    invoke-static {v6, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    .line 188
    throw v6

    .line 190
    :cond_13
    throw v0

    .line 90
    :cond_14
    move-object/from16 v15, p0

    throw v0

    .line 87
    :cond_15
    move-object/from16 v15, p0

    throw v0
.end method

.class public final Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0018\u0000 \u001d2\u00020\u0001:\u0001\u001dB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J(\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u000fH\u0002J\u0018\u0010\u0010\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000fH\u0002J\u0018\u0010\u0011\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0012\u001a\u00020\tH\u0002J$\u0010\u0013\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0014\u001a\u00020\u00052\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\"\u0010\u0017\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0014\u001a\u00020\u00052\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u0018\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u0014\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u001bH\u0002\u00a8\u0006\u001e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "<init>",
        "()V",
        "intercept",
        "Lnicoid/network238/okhttp3/Response;",
        "chain",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "recover",
        "",
        "e",
        "Ljava/io/IOException;",
        "call",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "userRequest",
        "Lnicoid/network238/okhttp3/Request;",
        "requestIsOneShot",
        "isRecoverable",
        "requestSendStarted",
        "followUpRequest",
        "userResponse",
        "exchange",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "buildRedirectRequest",
        "method",
        "",
        "retryAfter",
        "",
        "defaultDelay",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor$Companion;

.field private static final MAX_FOLLOW_UPS:I = 0x14


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;->Companion:Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor$Companion;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final buildRedirectRequest(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Request;
    .registers 8

    .line 302
    invoke-interface {p3}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getFollowRedirects()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    goto :goto_0

    .line 304
    :cond_0
    const-string v0, "Location"

    const/4 v2, 0x2

    invoke-static {p1, v0, v1, v2, v1}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 306
    :cond_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 309
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 310
    invoke-interface {p3}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getFollowSslRedirects()Z

    move-result p3

    if-nez p3, :cond_3

    :goto_0
    return-object v1

    .line 313
    :cond_3
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p3

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p3

    .line 314
    invoke-static {p2}, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 315
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v2

    .line 316
    sget-object v3, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->INSTANCE:Lnicoid/network238/okhttp3/internal/http/HttpMethod;

    invoke-virtual {v3, p2, v2}, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->redirectsToGet(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 317
    const-string p2, "GET"

    invoke-virtual {p3, p2, v1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 318
    const-string p2, "Transfer-Encoding"

    invoke-virtual {p3, p2}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 319
    const-string p2, "Content-Length"

    invoke-virtual {p3, p2}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 320
    const-string p2, "Content-Type"

    invoke-virtual {p3, p2}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    goto :goto_1

    .line 322
    :cond_4
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v1

    invoke-virtual {p3, p2, v1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 329
    :cond_5
    :goto_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-static {p1, v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->canReuseConnectionFor(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result p1

    if-nez p1, :cond_6

    .line 330
    const-string p1, "Authorization"

    invoke-virtual {p3, p1}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    .line 333
    :cond_6
    invoke-virtual {p3, v0}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    return-object p1
.end method

.method private final followUpRequest(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Request;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 211
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->route()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    .line 212
    :goto_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v2

    .line 214
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v3

    sparse-switch v2, :sswitch_data_0

    goto/16 :goto_1

    .line 259
    :sswitch_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->priorResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 260
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result p2

    const/16 p3, 0x1f7

    if-ne p2, p3, :cond_1

    goto/16 :goto_1

    :cond_1
    nop

    .line 265
    const p2, 0x7fffffff

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;->retryAfter(Lnicoid/network238/okhttp3/Response;I)I

    move-result p2

    if-nez p2, :cond_9

    .line 267
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    return-object p1

    .line 277
    :sswitch_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p3

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p3

    if-eqz p3, :cond_2

    .line 278
    invoke-virtual {p3}, Lnicoid/network238/okhttp3/RequestBody;->isOneShot()Z

    move-result p3

    if-nez p3, :cond_9

    :cond_2
    if-eqz p2, :cond_9

    .line 282
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->isCoalescedConnection$okhttp()Z

    move-result p3

    if-nez p3, :cond_3

    goto/16 :goto_1

    .line 286
    :cond_3
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noCoalescedConnections$okhttp()V

    .line 287
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    return-object p1

    .line 236
    :sswitch_2
    invoke-interface {p3}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getRetryOnConnectionFailure()Z

    move-result p2

    if-nez p2, :cond_4

    goto :goto_1

    .line 241
    :cond_4
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p2

    if-eqz p2, :cond_5

    .line 242
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/RequestBody;->isOneShot()Z

    move-result p2

    if-eqz p2, :cond_5

    goto :goto_1

    .line 245
    :cond_5
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->priorResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object p2

    if-eqz p2, :cond_6

    .line 246
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result p2

    const/16 p3, 0x198

    if-ne p2, p3, :cond_6

    goto :goto_1

    :cond_6
    nop

    .line 251
    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;->retryAfter(Lnicoid/network238/okhttp3/Response;I)I

    move-result p2

    if-lez p2, :cond_7

    goto :goto_1

    .line 255
    :cond_7
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    return-object p1

    .line 217
    :sswitch_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object p2

    .line 218
    invoke-virtual {p2}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object p2

    sget-object v0, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne p2, v0, :cond_8

    .line 221
    invoke-interface {p3}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getProxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object p2

    invoke-interface {p2, v1, p1}, Lnicoid/network238/okhttp3/Authenticator;->authenticate(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    return-object p1

    .line 219
    :cond_8
    new-instance p1, Ljava/net/ProtocolException;

    const-string p2, "Received HTTP_PROXY_AUTH (407) code while not using proxy"

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 225
    :sswitch_4
    invoke-interface {p3}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object p2

    invoke-interface {p2, v1, p1}, Lnicoid/network238/okhttp3/Authenticator;->authenticate(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    return-object p1

    .line 229
    :sswitch_5
    invoke-direct {p0, p1, v3, p3}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;->buildRedirectRequest(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    return-object p1

    .line 251
    :cond_9
    :goto_1
    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x12c -> :sswitch_5
        0x12d -> :sswitch_5
        0x12e -> :sswitch_5
        0x12f -> :sswitch_5
        0x133 -> :sswitch_5
        0x134 -> :sswitch_5
        0x191 -> :sswitch_4
        0x197 -> :sswitch_3
        0x198 -> :sswitch_2
        0x1a5 -> :sswitch_1
        0x1f7 -> :sswitch_0
    .end sparse-switch
.end method

.method private final isRecoverable(Ljava/io/IOException;Z)Z
    .registers 4

    .line 171
    instance-of v0, p1, Ljava/net/ProtocolException;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 177
    :cond_0
    instance-of v0, p1, Ljava/io/InterruptedIOException;

    if-eqz v0, :cond_1

    .line 178
    instance-of p1, p1, Ljava/net/SocketTimeoutException;

    if-eqz p1, :cond_3

    if-nez p2, :cond_3

    goto :goto_1

    .line 183
    :cond_1
    instance-of p2, p1, Ljavax/net/ssl/SSLHandshakeException;

    if-eqz p2, :cond_2

    .line 186
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    instance-of p2, p2, Ljava/security/cert/CertificateException;

    if-eqz p2, :cond_2

    goto :goto_0

    .line 190
    :cond_2
    instance-of p1, p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    if-eqz p1, :cond_4

    :cond_3
    :goto_0
    const/4 p1, 0x0

    return p1

    :cond_4
    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method private final recover(Ljava/io/IOException;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/Interceptor$Chain;Lnicoid/network238/okhttp3/Request;)Z
    .registers 7

    .line 139
    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/http2/ConnectionShutdownException;

    xor-int/lit8 v1, v0, 0x1

    .line 142
    invoke-interface {p3}, Lnicoid/network238/okhttp3/Interceptor$Chain;->getRetryOnConnectionFailure()Z

    move-result p3

    if-eqz p3, :cond_2

    if-nez v0, :cond_0

    .line 145
    invoke-direct {p0, p1, p4}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;->requestIsOneShot(Ljava/io/IOException;Lnicoid/network238/okhttp3/Request;)Z

    move-result p3

    if-eqz p3, :cond_0

    goto :goto_0

    .line 148
    :cond_0
    invoke-direct {p0, p1, v1}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;->isRecoverable(Ljava/io/IOException;Z)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    .line 151
    :cond_1
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->retryAfterFailure()Z

    move-result p1

    if-nez p1, :cond_3

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method private final requestIsOneShot(Ljava/io/IOException;Lnicoid/network238/okhttp3/Request;)Z
    .registers 3

    .line 161
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 162
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/RequestBody;->isOneShot()Z

    move-result p2

    if-nez p2, :cond_1

    .line 163
    :cond_0
    instance-of p1, p1, Ljava/io/FileNotFoundException;

    if-eqz p1, :cond_2

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method private final retryAfter(Lnicoid/network238/okhttp3/Response;I)I
    .registers 6

    .line 340
    const/4 v0, 0x0

    const/4 v1, 0x2

    const-string v2, "Retry-After"

    invoke-static {p1, v2, v0, v1, v0}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return p2

    .line 344
    :cond_0
    new-instance p2, Lnicoid/network238/kotlin/text/Regex;

    const-string v0, "\\d+"

    invoke-direct {p2, v0}, Lnicoid/network238/kotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Lnicoid/network238/kotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 345
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    return p1

    :cond_1
    const p1, 0x7fffffff

    return p1
.end method


# virtual methods
.method public intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    move-object v0, p1

    check-cast v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    .line 55
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getRequest$okhttp()Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    .line 56
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v2

    .line 60
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move v9, v4

    move-object v8, v5

    move v7, v6

    .line 62
    :goto_0
    invoke-virtual {v2, v1, v7, v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->enterNetworkInterceptorExchange(Lnicoid/network238/okhttp3/Request;ZLnicoid/network238/okhttp3/internal/http/RealInterceptorChain;)V

    .line 67
    :try_start_0
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->isCanceled()Z

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v7, :cond_6

    .line 72
    :try_start_1
    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object v7
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 87
    :try_start_2
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v7

    .line 88
    invoke-virtual {v7, v1}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    if-eqz v8, :cond_0

    .line 89
    invoke-static {v8}, Lnicoid/network238/okhttp3/internal/UnreadableResponseBodyKt;->stripBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;

    move-result-object v7

    goto :goto_1

    :cond_0
    move-object v7, v5

    :goto_1
    invoke-virtual {v1, v7}, Lnicoid/network238/okhttp3/Response$Builder;->priorResponse(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 90
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v8

    .line 92
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getInterceptorScopedExchange$okhttp()Lnicoid/network238/okhttp3/internal/connection/Exchange;

    move-result-object v1

    .line 93
    invoke-direct {p0, v8, v1, p1}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;->followUpRequest(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Request;

    move-result-object v7

    if-nez v7, :cond_2

    if-eqz v1, :cond_1

    .line 96
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->isDuplex$okhttp()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 97
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->timeoutEarlyExit()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_1
    nop

    .line 100
    :try_start_3
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    invoke-virtual {p1, v2, v8, v5}, Lnicoid/network238/okhttp3/EventListener;->followUpDecision(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 104
    :cond_2
    :try_start_4
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 105
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/RequestBody;->isOneShot()Z

    move-result v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v1, :cond_3

    .line 107
    :try_start_5
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    invoke-virtual {p1, v2, v8, v5}, Lnicoid/network238/okhttp3/EventListener;->followUpDecision(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 122
    :goto_2
    invoke-virtual {v2, v4}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exitNetworkInterceptorExchange$okhttp(Z)V

    return-object v8

    .line 68
    :catchall_0
    move-exception p1

    goto :goto_3

    .line 111
    :cond_3
    :try_start_6
    invoke-virtual {v8}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    add-int/lit8 v9, v9, 0x1

    const/16 v1, 0x14

    if-gt v9, v1, :cond_4

    .line 118
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v1

    invoke-virtual {v1, v2, v8, v7}, Lnicoid/network238/okhttp3/EventListener;->followUpDecision(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 122
    invoke-virtual {v2, v6}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exitNetworkInterceptorExchange$okhttp(Z)V

    move-object v1, v7

    move v7, v6

    goto :goto_0

    .line 114
    :cond_4
    :try_start_7
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    invoke-virtual {p1, v2, v8, v5}, Lnicoid/network238/okhttp3/EventListener;->followUpDecision(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)V

    .line 115
    new-instance p1, Ljava/net/ProtocolException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Too many follow-up requests: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_0
    move-exception v7

    .line 76
    invoke-direct {p0, v7, v2, p1, v1}, Lnicoid/network238/okhttp3/internal/http/RetryAndFollowUpInterceptor;->recover(Ljava/io/IOException;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/Interceptor$Chain;Lnicoid/network238/okhttp3/Request;)Z

    move-result v10

    .line 77
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v11

    invoke-virtual {v11, v2, v7, v10}, Lnicoid/network238/okhttp3/EventListener;->retryDecision(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;Z)V

    if-eqz v10, :cond_5

    .line 79
    invoke-static {v3, v7}, Lnicoid/network238/kotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 122
    invoke-virtual {v2, v6}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exitNetworkInterceptorExchange$okhttp(Z)V

    move v7, v4

    goto/16 :goto_0

    .line 78
    :cond_5
    :try_start_8
    invoke-static {v7, v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->withSuppressed(Ljava/lang/Exception;Ljava/util/List;)Ljava/lang/Throwable;

    move-result-object p1

    throw p1

    .line 68
    :cond_6
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Canceled"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception p1

    move v4, v6

    .line 122
    :goto_3
    invoke-virtual {v2, v4}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->exitNetworkInterceptorExchange$okhttp(Z)V

    throw p1
.end method

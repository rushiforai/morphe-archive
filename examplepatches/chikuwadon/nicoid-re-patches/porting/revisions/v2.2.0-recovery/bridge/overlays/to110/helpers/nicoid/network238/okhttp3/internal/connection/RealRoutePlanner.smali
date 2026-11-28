.class public final Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001Bq\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\u0007\u0012\u0006\u0010\u000b\u001a\u00020\u0007\u0012\u0006\u0010\u000c\u001a\u00020\r\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0014\u0012\u0006\u0010\u0015\u001a\u00020\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0008\u0010\'\u001a\u00020\rH\u0016J\u0008\u0010(\u001a\u00020$H\u0016J\n\u0010)\u001a\u0004\u0018\u00010*H\u0002J\r\u0010+\u001a\u00020,H\u0000\u00a2\u0006\u0002\u0008-J-\u0010.\u001a\u0004\u0018\u00010*2\n\u0008\u0002\u0010/\u001a\u0004\u0018\u00010,2\u0010\u0008\u0002\u00100\u001a\n\u0012\u0004\u0012\u00020!\u0018\u000101H\u0000\u00a2\u0006\u0002\u00082J\'\u00103\u001a\u00020,2\u0006\u00104\u001a\u00020!2\u0010\u0008\u0002\u00100\u001a\n\u0012\u0004\u0012\u00020!\u0018\u000101H\u0000\u00a2\u0006\u0002\u00085J\u0010\u00106\u001a\u00020\u00162\u0006\u00104\u001a\u00020!H\u0002J\u0012\u00107\u001a\u00020\r2\u0008\u00108\u001a\u0004\u0018\u000109H\u0016J\u0012\u0010:\u001a\u0004\u0018\u00010!2\u0006\u0010;\u001a\u000209H\u0002J\u0010\u0010<\u001a\u00020\r2\u0006\u0010=\u001a\u00020>H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u00020\u0010X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u001aR\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u001dX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001e\u001a\u0004\u0018\u00010\u001fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010 \u001a\u0004\u0018\u00010!X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\"\u001a\u0008\u0012\u0004\u0012\u00020$0#X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010&\u00a8\u0006?"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "connectionPool",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "readTimeoutMillis",
        "",
        "writeTimeoutMillis",
        "socketConnectTimeoutMillis",
        "socketReadTimeoutMillis",
        "pingIntervalMillis",
        "retryOnConnectionFailure",
        "",
        "fastFallback",
        "address",
        "Lnicoid/network238/okhttp3/Address;",
        "routeDatabase",
        "Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;",
        "call",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZZLnicoid/network238/okhttp3/Address;Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/Request;)V",
        "getAddress",
        "()Lnicoid/network238/okhttp3/Address;",
        "doExtensiveHealthChecks",
        "routeSelection",
        "Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;",
        "routeSelector",
        "Lnicoid/network238/okhttp3/internal/connection/RouteSelector;",
        "nextRouteToTry",
        "Lnicoid/network238/okhttp3/Route;",
        "deferredPlans",
        "Lnicoid/network238/kotlin/collections/ArrayDeque;",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "getDeferredPlans",
        "()Lnicoid/network238/kotlin/collections/ArrayDeque;",
        "isCanceled",
        "plan",
        "planReuseCallConnection",
        "Lnicoid/network238/okhttp3/internal/connection/ReusePlan;",
        "planConnect",
        "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;",
        "planConnect$okhttp",
        "planReusePooledConnection",
        "planToReplace",
        "routes",
        "",
        "planReusePooledConnection$okhttp",
        "planConnectToRoute",
        "route",
        "planConnectToRoute$okhttp",
        "createTunnelRequest",
        "hasNext",
        "failedConnection",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "retryRoute",
        "connection",
        "sameHostAndPort",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
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
.field private final address:Lnicoid/network238/okhttp3/Address;

.field private final call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

.field private final connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

.field private final deferredPlans:Lnicoid/network238/kotlin/collections/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/kotlin/collections/ArrayDeque;"
        }
    .end annotation
.end field

.field private final doExtensiveHealthChecks:Z

.field private final fastFallback:Z

.field private nextRouteToTry:Lnicoid/network238/okhttp3/Route;

.field private final pingIntervalMillis:I

.field private final readTimeoutMillis:I

.field private final retryOnConnectionFailure:Z

.field private final routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

.field private routeSelection:Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;

.field private routeSelector:Lnicoid/network238/okhttp3/internal/connection/RouteSelector;

.field private final socketConnectTimeoutMillis:I

.field private final socketReadTimeoutMillis:I

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

.field private final writeTimeoutMillis:I


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZZLnicoid/network238/okhttp3/Address;Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;Lnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/Request;)V
    .registers 14

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 42
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 43
    iput p3, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->readTimeoutMillis:I

    .line 44
    iput p4, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->writeTimeoutMillis:I

    .line 45
    iput p5, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->socketConnectTimeoutMillis:I

    .line 46
    iput p6, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->socketReadTimeoutMillis:I

    .line 47
    iput p7, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->pingIntervalMillis:I

    .line 48
    iput-boolean p8, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->retryOnConnectionFailure:Z

    .line 49
    iput-boolean p9, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->fastFallback:Z

    .line 50
    iput-object p10, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->address:Lnicoid/network238/okhttp3/Address;

    .line 51
    iput-object p11, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 52
    iput-object p12, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 55
    invoke-virtual {p13}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object p1

    const-string p2, "GET"

    invoke-static {p1, p2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->doExtensiveHealthChecks:Z

    .line 60
    new-instance p1, Lnicoid/network238/kotlin/collections/ArrayDeque;

    invoke-direct {p1}, Lnicoid/network238/kotlin/collections/ArrayDeque;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->deferredPlans:Lnicoid/network238/kotlin/collections/ArrayDeque;

    return-void
.end method

.method private final createTunnelRequest(Lnicoid/network238/okhttp3/Route;)Lnicoid/network238/okhttp3/Request;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 272
    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    .line 273
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 274
    const-string v1, "CONNECT"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 275
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHostHeader(Lnicoid/network238/okhttp3/HttpUrl;Z)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Host"

    invoke-virtual {v0, v2, v1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 276
    const-string v1, "Proxy-Connection"

    const-string v2, "Keep-Alive"

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 277
    const-string v1, "User-Agent"

    const-string v2, "okhttp/5.5.1"

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 278
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 282
    new-instance v1, Lnicoid/network238/okhttp3/Response$Builder;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/Response$Builder;-><init>()V

    .line 283
    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 284
    sget-object v2, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->protocol(Lnicoid/network238/okhttp3/Protocol;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 285
    const/16 v2, 0x197

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->code(I)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 286
    const-string v2, "Preemptive Authenticate"

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 287
    const-wide/16 v2, -0x1

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 288
    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 289
    const-string v2, "Proxy-Authenticate"

    const-string v3, "OkHttp-Preemptive"

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/Response$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v1

    .line 290
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v1

    .line 293
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Address;->proxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v2

    .line 294
    invoke-interface {v2, p1, v1}, Lnicoid/network238/okhttp3/Authenticator;->authenticate(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Request;

    move-result-object p1

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    return-object p1
.end method

.method public static synthetic planConnectToRoute$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 212
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planConnectToRoute$okhttp(Lnicoid/network238/okhttp3/Route;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object p0

    return-object p0
.end method

.method private final planReuseCallConnection()Lnicoid/network238/okhttp3/internal/connection/ReusePlan;
    .registers 8

    .line 95
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getConnection()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 99
    :cond_0
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->doExtensiveHealthChecks:Z

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->isHealthy(Z)Z

    move-result v2

    .line 355
    monitor-enter v0

    if-nez v2, :cond_1

    .line 105
    :try_start_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getNoNewExchanges()Z

    move-result v2

    const/4 v3, 0x1

    xor-int/2addr v2, v3

    .line 106
    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setNoNewExchanges(Z)V

    .line 107
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->releaseConnectionNoEvents$okhttp()Ljava/net/Socket;

    move-result-object v3

    goto :goto_0

    .line 110
    :cond_1
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getNoNewExchanges()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_2

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->route()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {p0, v2}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->sameHostAndPort(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v3

    move-object v3, v1

    goto :goto_1

    .line 111
    :cond_2
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->releaseConnectionNoEvents$okhttp()Ljava/net/Socket;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v6, v3

    move-object v3, v2

    move v2, v6

    :goto_0
    nop

    .line 355
    :goto_1
    monitor-exit v0

    .line 122
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getConnection()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v4

    if-eqz v4, :cond_4

    if-nez v3, :cond_3

    .line 124
    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;

    invoke-direct {v1, v0}, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V

    return-object v1

    .line 123
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    if-eqz v3, :cond_5

    .line 128
    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 129
    :cond_5
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v4

    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v4, v5, v0}, Lnicoid/network238/okhttp3/EventListener;->connectionReleased(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V

    .line 130
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v4

    iget-object v5, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v4, v0, v5}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionReleased(Lnicoid/network238/okhttp3/Connection;Lnicoid/network238/okhttp3/Call;)V

    if-eqz v3, :cond_6

    .line 132
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v2

    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionClosed(Lnicoid/network238/okhttp3/Connection;)V

    goto :goto_2

    :cond_6
    if-eqz v2, :cond_7

    .line 134
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v2

    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->noNewExchanges(Lnicoid/network238/okhttp3/Connection;)V

    :cond_7
    :goto_2
    return-object v1

    :catchall_0
    move-exception v1

    .line 355
    monitor-exit v0

    throw v1
.end method

.method public static synthetic planReusePooledConnection$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ReusePlan;
    .registers 6

    and-int/lit8 p4, p3, 0x1

    const/4 v0, 0x0

    if-eqz p4, :cond_0

    move-object p1, v0

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    move-object p2, v0

    .line 185
    :cond_1
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planReusePooledConnection$okhttp(Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/connection/ReusePlan;

    move-result-object p0

    return-object p0
.end method

.method private final retryRoute(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)Lnicoid/network238/okhttp3/Route;
    .registers 4

    .line 356
    monitor-enter p1

    .line 335
    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRouteFailureCount$okhttp()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 338
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getNoNewExchanges()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 341
    :cond_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->route()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    .line 342
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    .line 343
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->getAddress()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->canReuseConnectionFor(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-nez v0, :cond_2

    :goto_0
    const/4 v0, 0x0

    goto :goto_1

    .line 345
    :cond_2
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->route()Lnicoid/network238/okhttp3/Route;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 356
    :goto_1
    monitor-exit p1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p1

    throw v0
.end method


# virtual methods
.method public getAddress()Lnicoid/network238/okhttp3/Address;
    .registers 2

    .line 50
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->address:Lnicoid/network238/okhttp3/Address;

    return-object v0
.end method

.method public getDeferredPlans()Lnicoid/network238/kotlin/collections/ArrayDeque;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnicoid/network238/kotlin/collections/ArrayDeque;"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->deferredPlans:Lnicoid/network238/kotlin/collections/ArrayDeque;

    return-object v0
.end method

.method public hasNext(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)Z
    .registers 4

    .line 300
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->getDeferredPlans()Lnicoid/network238/kotlin/collections/ArrayDeque;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    goto :goto_0

    .line 304
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->nextRouteToTry:Lnicoid/network238/okhttp3/Route;

    if-nez v0, :cond_3

    if-eqz p1, :cond_1

    .line 309
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->retryRoute(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)Lnicoid/network238/okhttp3/Route;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 312
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->nextRouteToTry:Lnicoid/network238/okhttp3/Route;

    return v1

    .line 318
    :cond_1
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->routeSelection:Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;->hasNext()Z

    move-result p1

    if-ne p1, v1, :cond_2

    goto :goto_0

    .line 321
    :cond_2
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->routeSelector:Lnicoid/network238/okhttp3/internal/connection/RouteSelector;

    if-nez p1, :cond_4

    :cond_3
    :goto_0
    return v1

    .line 324
    :cond_4
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->hasNext()Z

    move-result p1

    return p1
.end method

.method public isCanceled()Z
    .registers 2

    .line 62
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->isCanceled()Z

    move-result v0

    return v0
.end method

.method public plan()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planReuseCallConnection()Lnicoid/network238/okhttp3/internal/connection/ReusePlan;

    move-result-object v0

    if-nez v0, :cond_2

    .line 70
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-static {p0, v0, v0, v1, v0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planReusePooledConnection$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ReusePlan;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 74
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->getDeferredPlans()Lnicoid/network238/kotlin/collections/ArrayDeque;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->getDeferredPlans()Lnicoid/network238/kotlin/collections/ArrayDeque;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    return-object v0

    .line 77
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planConnect$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoutes$okhttp()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planReusePooledConnection$okhttp(Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/connection/ReusePlan;

    move-result-object v1

    if-eqz v1, :cond_2

    move-object v0, v1

    :cond_2
    :goto_0
    return-object v0
.end method

.method public final planConnect$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->nextRouteToTry:Lnicoid/network238/okhttp3/Route;

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 145
    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->nextRouteToTry:Lnicoid/network238/okhttp3/Route;

    .line 146
    invoke-static {p0, v0, v2, v1, v2}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planConnectToRoute$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object v0

    return-object v0

    .line 150
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->routeSelection:Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;

    if-eqz v0, :cond_1

    .line 151
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 152
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;->next()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-static {p0, v0, v2, v1, v2}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planConnectToRoute$okhttp$default(Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object v0

    return-object v0

    .line 156
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->routeSelector:Lnicoid/network238/okhttp3/internal/connection/RouteSelector;

    if-nez v0, :cond_2

    .line 159
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;

    .line 160
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->getAddress()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    .line 161
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 162
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 163
    iget-boolean v4, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->fastFallback:Z

    .line 159
    invoke-direct {v0, v1, v2, v3, v4}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;-><init>(Lnicoid/network238/okhttp3/Address;Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;Lnicoid/network238/okhttp3/internal/connection/RealCall;Z)V

    .line 165
    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->routeSelector:Lnicoid/network238/okhttp3/internal/connection/RouteSelector;

    .line 169
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 170
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->next()Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;

    move-result-object v0

    .line 171
    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->routeSelection:Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;

    .line 173
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->isCanceled()Z

    move-result v1

    if-nez v1, :cond_3

    .line 175
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;->next()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;->getRoutes()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planConnectToRoute$okhttp(Lnicoid/network238/okhttp3/Route;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object v0

    return-object v0

    .line 173
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Canceled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "exhausted all routes"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final planConnectToRoute$okhttp(Lnicoid/network238/okhttp3/Route;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Route;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;)",
            "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v10, p0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 216
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    if-nez v0, :cond_2

    .line 217
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->connectionSpecs()Ljava/util/List;

    move-result-object v0

    sget-object v1, Lnicoid/network238/okhttp3/ConnectionSpec;->CLEARTEXT:Lnicoid/network238/okhttp3/ConnectionSpec;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 221
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    .line 222
    sget-object v1, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v1

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/internal/platform/Platform;->isCleartextTrafficPermitted(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 223
    :cond_0
    new-instance v1, Ljava/net/UnknownServiceException;

    .line 224
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CLEARTEXT communication to "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " not permitted by network security policy"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 223
    invoke-direct {v1, v0}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 218
    :cond_1
    new-instance v0, Ljava/net/UnknownServiceException;

    const-string v1, "CLEARTEXT communication not enabled for client"

    invoke-direct {v0, v1}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->protocols()Ljava/util/List;

    move-result-object v0

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 235
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/Route;->requiresTunnel()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct/range {p0 .. p1}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->createTunnelRequest(Lnicoid/network238/okhttp3/Route;)Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    move-object v14, v0

    .line 239
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    .line 240
    iget-object v1, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 241
    iget-object v2, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 242
    iget v3, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->readTimeoutMillis:I

    .line 243
    iget v4, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->writeTimeoutMillis:I

    .line 244
    iget v5, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->socketConnectTimeoutMillis:I

    .line 245
    iget v6, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->socketReadTimeoutMillis:I

    .line 246
    iget v7, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->pingIntervalMillis:I

    .line 247
    iget-boolean v8, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->retryOnConnectionFailure:Z

    .line 248
    iget-object v9, v10, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 239
    const/4 v13, 0x0

    const/4 v15, -0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/high16 v18, 0x10000

    const/16 v19, 0x0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    invoke-direct/range {v0 .. v19}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZLnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 229
    :cond_4
    new-instance v0, Ljava/net/UnknownServiceException;

    const-string v1, "H2_PRIOR_KNOWLEDGE cannot be used with HTTPS"

    invoke-direct {v0, v1}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final planReusePooledConnection$okhttp(Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/connection/ReusePlan;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;)",
            "Lnicoid/network238/okhttp3/internal/connection/ReusePlan;"
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 191
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->doExtensiveHealthChecks:Z

    .line 192
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->getAddress()Lnicoid/network238/okhttp3/Address;

    move-result-object v2

    .line 193
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    if-eqz p1, :cond_0

    .line 195
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->isReady()Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    move v5, v4

    .line 190
    move-object v4, p2

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->callAcquirePooledConnection$okhttp(ZLnicoid/network238/okhttp3/Address;Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;Z)Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object p2

    if-nez p2, :cond_1

    const/4 p1, 0x0

    return-object p1

    :cond_1
    if-eqz p1, :cond_2

    .line 201
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->nextRouteToTry:Lnicoid/network238/okhttp3/Route;

    .line 202
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->closeQuietly()V

    .line 205
    :cond_2
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p1, v0, p2}, Lnicoid/network238/okhttp3/EventListener;->connectionAcquired(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V

    .line 206
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p1, p2, v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionAcquired(Lnicoid/network238/okhttp3/Connection;Lnicoid/network238/okhttp3/Call;)V

    .line 207
    new-instance p1, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;

    invoke-direct {p1, p2}, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V

    return-object p1
.end method

.method public sameHostAndPort(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 350
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->getAddress()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    .line 351
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.class public final Lnicoid/network238/okhttp3/internal/connection/RealConnection;
.super Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Connection;
.implements Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;
.implements Lnicoid/network238/okhttp3/internal/concurrent/Lockable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00c8\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0010\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0007\u0018\u0000 r2\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0001rB[\u0008\u0000\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012\u0006\u0010\r\u001a\u00020\u000c\u0012\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\u0006\u0010\u0010\u001a\u00020\u0011\u0012\u0006\u0010\u0012\u001a\u00020\u0013\u0012\u0006\u0010\u0014\u001a\u00020\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u0017\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u0008\u0010$\u001a\u00020CH\u0016J\r\u0010*\u001a\u00020CH\u0000\u00a2\u0006\u0002\u0008DJ\r\u0010E\u001a\u00020CH\u0000\u00a2\u0006\u0002\u0008FJ\u0006\u0010G\u001a\u00020CJ\u0008\u0010H\u001a\u00020CH\u0002J%\u0010I\u001a\u00020%2\u0006\u0010J\u001a\u00020K2\u000e\u0010L\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010MH\u0000\u00a2\u0006\u0002\u0008NJ\u0016\u0010O\u001a\u00020%2\u000c\u0010P\u001a\u0008\u0012\u0004\u0012\u00020\n0MH\u0002J\u0010\u0010Q\u001a\u00020%2\u0006\u0010R\u001a\u00020SH\u0002J\u0018\u0010T\u001a\u00020%2\u0006\u0010R\u001a\u00020S2\u0006\u0010\u000e\u001a\u00020\u000fH\u0002J\u001d\u0010U\u001a\u00020V2\u0006\u0010W\u001a\u00020X2\u0006\u0010Y\u001a\u00020ZH\u0000\u00a2\u0006\u0002\u0008[J\r\u0010\\\u001a\u00020CH\u0000\u00a2\u0006\u0002\u0008]J\u0008\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010^\u001a\u00020CH\u0016J\u0008\u0010\u0012\u001a\u00020\u000cH\u0016J\u000e\u0010_\u001a\u00020%2\u0006\u0010`\u001a\u00020%J\u0010\u0010a\u001a\u00020C2\u0006\u0010b\u001a\u00020cH\u0016J\u0018\u0010d\u001a\u00020C2\u0006\u0010e\u001a\u00020#2\u0006\u0010f\u001a\u00020gH\u0016J\n\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0016J%\u0010h\u001a\u00020C2\u0006\u0010W\u001a\u00020X2\u0006\u0010i\u001a\u00020\n2\u0006\u0010j\u001a\u00020kH\u0000\u00a2\u0006\u0002\u0008lJ\u001a\u0010m\u001a\u00020C2\u0006\u0010n\u001a\u0002082\u0008\u0010o\u001a\u0004\u0018\u00010kH\u0016J\u0008\u0010\u0010\u001a\u00020\u0011H\u0016J\u0008\u0010p\u001a\u00020qH\u0016R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u001bR\u0011\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001dR\u0014\u0010\t\u001a\u00020\nX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010\u001fR\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0016\u001a\u00020\u0017X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008 \u0010!R\u0010\u0010\"\u001a\u0004\u0018\u00010#X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010$\u001a\u00020%X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008&\u0010\'\"\u0004\u0008(\u0010)R\u000e\u0010*\u001a\u00020%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010+\u001a\u00020\u0015X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008,\u0010-\"\u0004\u0008.\u0010/R\u000e\u00100\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00101\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001e\u00103\u001a\u00020\u00152\u0006\u00102\u001a\u00020\u0015@BX\u0080\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00084\u0010-R\u001d\u00105\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002080706\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00089\u0010:R\u001a\u0010;\u001a\u00020<X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008=\u0010>\"\u0004\u0008?\u0010@R\u0014\u0010A\u001a\u00020%8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008B\u0010\'\u00a8\u0006s"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;",
        "Lnicoid/network238/okhttp3/Connection;",
        "Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "connectionPool",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "route",
        "Lnicoid/network238/okhttp3/Route;",
        "rawSocket",
        "Ljava/net/Socket;",
        "javaNetSocket",
        "handshake",
        "Lnicoid/network238/okhttp3/Handshake;",
        "protocol",
        "Lnicoid/network238/okhttp3/Protocol;",
        "socket",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "pingIntervalMillis",
        "",
        "connectionListener",
        "Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;Lnicoid/network238/okhttp3/Route;Ljava/net/Socket;Ljava/net/Socket;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Protocol;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;ILnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V",
        "getTaskRunner",
        "()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "getConnectionPool",
        "()Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "getRoute",
        "()Lnicoid/network238/okhttp3/Route;",
        "getConnectionListener$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;",
        "http2Connection",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection;",
        "noNewExchanges",
        "",
        "getNoNewExchanges",
        "()Z",
        "setNoNewExchanges",
        "(Z)V",
        "noCoalescedConnections",
        "routeFailureCount",
        "getRouteFailureCount$okhttp",
        "()I",
        "setRouteFailureCount$okhttp",
        "(I)V",
        "successCount",
        "refusedStreamCount",
        "value",
        "allocationLimit",
        "getAllocationLimit$okhttp",
        "calls",
        "",
        "Ljava/lang/ref/Reference;",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "getCalls",
        "()Ljava/util/List;",
        "idleAtNs",
        "",
        "getIdleAtNs",
        "()J",
        "setIdleAtNs",
        "(J)V",
        "isMultiplexed",
        "isMultiplexed$okhttp",
        "",
        "noCoalescedConnections$okhttp",
        "incrementSuccessCount",
        "incrementSuccessCount$okhttp",
        "start",
        "startHttp2",
        "isEligible",
        "address",
        "Lnicoid/network238/okhttp3/Address;",
        "routes",
        "",
        "isEligible$okhttp",
        "routeMatchesAny",
        "candidates",
        "supportsUrl",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "certificateSupportHost",
        "newCodec",
        "Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;",
        "client",
        "Lnicoid/network238/okhttp3/OkHttpClient;",
        "chain",
        "Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;",
        "newCodec$okhttp",
        "useAsSocket",
        "useAsSocket$okhttp",
        "cancel",
        "isHealthy",
        "doExtensiveChecks",
        "onStream",
        "stream",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Stream;",
        "onSettings",
        "connection",
        "settings",
        "Lnicoid/network238/okhttp3/internal/http2/Settings;",
        "connectFailed",
        "failedRoute",
        "failure",
        "Ljava/io/IOException;",
        "connectFailed$okhttp",
        "trackFailure",
        "call",
        "e",
        "toString",
        "",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;

.field public static final IDLE_CONNECTION_HEALTHY_NS:J = 0x2540be400L


# instance fields
.field private allocationLimit:I

.field private final calls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/Reference<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            ">;>;"
        }
    .end annotation
.end field

.field private final connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

.field private final connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

.field private final handshake:Lnicoid/network238/okhttp3/Handshake;

.field private http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

.field private idleAtNs:J

.field private final javaNetSocket:Ljava/net/Socket;

.field private noCoalescedConnections:Z

.field private noNewExchanges:Z

.field private final pingIntervalMillis:I

.field private final protocol:Lnicoid/network238/okhttp3/Protocol;

.field private final rawSocket:Ljava/net/Socket;

.field private refusedStreamCount:I

.field private final route:Lnicoid/network238/okhttp3/Route;

.field private routeFailureCount:I

.field private final socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

.field private successCount:I

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->Companion:Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;Lnicoid/network238/okhttp3/Route;Ljava/net/Socket;Ljava/net/Socket;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Protocol;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;ILnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;-><init>()V

    .line 65
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 66
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 67
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->route:Lnicoid/network238/okhttp3/Route;

    .line 69
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 74
    iput-object p5, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    .line 75
    iput-object p6, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->handshake:Lnicoid/network238/okhttp3/Handshake;

    .line 76
    iput-object p7, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->protocol:Lnicoid/network238/okhttp3/Protocol;

    .line 77
    iput-object p8, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    .line 78
    iput p9, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->pingIntervalMillis:I

    .line 79
    iput-object p10, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    .line 117
    const/4 p1, 0x1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->allocationLimit:I

    .line 121
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->calls:Ljava/util/List;

    .line 124
    const-wide p1, 0x7fffffffffffffffL

    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->idleAtNs:J

    return-void
.end method

.method private final certificateSupportHost(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Handshake;)Z
    .registers 5

    .line 263
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object p2

    .line 265
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 266
    sget-object v0, Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p2, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;->verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v1
.end method

.method private final routeMatchesAny(Ljava/util/List;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;)Z"
        }
    .end annotation

    .line 473
    instance-of v0, p1, Ljava/util/Collection;

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 474
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/Route;

    .line 237
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    sget-object v2, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-ne v1, v2, :cond_1

    .line 238
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    if-ne v1, v2, :cond_1

    .line 239
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v0

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private final startHttp2()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 164
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 165
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    instance-of v2, v0, Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    check-cast v0, Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;

    goto :goto_0

    :cond_0
    move-object v0, v3

    :goto_0
    if-nez v0, :cond_1

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/FlowControlListener$None;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/FlowControlListener$None;

    .line 168
    :cond_1
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    const/4 v5, 0x1

    invoke-direct {v2, v5, v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;-><init>(ZLnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V

    .line 169
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v4, v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->socket(Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;

    move-result-object v2

    .line 170
    invoke-virtual {v2, p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->listener(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;

    move-result-object v2

    .line 171
    iget v4, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->pingIntervalMillis:I

    invoke-virtual {v2, v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->pingIntervalMillis(I)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;

    move-result-object v2

    .line 172
    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->flowControlListener(Lnicoid/network238/okhttp3/internal/http2/FlowControlListener;)Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;

    move-result-object v0

    .line 173
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Builder;->build()Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    move-result-object v0

    .line 174
    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    .line 175
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->Companion:Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Companion;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Companion;->getDEFAULT_SETTINGS()Lnicoid/network238/okhttp3/internal/http2/Settings;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getMaxConcurrentStreams()I

    move-result v2

    iput v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->allocationLimit:I

    .line 176
    invoke-static {v0, v1, v5, v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->start$default(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;ZILjava/lang/Object;)V

    return-void
.end method

.method private final supportsUrl(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 5

    .line 476
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 477
    new-instance p1, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Thread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MUST hold lock on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 245
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    .line 247
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v2

    if-eq v1, v2, :cond_1

    goto :goto_1

    .line 251
    :cond_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 256
    :cond_2
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noCoalescedConnections:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->handshake:Lnicoid/network238/okhttp3/Handshake;

    if-eqz v0, :cond_3

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->certificateSupportHost(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Handshake;)Z

    move-result p1

    if-eqz p1, :cond_3

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_3
    :goto_1
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 296
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    return-void
.end method

.method public final connectFailed$okhttp(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Route;Ljava/io/IOException;)V
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 353
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_0

    .line 354
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    .line 355
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->proxySelector()Ljava/net/ProxySelector;

    move-result-object v1

    .line 356
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->uri()Ljava/net/URI;

    move-result-object v0

    .line 357
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    .line 355
    invoke-virtual {v1, v0, v2, p3}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    .line 362
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->getRouteDatabase$okhttp()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    move-result-object p1

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;->failed(Lnicoid/network238/okhttp3/Route;)V

    return-void
.end method

.method public final getAllocationLimit$okhttp()I
    .registers 2

    .line 117
    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->allocationLimit:I

    return v0
.end method

.method public final getCalls()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/ref/Reference<",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            ">;>;"
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->calls:Ljava/util/List;

    return-object v0
.end method

.method public final getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;
    .registers 2

    .line 79
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    return-object v0
.end method

.method public final getConnectionPool()Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;
    .registers 2

    .line 66
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    return-object v0
.end method

.method public final getIdleAtNs()J
    .registers 3

    .line 124
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->idleAtNs:J

    return-wide v0
.end method

.method public final getNoNewExchanges()Z
    .registers 2

    .line 96
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    return v0
.end method

.method public getRoute()Lnicoid/network238/okhttp3/Route;
    .registers 2

    .line 67
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->route:Lnicoid/network238/okhttp3/Route;

    return-object v0
.end method

.method public final getRouteFailureCount$okhttp()I
    .registers 2

    .line 108
    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeFailureCount:I

    return v0
.end method

.method public final getTaskRunner()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    .registers 2

    .line 65
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object v0
.end method

.method public handshake()Lnicoid/network238/okhttp3/Handshake;
    .registers 2

    .line 344
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->handshake:Lnicoid/network238/okhttp3/Handshake;

    return-object v0
.end method

.method public final incrementSuccessCount$okhttp()V
    .registers 2

    .line 468
    monitor-enter p0

    .line 150
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->successCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->successCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 468
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final isEligible$okhttp(Lnicoid/network238/okhttp3/Address;Ljava/util/List;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Address;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 469
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 470
    new-instance p1, Ljava/lang/AssertionError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Thread "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " MUST hold lock on "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 190
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->calls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->allocationLimit:I

    if-ge v0, v1, :cond_6

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    if-nez v0, :cond_6

    .line 193
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Address;->equalsNonHost$okhttp(Lnicoid/network238/okhttp3/Address;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 196
    :cond_1
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    .line 198
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->route()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    .line 199
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    .line 196
    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 210
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-eqz v0, :cond_6

    if-eqz p2, :cond_6

    .line 213
    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeMatchesAny(Ljava/util/List;)Z

    move-result p2

    if-nez p2, :cond_3

    goto :goto_1

    .line 216
    :cond_3
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object p2

    sget-object v0, Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;

    if-eq p2, v0, :cond_4

    goto :goto_1

    .line 217
    :cond_4
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p2

    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->supportsUrl(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result p2

    if-nez p2, :cond_5

    goto :goto_1

    .line 221
    :cond_5
    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->certificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->handshake()Lnicoid/network238/okhttp3/Handshake;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lnicoid/network238/okhttp3/CertificatePinner;->check(Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    :cond_6
    :goto_1
    const/4 p1, 0x0

    return p1
.end method

.method public final isHealthy(Z)Z
    .registers 6

    .line 480
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 481
    new-instance p1, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Thread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MUST NOT hold lock on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 305
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 307
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_4

    .line 308
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_4

    .line 309
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->isInputShutdown()Z

    move-result v2

    if-nez v2, :cond_4

    .line 310
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->isOutputShutdown()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 315
    :cond_1
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-eqz v2, :cond_2

    .line 317
    invoke-virtual {v2, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isHealthy(J)Z

    move-result p1

    return p1

    .line 484
    :cond_2
    monitor-enter p0

    .line 320
    :try_start_0
    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->idleAtNs:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long/2addr v0, v2

    .line 484
    monitor-exit p0

    const-wide v2, 0x2540be400L

    cmp-long v0, v0, v2

    if-ltz v0, :cond_3

    if-eqz p1, :cond_3

    .line 322
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    invoke-static {p1, v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->isHealthy(Ljava/net/Socket;Lnicoid/network238/okio/BufferedSource;)Z

    move-result p1

    return p1

    :cond_3
    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    .line 484
    monitor-exit p0

    throw p1

    :cond_4
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final isMultiplexed$okhttp()Z
    .registers 2

    .line 131
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final newCodec$okhttp(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;)Lnicoid/network238/okhttp3/internal/http/ExchangeCodec;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 274
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    .line 275
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->http2Connection:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-eqz v1, :cond_0

    .line 278
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;

    invoke-direct {v0, p1, p0, p2, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;-><init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)V

    return-object v0

    .line 280
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->readTimeoutMillis()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 281
    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v1

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getReadTimeoutMillis$okhttp()I

    move-result v2

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 282
    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v1

    invoke-interface {v1}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v1

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getWriteTimeoutMillis$okhttp()I

    move-result p2

    int-to-long v2, p2

    invoke-virtual {v1, v2, v3, v4}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 283
    new-instance p2, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    invoke-direct {p2, p1, p0, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;-><init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;)V

    return-object p2
.end method

.method public final noCoalescedConnections$okhttp()V
    .registers 2

    .line 467
    monitor-enter p0

    .line 144
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noCoalescedConnections:Z

    .line 145
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 467
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public noNewExchanges()V
    .registers 2

    .line 466
    monitor-enter p0

    .line 136
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 137
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 466
    monitor-exit p0

    .line 138
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->noNewExchanges(Lnicoid/network238/okhttp3/Connection;)V

    return-void

    :catchall_0
    move-exception v0

    .line 466
    monitor-exit p0

    throw v0
.end method

.method public onSettings(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 485
    monitor-enter p0

    .line 340
    :try_start_0
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getMaxConcurrentStreams()I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->allocationLimit:I

    .line 341
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 485
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onStream(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 331
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->close(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    return-void
.end method

.method public protocol()Lnicoid/network238/okhttp3/Protocol;
    .registers 2

    .line 419
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->protocol:Lnicoid/network238/okhttp3/Protocol;

    return-object v0
.end method

.method public route()Lnicoid/network238/okhttp3/Route;
    .registers 2

    .line 292
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    return-object v0
.end method

.method public final setIdleAtNs(J)V
    .registers 3

    .line 124
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->idleAtNs:J

    return-void
.end method

.method public final setNoNewExchanges(Z)V
    .registers 2

    .line 96
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    return-void
.end method

.method public final setRouteFailureCount$okhttp(I)V
    .registers 2

    .line 108
    iput p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeFailureCount:I

    return-void
.end method

.method public socket()Ljava/net/Socket;
    .registers 2

    .line 299
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    return-object v0
.end method

.method public final start()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->idleAtNs:J

    .line 157
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->protocol:Lnicoid/network238/okhttp3/Protocol;

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    if-eq v0, v1, :cond_0

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    if-eq v0, v1, :cond_0

    return-void

    .line 158
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->startHttp2()V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 422
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Connection{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", proxy="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 423
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v1

    .line 422
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " hostAddress="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 424
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v1

    .line 422
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " cipherSuite="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 425
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->handshake:Lnicoid/network238/okhttp3/Handshake;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Handshake;->cipherSuite()Lnicoid/network238/okhttp3/CipherSuite;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "none"

    .line 422
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " protocol="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 426
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->protocol:Lnicoid/network238/okhttp3/Protocol;

    .line 422
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trackFailure(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/io/IOException;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 486
    monitor-enter p0

    .line 375
    :try_start_0
    instance-of v0, p2, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    .line 377
    move-object v0, p2

    check-cast v0, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;

    iget-object v0, v0, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;->errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    if-ne v0, v2, :cond_0

    .line 379
    iget p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->refusedStreamCount:I

    add-int/2addr p1, v1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->refusedStreamCount:I

    if-le p1, v1, :cond_3

    .line 381
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    xor-int/2addr p1, v1

    .line 382
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 383
    iget p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeFailureCount:I

    add-int/2addr p2, v1

    iput p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeFailureCount:I

    goto :goto_1

    .line 387
    :cond_0
    check-cast p2, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;

    iget-object p2, p2, Lnicoid/network238/okhttp3/internal/http2/StreamResetException;->errorCode:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    if-ne p2, v0, :cond_1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->isCanceled()Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    .line 393
    :cond_1
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    xor-int/2addr p1, v1

    .line 394
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 395
    iget p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeFailureCount:I

    add-int/2addr p2, v1

    iput p2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeFailureCount:I

    goto :goto_1

    .line 398
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->isMultiplexed$okhttp()Z

    move-result v0

    if-eqz v0, :cond_4

    instance-of v0, p2, Lnicoid/network238/okhttp3/internal/http2/ConnectionShutdownException;

    if-nez v0, :cond_4

    .line 412
    :cond_3
    :goto_0
    const/4 p1, 0x0

    goto :goto_1

    .line 399
    :cond_4
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    xor-int/2addr v0, v1

    .line 400
    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 403
    iget v2, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->successCount:I

    if-nez v2, :cond_6

    if-eqz p2, :cond_5

    .line 405
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object p1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    invoke-virtual {p0, p1, v2, p2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->connectFailed$okhttp(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Route;Ljava/io/IOException;)V

    .line 407
    :cond_5
    iget p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeFailureCount:I

    add-int/2addr p1, v1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->routeFailureCount:I

    .line 412
    :cond_6
    move p1, v0

    :goto_1
    sget-object p2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 486
    monitor-exit p0

    if-eqz p1, :cond_7

    .line 415
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->connectionListener:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    invoke-virtual {p1, p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->noNewExchanges(Lnicoid/network238/okhttp3/Connection;)V

    :cond_7
    return-void

    :catchall_0
    move-exception p1

    .line 486
    monitor-exit p0

    throw p1
.end method

.method public final useAsSocket$okhttp()V
    .registers 3

    .line 288
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->javaNetSocket:Ljava/net/Socket;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 289
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->noNewExchanges()V

    return-void
.end method

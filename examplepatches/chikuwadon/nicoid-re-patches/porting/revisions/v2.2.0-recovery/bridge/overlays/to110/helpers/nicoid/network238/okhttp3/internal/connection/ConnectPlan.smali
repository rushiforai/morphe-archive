.class public final Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
.implements Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$Companion;,
        Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$WhenMappings;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00a2\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0007\u0018\u0000 W2\u00020\u00012\u00020\u0002:\u0001WB\u009f\u0001\u0008\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\n\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\u0008\u0012\u0006\u0010\u000c\u001a\u00020\u0008\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0014\u0012\u000e\u0010\u0015\u001a\n\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u0016\u0012\u0006\u0010\u0017\u001a\u00020\u0008\u0012\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0019\u0012\u0006\u0010\u001a\u001a\u00020\u0008\u0012\u0006\u0010\u001b\u001a\u00020\u000e\u0012\n\u0008\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJH\u00109\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u00142\u0008\u0008\u0002\u0010\u0017\u001a\u00020\u00082\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u000e2\n\u0008\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001dH\u0002J\u0008\u0010:\u001a\u00020;H\u0016J\u0008\u0010<\u001a\u00020;H\u0016J\u0008\u0010=\u001a\u00020>H\u0002J\r\u0010?\u001a\u00020;H\u0000\u00a2\u0006\u0002\u0008@J\u0018\u0010A\u001a\u00020>2\u0006\u0010B\u001a\u00020C2\u0006\u0010D\u001a\u00020EH\u0002J\n\u0010F\u001a\u0004\u0018\u00010\u0019H\u0002J#\u0010G\u001a\u00020\u00002\u000c\u0010H\u001a\u0008\u0012\u0004\u0012\u00020E0\u00162\u0006\u0010B\u001a\u00020CH\u0000\u00a2\u0006\u0002\u0008IJ-\u0010J\u001a\u0004\u0018\u00010\u00002\u000c\u0010H\u001a\u0008\u0012\u0004\u0012\u00020E0\u00162\u0006\u0010B\u001a\u00020C2\u0006\u0010K\u001a\u00020LH\u0000\u00a2\u0006\u0002\u0008MJ \u0010N\u001a\u0004\u0018\u00010\u00002\u000c\u0010H\u001a\u0008\u0012\u0004\u0012\u00020E0\u00162\u0006\u0010B\u001a\u00020CH\u0002J\u0008\u0010O\u001a\u000207H\u0016J\u001a\u0010P\u001a\u00020>2\u0006\u0010\u000f\u001a\u00020\u00102\u0008\u0010Q\u001a\u0004\u0018\u00010RH\u0016J\u0008\u0010S\u001a\u00020>H\u0016J\u0008\u0010T\u001a\u00020>H\u0016J\u0008\u0010U\u001a\u00020\u0001H\u0016J\u0006\u0010V\u001a\u00020>R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0013\u001a\u00020\u0014X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008 \u0010!R\u001c\u0010\u0015\u001a\n\u0012\u0004\u0012\u00020\u0014\u0018\u00010\u0016X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010#R\u000e\u0010\u0017\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u001a\u001a\u00020\u0008X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008$\u0010%R\u0014\u0010\u001b\u001a\u00020\u000eX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008&\u0010\'R\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u001dX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010(\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010)\u001a\u0004\u0018\u00010*X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010+\u001a\u0004\u0018\u00010*X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008,\u0010-\"\u0004\u0008.\u0010/R\u0010\u00100\u001a\u0004\u0018\u000101X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u00102\u001a\u0004\u0018\u000103X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00104\u001a\u000205X\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u00106\u001a\u0004\u0018\u000107X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u00108\u001a\u00020\u000e8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u00088\u0010\'\u00a8\u0006X"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;",
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
        "call",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "routePlanner",
        "Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;",
        "route",
        "Lnicoid/network238/okhttp3/Route;",
        "routes",
        "",
        "attempt",
        "tunnelRequest",
        "Lnicoid/network238/okhttp3/Request;",
        "connectionSpecIndex",
        "isTlsFallback",
        "echRetryPlan",
        "Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZLnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;)V",
        "getRoute",
        "()Lnicoid/network238/okhttp3/Route;",
        "getRoutes$okhttp",
        "()Ljava/util/List;",
        "getConnectionSpecIndex$okhttp",
        "()I",
        "isTlsFallback$okhttp",
        "()Z",
        "canceled",
        "rawSocket",
        "Ljava/net/Socket;",
        "javaNetSocket",
        "getJavaNetSocket$okhttp",
        "()Ljava/net/Socket;",
        "setJavaNetSocket$okhttp",
        "(Ljava/net/Socket;)V",
        "handshake",
        "Lnicoid/network238/okhttp3/Handshake;",
        "protocol",
        "Lnicoid/network238/okhttp3/Protocol;",
        "socket",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "connection",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "isReady",
        "copy",
        "connectTcp",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;",
        "connectTlsEtc",
        "connectSocket",
        "",
        "connectTunnel",
        "connectTunnel$okhttp",
        "connectTls",
        "sslSocket",
        "Ljavax/net/ssl/SSLSocket;",
        "connectionSpec",
        "Lnicoid/network238/okhttp3/ConnectionSpec;",
        "createTunnel",
        "planWithCurrentOrInitialConnectionSpec",
        "connectionSpecs",
        "planWithCurrentOrInitialConnectionSpec$okhttp",
        "nextConnectionSpec",
        "sslException",
        "Ljavax/net/ssl/SSLException;",
        "nextConnectionSpec$okhttp",
        "nextCompatibleConnectionSpec",
        "handleSuccess",
        "trackFailure",
        "e",
        "Ljava/io/IOException;",
        "noNewExchanges",
        "cancel",
        "retry",
        "closeQuietly",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$Companion;

.field private static final MAX_TUNNEL_ATTEMPTS:I = 0x15

.field private static final NPE_THROW_WITH_NULL:Ljava/lang/String; = "throw with null exception"


# instance fields
.field private final attempt:I

.field private final call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

.field private volatile canceled:Z

.field private connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

.field private final connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

.field private final connectionSpecIndex:I

.field private final echRetryPlan:Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;

.field private handshake:Lnicoid/network238/okhttp3/Handshake;

.field private final isTlsFallback:Z

.field private javaNetSocket:Ljava/net/Socket;

.field private final pingIntervalMillis:I

.field private protocol:Lnicoid/network238/okhttp3/Protocol;

.field private rawSocket:Ljava/net/Socket;

.field private final readTimeoutMillis:I

.field private final retryOnConnectionFailure:Z

.field private final route:Lnicoid/network238/okhttp3/Route;

.field private final routePlanner:Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;

.field private final routes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;"
        }
    .end annotation
.end field

.field private socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

.field private final socketConnectTimeoutMillis:I

.field private final socketReadTimeoutMillis:I

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

.field private final tunnelRequest:Lnicoid/network238/okhttp3/Request;

.field private final writeTimeoutMillis:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->Companion:Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZLnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
            "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
            "IIIIIZ",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            "Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;",
            "Lnicoid/network238/okhttp3/Route;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;I",
            "Lnicoid/network238/okhttp3/Request;",
            "IZ",
            "Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 65
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 66
    iput p3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->readTimeoutMillis:I

    .line 67
    iput p4, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->writeTimeoutMillis:I

    .line 68
    iput p5, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socketConnectTimeoutMillis:I

    .line 69
    iput p6, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socketReadTimeoutMillis:I

    .line 70
    iput p7, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->pingIntervalMillis:I

    .line 71
    iput-boolean p8, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->retryOnConnectionFailure:Z

    .line 72
    iput-object p9, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 73
    iput-object p10, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routePlanner:Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;

    .line 75
    iput-object p11, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->route:Lnicoid/network238/okhttp3/Route;

    .line 76
    iput-object p12, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routes:Ljava/util/List;

    .line 77
    iput p13, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->attempt:I

    .line 78
    iput-object p14, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->tunnelRequest:Lnicoid/network238/okhttp3/Request;

    .line 79
    iput p15, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionSpecIndex:I

    .line 80
    move/from16 p1, p16

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->isTlsFallback:Z

    .line 81
    move-object/from16 p1, p17

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->echRetryPlan:Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZLnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 39

    const/high16 v0, 0x10000

    and-int v0, p18, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    move-object/from16 v18, v0

    goto :goto_0

    :cond_0
    move-object/from16 v18, p17

    .line 63
    :goto_0
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move/from16 v14, p13

    move-object/from16 v15, p14

    move/from16 v16, p15

    move/from16 v17, p16

    invoke-direct/range {v1 .. v18}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZLnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;)V

    return-void
.end method

.method private final connectSocket()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 271
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    sget-object v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v1, v0

    :goto_0
    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    .line 273
    new-instance v0, Ljava/net/Socket;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    goto :goto_1

    .line 272
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->socketFactory()Ljavax/net/SocketFactory;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 275
    :goto_1
    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->rawSocket:Ljava/net/Socket;

    .line 278
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->canceled:Z

    if-nez v1, :cond_3

    .line 282
    iget v1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socketReadTimeoutMillis:I

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 284
    :try_start_0
    sget-object v1, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v2

    iget v3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socketConnectTimeoutMillis:I

    invoke-virtual {v1, v0, v2, v3}, Lnicoid/network238/okhttp3/internal/platform/Platform;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    :try_end_0
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_1

    .line 296
    :try_start_1
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt;->asBufferedSocket(Ljava/net/Socket;)Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 298
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "throw with null exception"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return-void

    .line 299
    :cond_2
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    .line 286
    new-instance v1, Ljava/net/ConnectException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Failed to connect to "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 287
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 286
    throw v1

    .line 279
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "canceled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final connectTls(Ljavax/net/ssl/SSLSocket;Lnicoid/network238/okhttp3/ConnectionSpec;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 352
    const-string v0, "\n            |Hostname "

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    .line 355
    :try_start_0
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/ConnectionSpec;->supportsTlsExtensions()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 356
    sget-object v2, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v2

    .line 358
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v3

    .line 359
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->protocols()Ljava/util/List;

    move-result-object v4

    .line 360
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Route;->echConfigList()Lnicoid/network238/okio/ByteString;

    move-result-object v5

    .line 356
    invoke-virtual {v2, p1, v3, v4, v5}, Lnicoid/network238/okhttp3/internal/platform/Platform;->configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V

    .line 365
    :cond_0
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 367
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v2

    .line 368
    sget-object v3, Lnicoid/network238/okhttp3/Handshake;->Companion:Lnicoid/network238/okhttp3/Handshake$Companion;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v2}, Lnicoid/network238/okhttp3/Handshake$Companion;->get(Ljavax/net/ssl/SSLSession;)Lnicoid/network238/okhttp3/Handshake;

    move-result-object v3

    .line 371
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x0

    const-string v5, "Hostname "

    if-nez v2, :cond_2

    .line 372
    :try_start_1
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object p2

    .line 373
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 374
    const/4 v2, 0x0

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p2, Ljava/security/cert/X509Certificate;

    .line 375
    new-instance v2, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 376
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 377
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    .line 376
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 377
    const-string v1, " not verified:\n            |    certificate: "

    .line 376
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 378
    sget-object v1, Lnicoid/network238/okhttp3/CertificatePinner;->Companion:Lnicoid/network238/okhttp3/CertificatePinner$Companion;

    invoke-virtual {v1, p2}, Lnicoid/network238/okhttp3/CertificatePinner$Companion;->pin(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v1

    .line 376
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 378
    const-string v1, "\n            |    DN: "

    .line 376
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 379
    invoke-virtual {p2}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v1

    invoke-interface {v1}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v1

    .line 376
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 379
    const-string v1, "\n            |    subjectAltNames: "

    .line 376
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 380
    sget-object v1, Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;

    invoke-virtual {v1, p2}, Lnicoid/network238/okhttp3/internal/tls/OkHostnameVerifier;->allSubjectAltNames(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object p2

    .line 376
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 380
    const-string v0, "\n            "

    .line 376
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 381
    const/4 v0, 0x1

    invoke-static {p2, v4, v0, v4}, Lnicoid/network238/kotlin/text/StringsKt;->trimMargin$default(Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 375
    invoke-direct {v2, p2}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 384
    :cond_1
    new-instance p2, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 385
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " not verified (no certificates)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 384
    invoke-direct {p2, v0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 388
    :cond_2
    sget-object v0, Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;->INSTANCE:Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;

    invoke-virtual {v0, v3}, Lnicoid/network238/okhttp3/internal/tls/CertificateBlocklist;->isBlocklisted(Lnicoid/network238/okhttp3/Handshake;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 394
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->certificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 397
    new-instance v2, Lnicoid/network238/okhttp3/Handshake;

    .line 398
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Handshake;->tlsVersion()Lnicoid/network238/okhttp3/TlsVersion;

    move-result-object v5

    .line 399
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Handshake;->cipherSuite()Lnicoid/network238/okhttp3/CipherSuite;

    move-result-object v6

    .line 400
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Handshake;->localCertificates()Ljava/util/List;

    move-result-object v7

    .line 396
    new-instance v8, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;

    invoke-direct {v8, v0, v3, v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$0;-><init>(Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Address;)V

    .line 397
    invoke-direct {v2, v5, v6, v7, v8}, Lnicoid/network238/okhttp3/Handshake;-><init>(Lnicoid/network238/okhttp3/TlsVersion;Lnicoid/network238/okhttp3/CipherSuite;Ljava/util/List;Lnicoid/network238/kotlin/jvm/functions/Function0;)V

    .line 407
    iput-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->handshake:Lnicoid/network238/okhttp3/Handshake;

    .line 410
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$1;

    invoke-direct {v3, v2}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan$1;-><init>(Lnicoid/network238/okhttp3/Handshake;)V

    invoke-virtual {v0, v1, v3}, Lnicoid/network238/okhttp3/CertificatePinner;->check$okhttp(Ljava/lang/String;Lnicoid/network238/kotlin/jvm/functions/Function0;)V

    .line 416
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/ConnectionSpec;->supportsTlsExtensions()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 417
    sget-object p2, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object p2

    invoke-virtual {p2, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    move-result-object v4

    :cond_3
    nop

    .line 421
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    .line 422
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt;->asBufferedSocket(Ljava/net/Socket;)Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p2

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    if-eqz v4, :cond_4

    .line 423
    sget-object p2, Lnicoid/network238/okhttp3/Protocol;->Companion:Lnicoid/network238/okhttp3/Protocol$Companion;

    invoke-virtual {p2, v4}, Lnicoid/network238/okhttp3/Protocol$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/Protocol;

    move-result-object p2

    goto :goto_0

    :cond_4
    sget-object p2, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    :goto_0
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->protocol:Lnicoid/network238/okhttp3/Protocol;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 426
    sget-object p2, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object p2

    invoke-virtual {p2, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    return-void

    .line 389
    :cond_5
    :try_start_2
    new-instance p2, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 390
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " not verified (blocklisted by OkHttp)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 389
    invoke-direct {p2, v0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p2

    .line 426
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    .line 428
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    throw p2
.end method

.method static final connectTls$lambda$0(Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Address;)Ljava/util/List;
    .registers 3

    .line 402
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CertificatePinner;->getCertificateChainCleaner$okhttp()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 403
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object p1

    .line 404
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p2

    .line 402
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;->clean(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static final connectTls$lambda$1(Lnicoid/network238/okhttp3/Handshake;)Ljava/util/List;
    .registers 3

    .line 411
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Handshake;->peerCertificates()Ljava/util/List;

    move-result-object p0

    .line 636
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 637
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 638
    check-cast v1, Ljava/security/cert/Certificate;

    .line 411
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 638
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private final copy(Lnicoid/network238/okhttp3/Route;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
    .registers 26

    .line 114
    move-object/from16 v0, p0

    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    .line 115
    iget-object v2, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 116
    iget-object v3, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 117
    iget v4, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->readTimeoutMillis:I

    .line 118
    iget v5, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->writeTimeoutMillis:I

    .line 119
    iget v6, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socketConnectTimeoutMillis:I

    .line 120
    iget v7, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socketReadTimeoutMillis:I

    .line 121
    iget v8, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->pingIntervalMillis:I

    .line 122
    iget-boolean v9, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->retryOnConnectionFailure:Z

    .line 123
    iget-object v10, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 124
    iget-object v11, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routePlanner:Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;

    .line 126
    iget-object v13, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routes:Ljava/util/List;

    .line 114
    move-object/from16 v12, p1

    move/from16 v14, p2

    move-object/from16 v15, p3

    move/from16 v16, p4

    move/from16 v17, p5

    move-object/from16 v18, p6

    invoke-direct/range {v1 .. v18}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZLnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;)V

    return-object v1
.end method

.method static synthetic copy$default(Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Lnicoid/network238/okhttp3/Route;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
    .registers 9

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    .line 107
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object p1

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    .line 108
    iget p2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->attempt:I

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    .line 109
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->tunnelRequest:Lnicoid/network238/okhttp3/Request;

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    .line 110
    iget p4, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionSpecIndex:I

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    .line 111
    iget-boolean p5, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->isTlsFallback:Z

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    .line 112
    iget-object p6, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->echRetryPlan:Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;

    move-object p8, p6

    goto :goto_0

    .line 111
    :cond_5
    move-object p8, p6

    .line 106
    :goto_0
    move p6, p4

    move p7, p5

    move p4, p2

    move-object p5, p3

    move-object p2, p0

    move-object p3, p1

    invoke-direct/range {p2 .. p8}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->copy(Lnicoid/network238/okhttp3/Route;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object p0

    return-object p0
.end method

.method private final createTunnel()Lnicoid/network238/okhttp3/Request;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 439
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->tunnelRequest:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 441
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    .line 442
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CONNECT "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-static {v1, v3}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHostHeader(Lnicoid/network238/okhttp3/HttpUrl;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " HTTP/1.1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 445
    :goto_0
    new-instance v2, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;

    .line 449
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    const-string v5, "socket"

    const/4 v6, 0x0

    if-nez v4, :cond_0

    invoke-static {v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v6

    .line 445
    :cond_0
    invoke-direct {v2, v6, p0, v4}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;-><init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/internal/http/ExchangeCodec$Carrier;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;)V

    .line 451
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    if-nez v4, :cond_1

    invoke-static {v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v6

    :cond_1
    invoke-interface {v4}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v4

    invoke-interface {v4}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v4

    iget v7, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->readTimeoutMillis:I

    int-to-long v7, v7

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v7, v8, v9}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 452
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    if-nez v4, :cond_2

    invoke-static {v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v4, v6

    :cond_2
    invoke-interface {v4}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v4

    invoke-interface {v4}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v4

    iget v5, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->writeTimeoutMillis:I

    int-to-long v7, v5

    invoke-virtual {v4, v7, v8, v9}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    .line 453
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v4

    invoke-virtual {v2, v4, v1}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->writeRequest(Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;)V

    .line 454
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->finishRequest()V

    .line 457
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->readResponseHeaders(Z)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 458
    invoke-virtual {v4, v0}, Lnicoid/network238/okhttp3/Response$Builder;->request(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 459
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    .line 460
    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/http1/Http1ExchangeCodec;->skipConnectBody(Lnicoid/network238/okhttp3/Response;)V

    .line 462
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v2

    const/16 v4, 0xc8

    if-eq v2, v4, :cond_6

    const/16 v4, 0x197

    if-ne v2, v4, :cond_5

    .line 468
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Address;->proxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v4

    invoke-interface {v2, v4, v0}, Lnicoid/network238/okhttp3/Authenticator;->authenticate(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Request;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 471
    const-string v4, "Connection"

    const/4 v5, 0x2

    invoke-static {v0, v4, v6, v5, v6}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "close"

    invoke-static {v4, v0, v3}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    return-object v2

    :cond_3
    move-object v0, v2

    goto/16 :goto_0

    .line 469
    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Failed to authenticate with proxy"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 477
    :cond_5
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unexpected response code for CONNECT: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_6
    return-object v6
.end method

.method private final nextCompatibleConnectionSpec(Ljava/util/List;Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;",
            "Ljavax/net/ssl/SSLSocket;",
            ")",
            "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;"
        }
    .end annotation

    .line 556
    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionSpecIndex:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    move v7, v0

    :goto_0
    if-ge v7, v2, :cond_2

    .line 557
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/ConnectionSpec;

    invoke-virtual {v0, p2}, Lnicoid/network238/okhttp3/ConnectionSpec;->isCompatible(Ljavax/net/ssl/SSLSocket;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 558
    iget p1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionSpecIndex:I

    const/4 p2, -0x1

    if-ne p1, p2, :cond_0

    const/4 v1, 0x0

    :cond_0
    move v8, v1

    const/16 v10, 0x27

    const/4 v11, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x0

    move-object v3, p0

    invoke-static/range {v3 .. v11}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->copy$default(Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Lnicoid/network238/okhttp3/Route;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object p1

    return-object p1

    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 598
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->canceled:Z

    .line 600
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->rawSocket:Ljava/net/Socket;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    :cond_0
    return-void
.end method

.method public final closeQuietly()V
    .registers 2

    .line 625
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    if-eqz v0, :cond_0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    :cond_0
    return-void
.end method

.method public connectTcp()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 15

    .line 135
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->rawSocket:Ljava/net/Socket;

    if-nez v0, :cond_3

    .line 140
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 142
    const/4 v1, 0x0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v3

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v4}, Lnicoid/network238/okhttp3/EventListener;->connectStart(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 143
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v2, v3}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectStart(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Call;)V

    .line 145
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectSocket()V

    .line 147
    const/4 v1, 0x1

    new-instance v2, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    const/4 v6, 0x6

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    return-object v2

    :catch_0
    move-exception v0

    move-object v7, v0

    .line 150
    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->proxy()Ljava/net/Proxy;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v2, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v2, :cond_0

    .line 151
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->proxySelector()Ljava/net/ProxySelector;

    move-result-object v0

    .line 152
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/HttpUrl;->uri()Ljava/net/URI;

    move-result-object v2

    .line 153
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v3

    .line 151
    invoke-virtual {v0, v2, v3, v7}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    .line 157
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v2

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v4

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Lnicoid/network238/okhttp3/EventListener;->connectFailed(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;Ljava/io/IOException;)V

    .line 158
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v2, v3, v7}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectFailed(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 159
    new-instance v8, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    const/4 v12, 0x2

    const/4 v13, 0x0

    const/4 v10, 0x0

    move-object v9, p0

    move-object v11, v7

    invoke-direct/range {v8 .. v13}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    if-nez v1, :cond_1

    .line 163
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->rawSocket:Ljava/net/Socket;

    if-eqz v0, :cond_1

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    :cond_1
    return-object v8

    :catchall_0
    move-exception v0

    .line 161
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v2

    invoke-interface {v2, p0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    if-nez v1, :cond_2

    .line 163
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->rawSocket:Ljava/net/Socket;

    if-eqz v1, :cond_2

    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    :cond_2
    throw v0

    .line 135
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "TCP already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public connectTlsEtc()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 17

    .line 169
    move-object/from16 v1, p0

    iget-object v6, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->rawSocket:Ljava/net/Socket;

    if-eqz v6, :cond_e

    .line 170
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->isReady()Z

    move-result v0

    if-nez v0, :cond_d

    .line 172
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->connectionSpecs()Ljava/util/List;

    move-result-object v2

    .line 177
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 179
    const/4 v13, 0x0

    const/4 v14, 0x0

    :try_start_0
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->tunnelRequest:Lnicoid/network238/okhttp3/Request;

    if-eqz v0, :cond_2

    .line 180
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectTunnel$okhttp()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    move-result-object v0

    .line 183
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->getNextPlan()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    move-result-object v3

    if-nez v3, :cond_0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;->getThrowable()Ljava/lang/Throwable;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v3, :cond_0

    goto :goto_0

    .line 259
    :cond_0
    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 261
    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    if-eqz v2, :cond_1

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 262
    :cond_1
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    return-object v0

    .line 188
    :cond_2
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 v15, 0x1

    const-string v3, "socket"

    if-eqz v0, :cond_6

    .line 193
    :try_start_2
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    if-nez v0, :cond_3

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v13

    :cond_3
    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSource()Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    if-nez v0, :cond_4

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v13

    :cond_4
    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;->getSink()Lnicoid/network238/okio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 197
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v4, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v4}, Lnicoid/network238/okhttp3/EventListener;->secureConnectStart(Lnicoid/network238/okhttp3/Call;)V

    .line 201
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 203
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v4

    .line 204
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v5

    .line 201
    invoke-virtual {v0, v6, v4, v5, v15}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v4, v0

    check-cast v4, Ljavax/net/ssl/SSLSocket;

    .line 209
    invoke-virtual {v1, v2, v4}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->planWithCurrentOrInitialConnectionSpec$okhttp(Ljava/util/List;Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object v5

    .line 210
    iget v0, v5, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionSpecIndex:I

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/ConnectionSpec;

    .line 212
    iget-boolean v7, v5, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->isTlsFallback:Z

    invoke-virtual {v0, v4, v7}, Lnicoid/network238/okhttp3/ConnectionSpec;->apply$okhttp(Ljavax/net/ssl/SSLSocket;Z)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 214
    :try_start_3
    invoke-direct {v1, v4, v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectTls(Ljavax/net/ssl/SSLSocket;Lnicoid/network238/okhttp3/ConnectionSpec;)V
    :try_end_3
    .catch Ljavax/net/ssl/SSLException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 219
    :try_start_4
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    iget-object v4, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->handshake:Lnicoid/network238/okhttp3/Handshake;

    invoke-virtual {v0, v2, v4}, Lnicoid/network238/okhttp3/EventListener;->secureConnectEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Handshake;)V

    goto :goto_2

    :catch_0
    move-exception v0

    .line 216
    invoke-virtual {v5, v2, v4, v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->nextConnectionSpec$okhttp(Ljava/util/List;Ljavax/net/ssl/SSLSocket;Ljavax/net/ssl/SSLException;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object v13

    .line 217
    throw v0

    .line 194
    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v2, "TLS tunnel buffered too many bytes!"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_6
    iput-object v6, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    .line 224
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->protocols()Ljava/util/List;

    move-result-object v0

    sget-object v2, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_1

    .line 225
    :cond_7
    sget-object v2, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    .line 222
    :goto_1
    iput-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->protocol:Lnicoid/network238/okhttp3/Protocol;

    .line 230
    :goto_2
    new-instance v2, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 231
    move-object v0, v3

    iget-object v3, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 232
    iget-object v4, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 233
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v5

    .line 235
    iget-object v7, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 236
    iget-object v8, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->handshake:Lnicoid/network238/okhttp3/Handshake;

    .line 237
    iget-object v9, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->protocol:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 238
    iget-object v10, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socket:Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    if-nez v10, :cond_8

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v10, v13

    .line 239
    :cond_8
    iget v11, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->pingIntervalMillis:I

    .line 240
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v12

    .line 230
    invoke-direct/range {v2 .. v12}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;Lnicoid/network238/okhttp3/Route;Ljava/net/Socket;Ljava/net/Socket;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Protocol;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;ILnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V

    .line 242
    iput-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 243
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->start()V

    .line 246
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v3

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v4

    iget-object v5, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->protocol:Lnicoid/network238/okhttp3/Protocol;

    invoke-virtual {v0, v2, v3, v4, v5}, Lnicoid/network238/okhttp3/EventListener;->connectEnd(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 248
    :try_start_5
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 259
    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    return-object v0

    .line 262
    :catchall_0
    move-exception v0

    move v14, v15

    goto :goto_4

    .line 259
    :catch_1
    move-exception v0

    move-object v12, v0

    move v14, v15

    goto :goto_3

    :catch_2
    move-exception v0

    move-object v12, v0

    .line 250
    :goto_3
    :try_start_6
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v7

    iget-object v8, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v9

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual/range {v7 .. v12}, Lnicoid/network238/okhttp3/EventListener;->connectFailed(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;Ljava/io/IOException;)V

    .line 251
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    iget-object v3, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v2, v3, v12}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectFailed(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 253
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    invoke-direct {v0, v1, v13, v12}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 259
    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    if-nez v14, :cond_a

    .line 261
    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    if-eqz v2, :cond_9

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 262
    :cond_9
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    :cond_a
    return-object v0

    :catchall_1
    move-exception v0

    .line 259
    :goto_4
    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getPlansToCancel$okhttp()Ljava/util/concurrent/CopyOnWriteArrayList;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    if-nez v14, :cond_c

    .line 261
    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    if-eqz v2, :cond_b

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 262
    :cond_b
    invoke-static {v6}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    :cond_c
    throw v0

    .line 170
    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "already connected"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "TCP not connected"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final connectTunnel$okhttp()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 314
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->createTunnel()Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    if-nez v3, :cond_0

    .line 315
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 319
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->rawSocket:Ljava/net/Socket;

    if-eqz v0, :cond_1

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->closeQuietly(Ljava/net/Socket;)V

    .line 321
    :cond_1
    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->attempt:I

    add-int/lit8 v2, v0, 0x1

    const/16 v0, 0x15

    if-ge v2, v0, :cond_2

    .line 324
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v5

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v0, v4, v5, v6, v7}, Lnicoid/network238/okhttp3/EventListener;->connectEnd(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;)V

    .line 325
    new-instance v9, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    .line 328
    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v7, 0x39

    const/4 v8, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v8}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->copy$default(Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Lnicoid/network238/okhttp3/Route;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object v2

    .line 325
    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x0

    move-object v1, p0

    move-object v0, v9

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 337
    :cond_2
    new-instance v3, Ljava/net/ProtocolException;

    const-string v0, "Too many tunnel connections attempted: 21"

    invoke-direct {v3, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 340
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v2

    move-object v7, v3

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v4

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Lnicoid/network238/okhttp3/EventListener;->connectFailed(Lnicoid/network238/okhttp3/Call;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Protocol;Ljava/io/IOException;)V

    .line 341
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v2, v3, v7}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectFailed(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V

    .line 342
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v1, p0

    move-object v3, v7

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final getConnectionSpecIndex$okhttp()I
    .registers 2

    .line 79
    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionSpecIndex:I

    return v0
.end method

.method public final getJavaNetSocket$okhttp()Ljava/net/Socket;
    .registers 2

    .line 96
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    return-object v0
.end method

.method public getRoute()Lnicoid/network238/okhttp3/Route;
    .registers 2

    .line 75
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->route:Lnicoid/network238/okhttp3/Route;

    return-object v0
.end method

.method public final getRoutes$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;"
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routes:Ljava/util/List;

    return-object v0
.end method

.method public handleSuccess()Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 5

    .line 566
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->getRouteDatabase$okhttp()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;->connected(Lnicoid/network238/okhttp3/Route;)V

    .line 568
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 569
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v2

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1, v0, v2, v3}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectEnd(Lnicoid/network238/okhttp3/Connection;Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Call;)V

    .line 573
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routePlanner:Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routes:Ljava/util/List;

    invoke-virtual {v1, p0, v2}, Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;->planReusePooledConnection$okhttp(Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Ljava/util/List;)Lnicoid/network238/okhttp3/internal/connection/ReusePlan;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 574
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->getConnection()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v0

    return-object v0

    .line 635
    :cond_0
    monitor-enter v0

    .line 577
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->put(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V

    .line 578
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->acquireConnectionNoEvents(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V

    .line 579
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 635
    monitor-exit v0

    .line 581
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1, v2, v0}, Lnicoid/network238/okhttp3/EventListener;->connectionAcquired(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Connection;)V

    .line 582
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1, v0, v2}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->connectionAcquired(Lnicoid/network238/okhttp3/Connection;Lnicoid/network238/okhttp3/Call;)V

    return-object v0

    :catchall_0
    move-exception v1

    .line 635
    monitor-exit v0

    throw v1
.end method

.method public isReady()Z
    .registers 2

    .line 104
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->protocol:Lnicoid/network238/okhttp3/Protocol;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final isTlsFallback$okhttp()Z
    .registers 2

    .line 80
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->isTlsFallback:Z

    return v0
.end method

.method public final nextConnectionSpec$okhttp(Ljava/util/List;Ljavax/net/ssl/SSLSocket;Ljavax/net/ssl/SSLException;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;",
            "Ljavax/net/ssl/SSLSocket;",
            "Ljavax/net/ssl/SSLException;",
            ")",
            "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 512
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->echRetryPlan:Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 514
    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    invoke-virtual {v0, p3}, Lnicoid/network238/okhttp3/internal/platform/Platform;->echRetryPlan(Ljavax/net/ssl/SSLException;)Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 519
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 520
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;->getPublicName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 529
    new-instance v2, Lnicoid/network238/okhttp3/Route;

    .line 530
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object p1

    .line 531
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object p2

    .line 532
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object p3

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object p3

    .line 533
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;->getConfigList()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    .line 529
    invoke-direct {v2, p1, p2, p3, v0}, Lnicoid/network238/okhttp3/Route;-><init>(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lnicoid/network238/okio/ByteString;)V

    .line 527
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v8, 0x1e

    const/4 v9, 0x0

    move-object v1, p0

    invoke-static/range {v1 .. v9}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->copy$default(Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;Lnicoid/network238/okhttp3/Route;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object p1

    return-object p1

    .line 521
    :cond_1
    new-instance p1, Lnicoid/network238/okhttp3/internal/ech/EchUntrustedException;

    .line 522
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "public_name \'"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;->getPublicName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "\' not verified"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 521
    invoke-direct {p1, p2, p3}, Lnicoid/network238/okhttp3/internal/ech/EchUntrustedException;-><init>(Ljava/lang/String;Ljavax/net/ssl/SSLException;)V

    throw p1

    .line 540
    :cond_2
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->retryOnConnectionFailure:Z

    if-nez v0, :cond_3

    goto :goto_0

    .line 543
    :cond_3
    invoke-static {p3}, Lnicoid/network238/okhttp3/internal/connection/RetryTlsHandshakeKt;->attemptAnotherConnectionSpec(Ljava/io/IOException;)Z

    move-result p3

    if-nez p3, :cond_4

    :goto_0
    const/4 p1, 0x0

    return-object p1

    .line 545
    :cond_4
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->nextCompatibleConnectionSpec(Ljava/util/List;Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object p1

    return-object p1
.end method

.method public noNewExchanges()V
    .registers 1

    return-void
.end method

.method public final planWithCurrentOrInitialConnectionSpec$okhttp(Ljava/util/List;Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;",
            "Ljavax/net/ssl/SSLSocket;",
            ")",
            "Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 492
    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionSpecIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return-object p0

    .line 493
    :cond_0
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->nextCompatibleConnectionSpec(Ljava/util/List;Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    move-result-object v0

    if-eqz v0, :cond_1

    return-object v0

    .line 494
    :cond_1
    new-instance v0, Ljava/net/UnknownServiceException;

    .line 495
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unable to find acceptable protocols. isFallback="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 496
    iget-boolean v2, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->isTlsFallback:Z

    .line 495
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", modes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ", supported protocols="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 498
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 495
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 494
    invoke-direct {v0, p1}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public retry()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .registers 21

    .line 604
    move-object/from16 v0, p0

    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;

    .line 605
    iget-object v2, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 606
    iget-object v3, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionPool:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 607
    iget v4, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->readTimeoutMillis:I

    .line 608
    iget v5, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->writeTimeoutMillis:I

    .line 609
    iget v6, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socketConnectTimeoutMillis:I

    .line 610
    iget v7, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->socketReadTimeoutMillis:I

    .line 611
    iget v8, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->pingIntervalMillis:I

    .line 612
    iget-boolean v9, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->retryOnConnectionFailure:Z

    .line 613
    iget-object v10, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 614
    iget-object v11, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routePlanner:Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;

    .line 615
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->getRoute()Lnicoid/network238/okhttp3/Route;

    move-result-object v12

    .line 616
    iget-object v13, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->routes:Ljava/util/List;

    .line 617
    iget v14, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->attempt:I

    .line 618
    iget-object v15, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->tunnelRequest:Lnicoid/network238/okhttp3/Request;

    .line 619
    move-object/from16 v16, v1

    iget v1, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->connectionSpecIndex:I

    .line 620
    move/from16 v17, v1

    iget-boolean v1, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->isTlsFallback:Z

    .line 621
    move/from16 v18, v1

    iget-object v1, v0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->echRetryPlan:Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;

    .line 604
    move/from16 v19, v18

    move-object/from16 v18, v1

    move-object/from16 v1, v16

    move/from16 v16, v17

    move/from16 v17, v19

    invoke-direct/range {v1 .. v18}, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;IIIIIZLnicoid/network238/okhttp3/internal/connection/RealCall;Lnicoid/network238/okhttp3/internal/connection/RealRoutePlanner;Lnicoid/network238/okhttp3/Route;Ljava/util/List;ILnicoid/network238/okhttp3/Request;IZLnicoid/network238/okhttp3/internal/ech/EchRetryPlan;)V

    move-object/from16 v16, v1

    return-object v16
.end method

.method public final setJavaNetSocket$okhttp(Ljava/net/Socket;)V
    .registers 2

    .line 96
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/ConnectPlan;->javaNetSocket:Ljava/net/Socket;

    return-void
.end method

.method public trackFailure(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/io/IOException;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

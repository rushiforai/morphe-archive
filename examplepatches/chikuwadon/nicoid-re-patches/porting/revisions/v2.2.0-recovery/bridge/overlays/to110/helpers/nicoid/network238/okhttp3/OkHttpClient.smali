.class public Lnicoid/network238/okhttp3/OkHttpClient;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Call$Factory;
.implements Lnicoid/network238/okhttp3/WebSocket$Factory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/OkHttpClient$Builder;,
        Lnicoid/network238/okhttp3/OkHttpClient$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00fa\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u001e\u0008\u0016\u0018\u0000 \u0084\u00012\u00020\u00012\u00020\u0002:\u0004\u0083\u0001\u0084\u0001B\u0011\u0008\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0007J\u000e\u0010Z\u001a\u00020[2\u0006\u0010\\\u001a\u00020]J\u0008\u0010^\u001a\u00020_H\u0002J\u0010\u0010`\u001a\u00020a2\u0006\u0010b\u001a\u00020cH\u0016J\u0018\u0010d\u001a\u00020e2\u0006\u0010b\u001a\u00020c2\u0006\u0010f\u001a\u00020gH\u0016J\u0008\u0010h\u001a\u00020\u0004H\u0016J\r\u0010\u0008\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0008iJ\r\u0010W\u001a\u00020XH\u0007\u00a2\u0006\u0002\u0008jJ\u0013\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000cH\u0007\u00a2\u0006\u0002\u0008kJ\u0013\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000cH\u0007\u00a2\u0006\u0002\u0008lJ\r\u0010\u0010\u001a\u00020\u0011H\u0007\u00a2\u0006\u0002\u0008mJ\r\u0010\u0013\u001a\u00020\u0014H\u0007\u00a2\u0006\u0002\u0008nJ\r\u0010\u0017\u001a\u00020\u0018H\u0007\u00a2\u0006\u0002\u0008oJ\r\u0010\u001a\u001a\u00020\u0014H\u0007\u00a2\u0006\u0002\u0008pJ\r\u0010\u001b\u001a\u00020\u0014H\u0007\u00a2\u0006\u0002\u0008qJ\r\u0010\u001c\u001a\u00020\u001dH\u0007\u00a2\u0006\u0002\u0008rJ\u000f\u0010\u001f\u001a\u0004\u0018\u00010 H\u0007\u00a2\u0006\u0002\u0008sJ\r\u0010\"\u001a\u00020#H\u0007\u00a2\u0006\u0002\u0008tJ\u000f\u0010%\u001a\u0004\u0018\u00010&H\u0007\u00a2\u0006\u0002\u0008uJ\r\u0010(\u001a\u00020)H\u0007\u00a2\u0006\u0002\u0008vJ\r\u0010+\u001a\u00020\u0018H\u0007\u00a2\u0006\u0002\u0008wJ\r\u0010,\u001a\u00020-H\u0007\u00a2\u0006\u0002\u0008xJ\r\u00103\u001a\u000200H\u0007\u00a2\u0006\u0002\u0008yJ\u0013\u00107\u001a\u0008\u0012\u0004\u0012\u0002080\u000cH\u0007\u00a2\u0006\u0002\u0008zJ\u0013\u00109\u001a\u0008\u0012\u0004\u0012\u00020:0\u000cH\u0007\u00a2\u0006\u0002\u0008{J\r\u0010;\u001a\u00020<H\u0007\u00a2\u0006\u0002\u0008|J\r\u0010>\u001a\u00020?H\u0007\u00a2\u0006\u0002\u0008}J\r\u0010D\u001a\u00020EH\u0007\u00a2\u0006\u0002\u0008~J\r\u0010G\u001a\u00020EH\u0007\u00a2\u0006\u0002\u0008\u007fJ\u000e\u0010H\u001a\u00020EH\u0007\u00a2\u0006\u0003\u0008\u0080\u0001J\u000e\u0010I\u001a\u00020EH\u0007\u00a2\u0006\u0003\u0008\u0081\u0001J\u000e\u0010J\u001a\u00020EH\u0007\u00a2\u0006\u0003\u0008\u0082\u0001R\u0013\u0010\u0008\u001a\u00020\t8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\nR\u0019\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000eR\u0019\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000eR\u0013\u0010\u0010\u001a\u00020\u00118\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0012R\u0013\u0010\u0013\u001a\u00020\u00148\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0015R\u0013\u0010\u0016\u001a\u00020\u00148\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0015R\u0013\u0010\u0017\u001a\u00020\u00188\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0019R\u0013\u0010\u001a\u001a\u00020\u00148\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u0015R\u0013\u0010\u001b\u001a\u00020\u00148\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u0015R\u0013\u0010\u001c\u001a\u00020\u001d8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001eR\u0015\u0010\u001f\u001a\u0004\u0018\u00010 8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010!R\u0013\u0010\"\u001a\u00020#8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\"\u0010$R\u0015\u0010%\u001a\u0004\u0018\u00010&8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010\'R\u0013\u0010(\u001a\u00020)8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008(\u0010*R\u0013\u0010+\u001a\u00020\u00188\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008+\u0010\u0019R\u0013\u0010,\u001a\u00020-8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008,\u0010.R\u0016\u0010/\u001a\u0004\u0018\u000100X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00081\u00102R\u0011\u00103\u001a\u0002008G\u00a2\u0006\u0006\u001a\u0004\u00083\u00102R\u0015\u00104\u001a\u0004\u0018\u0001058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00084\u00106R\u0019\u00107\u001a\u0008\u0012\u0004\u0012\u0002080\u000c8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00087\u0010\u000eR\u0019\u00109\u001a\u0008\u0012\u0004\u0012\u00020:0\u000c8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00089\u0010\u000eR\u0013\u0010;\u001a\u00020<8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008;\u0010=R\u0013\u0010>\u001a\u00020?8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008>\u0010@R\u0015\u0010A\u001a\u0004\u0018\u00010B8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008A\u0010CR\u0013\u0010D\u001a\u00020E8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008D\u0010FR\u0013\u0010G\u001a\u00020E8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008G\u0010FR\u0013\u0010H\u001a\u00020E8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008H\u0010FR\u0013\u0010I\u001a\u00020E8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008I\u0010FR\u0013\u0010J\u001a\u00020E8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008J\u0010FR\u0013\u0010K\u001a\u00020E8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008K\u0010FR\u0013\u0010L\u001a\u00020M8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008L\u0010NR\u0014\u0010O\u001a\u00020PX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008Q\u0010RR\u0014\u0010S\u001a\u00020TX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008U\u0010VR\u0013\u0010W\u001a\u00020X8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008W\u0010Y\u00a8\u0006\u0085\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/OkHttpClient;",
        "Lnicoid/network238/okhttp3/Call$Factory;",
        "Lnicoid/network238/okhttp3/WebSocket$Factory;",
        "builder",
        "Lnicoid/network238/okhttp3/OkHttpClient$Builder;",
        "<init>",
        "(Lnicoid/network238/okhttp3/OkHttpClient$Builder;)V",
        "()V",
        "dispatcher",
        "Lnicoid/network238/okhttp3/Dispatcher;",
        "()Lnicoid/network238/okhttp3/Dispatcher;",
        "interceptors",
        "",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "()Ljava/util/List;",
        "networkInterceptors",
        "eventListenerFactory",
        "Lnicoid/network238/okhttp3/EventListener$Factory;",
        "()Lnicoid/network238/okhttp3/EventListener$Factory;",
        "retryOnConnectionFailure",
        "",
        "()Z",
        "fastFallback",
        "authenticator",
        "Lnicoid/network238/okhttp3/Authenticator;",
        "()Lnicoid/network238/okhttp3/Authenticator;",
        "followRedirects",
        "followSslRedirects",
        "cookieJar",
        "Lnicoid/network238/okhttp3/CookieJar;",
        "()Lnicoid/network238/okhttp3/CookieJar;",
        "cache",
        "Lnicoid/network238/okhttp3/Cache;",
        "()Lnicoid/network238/okhttp3/Cache;",
        "dns",
        "Lnicoid/network238/okhttp3/Dns;",
        "()Lnicoid/network238/okhttp3/Dns;",
        "proxy",
        "Ljava/net/Proxy;",
        "()Ljava/net/Proxy;",
        "proxySelector",
        "Ljava/net/ProxySelector;",
        "()Ljava/net/ProxySelector;",
        "proxyAuthenticator",
        "socketFactory",
        "Ljavax/net/SocketFactory;",
        "()Ljavax/net/SocketFactory;",
        "sslSocketFactoryOrNull",
        "Ljavax/net/ssl/SSLSocketFactory;",
        "getSslSocketFactoryOrNull$okhttp",
        "()Ljavax/net/ssl/SSLSocketFactory;",
        "sslSocketFactory",
        "x509TrustManager",
        "Ljavax/net/ssl/X509TrustManager;",
        "()Ljavax/net/ssl/X509TrustManager;",
        "connectionSpecs",
        "Lnicoid/network238/okhttp3/ConnectionSpec;",
        "protocols",
        "Lnicoid/network238/okhttp3/Protocol;",
        "hostnameVerifier",
        "Ljavax/net/ssl/HostnameVerifier;",
        "()Ljavax/net/ssl/HostnameVerifier;",
        "certificatePinner",
        "Lnicoid/network238/okhttp3/CertificatePinner;",
        "()Lnicoid/network238/okhttp3/CertificatePinner;",
        "certificateChainCleaner",
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "callTimeoutMillis",
        "",
        "()I",
        "connectTimeoutMillis",
        "readTimeoutMillis",
        "writeTimeoutMillis",
        "pingIntervalMillis",
        "webSocketCloseTimeout",
        "minWebSocketMessageToCompress",
        "",
        "()J",
        "routeDatabase",
        "Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;",
        "getRouteDatabase$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "getTaskRunner$okhttp",
        "()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "connectionPool",
        "Lnicoid/network238/okhttp3/ConnectionPool;",
        "()Lnicoid/network238/okhttp3/ConnectionPool;",
        "address",
        "Lnicoid/network238/okhttp3/Address;",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "verifyClientState",
        "",
        "newCall",
        "Lnicoid/network238/okhttp3/Call;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "newWebSocket",
        "Lnicoid/network238/okhttp3/WebSocket;",
        "listener",
        "Lnicoid/network238/okhttp3/WebSocketListener;",
        "newBuilder",
        "-deprecated_dispatcher",
        "-deprecated_connectionPool",
        "-deprecated_interceptors",
        "-deprecated_networkInterceptors",
        "-deprecated_eventListenerFactory",
        "-deprecated_retryOnConnectionFailure",
        "-deprecated_authenticator",
        "-deprecated_followRedirects",
        "-deprecated_followSslRedirects",
        "-deprecated_cookieJar",
        "-deprecated_cache",
        "-deprecated_dns",
        "-deprecated_proxy",
        "-deprecated_proxySelector",
        "-deprecated_proxyAuthenticator",
        "-deprecated_socketFactory",
        "-deprecated_sslSocketFactory",
        "-deprecated_connectionSpecs",
        "-deprecated_protocols",
        "-deprecated_hostnameVerifier",
        "-deprecated_certificatePinner",
        "-deprecated_callTimeoutMillis",
        "-deprecated_connectTimeoutMillis",
        "-deprecated_readTimeoutMillis",
        "-deprecated_writeTimeoutMillis",
        "-deprecated_pingIntervalMillis",
        "Builder",
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
.field public static final Companion:Lnicoid/network238/okhttp3/OkHttpClient$Companion;

.field private static final DEFAULT_CONNECTION_SPECS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEFAULT_PROTOCOLS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final authenticator:Lnicoid/network238/okhttp3/Authenticator;

.field private final cache:Lnicoid/network238/okhttp3/Cache;

.field private final callTimeoutMillis:I

.field private final certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

.field private final certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

.field private final connectTimeoutMillis:I

.field private final connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

.field private final connectionSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation
.end field

.field private final cookieJar:Lnicoid/network238/okhttp3/CookieJar;

.field private final dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

.field private final dns:Lnicoid/network238/okhttp3/Dns;

.field private final eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

.field private final fastFallback:Z

.field private final followRedirects:Z

.field private final followSslRedirects:Z

.field private final hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private final interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field private final minWebSocketMessageToCompress:J

.field private final networkInterceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field private final pingIntervalMillis:I

.field private final protocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field private final proxy:Ljava/net/Proxy;

.field private final proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

.field private final proxySelector:Ljava/net/ProxySelector;

.field private final readTimeoutMillis:I

.field private final retryOnConnectionFailure:Z

.field private final routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

.field private final socketFactory:Ljavax/net/SocketFactory;

.field private final sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

.field private final webSocketCloseTimeout:I

.field private final writeTimeoutMillis:I

.field private final x509TrustManager:Ljavax/net/ssl/X509TrustManager;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/OkHttpClient;->Companion:Lnicoid/network238/okhttp3/OkHttpClient$Companion;

    .line 1389
    const/4 v0, 0x2

    new-array v1, v0, [Lnicoid/network238/okhttp3/Protocol;

    sget-object v2, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lnicoid/network238/okhttp3/Protocol;->HTTP_1_1:Lnicoid/network238/okhttp3/Protocol;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->immutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/OkHttpClient;->DEFAULT_PROTOCOLS:Ljava/util/List;

    .line 1394
    new-array v0, v0, [Lnicoid/network238/okhttp3/ConnectionSpec;

    sget-object v1, Lnicoid/network238/okhttp3/ConnectionSpec;->MODERN_TLS:Lnicoid/network238/okhttp3/ConnectionSpec;

    aput-object v1, v0, v3

    sget-object v1, Lnicoid/network238/okhttp3/ConnectionSpec;->CLEARTEXT:Lnicoid/network238/okhttp3/ConnectionSpec;

    aput-object v1, v0, v4

    .line 1392
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->immutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/OkHttpClient;->DEFAULT_CONNECTION_SPECS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 279
    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>()V

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/OkHttpClient;-><init>(Lnicoid/network238/okhttp3/OkHttpClient$Builder;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/OkHttpClient$Builder;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getDispatcher$okhttp()Lnicoid/network238/okhttp3/Dispatcher;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

    .line 149
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getInterceptors$okhttp()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->interceptors:Ljava/util/List;

    .line 158
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getNetworkInterceptors$okhttp()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->networkInterceptors:Ljava/util/List;

    .line 162
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getEventListenerFactory$okhttp()Lnicoid/network238/okhttp3/EventListener$Factory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    .line 166
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getRetryOnConnectionFailure$okhttp()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->retryOnConnectionFailure:Z

    .line 169
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getFastFallback$okhttp()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->fastFallback:Z

    .line 172
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getAuthenticator$okhttp()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 175
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getFollowRedirects$okhttp()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->followRedirects:Z

    .line 178
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getFollowSslRedirects$okhttp()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->followSslRedirects:Z

    .line 181
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getCookieJar$okhttp()Lnicoid/network238/okhttp3/CookieJar;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    .line 184
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getCache$okhttp()Lnicoid/network238/okhttp3/Cache;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->cache:Lnicoid/network238/okhttp3/Cache;

    .line 187
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getDns$okhttp()Lnicoid/network238/okhttp3/Dns;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->dns:Lnicoid/network238/okhttp3/Dns;

    .line 190
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getProxy$okhttp()Ljava/net/Proxy;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxy:Ljava/net/Proxy;

    .line 196
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getProxy$okhttp()Ljava/net/Proxy;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;->INSTANCE:Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;

    goto :goto_0

    .line 198
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getProxySelector$okhttp()Ljava/net/ProxySelector;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object v0, Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;->INSTANCE:Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;

    .line 194
    :cond_1
    :goto_0
    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxySelector:Ljava/net/ProxySelector;

    .line 203
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getProxyAuthenticator$okhttp()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 206
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getSocketFactory$okhttp()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->socketFactory:Ljavax/net/SocketFactory;

    .line 219
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getConnectionSpecs$okhttp()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectionSpecs:Ljava/util/List;

    .line 222
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getProtocols$okhttp()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->protocols:Ljava/util/List;

    .line 225
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getHostnameVerifier$okhttp()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 240
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getCallTimeout$okhttp()I

    move-result v1

    iput v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->callTimeoutMillis:I

    .line 244
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getConnectTimeout$okhttp()I

    move-result v1

    iput v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectTimeoutMillis:I

    .line 248
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getReadTimeout$okhttp()I

    move-result v1

    iput v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->readTimeoutMillis:I

    .line 252
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getWriteTimeout$okhttp()I

    move-result v1

    iput v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->writeTimeoutMillis:I

    .line 256
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getPingInterval$okhttp()I

    move-result v1

    iput v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->pingIntervalMillis:I

    .line 260
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getWebSocketCloseTimeout$okhttp()I

    move-result v1

    iput v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->webSocketCloseTimeout:I

    .line 267
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getMinWebSocketMessageToCompress$okhttp()J

    move-result-wide v1

    iput-wide v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->minWebSocketMessageToCompress:J

    .line 269
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getRouteDatabase$okhttp()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    move-result-object v1

    if-nez v1, :cond_2

    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;-><init>()V

    :cond_2
    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 270
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v1

    if-nez v1, :cond_3

    sget-object v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    :cond_3
    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 274
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getConnectionPool$okhttp()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object v1

    if-nez v1, :cond_4

    new-instance v1, Lnicoid/network238/okhttp3/ConnectionPool;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/ConnectionPool;-><init>()V

    .line 276
    invoke-virtual {p1, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->setConnectionPool$okhttp(Lnicoid/network238/okhttp3/ConnectionPool;)V

    .line 274
    :cond_4
    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    .line 1399
    instance-of v1, v0, Ljava/util/Collection;

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_1

    .line 1400
    :cond_5
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/ConnectionSpec;

    .line 282
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/ConnectionSpec;->isTls()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 287
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getSslSocketFactoryOrNull$okhttp()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 288
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getSslSocketFactoryOrNull$okhttp()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    .line 289
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getCertificateChainCleaner$okhttp()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    .line 290
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getX509TrustManagerOrNull$okhttp()Ljavax/net/ssl/X509TrustManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->x509TrustManager:Ljavax/net/ssl/X509TrustManager;

    .line 292
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getCertificatePinner$okhttp()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object p1

    .line 293
    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/CertificatePinner;->withCertificateChainCleaner$okhttp(Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object p1

    .line 291
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    goto :goto_2

    .line 295
    :cond_7
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->platformTrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->x509TrustManager:Ljavax/net/ssl/X509TrustManager;

    .line 296
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->newSslSocketFactory(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    .line 297
    sget-object v0, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;->Companion:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;->get(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    .line 299
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->getCertificatePinner$okhttp()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object p1

    .line 300
    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/CertificatePinner;->withCertificateChainCleaner$okhttp(Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object p1

    .line 298
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    goto :goto_2

    :cond_8
    :goto_1
    nop

    .line 283
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    .line 284
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    .line 285
    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->x509TrustManager:Ljavax/net/ssl/X509TrustManager;

    .line 286
    sget-object p1, Lnicoid/network238/okhttp3/CertificatePinner;->DEFAULT:Lnicoid/network238/okhttp3/CertificatePinner;

    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    .line 303
    :goto_2
    invoke-direct {p0}, Lnicoid/network238/okhttp3/OkHttpClient;->verifyClientState()V

    return-void
.end method

.method public static final synthetic access$getDEFAULT_CONNECTION_SPECS$cp()Ljava/util/List;
    .registers 1

    .line 135
    sget-object v0, Lnicoid/network238/okhttp3/OkHttpClient;->DEFAULT_CONNECTION_SPECS:Ljava/util/List;

    return-object v0
.end method

.method public static final synthetic access$getDEFAULT_PROTOCOLS$cp()Ljava/util/List;
    .registers 1

    .line 135
    sget-object v0, Lnicoid/network238/okhttp3/OkHttpClient;->DEFAULT_PROTOCOLS:Ljava/util/List;

    return-object v0
.end method

.method private final verifyClientState()V
    .registers 4

    .line 337
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->interceptors:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 340
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->networkInterceptors:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 344
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectionSpecs:Ljava/util/List;

    .line 1402
    instance-of v1, v0, Ljava/util/Collection;

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1403
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/ConnectionSpec;

    .line 344
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/ConnectionSpec;->isTls()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 350
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_4

    .line 351
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    if-eqz v0, :cond_3

    .line 352
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->x509TrustManager:Ljavax/net/ssl/X509TrustManager;

    if-eqz v0, :cond_2

    return-void

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "x509TrustManager == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 351
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "certificateChainCleaner == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 350
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "sslSocketFactory == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 345
    :cond_5
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    const-string v1, "Check failed."

    if-nez v0, :cond_9

    .line 346
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    if-nez v0, :cond_8

    .line 347
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->x509TrustManager:Ljavax/net/ssl/X509TrustManager;

    if-nez v0, :cond_7

    .line 348
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    sget-object v2, Lnicoid/network238/okhttp3/CertificatePinner;->DEFAULT:Lnicoid/network238/okhttp3/CertificatePinner;

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-void

    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 347
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 345
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 341
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Null network interceptor: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->networkInterceptors:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 340
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 338
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Null interceptor: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->interceptors:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 337
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final -deprecated_authenticator()Lnicoid/network238/okhttp3/Authenticator;
    .registers 2

    .line 436
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object v0
.end method

.method public final -deprecated_cache()Lnicoid/network238/okhttp3/Cache;
    .registers 2

    .line 468
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->cache:Lnicoid/network238/okhttp3/Cache;

    return-object v0
.end method

.method public final -deprecated_callTimeoutMillis()I
    .registers 2

    .line 556
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->callTimeoutMillis:I

    return v0
.end method

.method public final -deprecated_certificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;
    .registers 2

    .line 548
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    return-object v0
.end method

.method public final -deprecated_connectTimeoutMillis()I
    .registers 2

    .line 564
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectTimeoutMillis:I

    return v0
.end method

.method public final -deprecated_connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;
    .registers 2

    .line 396
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    return-object v0
.end method

.method public final -deprecated_connectionSpecs()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation

    .line 524
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectionSpecs:Ljava/util/List;

    return-object v0
.end method

.method public final -deprecated_cookieJar()Lnicoid/network238/okhttp3/CookieJar;
    .registers 2

    .line 460
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    return-object v0
.end method

.method public final -deprecated_dispatcher()Lnicoid/network238/okhttp3/Dispatcher;
    .registers 2

    .line 388
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

    return-object v0
.end method

.method public final -deprecated_dns()Lnicoid/network238/okhttp3/Dns;
    .registers 2

    .line 476
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->dns:Lnicoid/network238/okhttp3/Dns;

    return-object v0
.end method

.method public final -deprecated_eventListenerFactory()Lnicoid/network238/okhttp3/EventListener$Factory;
    .registers 2

    .line 420
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    return-object v0
.end method

.method public final -deprecated_followRedirects()Z
    .registers 2

    .line 444
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->followRedirects:Z

    return v0
.end method

.method public final -deprecated_followSslRedirects()Z
    .registers 2

    .line 452
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->followSslRedirects:Z

    return v0
.end method

.method public final -deprecated_hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .registers 2

    .line 540
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public final -deprecated_interceptors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 404
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->interceptors:Ljava/util/List;

    return-object v0
.end method

.method public final -deprecated_networkInterceptors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 412
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->networkInterceptors:Ljava/util/List;

    return-object v0
.end method

.method public final -deprecated_pingIntervalMillis()I
    .registers 2

    .line 588
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->pingIntervalMillis:I

    return v0
.end method

.method public final -deprecated_protocols()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation

    .line 532
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->protocols:Ljava/util/List;

    return-object v0
.end method

.method public final -deprecated_proxy()Ljava/net/Proxy;
    .registers 2

    .line 484
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public final -deprecated_proxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;
    .registers 2

    .line 500
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object v0
.end method

.method public final -deprecated_proxySelector()Ljava/net/ProxySelector;
    .registers 2

    .line 492
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxySelector:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public final -deprecated_readTimeoutMillis()I
    .registers 2

    .line 572
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->readTimeoutMillis:I

    return v0
.end method

.method public final -deprecated_retryOnConnectionFailure()Z
    .registers 2

    .line 428
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->retryOnConnectionFailure:Z

    return v0
.end method

.method public final -deprecated_socketFactory()Ljavax/net/SocketFactory;
    .registers 2

    .line 508
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public final -deprecated_sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .registers 2

    .line 516
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    return-object v0
.end method

.method public final -deprecated_writeTimeoutMillis()I
    .registers 2

    .line 580
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->writeTimeoutMillis:I

    return v0
.end method

.method public final address(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Address;
    .registers 16

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 314
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 316
    iget-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 317
    iget-object v2, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    move-object v6, v0

    move-object v7, v1

    move-object v8, v2

    goto :goto_0

    .line 314
    :cond_0
    const/4 v0, 0x0

    move-object v6, v0

    move-object v7, v6

    move-object v8, v7

    .line 320
    :goto_0
    new-instance v1, Lnicoid/network238/okhttp3/Address;

    .line 321
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    .line 322
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v3

    .line 323
    iget-object v4, p0, Lnicoid/network238/okhttp3/OkHttpClient;->dns:Lnicoid/network238/okhttp3/Dns;

    .line 324
    iget-object v5, p0, Lnicoid/network238/okhttp3/OkHttpClient;->socketFactory:Ljavax/net/SocketFactory;

    .line 328
    iget-object v9, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 329
    iget-object v10, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxy:Ljava/net/Proxy;

    .line 330
    iget-object v11, p0, Lnicoid/network238/okhttp3/OkHttpClient;->protocols:Ljava/util/List;

    .line 331
    iget-object v12, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectionSpecs:Ljava/util/List;

    .line 332
    iget-object v13, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxySelector:Ljava/net/ProxySelector;

    .line 320
    invoke-direct/range {v1 .. v13}, Lnicoid/network238/okhttp3/Address;-><init>(Ljava/lang/String;ILnicoid/network238/okhttp3/Dns;Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V

    return-object v1
.end method

.method public final authenticator()Lnicoid/network238/okhttp3/Authenticator;
    .registers 2

    .line 172
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object v0
.end method

.method public final cache()Lnicoid/network238/okhttp3/Cache;
    .registers 2

    .line 184
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->cache:Lnicoid/network238/okhttp3/Cache;

    return-object v0
.end method

.method public final callTimeoutMillis()I
    .registers 2

    .line 240
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->callTimeoutMillis:I

    return v0
.end method

.method public final certificateChainCleaner()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
    .registers 2

    .line 231
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    return-object v0
.end method

.method public final certificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;
    .registers 2

    .line 228
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    return-object v0
.end method

.method public final connectTimeoutMillis()I
    .registers 2

    .line 244
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectTimeoutMillis:I

    return v0
.end method

.method public final connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;
    .registers 2

    .line 273
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    return-object v0
.end method

.method public final connectionSpecs()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/ConnectionSpec;",
            ">;"
        }
    .end annotation

    .line 218
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->connectionSpecs:Ljava/util/List;

    return-object v0
.end method

.method public final cookieJar()Lnicoid/network238/okhttp3/CookieJar;
    .registers 2

    .line 181
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    return-object v0
.end method

.method public final dispatcher()Lnicoid/network238/okhttp3/Dispatcher;
    .registers 2

    .line 140
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->dispatcher:Lnicoid/network238/okhttp3/Dispatcher;

    return-object v0
.end method

.method public final dns()Lnicoid/network238/okhttp3/Dns;
    .registers 2

    .line 187
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->dns:Lnicoid/network238/okhttp3/Dns;

    return-object v0
.end method

.method public final eventListenerFactory()Lnicoid/network238/okhttp3/EventListener$Factory;
    .registers 2

    .line 161
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->eventListenerFactory:Lnicoid/network238/okhttp3/EventListener$Factory;

    return-object v0
.end method

.method public final fastFallback()Z
    .registers 2

    .line 169
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->fastFallback:Z

    return v0
.end method

.method public final followRedirects()Z
    .registers 2

    .line 175
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->followRedirects:Z

    return v0
.end method

.method public final followSslRedirects()Z
    .registers 2

    .line 178
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->followSslRedirects:Z

    return v0
.end method

.method public final getRouteDatabase$okhttp()Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;
    .registers 2

    .line 269
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    return-object v0
.end method

.method public final getSslSocketFactoryOrNull$okhttp()Ljavax/net/ssl/SSLSocketFactory;
    .registers 2

    .line 208
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method public final getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    .registers 2

    .line 270
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object v0
.end method

.method public final hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .registers 2

    .line 225
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public final interceptors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 148
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->interceptors:Ljava/util/List;

    return-object v0
.end method

.method public final minWebSocketMessageToCompress()J
    .registers 3

    .line 267
    iget-wide v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->minWebSocketMessageToCompress:J

    return-wide v0
.end method

.method public final networkInterceptors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 157
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->networkInterceptors:Ljava/util/List;

    return-object v0
.end method

.method public newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;
    .registers 2

    .line 380
    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>(Lnicoid/network238/okhttp3/OkHttpClient;)V

    return-object v0
.end method

.method public newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 357
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealCall;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;-><init>(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/Request;Z)V

    return-object v0
.end method

.method public newWebSocket(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/WebSocketListener;)Lnicoid/network238/okhttp3/WebSocket;
    .registers 15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 365
    new-instance v0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    .line 366
    iget-object v1, p0, Lnicoid/network238/okhttp3/OkHttpClient;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 369
    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    .line 370
    iget v2, p0, Lnicoid/network238/okhttp3/OkHttpClient;->pingIntervalMillis:I

    int-to-long v5, v2

    .line 373
    iget-wide v8, p0, Lnicoid/network238/okhttp3/OkHttpClient;->minWebSocketMessageToCompress:J

    .line 374
    iget v2, p0, Lnicoid/network238/okhttp3/OkHttpClient;->webSocketCloseTimeout:I

    int-to-long v10, v2

    .line 365
    const/4 v7, 0x0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v11}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/WebSocketListener;Ljava/util/Random;JLnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;JJ)V

    .line 376
    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->connect(Lnicoid/network238/okhttp3/OkHttpClient;)V

    return-object v0
.end method

.method public final pingIntervalMillis()I
    .registers 2

    .line 256
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->pingIntervalMillis:I

    return v0
.end method

.method public final protocols()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;"
        }
    .end annotation

    .line 222
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->protocols:Ljava/util/List;

    return-object v0
.end method

.method public final proxy()Ljava/net/Proxy;
    .registers 2

    .line 190
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public final proxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;
    .registers 2

    .line 202
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object v0
.end method

.method public final proxySelector()Ljava/net/ProxySelector;
    .registers 2

    .line 193
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->proxySelector:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public final readTimeoutMillis()I
    .registers 2

    .line 248
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->readTimeoutMillis:I

    return v0
.end method

.method public final retryOnConnectionFailure()Z
    .registers 2

    .line 165
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->retryOnConnectionFailure:Z

    return v0
.end method

.method public final socketFactory()Ljavax/net/SocketFactory;
    .registers 2

    .line 206
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public final sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .registers 3

    .line 212
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CLEARTEXT-only client"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final webSocketCloseTimeout()I
    .registers 2

    .line 260
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->webSocketCloseTimeout:I

    return v0
.end method

.method public final writeTimeoutMillis()I
    .registers 2

    .line 252
    iget v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->writeTimeoutMillis:I

    return v0
.end method

.method public final x509TrustManager()Ljavax/net/ssl/X509TrustManager;
    .registers 2

    .line 215
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient;->x509TrustManager:Ljavax/net/ssl/X509TrustManager;

    return-object v0
.end method

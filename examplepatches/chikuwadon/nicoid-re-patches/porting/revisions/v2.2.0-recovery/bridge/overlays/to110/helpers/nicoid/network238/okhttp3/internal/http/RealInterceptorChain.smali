.class public final Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor$Chain;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00c4\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008.\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u00d1\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012\u0006\u0010\r\u001a\u00020\u0008\u0012\u0006\u0010\u000e\u001a\u00020\u0008\u0012\u0006\u0010\u000f\u001a\u00020\u0008\u0012\u0006\u0010\u0010\u001a\u00020\u0011\u0012\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0013\u0012\u0006\u0010\u0014\u001a\u00020\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u0017\u0012\u0006\u0010\u0018\u001a\u00020\u0019\u0012\u0006\u0010\u001a\u001a\u00020\u001b\u0012\u0006\u0010\u001c\u001a\u00020\u001d\u0012\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001f\u0012\u0006\u0010 \u001a\u00020\u0011\u0012\u0006\u0010!\u001a\u00020\"\u0012\u0006\u0010#\u001a\u00020$\u0012\u0006\u0010%\u001a\u00020&\u0012\u0008\u0010\'\u001a\u0004\u0018\u00010(\u0012\u0008\u0010)\u001a\u0004\u0018\u00010*\u0012\u0008\u0010+\u001a\u0004\u0018\u00010,\u00a2\u0006\u0004\u0008-\u0010.BC\u0008\u0010\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010/\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012\u0008\u0008\u0002\u00100\u001a\u000201\u00a2\u0006\u0004\u0008-\u00102J\u00eb\u0001\u0010[\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00082\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\r\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u00112\n\u0008\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u00152\u0008\u0008\u0002\u0010\u0016\u001a\u00020\u00172\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u001b2\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u001d2\n\u0008\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u001f2\u0008\u0008\u0002\u0010 \u001a\u00020\u00112\u0008\u0008\u0002\u0010!\u001a\u00020\"2\u0008\u0008\u0002\u0010#\u001a\u00020$2\u0008\u0008\u0002\u0010%\u001a\u00020&2\n\u0008\u0002\u0010\\\u001a\u0004\u0018\u00010(2\n\u0008\u0002\u0010]\u001a\u0004\u0018\u00010*2\n\u0008\u0002\u0010+\u001a\u0004\u0018\u00010,H\u0000\u00a2\u0006\u0002\u0008^J\n\u0010g\u001a\u0004\u0018\u00010hH\u0016J\u0008\u0010\r\u001a\u00020\u0008H\u0016J\u0018\u0010i\u001a\u00020\u00012\u0006\u0010j\u001a\u00020\u00082\u0006\u0010k\u001a\u00020lH\u0016J\u0008\u0010\u000e\u001a\u00020\u0008H\u0016J\u0018\u0010m\u001a\u00020\u00012\u0006\u0010j\u001a\u00020\u00082\u0006\u0010k\u001a\u00020lH\u0016J\u0008\u0010\u000f\u001a\u00020\u0008H\u0016J\u0018\u0010n\u001a\u00020\u00012\u0006\u0010j\u001a\u00020\u00082\u0006\u0010k\u001a\u00020lH\u0016J\u0010\u0010o\u001a\u00020\u00012\u0006\u0010\u001a\u001a\u00020\u001bH\u0016J\u0010\u0010p\u001a\u00020\u00012\u0006\u0010%\u001a\u00020&H\u0016J\u0010\u0010q\u001a\u00020\u00012\u0006\u0010#\u001a\u00020$H\u0016J\u0010\u0010r\u001a\u00020\u00012\u0006\u0010\u0010\u001a\u00020\u0011H\u0016J\u0010\u0010s\u001a\u00020\u00012\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\u0012\u0010t\u001a\u00020\u00012\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0016J\u0012\u0010u\u001a\u00020\u00012\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0016J\u0010\u0010v\u001a\u00020\u00012\u0006\u0010!\u001a\u00020\"H\u0016J\u0010\u0010w\u001a\u00020\u00012\u0006\u0010 \u001a\u00020\u0011H\u0016J\u001c\u0010x\u001a\u00020\u00012\u0008\u0010\\\u001a\u0004\u0018\u00010(2\u0008\u0010]\u001a\u0004\u0018\u00010*H\u0016J\u0010\u0010y\u001a\u00020\u00012\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J\u0010\u0010z\u001a\u00020\u00012\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010{\u001a\u00020\u00012\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\u0008\u0010\u0002\u001a\u00020|H\u0016J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016J\u0010\u0010}\u001a\u00020~2\u0006\u0010\u000b\u001a\u00020\u000cH\u0016J\u0011\u0010\u007f\u001a\u00030\u0080\u00012\u0008\u0010\u0081\u0001\u001a\u00030\u0082\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00083\u00104R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\t\u001a\u0004\u0018\u00010\nX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00085\u00106R\u0014\u0010\u000b\u001a\u00020\u000cX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00087\u00108R\u0014\u0010\r\u001a\u00020\u0008X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00089\u0010:R\u0014\u0010\u000e\u001a\u00020\u0008X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008;\u0010:R\u0014\u0010\u000f\u001a\u00020\u0008X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008<\u0010:R\u0014\u0010\u0010\u001a\u00020\u0011X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008=\u0010>R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008?\u0010@R\u0014\u0010\u0014\u001a\u00020\u0015X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008A\u0010BR\u0014\u0010\u0016\u001a\u00020\u0017X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008C\u0010DR\u0014\u0010\u0018\u001a\u00020\u0019X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008E\u0010FR\u0014\u0010\u001a\u001a\u00020\u001bX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008G\u0010HR\u0014\u0010\u001c\u001a\u00020\u001dX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008I\u0010JR\u0016\u0010\u001e\u001a\u0004\u0018\u00010\u001fX\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008K\u0010LR\u0014\u0010 \u001a\u00020\u0011X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008M\u0010>R\u0014\u0010!\u001a\u00020\"X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008N\u0010OR\u0014\u0010#\u001a\u00020$X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008P\u0010QR\u0014\u0010%\u001a\u00020&X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008R\u0010SR\u0016\u0010\'\u001a\u0004\u0018\u00010(X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008T\u0010UR\u0016\u0010)\u001a\u0004\u0018\u00010*X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008V\u0010WR\u0013\u0010+\u001a\u0004\u0018\u00010,\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008X\u0010YR\u000e\u0010Z\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010_\u001a\u00020`8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008a\u0010bR\u0014\u0010c\u001a\u00020$8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008d\u0010QR\u0014\u0010e\u001a\u00020$8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008f\u0010Q\u00a8\u0006\u0083\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "call",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "interceptors",
        "",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "index",
        "",
        "exchange",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "connectTimeoutMillis",
        "readTimeoutMillis",
        "writeTimeoutMillis",
        "authenticator",
        "Lnicoid/network238/okhttp3/Authenticator;",
        "cache",
        "Lnicoid/network238/okhttp3/Cache;",
        "certificatePinner",
        "Lnicoid/network238/okhttp3/CertificatePinner;",
        "connectionPool",
        "Lnicoid/network238/okhttp3/ConnectionPool;",
        "cookieJar",
        "Lnicoid/network238/okhttp3/CookieJar;",
        "dns",
        "Lnicoid/network238/okhttp3/Dns;",
        "hostnameVerifier",
        "Ljavax/net/ssl/HostnameVerifier;",
        "proxy",
        "Ljava/net/Proxy;",
        "proxyAuthenticator",
        "proxySelector",
        "Ljava/net/ProxySelector;",
        "retryOnConnectionFailure",
        "",
        "socketFactory",
        "Ljavax/net/SocketFactory;",
        "sslSocketFactoryOrNull",
        "Ljavax/net/ssl/SSLSocketFactory;",
        "x509TrustManagerOrNull",
        "Ljavax/net/ssl/X509TrustManager;",
        "certificateChainCleaner",
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V",
        "",
        "client",
        "Lnicoid/network238/okhttp3/OkHttpClient;",
        "(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILjava/lang/Void;Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/OkHttpClient;)V",
        "getCall$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "getExchange$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "getRequest$okhttp",
        "()Lnicoid/network238/okhttp3/Request;",
        "getConnectTimeoutMillis$okhttp",
        "()I",
        "getReadTimeoutMillis$okhttp",
        "getWriteTimeoutMillis$okhttp",
        "getAuthenticator",
        "()Lnicoid/network238/okhttp3/Authenticator;",
        "getCache",
        "()Lnicoid/network238/okhttp3/Cache;",
        "getCertificatePinner",
        "()Lnicoid/network238/okhttp3/CertificatePinner;",
        "getConnectionPool",
        "()Lnicoid/network238/okhttp3/ConnectionPool;",
        "getCookieJar",
        "()Lnicoid/network238/okhttp3/CookieJar;",
        "getDns",
        "()Lnicoid/network238/okhttp3/Dns;",
        "getHostnameVerifier",
        "()Ljavax/net/ssl/HostnameVerifier;",
        "getProxy",
        "()Ljava/net/Proxy;",
        "getProxyAuthenticator",
        "getProxySelector",
        "()Ljava/net/ProxySelector;",
        "getRetryOnConnectionFailure",
        "()Z",
        "getSocketFactory",
        "()Ljavax/net/SocketFactory;",
        "getSslSocketFactoryOrNull",
        "()Ljavax/net/ssl/SSLSocketFactory;",
        "getX509TrustManagerOrNull",
        "()Ljavax/net/ssl/X509TrustManager;",
        "getCertificateChainCleaner",
        "()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "calls",
        "copy",
        "sslSocketFactory",
        "x509TrustManager",
        "copy$okhttp",
        "eventListener",
        "Lnicoid/network238/okhttp3/EventListener;",
        "getEventListener",
        "()Lnicoid/network238/okhttp3/EventListener;",
        "followSslRedirects",
        "getFollowSslRedirects",
        "followRedirects",
        "getFollowRedirects",
        "connection",
        "Lnicoid/network238/okhttp3/Connection;",
        "withConnectTimeout",
        "timeout",
        "unit",
        "Ljava/util/concurrent/TimeUnit;",
        "withReadTimeout",
        "withWriteTimeout",
        "withDns",
        "withSocketFactory",
        "withRetryOnConnectionFailure",
        "withAuthenticator",
        "withCookieJar",
        "withCache",
        "withProxy",
        "withProxySelector",
        "withProxyAuthenticator",
        "withSslSocketFactory",
        "withHostnameVerifier",
        "withCertificatePinner",
        "withConnectionPool",
        "Lnicoid/network238/okhttp3/Call;",
        "proceed",
        "Lnicoid/network238/okhttp3/Response;",
        "address",
        "Lnicoid/network238/okhttp3/Address;",
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
.field private final authenticator:Lnicoid/network238/okhttp3/Authenticator;

.field private final cache:Lnicoid/network238/okhttp3/Cache;

.field private final call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

.field private calls:I

.field private final certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

.field private final certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

.field private final connectTimeoutMillis:I

.field private final connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

.field private final cookieJar:Lnicoid/network238/okhttp3/CookieJar;

.field private final dns:Lnicoid/network238/okhttp3/Dns;

.field private final exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

.field private final hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field private final index:I

.field private final interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field private final proxy:Ljava/net/Proxy;

.field private final proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

.field private final proxySelector:Ljava/net/ProxySelector;

.field private final readTimeoutMillis:I

.field private final request:Lnicoid/network238/okhttp3/Request;

.field private final retryOnConnectionFailure:Z

.field private final socketFactory:Ljavax/net/SocketFactory;

.field private final sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

.field private final writeTimeoutMillis:I

.field private final x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILjava/lang/Void;Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/OkHttpClient;)V
    .registers 31
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;I",
            "Ljava/lang/Void;",
            "Lnicoid/network238/okhttp3/Request;",
            "Lnicoid/network238/okhttp3/OkHttpClient;",
            ")V"
        }
    .end annotation

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p5 .. p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p6 .. p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    move-object/from16 v4, p4

    check-cast v4, Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 91
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->connectTimeoutMillis()I

    move-result v6

    .line 92
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->readTimeoutMillis()I

    move-result v7

    .line 93
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->writeTimeoutMillis()I

    move-result v8

    .line 94
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->authenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v9

    .line 95
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->cache()Lnicoid/network238/okhttp3/Cache;

    move-result-object v10

    .line 96
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->certificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v11

    .line 97
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object v12

    .line 98
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->cookieJar()Lnicoid/network238/okhttp3/CookieJar;

    move-result-object v13

    .line 99
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->dns()Lnicoid/network238/okhttp3/Dns;

    move-result-object v14

    .line 100
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v15

    .line 101
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->proxy()Ljava/net/Proxy;

    move-result-object v16

    .line 102
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->proxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v17

    .line 103
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->proxySelector()Ljava/net/ProxySelector;

    move-result-object v18

    .line 104
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->retryOnConnectionFailure()Z

    move-result v19

    .line 105
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->socketFactory()Ljavax/net/SocketFactory;

    move-result-object v20

    .line 106
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->getSslSocketFactoryOrNull$okhttp()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v21

    .line 107
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->x509TrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object v22

    .line 108
    invoke-virtual/range {p6 .. p6}, Lnicoid/network238/okhttp3/OkHttpClient;->certificateChainCleaner()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object v23

    .line 85
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v5, p5

    invoke-direct/range {v0 .. v23}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILjava/lang/Void;Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/OkHttpClient;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 16

    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_0

    .line 84
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object p6

    move-object v6, p6

    goto :goto_0

    .line 0
    :cond_0
    move-object v6, p6

    .line 78
    :goto_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILjava/lang/Void;Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/OkHttpClient;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Interceptor;",
            ">;I",
            "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
            "Lnicoid/network238/okhttp3/Request;",
            "III",
            "Lnicoid/network238/okhttp3/Authenticator;",
            "Lnicoid/network238/okhttp3/Cache;",
            "Lnicoid/network238/okhttp3/CertificatePinner;",
            "Lnicoid/network238/okhttp3/ConnectionPool;",
            "Lnicoid/network238/okhttp3/CookieJar;",
            "Lnicoid/network238/okhttp3/Dns;",
            "Ljavax/net/ssl/HostnameVerifier;",
            "Ljava/net/Proxy;",
            "Lnicoid/network238/okhttp3/Authenticator;",
            "Ljava/net/ProxySelector;",
            "Z",
            "Ljavax/net/SocketFactory;",
            "Ljavax/net/ssl/SSLSocketFactory;",
            "Ljavax/net/ssl/X509TrustManager;",
            "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p17 .. p17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p18 .. p18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p20 .. p20}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 55
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    .line 56
    iput p3, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->index:I

    .line 57
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    .line 58
    iput-object p5, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->request:Lnicoid/network238/okhttp3/Request;

    .line 59
    iput p6, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->connectTimeoutMillis:I

    .line 60
    iput p7, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->readTimeoutMillis:I

    .line 61
    iput p8, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->writeTimeoutMillis:I

    .line 62
    iput-object p9, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 63
    iput-object p10, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->cache:Lnicoid/network238/okhttp3/Cache;

    .line 64
    iput-object p11, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    .line 65
    iput-object p12, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    .line 66
    iput-object p13, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    .line 67
    iput-object p14, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->dns:Lnicoid/network238/okhttp3/Dns;

    .line 68
    iput-object p15, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 69
    move-object/from16 p1, p16

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proxy:Ljava/net/Proxy;

    .line 70
    move-object/from16 p1, p17

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    .line 71
    move-object/from16 p1, p18

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proxySelector:Ljava/net/ProxySelector;

    .line 72
    move/from16 p1, p19

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->retryOnConnectionFailure:Z

    .line 73
    move-object/from16 p1, p20

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->socketFactory:Ljavax/net/SocketFactory;

    .line 74
    move-object/from16 p1, p21

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    .line 75
    move-object/from16 p1, p22

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    .line 76
    move-object/from16 p1, p23

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    return-void
.end method

.method public static synthetic copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;
    .registers 46

    move-object/from16 v0, p0

    move/from16 v1, p22

    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_0

    .line 114
    iget v2, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->index:I

    goto :goto_0

    .line 0
    :cond_0
    move/from16 v2, p1

    .line 114
    :goto_0
    and-int/lit8 v3, v1, 0x2

    if-eqz v3, :cond_1

    .line 115
    iget-object v3, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    goto :goto_1

    .line 114
    :cond_1
    move-object/from16 v3, p2

    .line 115
    :goto_1
    and-int/lit8 v4, v1, 0x4

    if-eqz v4, :cond_2

    .line 116
    iget-object v4, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->request:Lnicoid/network238/okhttp3/Request;

    goto :goto_2

    .line 115
    :cond_2
    move-object/from16 v4, p3

    .line 116
    :goto_2
    and-int/lit8 v5, v1, 0x8

    if-eqz v5, :cond_3

    .line 117
    iget v5, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->connectTimeoutMillis:I

    goto :goto_3

    .line 116
    :cond_3
    move/from16 v5, p4

    .line 117
    :goto_3
    and-int/lit8 v6, v1, 0x10

    if-eqz v6, :cond_4

    .line 118
    iget v6, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->readTimeoutMillis:I

    goto :goto_4

    .line 117
    :cond_4
    move/from16 v6, p5

    .line 118
    :goto_4
    and-int/lit8 v7, v1, 0x20

    if-eqz v7, :cond_5

    .line 119
    iget v7, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->writeTimeoutMillis:I

    goto :goto_5

    .line 118
    :cond_5
    move/from16 v7, p6

    .line 119
    :goto_5
    and-int/lit8 v8, v1, 0x40

    if-eqz v8, :cond_6

    .line 120
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v8

    goto :goto_6

    .line 119
    :cond_6
    move-object/from16 v8, p7

    .line 120
    :goto_6
    and-int/lit16 v9, v1, 0x80

    if-eqz v9, :cond_7

    .line 121
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getCache()Lnicoid/network238/okhttp3/Cache;

    move-result-object v9

    goto :goto_7

    .line 120
    :cond_7
    move-object/from16 v9, p8

    .line 121
    :goto_7
    and-int/lit16 v10, v1, 0x100

    if-eqz v10, :cond_8

    .line 122
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getCertificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v10

    goto :goto_8

    .line 121
    :cond_8
    move-object/from16 v10, p9

    .line 122
    :goto_8
    and-int/lit16 v11, v1, 0x200

    if-eqz v11, :cond_9

    .line 123
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getConnectionPool()Lnicoid/network238/okhttp3/ConnectionPool;

    move-result-object v11

    goto :goto_9

    .line 122
    :cond_9
    move-object/from16 v11, p10

    .line 123
    :goto_9
    and-int/lit16 v12, v1, 0x400

    if-eqz v12, :cond_a

    .line 124
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getCookieJar()Lnicoid/network238/okhttp3/CookieJar;

    move-result-object v12

    goto :goto_a

    .line 123
    :cond_a
    move-object/from16 v12, p11

    .line 124
    :goto_a
    and-int/lit16 v13, v1, 0x800

    if-eqz v13, :cond_b

    .line 125
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getDns()Lnicoid/network238/okhttp3/Dns;

    move-result-object v13

    goto :goto_b

    .line 124
    :cond_b
    move-object/from16 v13, p12

    .line 125
    :goto_b
    and-int/lit16 v14, v1, 0x1000

    if-eqz v14, :cond_c

    .line 126
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v14

    goto :goto_c

    .line 125
    :cond_c
    move-object/from16 v14, p13

    .line 126
    :goto_c
    and-int/lit16 v15, v1, 0x2000

    if-eqz v15, :cond_d

    .line 127
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getProxy()Ljava/net/Proxy;

    move-result-object v15

    goto :goto_d

    .line 126
    :cond_d
    move-object/from16 v15, p14

    .line 127
    :goto_d
    move/from16 p1, v2

    and-int/lit16 v2, v1, 0x4000

    if-eqz v2, :cond_e

    .line 128
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getProxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v2

    goto :goto_e

    .line 127
    :cond_e
    move-object/from16 v2, p15

    .line 128
    :goto_e
    const v16, 0x8000

    and-int v16, v1, v16

    if-eqz v16, :cond_f

    .line 129
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v16

    goto :goto_f

    .line 128
    :cond_f
    move-object/from16 v16, p16

    .line 129
    :goto_f
    const/high16 v17, 0x10000

    and-int v17, v1, v17

    if-eqz v17, :cond_10

    .line 130
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getRetryOnConnectionFailure()Z

    move-result v17

    goto :goto_10

    .line 129
    :cond_10
    move/from16 v17, p17

    .line 130
    :goto_10
    const/high16 v18, 0x20000

    and-int v18, v1, v18

    if-eqz v18, :cond_11

    .line 131
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v18

    goto :goto_11

    .line 130
    :cond_11
    move-object/from16 v18, p18

    .line 131
    :goto_11
    const/high16 v19, 0x40000

    and-int v19, v1, v19

    if-eqz v19, :cond_12

    .line 132
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getSslSocketFactoryOrNull()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v19

    goto :goto_12

    .line 131
    :cond_12
    move-object/from16 v19, p19

    .line 132
    :goto_12
    const/high16 v20, 0x80000

    and-int v20, v1, v20

    if-eqz v20, :cond_13

    .line 133
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getX509TrustManagerOrNull()Ljavax/net/ssl/X509TrustManager;

    move-result-object v20

    goto :goto_13

    .line 132
    :cond_13
    move-object/from16 v20, p20

    .line 133
    :goto_13
    const/high16 v21, 0x100000

    and-int v1, v1, v21

    if-eqz v1, :cond_14

    .line 134
    iget-object v1, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    goto :goto_14

    .line 133
    :cond_14
    move-object/from16 v1, p21

    .line 113
    :goto_14
    move/from16 p2, p1

    move-object/from16 p1, v0

    move-object/from16 p22, v1

    move-object/from16 p16, v2

    move-object/from16 p3, v3

    move-object/from16 p4, v4

    move/from16 p5, v5

    move/from16 p6, v6

    move/from16 p7, v7

    move-object/from16 p8, v8

    move-object/from16 p9, v9

    move-object/from16 p10, v10

    move-object/from16 p11, v11

    move-object/from16 p12, v12

    move-object/from16 p13, v13

    move-object/from16 p14, v14

    move-object/from16 p15, v15

    move-object/from16 p17, v16

    move/from16 p18, v17

    move-object/from16 p19, v18

    move-object/from16 p20, v19

    move-object/from16 p21, v20

    invoke-virtual/range {p1 .. p22}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp(ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final address(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Address;
    .registers 16

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 353
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 354
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getSslSocketFactoryOrNull()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    .line 355
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v1

    .line 356
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getCertificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v2

    move-object v6, v0

    move-object v7, v1

    move-object v8, v2

    goto :goto_0

    .line 353
    :cond_0
    const/4 v0, 0x0

    move-object v6, v0

    move-object v7, v6

    move-object v8, v7

    .line 359
    :goto_0
    new-instance v1, Lnicoid/network238/okhttp3/Address;

    .line 360
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    .line 361
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v3

    .line 362
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getDns()Lnicoid/network238/okhttp3/Dns;

    move-result-object v4

    .line 363
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v5

    .line 367
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getProxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;

    move-result-object v9

    .line 368
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getProxy()Ljava/net/Proxy;

    move-result-object v10

    .line 369
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->protocols()Ljava/util/List;

    move-result-object v11

    .line 370
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/OkHttpClient;->connectionSpecs()Ljava/util/List;

    move-result-object v12

    .line 371
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v13

    .line 359
    invoke-direct/range {v1 .. v13}, Lnicoid/network238/okhttp3/Address;-><init>(Ljava/lang/String;ILnicoid/network238/okhttp3/Dns;Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V

    return-object v1
.end method

.method public call()Lnicoid/network238/okhttp3/Call;
    .registers 2

    .line 307
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    return-object v0
.end method

.method public connectTimeoutMillis()I
    .registers 2

    .line 172
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->connectTimeoutMillis:I

    return v0
.end method

.method public connection()Lnicoid/network238/okhttp3/Connection;
    .registers 2

    .line 170
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final copy$okhttp(ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;
    .registers 47

    move-object/from16 v0, p0

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p9 .. p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p10 .. p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p11 .. p11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p12 .. p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p13 .. p13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p15 .. p15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p16 .. p16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p18 .. p18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    new-instance v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    .line 136
    iget-object v2, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 137
    iget-object v3, v0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    .line 135
    move/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    move-object/from16 v11, p8

    move-object/from16 v12, p9

    move-object/from16 v13, p10

    move-object/from16 v14, p11

    move-object/from16 v15, p12

    move-object/from16 v16, p13

    move-object/from16 v17, p14

    move-object/from16 v18, p15

    move-object/from16 v19, p16

    move/from16 v20, p17

    move-object/from16 v21, p18

    move-object/from16 v22, p19

    move-object/from16 v23, p20

    move-object/from16 v24, p21

    invoke-direct/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealCall;Ljava/util/List;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)V

    return-object v1
.end method

.method public getAuthenticator()Lnicoid/network238/okhttp3/Authenticator;
    .registers 2

    .line 62
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->authenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object v0
.end method

.method public getCache()Lnicoid/network238/okhttp3/Cache;
    .registers 2

    .line 63
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->cache:Lnicoid/network238/okhttp3/Cache;

    return-object v0
.end method

.method public final getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;
    .registers 2

    .line 54
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    return-object v0
.end method

.method public final getCertificateChainCleaner()Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
    .registers 2

    .line 76
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    return-object v0
.end method

.method public getCertificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;
    .registers 2

    .line 64
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->certificatePinner:Lnicoid/network238/okhttp3/CertificatePinner;

    return-object v0
.end method

.method public final getConnectTimeoutMillis$okhttp()I
    .registers 2

    .line 59
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->connectTimeoutMillis:I

    return v0
.end method

.method public getConnectionPool()Lnicoid/network238/okhttp3/ConnectionPool;
    .registers 2

    .line 65
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->connectionPool:Lnicoid/network238/okhttp3/ConnectionPool;

    return-object v0
.end method

.method public getCookieJar()Lnicoid/network238/okhttp3/CookieJar;
    .registers 2

    .line 66
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->cookieJar:Lnicoid/network238/okhttp3/CookieJar;

    return-object v0
.end method

.method public getDns()Lnicoid/network238/okhttp3/Dns;
    .registers 2

    .line 67
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->dns:Lnicoid/network238/okhttp3/Dns;

    return-object v0
.end method

.method public getEventListener()Lnicoid/network238/okhttp3/EventListener;
    .registers 2

    .line 162
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    return-object v0
.end method

.method public final getExchange$okhttp()Lnicoid/network238/okhttp3/internal/connection/Exchange;
    .registers 2

    .line 57
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    return-object v0
.end method

.method public getFollowRedirects()Z
    .registers 2

    .line 168
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->followRedirects()Z

    move-result v0

    return v0
.end method

.method public getFollowSslRedirects()Z
    .registers 2

    .line 165
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getClient()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient;->followSslRedirects()Z

    move-result v0

    return v0
.end method

.method public getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .registers 2

    .line 68
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method public getProxy()Ljava/net/Proxy;
    .registers 2

    .line 69
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public getProxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;
    .registers 2

    .line 70
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proxyAuthenticator:Lnicoid/network238/okhttp3/Authenticator;

    return-object v0
.end method

.method public getProxySelector()Ljava/net/ProxySelector;
    .registers 2

    .line 71
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proxySelector:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public final getReadTimeoutMillis$okhttp()I
    .registers 2

    .line 60
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->readTimeoutMillis:I

    return v0
.end method

.method public final getRequest$okhttp()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 58
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->request:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method

.method public getRetryOnConnectionFailure()Z
    .registers 2

    .line 72
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->retryOnConnectionFailure:Z

    return v0
.end method

.method public getSocketFactory()Ljavax/net/SocketFactory;
    .registers 2

    .line 73
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public getSslSocketFactoryOrNull()Ljavax/net/ssl/SSLSocketFactory;
    .registers 2

    .line 74
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->sslSocketFactoryOrNull:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method public final getWriteTimeoutMillis$okhttp()I
    .registers 2

    .line 61
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->writeTimeoutMillis:I

    return v0
.end method

.method public getX509TrustManagerOrNull()Ljavax/net/ssl/X509TrustManager;
    .registers 2

    .line 75
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->x509TrustManagerOrNull:Ljavax/net/ssl/X509TrustManager;

    return-object v0
.end method

.method public proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;
    .registers 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 313
    iget v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->index:I

    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_5

    .line 315
    iget v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->calls:I

    const/4 v2, 0x1

    add-int/2addr v0, v2

    iput v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->calls:I

    .line 317
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    const-string v3, " must call proceed() exactly once"

    const-string v4, "network interceptor "

    if-eqz v0, :cond_2

    .line 318
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getFinder$okhttp()Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/connection/ExchangeFinder;->getRoutePlanner()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    invoke-interface {v0, v5}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;->sameHostAndPort(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 321
    iget v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->calls:I

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 322
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget v5, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->index:I

    sub-int/2addr v5, v2

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 321
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 319
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget v4, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->index:I

    sub-int/2addr v4, v2

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " must retain the same host and port"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 318
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 327
    :cond_2
    :goto_0
    iget v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->index:I

    add-int/2addr v0, v2

    const v23, 0x1ffffa

    const/16 v24, 0x0

    move-object v5, v3

    const/4 v3, 0x0

    move-object v6, v5

    const/4 v5, 0x0

    move-object v7, v6

    const/4 v6, 0x0

    move-object v8, v7

    const/4 v7, 0x0

    move-object v9, v8

    const/4 v8, 0x0

    move-object v10, v9

    const/4 v9, 0x0

    move-object v11, v10

    const/4 v10, 0x0

    move-object v12, v11

    const/4 v11, 0x0

    move-object v13, v12

    const/4 v12, 0x0

    move-object v14, v13

    const/4 v13, 0x0

    move-object v15, v14

    const/4 v14, 0x0

    move-object/from16 v16, v15

    const/4 v15, 0x0

    move-object/from16 v17, v16

    const/16 v16, 0x0

    move-object/from16 v18, v17

    const/16 v17, 0x0

    move-object/from16 v19, v18

    const/16 v18, 0x0

    move-object/from16 v20, v19

    const/16 v19, 0x0

    move-object/from16 v21, v20

    const/16 v20, 0x0

    move-object/from16 v22, v21

    const/16 v21, 0x0

    move-object/from16 v25, v22

    const/16 v22, 0x0

    move/from16 v26, v2

    move v2, v0

    move/from16 v0, v26

    move-object/from16 v26, v4

    move-object/from16 v4, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v2

    .line 328
    iget-object v3, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    iget v4, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->index:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/Interceptor;

    .line 332
    invoke-interface {v3, v2}, Lnicoid/network238/okhttp3/Interceptor;->intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 336
    iget-object v5, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-eqz v5, :cond_3

    .line 337
    iget v5, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->index:I

    add-int/2addr v5, v0

    iget-object v6, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->interceptors:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_3

    iget v2, v2, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->calls:I

    if-eq v2, v0, :cond_3

    .line 338
    new-instance v0, Ljava/lang/StringBuilder;

    move-object/from16 v2, v26

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v5, v25

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 337
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_3
    return-object v4

    .line 332
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    .line 333
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "interceptor "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " returned null"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 332
    invoke-direct {v0, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 313
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Check failed."

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readTimeoutMillis()I
    .registers 2

    .line 183
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->readTimeoutMillis:I

    return v0
.end method

.method public request()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 309
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->request:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method

.method public withAuthenticator(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 224
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 226
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1fffbf

    const/16 v24, 0x0

    move-object/from16 v8, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 224
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "authenticator can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withCache(Lnicoid/network238/okhttp3/Cache;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    .line 236
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 238
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1fff7f

    const/16 v24, 0x0

    move-object/from16 v9, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 236
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cache can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withCertificatePinner(Lnicoid/network238/okhttp3/CertificatePinner;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    move-object/from16 v1, p0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 289
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_1

    .line 292
    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->certificateChainCleaner:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    if-eqz v0, :cond_0

    .line 293
    move-object/from16 v2, p1

    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/CertificatePinner;->withCertificateChainCleaner$okhttp(Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v0

    move-object v10, v0

    goto :goto_0

    .line 292
    :cond_0
    move-object/from16 v2, p1

    move-object v10, v2

    .line 293
    :goto_0
    nop

    .line 298
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1ffeff

    const/16 v24, 0x0

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 289
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "certificatePinner can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withConnectTimeout(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 28

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 178
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    move/from16 v0, p1

    int-to-long v2, v0

    .line 180
    const-string v0, "connectTimeout"

    move-object/from16 v4, p2

    invoke-static {v0, v2, v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result v5

    const v23, 0x1ffff7

    const/16 v24, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 178
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Timeouts can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withConnectionPool(Lnicoid/network238/okhttp3/ConnectionPool;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 302
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 304
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1ffdff

    const/16 v24, 0x0

    move-object/from16 v11, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 302
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "connectionPool can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withCookieJar(Lnicoid/network238/okhttp3/CookieJar;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 230
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 232
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1ffbff

    const/16 v24, 0x0

    move-object/from16 v12, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 230
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cookieJar can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withDns(Lnicoid/network238/okhttp3/Dns;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 208
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1ff7ff

    const/16 v24, 0x0

    move-object/from16 v13, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 206
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "dns can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 283
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 285
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1fefff

    const/16 v24, 0x0

    move-object/from16 v14, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 283
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "hostnameVerifier can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withProxy(Ljava/net/Proxy;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    .line 242
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 244
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1fdfff

    const/16 v24, 0x0

    move-object/from16 v15, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 242
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "proxy can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withProxyAuthenticator(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 256
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1fbfff

    const/16 v24, 0x0

    move-object/from16 v16, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 254
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "proxyAuthenticator can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withProxySelector(Ljava/net/ProxySelector;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 248
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 250
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1f7fff

    const/16 v24, 0x0

    move-object/from16 v17, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 248
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "proxySelector can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withReadTimeout(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 28

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 189
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    move/from16 v0, p1

    int-to-long v2, v0

    .line 191
    const-string v0, "readTimeout"

    move-object/from16 v4, p2

    invoke-static {v0, v2, v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result v6

    const v23, 0x1fffef

    const/16 v24, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 189
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Timeouts can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withRetryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    .line 218
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 220
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1effff

    const/16 v24, 0x0

    move/from16 v18, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 218
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "retryOnConnectionFailure can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withSocketFactory(Ljavax/net/SocketFactory;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 27

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 212
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    .line 214
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x1dffff

    const/16 v24, 0x0

    move-object/from16 v19, p1

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 212
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "socketFactory can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withSslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 28

    .line 263
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v2, :cond_1

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    .line 266
    sget-object v2, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;->Companion:Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;

    invoke-virtual {v2, v0}, Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner$Companion;->get(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object v2

    .line 271
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getCertificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v3

    invoke-virtual {v3, v2}, Lnicoid/network238/okhttp3/CertificatePinner;->withCertificateChainCleaner$okhttp(Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;)Lnicoid/network238/okhttp3/CertificatePinner;

    move-result-object v10

    .line 267
    move-object/from16 v22, v2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const v23, 0x3feff

    const/16 v24, 0x0

    move-object/from16 v20, p1

    move-object/from16 v21, v0

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    :cond_0
    nop

    .line 274
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const v23, 0x3ffff

    const/16 v24, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 263
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "sslSocketFactory can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public withWriteTimeout(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/Interceptor$Chain;
    .registers 28

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 200
    move-object/from16 v1, p0

    iget-object v0, v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->exchange:Lnicoid/network238/okhttp3/internal/connection/Exchange;

    if-nez v0, :cond_0

    move/from16 v0, p1

    int-to-long v2, v0

    .line 202
    const-string v0, "writeTimeout"

    move-object/from16 v4, p2

    invoke-static {v0, v2, v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result v7

    const v23, 0x1fffdf

    const/16 v24, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    return-object v0

    .line 200
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Timeouts can\'t be adjusted in a network interceptor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeTimeoutMillis()I
    .registers 2

    .line 194
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->writeTimeoutMillis:I

    return v0
.end method

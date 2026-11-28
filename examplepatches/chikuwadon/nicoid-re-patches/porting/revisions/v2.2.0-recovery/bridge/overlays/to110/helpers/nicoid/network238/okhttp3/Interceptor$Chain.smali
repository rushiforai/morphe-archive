.class public interface abstract Lnicoid/network238/okhttp3/Interceptor$Chain;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Interceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Chain"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00a2\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008f\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H&J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u0003H&J\n\u0010\u0006\u001a\u0004\u0018\u00010\u0007H&J\u0008\u0010\u0008\u001a\u00020\tH&J\u0008\u0010\n\u001a\u00020\u000bH&J\u0018\u0010\u000c\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000fH&J\u0008\u0010\u0010\u001a\u00020\u000bH&J\u0018\u0010\u0011\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000fH&J\u0008\u0010\u0012\u001a\u00020\u000bH&J\u0018\u0010\u0013\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000fH&J\u0010\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\u001bH&J\u0010\u0010#\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020 H&J\u0010\u0010&\u001a\u00020\u00002\u0006\u0010$\u001a\u00020\u0015H&J\u0010\u0010+\u001a\u00020\u00002\u0006\u0010\'\u001a\u00020(H&J\u0010\u00100\u001a\u00020\u00002\u0006\u0010,\u001a\u00020-H&J\u0012\u00105\u001a\u00020\u00002\u0008\u00101\u001a\u0004\u0018\u000102H&J\u0012\u0010:\u001a\u00020\u00002\u0008\u00106\u001a\u0004\u0018\u000107H&J\u0010\u0010?\u001a\u00020\u00002\u0006\u0010;\u001a\u00020<H&J\u0010\u0010B\u001a\u00020\u00002\u0006\u0010@\u001a\u00020(H&J\u001c\u0010G\u001a\u00020\u00002\u0008\u0010H\u001a\u0004\u0018\u00010D2\u0008\u0010I\u001a\u0004\u0018\u00010JH&J\u0010\u0010R\u001a\u00020\u00002\u0006\u0010N\u001a\u00020OH&J\u0010\u0010W\u001a\u00020\u00002\u0006\u0010S\u001a\u00020TH&J\u0010\u0010\\\u001a\u00020\u00002\u0006\u0010X\u001a\u00020YH&R\u0012\u0010\u0014\u001a\u00020\u0015X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u0017R\u0012\u0010\u0018\u001a\u00020\u0015X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0019\u0010\u0017R\u0012\u0010\u001a\u001a\u00020\u001bX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001c\u0010\u001dR\u0012\u0010\u001f\u001a\u00020 X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008!\u0010\"R\u0012\u0010$\u001a\u00020\u0015X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008%\u0010\u0017R\u0012\u0010\'\u001a\u00020(X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008)\u0010*R\u0012\u0010,\u001a\u00020-X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008.\u0010/R\u0014\u00101\u001a\u0004\u0018\u000102X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u00083\u00104R\u0014\u00106\u001a\u0004\u0018\u000107X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u00088\u00109R\u0012\u0010;\u001a\u00020<X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008=\u0010>R\u0012\u0010@\u001a\u00020(X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008A\u0010*R\u0014\u0010C\u001a\u0004\u0018\u00010DX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008E\u0010FR\u0014\u0010K\u001a\u0004\u0018\u00010JX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008L\u0010MR\u0012\u0010N\u001a\u00020OX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008P\u0010QR\u0012\u0010S\u001a\u00020TX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008U\u0010VR\u0012\u0010X\u001a\u00020YX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008Z\u0010[R\u0012\u0010]\u001a\u00020^X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008_\u0010`\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006a\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "proceed",
        "Lnicoid/network238/okhttp3/Response;",
        "connection",
        "Lnicoid/network238/okhttp3/Connection;",
        "call",
        "Lnicoid/network238/okhttp3/Call;",
        "connectTimeoutMillis",
        "",
        "withConnectTimeout",
        "timeout",
        "unit",
        "Ljava/util/concurrent/TimeUnit;",
        "readTimeoutMillis",
        "withReadTimeout",
        "writeTimeoutMillis",
        "withWriteTimeout",
        "followSslRedirects",
        "",
        "getFollowSslRedirects",
        "()Z",
        "followRedirects",
        "getFollowRedirects",
        "dns",
        "Lnicoid/network238/okhttp3/Dns;",
        "getDns",
        "()Lnicoid/network238/okhttp3/Dns;",
        "withDns",
        "socketFactory",
        "Ljavax/net/SocketFactory;",
        "getSocketFactory",
        "()Ljavax/net/SocketFactory;",
        "withSocketFactory",
        "retryOnConnectionFailure",
        "getRetryOnConnectionFailure",
        "withRetryOnConnectionFailure",
        "authenticator",
        "Lnicoid/network238/okhttp3/Authenticator;",
        "getAuthenticator",
        "()Lnicoid/network238/okhttp3/Authenticator;",
        "withAuthenticator",
        "cookieJar",
        "Lnicoid/network238/okhttp3/CookieJar;",
        "getCookieJar",
        "()Lnicoid/network238/okhttp3/CookieJar;",
        "withCookieJar",
        "cache",
        "Lnicoid/network238/okhttp3/Cache;",
        "getCache",
        "()Lnicoid/network238/okhttp3/Cache;",
        "withCache",
        "proxy",
        "Ljava/net/Proxy;",
        "getProxy",
        "()Ljava/net/Proxy;",
        "withProxy",
        "proxySelector",
        "Ljava/net/ProxySelector;",
        "getProxySelector",
        "()Ljava/net/ProxySelector;",
        "withProxySelector",
        "proxyAuthenticator",
        "getProxyAuthenticator",
        "withProxyAuthenticator",
        "sslSocketFactoryOrNull",
        "Ljavax/net/ssl/SSLSocketFactory;",
        "getSslSocketFactoryOrNull",
        "()Ljavax/net/ssl/SSLSocketFactory;",
        "withSslSocketFactory",
        "sslSocketFactory",
        "x509TrustManager",
        "Ljavax/net/ssl/X509TrustManager;",
        "x509TrustManagerOrNull",
        "getX509TrustManagerOrNull",
        "()Ljavax/net/ssl/X509TrustManager;",
        "hostnameVerifier",
        "Ljavax/net/ssl/HostnameVerifier;",
        "getHostnameVerifier",
        "()Ljavax/net/ssl/HostnameVerifier;",
        "withHostnameVerifier",
        "certificatePinner",
        "Lnicoid/network238/okhttp3/CertificatePinner;",
        "getCertificatePinner",
        "()Lnicoid/network238/okhttp3/CertificatePinner;",
        "withCertificatePinner",
        "connectionPool",
        "Lnicoid/network238/okhttp3/ConnectionPool;",
        "getConnectionPool",
        "()Lnicoid/network238/okhttp3/ConnectionPool;",
        "withConnectionPool",
        "eventListener",
        "Lnicoid/network238/okhttp3/EventListener;",
        "getEventListener",
        "()Lnicoid/network238/okhttp3/EventListener;",
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


# virtual methods
.method public abstract call()Lnicoid/network238/okhttp3/Call;
.end method

.method public abstract connectTimeoutMillis()I
.end method

.method public abstract connection()Lnicoid/network238/okhttp3/Connection;
.end method

.method public abstract getAuthenticator()Lnicoid/network238/okhttp3/Authenticator;
.end method

.method public abstract getCache()Lnicoid/network238/okhttp3/Cache;
.end method

.method public abstract getCertificatePinner()Lnicoid/network238/okhttp3/CertificatePinner;
.end method

.method public abstract getConnectionPool()Lnicoid/network238/okhttp3/ConnectionPool;
.end method

.method public abstract getCookieJar()Lnicoid/network238/okhttp3/CookieJar;
.end method

.method public abstract getDns()Lnicoid/network238/okhttp3/Dns;
.end method

.method public abstract getEventListener()Lnicoid/network238/okhttp3/EventListener;
.end method

.method public abstract getFollowRedirects()Z
.end method

.method public abstract getFollowSslRedirects()Z
.end method

.method public abstract getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
.end method

.method public abstract getProxy()Ljava/net/Proxy;
.end method

.method public abstract getProxyAuthenticator()Lnicoid/network238/okhttp3/Authenticator;
.end method

.method public abstract getProxySelector()Ljava/net/ProxySelector;
.end method

.method public abstract getRetryOnConnectionFailure()Z
.end method

.method public abstract getSocketFactory()Ljavax/net/SocketFactory;
.end method

.method public abstract getSslSocketFactoryOrNull()Ljavax/net/ssl/SSLSocketFactory;
.end method

.method public abstract getX509TrustManagerOrNull()Ljavax/net/ssl/X509TrustManager;
.end method

.method public abstract proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract readTimeoutMillis()I
.end method

.method public abstract request()Lnicoid/network238/okhttp3/Request;
.end method

.method public abstract withAuthenticator(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withCache(Lnicoid/network238/okhttp3/Cache;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withCertificatePinner(Lnicoid/network238/okhttp3/CertificatePinner;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withConnectTimeout(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withConnectionPool(Lnicoid/network238/okhttp3/ConnectionPool;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withCookieJar(Lnicoid/network238/okhttp3/CookieJar;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withDns(Lnicoid/network238/okhttp3/Dns;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withProxy(Ljava/net/Proxy;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withProxyAuthenticator(Lnicoid/network238/okhttp3/Authenticator;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withProxySelector(Ljava/net/ProxySelector;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withReadTimeout(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withRetryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withSocketFactory(Ljavax/net/SocketFactory;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withSslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract withWriteTimeout(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/Interceptor$Chain;
.end method

.method public abstract writeTimeoutMillis()I
.end method

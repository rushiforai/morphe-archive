.class public final Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "<init>",
        "()V",
        "intercept",
        "Lnicoid/network238/okhttp3/Response;",
        "chain",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
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
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;->INSTANCE:Lnicoid/network238/okhttp3/internal/connection/ConnectInterceptor;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    move-object/from16 v1, p1

    check-cast v1, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    .line 32
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getCall$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealCall;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->initExchange$okhttp(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;)Lnicoid/network238/okhttp3/internal/connection/Exchange;

    move-result-object v3

    .line 33
    const/4 v2, 0x0

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

    const v23, 0x1ffffd

    const/16 v24, 0x0

    invoke-static/range {v1 .. v24}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->copy$okhttp$default(Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;ILnicoid/network238/okhttp3/internal/connection/Exchange;Lnicoid/network238/okhttp3/Request;IIILnicoid/network238/okhttp3/Authenticator;Lnicoid/network238/okhttp3/Cache;Lnicoid/network238/okhttp3/CertificatePinner;Lnicoid/network238/okhttp3/ConnectionPool;Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/Dns;Ljavax/net/ssl/HostnameVerifier;Ljava/net/Proxy;Lnicoid/network238/okhttp3/Authenticator;Ljava/net/ProxySelector;ZLjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;

    move-result-object v0

    .line 34
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->getRequest$okhttp()Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/http/RealInterceptorChain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    return-object v0
.end method

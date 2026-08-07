.class public final Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field public authenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

.field public cache:Lcom/tencent/cloud/ai/network/okhttp3/c;

.field public callTimeout:I

.field public certificateChainCleaner:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

.field public certificatePinner:Lcom/tencent/cloud/ai/network/okhttp3/e;

.field public connectTimeout:I

.field public connectionPool:Lcom/tencent/cloud/ai/network/okhttp3/i;

.field public connectionSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/j;",
            ">;"
        }
    .end annotation
.end field

.field public cookieJar:Lcom/tencent/cloud/ai/network/okhttp3/l;

.field public dispatcher:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

.field public dns:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

.field public eventListenerFactory:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

.field public followRedirects:Z

.field public followSslRedirects:Z

.field public hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

.field public final interceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field public internalCache:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

.field public final networkInterceptors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field public pingInterval:I

.field public protocols:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/q;",
            ">;"
        }
    .end annotation
.end field

.field public proxy:Ljava/net/Proxy;

.field public proxyAuthenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

.field public proxySelector:Ljava/net/ProxySelector;

.field public readTimeout:I

.field public retryOnConnectionFailure:Z

.field public socketFactory:Ljavax/net/SocketFactory;

.field public sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field public writeTimeout:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    .line 135
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dispatcher:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 136
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->C:Ljava/util/List;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    .line 137
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->D:Ljava/util/List;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    .line 138
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/m;->a:Lcom/tencent/cloud/ai/network/okhttp3/m;

    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/m;->a(Lcom/tencent/cloud/ai/network/okhttp3/m;)Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 139
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    if-nez v0, :cond_0

    .line 140
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/proxy/a;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/proxy/a;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    .line 141
    :cond_0
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/l;->a:Lcom/tencent/cloud/ai/network/okhttp3/l;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->cookieJar:Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 142
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 143
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/d;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/d;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 144
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/e;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->certificatePinner:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 145
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/b;->a:Lcom/tencent/cloud/ai/network/okhttp3/b;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 146
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->authenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 147
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/i;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/i;-><init>()V

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectionPool:Lcom/tencent/cloud/ai/network/okhttp3/i;

    .line 148
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/Dns;->SYSTEM:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dns:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    const/4 v0, 0x1

    .line 149
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    .line 150
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    .line 151
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    const/4 v0, 0x0

    .line 152
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->callTimeout:I

    const/16 v1, 0x2710

    .line 153
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    .line 154
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->readTimeout:I

    .line 155
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    .line 156
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->pingInterval:I

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->a:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 19
    .line 20
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dispatcher:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->b:Ljava/net/Proxy;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    .line 25
    .line 26
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->c:Ljava/util/List;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    .line 29
    .line 30
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->d:Ljava/util/List;

    .line 31
    .line 32
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    .line 33
    .line 34
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->e:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->f:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->g:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 47
    .line 48
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->h:Ljava/net/ProxySelector;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    .line 51
    .line 52
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->i:Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->cookieJar:Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 55
    .line 56
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->internalCache:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->cache:Lcom/tencent/cloud/ai/network/okhttp3/c;

    .line 62
    .line 63
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->l:Ljavax/net/SocketFactory;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 66
    .line 67
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 70
    .line 71
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->n:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 74
    .line 75
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 78
    .line 79
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->p:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->certificatePinner:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 82
    .line 83
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->q:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 86
    .line 87
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->r:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->authenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 90
    .line 91
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->s:Lcom/tencent/cloud/ai/network/okhttp3/i;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectionPool:Lcom/tencent/cloud/ai/network/okhttp3/i;

    .line 94
    .line 95
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->t:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dns:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 98
    .line 99
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->u:Z

    .line 100
    .line 101
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    .line 102
    .line 103
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->v:Z

    .line 104
    .line 105
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    .line 106
    .line 107
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->w:Z

    .line 108
    .line 109
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    .line 110
    .line 111
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->x:I

    .line 112
    .line 113
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->callTimeout:I

    .line 114
    .line 115
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->y:I

    .line 116
    .line 117
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    .line 118
    .line 119
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->z:I

    .line 120
    .line 121
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->readTimeout:I

    .line 122
    .line 123
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->A:I

    .line 124
    .line 125
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    .line 126
    .line 127
    iget p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->B:I

    .line 128
    .line 129
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->pingInterval:I

    .line 130
    .line 131
    return-void
.end method


# virtual methods
.method public addInterceptor(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const-string p0, "interceptor == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public addNetworkInterceptor(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const-string p0, "interceptor == null"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public authenticator(Lcom/tencent/cloud/ai/network/okhttp3/b;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->authenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "authenticator == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public build()Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public cache(Lcom/tencent/cloud/ai/network/okhttp3/c;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->cache:Lcom/tencent/cloud/ai/network/okhttp3/c;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->internalCache:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    .line 5
    .line 6
    return-object p0
.end method

.method public callTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    const-string v0, "timeout"

    .line 16
    invoke-static {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->callTimeout:I

    return-object p0
.end method

.method public callTimeout(Ljava/time/Duration;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 3
    .annotation build Lorg/codehaus/mojo/animal_sniffer/IgnoreJRERequirement;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/r3x0;->a(Ljava/time/Duration;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    const-string v2, "timeout"

    .line 8
    .line 9
    invoke-static {v2, v0, v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->callTimeout:I

    .line 14
    .line 15
    return-object p0
.end method

.method public certificatePinner(Lcom/tencent/cloud/ai/network/okhttp3/e;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->certificatePinner:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "certificatePinner == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public connectTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    const-string v0, "timeout"

    .line 16
    invoke-static {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    return-object p0
.end method

.method public connectTimeout(Ljava/time/Duration;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation build Lorg/codehaus/mojo/animal_sniffer/IgnoreJRERequirement;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/r3x0;->a(Ljava/time/Duration;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    const-string v2, "timeout"

    .line 8
    .line 9
    invoke-static {v2, v0, v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    .line 14
    .line 15
    return-object p0
.end method

.method public connectionPool(Lcom/tencent/cloud/ai/network/okhttp3/i;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectionPool:Lcom/tencent/cloud/ai/network/okhttp3/i;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "connectionPool == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public connectionSpecs(Ljava/util/List;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/j;",
            ">;)",
            "Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public cookieJar(Lcom/tencent/cloud/ai/network/okhttp3/l;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->cookieJar:Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "cookieJar == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public dispatcher(Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dispatcher:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "dispatcher == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public dns(Lcom/tencent/cloud/ai/network/okhttp3/Dns;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dns:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "dns == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public eventListener(Lcom/tencent/cloud/ai/network/okhttp3/m;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/m;->a(Lcom/tencent/cloud/ai/network/okhttp3/m;)Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "eventListener == null"

    .line 11
    .line 12
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public eventListenerFactory(Lcom/tencent/cloud/ai/network/okhttp3/m$b;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "eventListenerFactory == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public followRedirects(Z)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public followSslRedirects(Z)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public hostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "hostnameVerifier == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public interceptors()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public networkInterceptors()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public pingInterval(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    const-string v0, "interval"

    .line 16
    invoke-static {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->pingInterval:I

    return-object p0
.end method

.method public pingInterval(Ljava/time/Duration;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 3
    .annotation build Lorg/codehaus/mojo/animal_sniffer/IgnoreJRERequirement;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/r3x0;->a(Ljava/time/Duration;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    const-string v2, "timeout"

    .line 8
    .line 9
    invoke-static {v2, v0, v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->pingInterval:I

    .line 14
    .line 15
    return-object p0
.end method

.method public protocols(Ljava/util/List;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/q;",
            ">;)",
            "Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/q;->f:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/q;->c:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p0, "protocols must contain h2_prior_knowledge or http/1.1: "

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0

    .line 30
    :cond_1
    :goto_0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v1, 0x1

    .line 41
    if-gt p1, v1, :cond_2

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    const-string p0, "protocols containing h2_prior_knowledge cannot use other protocols: "

    .line 45
    .line 46
    invoke-static {p0, v0}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0

    .line 51
    :cond_3
    :goto_1
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/q;->b:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_5

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_4

    .line 65
    .line 66
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_4
    const-string p0, "protocols must not contain null"

    .line 79
    .line 80
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    const/4 p0, 0x0

    .line 84
    return-object p0

    .line 85
    :cond_5
    const-string p0, "protocols must not contain http/1.0: "

    .line 86
    .line 87
    invoke-static {p0, v0}, Ll/ypg0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    const/4 p0, 0x0

    .line 91
    return-object p0
.end method

.method public proxy(Ljava/net/Proxy;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public proxyAuthenticator(Lcom/tencent/cloud/ai/network/okhttp3/b;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "proxyAuthenticator == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public proxySelector(Ljava/net/ProxySelector;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "proxySelector == null"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public readTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    const-string v0, "timeout"

    .line 16
    invoke-static {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->readTimeout:I

    return-object p0
.end method

.method public readTimeout(Ljava/time/Duration;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 3
    .annotation build Lorg/codehaus/mojo/animal_sniffer/IgnoreJRERequirement;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/r3x0;->a(Ljava/time/Duration;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    const-string v2, "timeout"

    .line 8
    .line 9
    invoke-static {v2, v0, v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->readTimeout:I

    .line 14
    .line 15
    return-object p0
.end method

.method public retryOnConnectionFailure(Z)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public socketFactory(Ljavax/net/SocketFactory;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    instance-of v1, p1, Ljavax/net/ssl/SSLSocketFactory;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "socketFactory instanceof SSLSocketFactory"

    .line 12
    .line 13
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_1
    const-string p0, "socketFactory == null"

    .line 18
    .line 19
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 5
    .line 6
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 7
    .line 8
    invoke-virtual {v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljavax/net/ssl/X509TrustManager;)Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "Unable to extract the trust manager on "

    .line 24
    .line 25
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ", sslSocketFactory is "

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0, v1, p1}, Ll/l5j;->a(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_1
    const-string p0, "sslSocketFactory == null"

    .line 42
    .line 43
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method public sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 47
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 48
    sget-object p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 49
    invoke-virtual {p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(Ljavax/net/ssl/X509TrustManager;)Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    return-object p0

    .line 51
    :cond_0
    const-string p0, "trustManager == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    return-object v0

    .line 52
    :cond_1
    const-string p0, "sslSocketFactory == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    return-object v0
.end method

.method public writeTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    const-string v0, "timeout"

    .line 16
    invoke-static {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result p1

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    return-object p0
.end method

.method public writeTimeout(Ljava/time/Duration;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 3
    .annotation build Lorg/codehaus/mojo/animal_sniffer/IgnoreJRERequirement;
    .end annotation

    .line 1
    invoke-static {p1}, Ll/r3x0;->a(Ljava/time/Duration;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    const-string v2, "timeout"

    .line 8
    .line 9
    invoke-static {v2, v0, v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    .line 14
    .line 15
    return-object p0
.end method

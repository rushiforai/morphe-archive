.class public Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    }
.end annotation


# static fields
.field public static final C:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/q;",
            ">;"
        }
    .end annotation
.end field

.field public static final D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/j;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final A:I

.field public final B:I

.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

.field public final b:Ljava/net/Proxy;

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/q;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/j;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

.field public final h:Ljava/net/ProxySelector;

.field public final i:Lcom/tencent/cloud/ai/network/okhttp3/l;

.field public final j:Lcom/tencent/cloud/ai/network/okhttp3/c;

.field public final k:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

.field public final l:Ljavax/net/SocketFactory;

.field public final m:Ljavax/net/ssl/SSLSocketFactory;

.field public final n:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

.field public final o:Ljavax/net/ssl/HostnameVerifier;

.field public final p:Lcom/tencent/cloud/ai/network/okhttp3/e;

.field public final q:Lcom/tencent/cloud/ai/network/okhttp3/b;

.field public final r:Lcom/tencent/cloud/ai/network/okhttp3/b;

.field public final s:Lcom/tencent/cloud/ai/network/okhttp3/i;

.field public final t:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

.field public final u:Z

.field public final v:Z

.field public final w:Z

.field public final x:I

.field public final y:I

.field public final z:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/q;->e:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/q;->c:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->C:Ljava/util/List;

    .line 14
    .line 15
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/j;->g:Lcom/tencent/cloud/ai/network/okhttp3/j;

    .line 16
    .line 17
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/j;

    .line 18
    .line 19
    filled-new-array {v0, v1}, [Lcom/tencent/cloud/ai/network/okhttp3/j;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, [Ljava/lang/Object;

    .line 28
    .line 29
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->D:Ljava/util/List;

    .line 38
    .line 39
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 40
    .line 41
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;-><init>()V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 223
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;-><init>()V

    invoke-direct {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;)V

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dispatcher:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->a:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxy:Ljava/net/Proxy;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->b:Ljava/net/Proxy;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->protocols:Ljava/util/List;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->c:Ljava/util/List;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectionSpecs:Ljava/util/List;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->d:Ljava/util/List;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->interceptors:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/util/List;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->e:Ljava/util/List;

    .line 27
    .line 28
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->networkInterceptors:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/util/List;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->f:Ljava/util/List;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->eventListenerFactory:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 37
    .line 38
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->g:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxySelector:Ljava/net/ProxySelector;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->h:Ljava/net/ProxySelector;

    .line 43
    .line 44
    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->cookieJar:Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 45
    .line 46
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->i:Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->j:Lcom/tencent/cloud/ai/network/okhttp3/c;

    .line 50
    .line 51
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->internalCache:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    .line 52
    .line 53
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    .line 54
    .line 55
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 56
    .line 57
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->l:Ljavax/net/SocketFactory;

    .line 58
    .line 59
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v2, 0x0

    .line 64
    :cond_0
    move v3, v2

    .line 65
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_2

    .line 70
    .line 71
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Lcom/tencent/cloud/ai/network/okhttp3/j;

    .line 76
    .line 77
    if-nez v3, :cond_1

    .line 78
    .line 79
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/j;->a()Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_0

    .line 84
    .line 85
    :cond_1
    const/4 v3, 0x1

    .line 86
    goto :goto_0

    .line 87
    :cond_2
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 88
    .line 89
    if-nez v0, :cond_4

    .line 90
    .line 91
    if-nez v3, :cond_3

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    invoke-static {}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a()Ljavax/net/ssl/X509TrustManager;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->a(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;->a(Ljavax/net/ssl/X509TrustManager;)Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->n:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    :goto_1
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 112
    .line 113
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->certificateChainCleaner:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 114
    .line 115
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->n:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 116
    .line 117
    :goto_2
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 118
    .line 119
    if-eqz v0, :cond_5

    .line 120
    .line 121
    invoke-static {}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->b()Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a()V

    .line 126
    .line 127
    .line 128
    :cond_5
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->hostnameVerifier:Ljavax/net/ssl/HostnameVerifier;

    .line 129
    .line 130
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 131
    .line 132
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->certificatePinner:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 133
    .line 134
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->n:Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/e;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/tls/c;)Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->p:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 141
    .line 142
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->proxyAuthenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->q:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 145
    .line 146
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->authenticator:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 147
    .line 148
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->r:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 149
    .line 150
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectionPool:Lcom/tencent/cloud/ai/network/okhttp3/i;

    .line 151
    .line 152
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->s:Lcom/tencent/cloud/ai/network/okhttp3/i;

    .line 153
    .line 154
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dns:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 155
    .line 156
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->t:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 157
    .line 158
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->followSslRedirects:Z

    .line 159
    .line 160
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->u:Z

    .line 161
    .line 162
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->followRedirects:Z

    .line 163
    .line 164
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->v:Z

    .line 165
    .line 166
    iget-boolean v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure:Z

    .line 167
    .line 168
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->w:Z

    .line 169
    .line 170
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->callTimeout:I

    .line 171
    .line 172
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->x:I

    .line 173
    .line 174
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectTimeout:I

    .line 175
    .line 176
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->y:I

    .line 177
    .line 178
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->readTimeout:I

    .line 179
    .line 180
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->z:I

    .line 181
    .line 182
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->writeTimeout:I

    .line 183
    .line 184
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->A:I

    .line 185
    .line 186
    iget p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->pingInterval:I

    .line 187
    .line 188
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->B:I

    .line 189
    .line 190
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->e:Ljava/util/List;

    .line 191
    .line 192
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-nez p1, :cond_7

    .line 197
    .line 198
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->f:Ljava/util/List;

    .line 199
    .line 200
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    if-nez p1, :cond_6

    .line 205
    .line 206
    return-void

    .line 207
    :cond_6
    const-string p1, "Null network interceptor: "

    .line 208
    .line 209
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->f:Ljava/util/List;

    .line 210
    .line 211
    invoke-static {p1, p0}, Ll/qg50;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 212
    .line 213
    .line 214
    throw v1

    .line 215
    :cond_7
    const-string p1, "Null interceptor: "

    .line 216
    .line 217
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->e:Ljava/util/List;

    .line 218
    .line 219
    invoke-static {p1, p0}, Ll/qg50;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 220
    .line 221
    .line 222
    throw v1
.end method

.method public static a(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->c()Ljavax/net/ssl/SSLContext;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    new-array v1, v1, [Ljavax/net/ssl/TrustManager;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aput-object p0, v1, v2

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    invoke-virtual {v0, p0, v1, p0}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return-object p0

    .line 22
    :catch_0
    move-exception p0

    .line 23
    new-instance v0, Ljava/lang/AssertionError;

    .line 24
    .line 25
    const-string v1, "No System TLS"

    .line 26
    .line 27
    invoke-direct {v0, v1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    throw v0
.end method


# virtual methods
.method public authenticator()Lcom/tencent/cloud/ai/network/okhttp3/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->r:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public cache()Lcom/tencent/cloud/ai/network/okhttp3/c;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public callTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public certificatePinner()Lcom/tencent/cloud/ai/network/okhttp3/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->p:Lcom/tencent/cloud/ai/network/okhttp3/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public connectTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public connectionPool()Lcom/tencent/cloud/ai/network/okhttp3/i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->s:Lcom/tencent/cloud/ai/network/okhttp3/i;

    .line 2
    .line 3
    return-object p0
.end method

.method public connectionSpecs()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/j;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public cookieJar()Lcom/tencent/cloud/ai/network/okhttp3/l;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->i:Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->a:Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 2
    .line 3
    return-object p0
.end method

.method public dns()Lcom/tencent/cloud/ai/network/okhttp3/Dns;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->t:Lcom/tencent/cloud/ai/network/okhttp3/Dns;

    .line 2
    .line 3
    return-object p0
.end method

.method public eventListenerFactory()Lcom/tencent/cloud/ai/network/okhttp3/m$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->g:Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public followRedirects()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public followSslRedirects()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public hostnameVerifier()Ljavax/net/ssl/HostnameVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 2
    .line 3
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
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->e:Ljava/util/List;

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
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public newCall(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Call;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/r;->a(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public newWebSocket(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;)Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 2
    .line 3
    new-instance v3, Ljava/util/Random;

    .line 4
    .line 5
    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->B:I

    .line 9
    .line 10
    int-to-long v4, v1

    .line 11
    move-object v1, p1

    .line 12
    move-object v2, p2

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;Ljava/util/Random;J)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->connect(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public pingIntervalMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public protocols()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/q;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public proxy()Ljava/net/Proxy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->b:Ljava/net/Proxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public proxyAuthenticator()Lcom/tencent/cloud/ai/network/okhttp3/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->q:Lcom/tencent/cloud/ai/network/okhttp3/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public proxySelector()Ljava/net/ProxySelector;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->h:Ljava/net/ProxySelector;

    .line 2
    .line 3
    return-object p0
.end method

.method public readTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public retryOnConnectionFailure()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public socketFactory()Ljavax/net/SocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->l:Ljavax/net/SocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public writeTimeoutMillis()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->A:I

    .line 2
    .line 3
    return p0
.end method

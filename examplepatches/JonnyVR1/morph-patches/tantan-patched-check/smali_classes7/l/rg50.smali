.class public Ll/rg50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ll/ry3$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rg50$b;
    }
.end annotation


# static fields
.field public static final C:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field public static final D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final A:I

.field public final B:I

.field public final a:Ll/o5e;

.field public final b:Ljava/net/Proxy;

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/a;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/azm;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/azm;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ll/t4f$b;

.field public final h:Ljava/net/ProxySelector;

.field public final i:Ll/eu6;

.field public final j:Ll/tx3;

.field public final k:Ll/lzm;

.field public final l:Ljavax/net/SocketFactory;

.field public final m:Ljavax/net/ssl/SSLSocketFactory;

.field public final n:Ll/vq4;

.field public final o:Ljavax/net/ssl/HostnameVerifier;

.field public final p:Ll/xq4;

.field public final q:Ll/ce1;

.field public final r:Ll/ce1;

.field public final s:Ll/lx5;

.field public final t:Ll/o6e;

.field public final u:Z

.field public final v:Z

.field public final w:Z

.field public final x:I

.field public final y:I

.field public final z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;

    .line 2
    .line 3
    sget-object v1, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lokhttp3/Protocol;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/zlk0;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/rg50;->C:Ljava/util/List;

    .line 14
    .line 15
    sget-object v0, Lokhttp3/a;->h:Lokhttp3/a;

    .line 16
    .line 17
    sget-object v1, Lokhttp3/a;->j:Lokhttp3/a;

    .line 18
    .line 19
    filled-new-array {v0, v1}, [Lokhttp3/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/zlk0;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Ll/rg50;->D:Ljava/util/List;

    .line 28
    .line 29
    new-instance v0, Ll/rg50$a;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/rg50$a;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Ll/kzm;->a:Ll/kzm;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 227
    new-instance v0, Ll/rg50$b;

    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    invoke-direct {p0, v0}, Ll/rg50;-><init>(Ll/rg50$b;)V

    return-void
.end method

.method public constructor <init>(Ll/rg50$b;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/rg50$b;->a:Ll/o5e;

    .line 5
    .line 6
    iput-object v0, p0, Ll/rg50;->a:Ll/o5e;

    .line 7
    .line 8
    iget-object v0, p1, Ll/rg50$b;->b:Ljava/net/Proxy;

    .line 9
    .line 10
    iput-object v0, p0, Ll/rg50;->b:Ljava/net/Proxy;

    .line 11
    .line 12
    iget-object v0, p1, Ll/rg50$b;->c:Ljava/util/List;

    .line 13
    .line 14
    iput-object v0, p0, Ll/rg50;->c:Ljava/util/List;

    .line 15
    .line 16
    iget-object v0, p1, Ll/rg50$b;->d:Ljava/util/List;

    .line 17
    .line 18
    iput-object v0, p0, Ll/rg50;->d:Ljava/util/List;

    .line 19
    .line 20
    iget-object v1, p1, Ll/rg50$b;->e:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v1}, Ll/zlk0;->t(Ljava/util/List;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, p0, Ll/rg50;->e:Ljava/util/List;

    .line 27
    .line 28
    iget-object v1, p1, Ll/rg50$b;->f:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {v1}, Ll/zlk0;->t(Ljava/util/List;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, p0, Ll/rg50;->f:Ljava/util/List;

    .line 35
    .line 36
    iget-object v1, p1, Ll/rg50$b;->g:Ll/t4f$b;

    .line 37
    .line 38
    iput-object v1, p0, Ll/rg50;->g:Ll/t4f$b;

    .line 39
    .line 40
    iget-object v1, p1, Ll/rg50$b;->h:Ljava/net/ProxySelector;

    .line 41
    .line 42
    iput-object v1, p0, Ll/rg50;->h:Ljava/net/ProxySelector;

    .line 43
    .line 44
    iget-object v1, p1, Ll/rg50$b;->i:Ll/eu6;

    .line 45
    .line 46
    iput-object v1, p0, Ll/rg50;->i:Ll/eu6;

    .line 47
    .line 48
    iget-object v1, p1, Ll/rg50$b;->j:Ll/tx3;

    .line 49
    .line 50
    iput-object v1, p0, Ll/rg50;->j:Ll/tx3;

    .line 51
    .line 52
    iget-object v1, p1, Ll/rg50$b;->k:Ll/lzm;

    .line 53
    .line 54
    iput-object v1, p0, Ll/rg50;->k:Ll/lzm;

    .line 55
    .line 56
    iget-object v1, p1, Ll/rg50$b;->l:Ljavax/net/SocketFactory;

    .line 57
    .line 58
    iput-object v1, p0, Ll/rg50;->l:Ljavax/net/SocketFactory;

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v1, 0x0

    .line 65
    :cond_0
    move v2, v1

    .line 66
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_2

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lokhttp3/a;

    .line 77
    .line 78
    if-nez v2, :cond_1

    .line 79
    .line 80
    invoke-virtual {v3}, Lokhttp3/a;->d()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_0

    .line 85
    .line 86
    :cond_1
    const/4 v2, 0x1

    .line 87
    goto :goto_0

    .line 88
    :cond_2
    iget-object v0, p1, Ll/rg50$b;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 89
    .line 90
    if-nez v0, :cond_4

    .line 91
    .line 92
    if-nez v2, :cond_3

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    invoke-static {}, Ll/zlk0;->C()Ljavax/net/ssl/X509TrustManager;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Ll/rg50;->w(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, p0, Ll/rg50;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 104
    .line 105
    invoke-static {v0}, Ll/vq4;->get(Ljavax/net/ssl/X509TrustManager;)Ll/vq4;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Ll/rg50;->n:Ll/vq4;

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_4
    :goto_1
    iput-object v0, p0, Ll/rg50;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 113
    .line 114
    iget-object v0, p1, Ll/rg50$b;->n:Ll/vq4;

    .line 115
    .line 116
    iput-object v0, p0, Ll/rg50;->n:Ll/vq4;

    .line 117
    .line 118
    :goto_2
    iget-object v0, p0, Ll/rg50;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 119
    .line 120
    if-eqz v0, :cond_5

    .line 121
    .line 122
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object v1, p0, Ll/rg50;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lokhttp3/internal/platform/Platform;->configureSslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 129
    .line 130
    .line 131
    :cond_5
    iget-object v0, p1, Ll/rg50$b;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 132
    .line 133
    iput-object v0, p0, Ll/rg50;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 134
    .line 135
    iget-object v0, p1, Ll/rg50$b;->p:Ll/xq4;

    .line 136
    .line 137
    iget-object v1, p0, Ll/rg50;->n:Ll/vq4;

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ll/xq4;->f(Ll/vq4;)Ll/xq4;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p0, Ll/rg50;->p:Ll/xq4;

    .line 144
    .line 145
    iget-object v0, p1, Ll/rg50$b;->q:Ll/ce1;

    .line 146
    .line 147
    iput-object v0, p0, Ll/rg50;->q:Ll/ce1;

    .line 148
    .line 149
    iget-object v0, p1, Ll/rg50$b;->r:Ll/ce1;

    .line 150
    .line 151
    iput-object v0, p0, Ll/rg50;->r:Ll/ce1;

    .line 152
    .line 153
    iget-object v0, p1, Ll/rg50$b;->s:Ll/lx5;

    .line 154
    .line 155
    iput-object v0, p0, Ll/rg50;->s:Ll/lx5;

    .line 156
    .line 157
    iget-object v0, p1, Ll/rg50$b;->t:Ll/o6e;

    .line 158
    .line 159
    iput-object v0, p0, Ll/rg50;->t:Ll/o6e;

    .line 160
    .line 161
    iget-boolean v0, p1, Ll/rg50$b;->u:Z

    .line 162
    .line 163
    iput-boolean v0, p0, Ll/rg50;->u:Z

    .line 164
    .line 165
    iget-boolean v0, p1, Ll/rg50$b;->v:Z

    .line 166
    .line 167
    iput-boolean v0, p0, Ll/rg50;->v:Z

    .line 168
    .line 169
    iget-boolean v0, p1, Ll/rg50$b;->w:Z

    .line 170
    .line 171
    iput-boolean v0, p0, Ll/rg50;->w:Z

    .line 172
    .line 173
    iget v0, p1, Ll/rg50$b;->x:I

    .line 174
    .line 175
    iput v0, p0, Ll/rg50;->x:I

    .line 176
    .line 177
    iget v0, p1, Ll/rg50$b;->y:I

    .line 178
    .line 179
    iput v0, p0, Ll/rg50;->y:I

    .line 180
    .line 181
    iget v0, p1, Ll/rg50$b;->z:I

    .line 182
    .line 183
    iput v0, p0, Ll/rg50;->z:I

    .line 184
    .line 185
    iget v0, p1, Ll/rg50$b;->A:I

    .line 186
    .line 187
    iput v0, p0, Ll/rg50;->A:I

    .line 188
    .line 189
    iget p1, p1, Ll/rg50$b;->B:I

    .line 190
    .line 191
    iput p1, p0, Ll/rg50;->B:I

    .line 192
    .line 193
    iget-object p1, p0, Ll/rg50;->e:Ljava/util/List;

    .line 194
    .line 195
    const/4 v0, 0x0

    .line 196
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-nez p1, :cond_7

    .line 201
    .line 202
    iget-object p1, p0, Ll/rg50;->f:Ljava/util/List;

    .line 203
    .line 204
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-nez p1, :cond_6

    .line 209
    .line 210
    return-void

    .line 211
    :cond_6
    const-string p1, "Null network interceptor: "

    .line 212
    .line 213
    iget-object p0, p0, Ll/rg50;->f:Ljava/util/List;

    .line 214
    .line 215
    invoke-static {p1, p0}, Ll/qg50;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    throw v0

    .line 219
    :cond_7
    const-string p1, "Null interceptor: "

    .line 220
    .line 221
    iget-object p0, p0, Ll/rg50;->e:Ljava/util/List;

    .line 222
    .line 223
    invoke-static {p1, p0}, Ll/qg50;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 224
    .line 225
    .line 226
    throw v0
.end method

.method public static w(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lokhttp3/internal/platform/Platform;->getSSLContext()Ljavax/net/ssl/SSLContext;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v1, v1, [Ljavax/net/ssl/TrustManager;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput-object p0, v1, v2

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-virtual {v0, p0, v1, p0}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 20
    .line 21
    .line 22
    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    return-object p0

    .line 24
    :catch_0
    move-exception p0

    .line 25
    new-instance v0, Ljava/lang/AssertionError;

    .line 26
    .line 27
    const-string v1, "No System TLS"

    .line 28
    .line 29
    invoke-direct {v0, v1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    throw v0
.end method


# virtual methods
.method public A()Ljava/net/Proxy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->b:Ljava/net/Proxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()Ll/ce1;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->q:Ll/ce1;

    .line 2
    .line 3
    return-object p0
.end method

.method public C()Ljava/net/ProxySelector;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->h:Ljava/net/ProxySelector;

    .line 2
    .line 3
    return-object p0
.end method

.method public D()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rg50;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public E()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rg50;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public G()Ljavax/net/SocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->l:Ljavax/net/SocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public K()Ljavax/net/ssl/SSLSocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public L()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rg50;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public a(Ll/x1d0;)Ll/ry3;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/hmc0;->d(Ll/rg50;Ll/x1d0;Z)Ll/hmc0;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public b()Ll/ce1;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->r:Ll/ce1;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/tx3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->j:Ll/tx3;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rg50;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Ll/xq4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->p:Ll/xq4;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rg50;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public j()Ll/lx5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->s:Ll/lx5;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lokhttp3/a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rg50;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Ll/eu6;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->i:Ll/eu6;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Ll/o5e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->a:Ll/o5e;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Ll/o6e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->t:Ll/o6e;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ll/t4f$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->g:Ll/t4f$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rg50;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rg50;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public r()Ljavax/net/ssl/HostnameVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg50;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/azm;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rg50;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Ll/lzm;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rg50;->j:Ll/tx3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, v0, Ll/tx3;->a:Ll/lzm;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/rg50;->k:Ll/lzm;

    .line 9
    .line 10
    return-object p0
.end method

.method public u()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/azm;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rg50;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Ll/rg50$b;
    .locals 1

    .line 1
    new-instance v0, Ll/rg50$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rg50$b;-><init>(Ll/rg50;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public x(Ll/x1d0;Ll/ksp0;)Ll/hsp0;
    .locals 6

    .line 1
    new-instance v0, Ll/jnc0;

    .line 2
    .line 3
    new-instance v3, Ljava/util/Random;

    .line 4
    .line 5
    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/rg50;->B:I

    .line 9
    .line 10
    int-to-long v4, v1

    .line 11
    move-object v1, p1

    .line 12
    move-object v2, p2

    .line 13
    invoke-direct/range {v0 .. v5}, Ll/jnc0;-><init>(Ll/x1d0;Ll/ksp0;Ljava/util/Random;J)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/jnc0;->i(Ll/rg50;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rg50;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public z()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rg50;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

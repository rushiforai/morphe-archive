.class public final Ll/rg50$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rg50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public a:Ll/o5e;

.field public b:Ljava/net/Proxy;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
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

.field public g:Ll/t4f$b;

.field public h:Ljava/net/ProxySelector;

.field public i:Ll/eu6;

.field public j:Ll/tx3;

.field public k:Ll/lzm;

.field public l:Ljavax/net/SocketFactory;

.field public m:Ljavax/net/ssl/SSLSocketFactory;

.field public n:Ll/vq4;

.field public o:Ljavax/net/ssl/HostnameVerifier;

.field public p:Ll/xq4;

.field public q:Ll/ce1;

.field public r:Ll/ce1;

.field public s:Ll/lx5;

.field public t:Ll/o6e;

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/rg50$b;->e:Ljava/util/List;

    .line 135
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/rg50$b;->f:Ljava/util/List;

    .line 136
    new-instance v0, Ll/o5e;

    invoke-direct {v0}, Ll/o5e;-><init>()V

    iput-object v0, p0, Ll/rg50$b;->a:Ll/o5e;

    .line 137
    sget-object v0, Ll/rg50;->C:Ljava/util/List;

    iput-object v0, p0, Ll/rg50$b;->c:Ljava/util/List;

    .line 138
    sget-object v0, Ll/rg50;->D:Ljava/util/List;

    iput-object v0, p0, Ll/rg50$b;->d:Ljava/util/List;

    .line 139
    sget-object v0, Ll/t4f;->NONE:Ll/t4f;

    invoke-static {v0}, Ll/t4f;->factory(Ll/t4f;)Ll/t4f$b;

    move-result-object v0

    iput-object v0, p0, Ll/rg50$b;->g:Ll/t4f$b;

    .line 140
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v0

    iput-object v0, p0, Ll/rg50$b;->h:Ljava/net/ProxySelector;

    if-nez v0, :cond_0

    .line 141
    new-instance v0, Ll/g350;

    invoke-direct {v0}, Ll/g350;-><init>()V

    iput-object v0, p0, Ll/rg50$b;->h:Ljava/net/ProxySelector;

    .line 142
    :cond_0
    sget-object v0, Ll/eu6;->a:Ll/eu6;

    iput-object v0, p0, Ll/rg50$b;->i:Ll/eu6;

    .line 143
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Ll/rg50$b;->l:Ljavax/net/SocketFactory;

    .line 144
    sget-object v0, Ll/pg50;->INSTANCE:Ll/pg50;

    iput-object v0, p0, Ll/rg50$b;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 145
    sget-object v0, Ll/xq4;->c:Ll/xq4;

    iput-object v0, p0, Ll/rg50$b;->p:Ll/xq4;

    .line 146
    sget-object v0, Ll/ce1;->a:Ll/ce1;

    iput-object v0, p0, Ll/rg50$b;->q:Ll/ce1;

    .line 147
    iput-object v0, p0, Ll/rg50$b;->r:Ll/ce1;

    .line 148
    new-instance v0, Ll/lx5;

    invoke-direct {v0}, Ll/lx5;-><init>()V

    iput-object v0, p0, Ll/rg50$b;->s:Ll/lx5;

    .line 149
    sget-object v0, Ll/o6e;->a:Ll/o6e;

    iput-object v0, p0, Ll/rg50$b;->t:Ll/o6e;

    const/4 v0, 0x1

    .line 150
    iput-boolean v0, p0, Ll/rg50$b;->u:Z

    .line 151
    iput-boolean v0, p0, Ll/rg50$b;->v:Z

    .line 152
    iput-boolean v0, p0, Ll/rg50$b;->w:Z

    const/4 v0, 0x0

    .line 153
    iput v0, p0, Ll/rg50$b;->x:I

    const/16 v1, 0x2710

    .line 154
    iput v1, p0, Ll/rg50$b;->y:I

    .line 155
    iput v1, p0, Ll/rg50$b;->z:I

    .line 156
    iput v1, p0, Ll/rg50$b;->A:I

    .line 157
    iput v0, p0, Ll/rg50$b;->B:I

    return-void
.end method

.method public constructor <init>(Ll/rg50;)V
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
    iput-object v0, p0, Ll/rg50$b;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/rg50$b;->f:Ljava/util/List;

    .line 17
    .line 18
    iget-object v2, p1, Ll/rg50;->a:Ll/o5e;

    .line 19
    .line 20
    iput-object v2, p0, Ll/rg50$b;->a:Ll/o5e;

    .line 21
    .line 22
    iget-object v2, p1, Ll/rg50;->b:Ljava/net/Proxy;

    .line 23
    .line 24
    iput-object v2, p0, Ll/rg50$b;->b:Ljava/net/Proxy;

    .line 25
    .line 26
    iget-object v2, p1, Ll/rg50;->c:Ljava/util/List;

    .line 27
    .line 28
    iput-object v2, p0, Ll/rg50$b;->c:Ljava/util/List;

    .line 29
    .line 30
    iget-object v2, p1, Ll/rg50;->d:Ljava/util/List;

    .line 31
    .line 32
    iput-object v2, p0, Ll/rg50$b;->d:Ljava/util/List;

    .line 33
    .line 34
    iget-object v2, p1, Ll/rg50;->e:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p1, Ll/rg50;->f:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p1, Ll/rg50;->g:Ll/t4f$b;

    .line 45
    .line 46
    iput-object v0, p0, Ll/rg50$b;->g:Ll/t4f$b;

    .line 47
    .line 48
    iget-object v0, p1, Ll/rg50;->h:Ljava/net/ProxySelector;

    .line 49
    .line 50
    iput-object v0, p0, Ll/rg50$b;->h:Ljava/net/ProxySelector;

    .line 51
    .line 52
    iget-object v0, p1, Ll/rg50;->i:Ll/eu6;

    .line 53
    .line 54
    iput-object v0, p0, Ll/rg50$b;->i:Ll/eu6;

    .line 55
    .line 56
    iget-object v0, p1, Ll/rg50;->k:Ll/lzm;

    .line 57
    .line 58
    iput-object v0, p0, Ll/rg50$b;->k:Ll/lzm;

    .line 59
    .line 60
    iget-object v0, p1, Ll/rg50;->j:Ll/tx3;

    .line 61
    .line 62
    iput-object v0, p0, Ll/rg50$b;->j:Ll/tx3;

    .line 63
    .line 64
    iget-object v0, p1, Ll/rg50;->l:Ljavax/net/SocketFactory;

    .line 65
    .line 66
    iput-object v0, p0, Ll/rg50$b;->l:Ljavax/net/SocketFactory;

    .line 67
    .line 68
    iget-object v0, p1, Ll/rg50;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 69
    .line 70
    iput-object v0, p0, Ll/rg50$b;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 71
    .line 72
    iget-object v0, p1, Ll/rg50;->n:Ll/vq4;

    .line 73
    .line 74
    iput-object v0, p0, Ll/rg50$b;->n:Ll/vq4;

    .line 75
    .line 76
    iget-object v0, p1, Ll/rg50;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 77
    .line 78
    iput-object v0, p0, Ll/rg50$b;->o:Ljavax/net/ssl/HostnameVerifier;

    .line 79
    .line 80
    iget-object v0, p1, Ll/rg50;->p:Ll/xq4;

    .line 81
    .line 82
    iput-object v0, p0, Ll/rg50$b;->p:Ll/xq4;

    .line 83
    .line 84
    iget-object v0, p1, Ll/rg50;->q:Ll/ce1;

    .line 85
    .line 86
    iput-object v0, p0, Ll/rg50$b;->q:Ll/ce1;

    .line 87
    .line 88
    iget-object v0, p1, Ll/rg50;->r:Ll/ce1;

    .line 89
    .line 90
    iput-object v0, p0, Ll/rg50$b;->r:Ll/ce1;

    .line 91
    .line 92
    iget-object v0, p1, Ll/rg50;->s:Ll/lx5;

    .line 93
    .line 94
    iput-object v0, p0, Ll/rg50$b;->s:Ll/lx5;

    .line 95
    .line 96
    iget-object v0, p1, Ll/rg50;->t:Ll/o6e;

    .line 97
    .line 98
    iput-object v0, p0, Ll/rg50$b;->t:Ll/o6e;

    .line 99
    .line 100
    iget-boolean v0, p1, Ll/rg50;->u:Z

    .line 101
    .line 102
    iput-boolean v0, p0, Ll/rg50$b;->u:Z

    .line 103
    .line 104
    iget-boolean v0, p1, Ll/rg50;->v:Z

    .line 105
    .line 106
    iput-boolean v0, p0, Ll/rg50$b;->v:Z

    .line 107
    .line 108
    iget-boolean v0, p1, Ll/rg50;->w:Z

    .line 109
    .line 110
    iput-boolean v0, p0, Ll/rg50$b;->w:Z

    .line 111
    .line 112
    iget v0, p1, Ll/rg50;->x:I

    .line 113
    .line 114
    iput v0, p0, Ll/rg50$b;->x:I

    .line 115
    .line 116
    iget v0, p1, Ll/rg50;->y:I

    .line 117
    .line 118
    iput v0, p0, Ll/rg50$b;->y:I

    .line 119
    .line 120
    iget v0, p1, Ll/rg50;->z:I

    .line 121
    .line 122
    iput v0, p0, Ll/rg50$b;->z:I

    .line 123
    .line 124
    iget v0, p1, Ll/rg50;->A:I

    .line 125
    .line 126
    iput v0, p0, Ll/rg50$b;->A:I

    .line 127
    .line 128
    iget p1, p1, Ll/rg50;->B:I

    .line 129
    .line 130
    iput p1, p0, Ll/rg50$b;->B:I

    .line 131
    .line 132
    return-void
.end method


# virtual methods
.method public a(Ll/azm;)Ll/rg50$b;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/rg50$b;->e:Ljava/util/List;

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

.method public b(Ll/azm;)Ll/rg50$b;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/rg50$b;->f:Ljava/util/List;

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

.method public c()Ll/rg50;
    .locals 1

    .line 1
    new-instance v0, Ll/rg50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rg50;-><init>(Ll/rg50$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d(Ll/tx3;)Ll/rg50$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rg50$b;->j:Ll/tx3;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/rg50$b;->k:Ll/lzm;

    .line 5
    .line 6
    return-object p0
.end method

.method public e(Ll/xq4;)Ll/rg50$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/rg50$b;->p:Ll/xq4;

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

.method public f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;
    .locals 1

    .line 1
    const-string v0, "timeout"

    .line 2
    .line 3
    invoke-static {v0, p1, p2, p3}, Ll/zlk0;->e(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ll/rg50$b;->y:I

    .line 8
    .line 9
    return-object p0
.end method

.method public g(Ll/lx5;)Ll/rg50$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/rg50$b;->s:Ll/lx5;

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

.method public h(Ljava/util/List;)Ll/rg50$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lokhttp3/a;",
            ">;)",
            "Ll/rg50$b;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/zlk0;->t(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/rg50$b;->d:Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public i(Ll/o5e;)Ll/rg50$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/rg50$b;->a:Ll/o5e;

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

.method public j(Ll/o6e;)Ll/rg50$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/rg50$b;->t:Ll/o6e;

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

.method public k(Ll/t4f;)Ll/rg50$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ll/t4f;->factory(Ll/t4f;)Ll/t4f$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/rg50$b;->g:Ll/t4f$b;

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

.method public l(Ll/t4f$b;)Ll/rg50$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/rg50$b;->g:Ll/t4f$b;

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

.method public m(Z)Ll/rg50$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rg50$b;->v:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Z)Ll/rg50$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rg50$b;->u:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ljavax/net/ssl/HostnameVerifier;)Ll/rg50$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/rg50$b;->o:Ljavax/net/ssl/HostnameVerifier;

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

.method public p()Ljava/util/List;
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
    iget-object p0, p0, Ll/rg50$b;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;
    .locals 1

    .line 1
    const-string v0, "interval"

    .line 2
    .line 3
    invoke-static {v0, p1, p2, p3}, Ll/zlk0;->e(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ll/rg50$b;->B:I

    .line 8
    .line 9
    return-object p0
.end method

.method public r(Ljava/util/List;)Ll/rg50$b;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;)",
            "Ll/rg50$b;"
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
    sget-object p1, Lokhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lokhttp3/Protocol;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    sget-object v1, Lokhttp3/Protocol;->HTTP_1_1:Lokhttp3/Protocol;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

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
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->size()I

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
    sget-object p1, Lokhttp3/Protocol;->HTTP_1_0:Lokhttp3/Protocol;

    .line 52
    .line 53
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

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
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_4

    .line 65
    .line 66
    sget-object p1, Lokhttp3/Protocol;->SPDY_3:Lokhttp3/Protocol;

    .line 67
    .line 68
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Ll/rg50$b;->c:Ljava/util/List;

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

.method public s(Ljava/net/Proxy;)Ll/rg50$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rg50$b;->b:Ljava/net/Proxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Ljava/net/ProxySelector;)Ll/rg50$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/rg50$b;->h:Ljava/net/ProxySelector;

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

.method public u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;
    .locals 1

    .line 1
    const-string v0, "timeout"

    .line 2
    .line 3
    invoke-static {v0, p1, p2, p3}, Ll/zlk0;->e(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ll/rg50$b;->z:I

    .line 8
    .line 9
    return-object p0
.end method

.method public v(Z)Ll/rg50$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rg50$b;->w:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ljavax/net/ssl/SSLSocketFactory;)Ll/rg50$b;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/rg50$b;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 4
    .line 5
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Lokhttp3/internal/platform/Platform;->buildCertificateChainCleaner(Ljavax/net/ssl/SSLSocketFactory;)Ll/vq4;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/rg50$b;->n:Ll/vq4;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "sslSocketFactory == null"

    .line 17
    .line 18
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public x(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Ll/rg50$b;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iput-object p1, p0, Ll/rg50$b;->m:Ljavax/net/ssl/SSLSocketFactory;

    .line 7
    .line 8
    invoke-static {p2}, Ll/vq4;->get(Ljavax/net/ssl/X509TrustManager;)Ll/vq4;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/rg50$b;->n:Ll/vq4;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "trustManager == null"

    .line 16
    .line 17
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_1
    const-string p0, "sslSocketFactory == null"

    .line 22
    .line 23
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;
    .locals 1

    .line 1
    const-string v0, "timeout"

    .line 2
    .line 3
    invoke-static {v0, p1, p2, p3}, Ll/zlk0;->e(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ll/rg50$b;->A:I

    .line 8
    .line 9
    return-object p0
.end method

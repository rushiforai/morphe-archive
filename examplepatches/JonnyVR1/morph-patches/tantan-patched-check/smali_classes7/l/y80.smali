.class public final Ll/y80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/rnl;

.field public final b:Ll/o6e;

.field public final c:Ljavax/net/SocketFactory;

.field public final d:Ll/ce1;

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/a;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/net/ProxySelector;

.field public final h:Ljava/net/Proxy;

.field public final i:Ljavax/net/ssl/SSLSocketFactory;

.field public final j:Ljavax/net/ssl/HostnameVerifier;

.field public final k:Ll/xq4;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILl/o6e;Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Ll/xq4;Ll/ce1;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ll/o6e;",
            "Ljavax/net/SocketFactory;",
            "Ljavax/net/ssl/SSLSocketFactory;",
            "Ljavax/net/ssl/HostnameVerifier;",
            "Ll/xq4;",
            "Ll/ce1;",
            "Ljava/net/Proxy;",
            "Ljava/util/List<",
            "Lokhttp3/Protocol;",
            ">;",
            "Ljava/util/List<",
            "Lokhttp3/a;",
            ">;",
            "Ljava/net/ProxySelector;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rnl$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/rnl$a;-><init>()V

    .line 7
    .line 8
    .line 9
    if-eqz p5, :cond_0

    .line 10
    .line 11
    const-string v1, "https"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v1, "http"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, v1}, Ll/rnl$a;->v(Ljava/lang/String;)Ll/rnl$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p1}, Ll/rnl$a;->h(Ljava/lang/String;)Ll/rnl$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p2}, Ll/rnl$a;->o(I)Ll/rnl$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/rnl$a;->d()Ll/rnl;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/y80;->a:Ll/rnl;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    if-eqz p3, :cond_6

    .line 36
    .line 37
    iput-object p3, p0, Ll/y80;->b:Ll/o6e;

    .line 38
    .line 39
    if-eqz p4, :cond_5

    .line 40
    .line 41
    iput-object p4, p0, Ll/y80;->c:Ljavax/net/SocketFactory;

    .line 42
    .line 43
    if-eqz p8, :cond_4

    .line 44
    .line 45
    iput-object p8, p0, Ll/y80;->d:Ll/ce1;

    .line 46
    .line 47
    if-eqz p10, :cond_3

    .line 48
    .line 49
    invoke-static {p10}, Ll/zlk0;->t(Ljava/util/List;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iput-object p2, p0, Ll/y80;->e:Ljava/util/List;

    .line 54
    .line 55
    if-eqz p11, :cond_2

    .line 56
    .line 57
    invoke-static {p11}, Ll/zlk0;->t(Ljava/util/List;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iput-object p2, p0, Ll/y80;->f:Ljava/util/List;

    .line 62
    .line 63
    if-eqz p12, :cond_1

    .line 64
    .line 65
    iput-object p12, p0, Ll/y80;->g:Ljava/net/ProxySelector;

    .line 66
    .line 67
    iput-object p9, p0, Ll/y80;->h:Ljava/net/Proxy;

    .line 68
    .line 69
    iput-object p5, p0, Ll/y80;->i:Ljavax/net/ssl/SSLSocketFactory;

    .line 70
    .line 71
    iput-object p6, p0, Ll/y80;->j:Ljavax/net/ssl/HostnameVerifier;

    .line 72
    .line 73
    iput-object p7, p0, Ll/y80;->k:Ll/xq4;

    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    const-string p0, "proxySelector == null"

    .line 77
    .line 78
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw p1

    .line 82
    :cond_2
    const-string p0, "connectionSpecs == null"

    .line 83
    .line 84
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p1

    .line 88
    :cond_3
    const-string p0, "protocols == null"

    .line 89
    .line 90
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p1

    .line 94
    :cond_4
    const-string p0, "proxyAuthenticator == null"

    .line 95
    .line 96
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    throw p1

    .line 100
    :cond_5
    const-string p0, "socketFactory == null"

    .line 101
    .line 102
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    throw p1

    .line 106
    :cond_6
    const-string p0, "dns == null"

    .line 107
    .line 108
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw p1
.end method


# virtual methods
.method public a()Ll/xq4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->k:Ll/xq4;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/util/List;
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
    iget-object p0, p0, Ll/y80;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/o6e;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->b:Ll/o6e;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/y80;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y80;->b:Ll/o6e;

    .line 2
    .line 3
    iget-object v1, p1, Ll/y80;->b:Ll/o6e;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/y80;->d:Ll/ce1;

    .line 12
    .line 13
    iget-object v1, p1, Ll/y80;->d:Ll/ce1;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/y80;->e:Ljava/util/List;

    .line 22
    .line 23
    iget-object v1, p1, Ll/y80;->e:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/y80;->f:Ljava/util/List;

    .line 32
    .line 33
    iget-object v1, p1, Ll/y80;->f:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ll/y80;->g:Ljava/net/ProxySelector;

    .line 42
    .line 43
    iget-object v1, p1, Ll/y80;->g:Ljava/net/ProxySelector;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Ll/y80;->h:Ljava/net/Proxy;

    .line 52
    .line 53
    iget-object v1, p1, Ll/y80;->h:Ljava/net/Proxy;

    .line 54
    .line 55
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    iget-object v0, p0, Ll/y80;->i:Ljavax/net/ssl/SSLSocketFactory;

    .line 62
    .line 63
    iget-object v1, p1, Ll/y80;->i:Ljavax/net/ssl/SSLSocketFactory;

    .line 64
    .line 65
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_0

    .line 70
    .line 71
    iget-object v0, p0, Ll/y80;->j:Ljavax/net/ssl/HostnameVerifier;

    .line 72
    .line 73
    iget-object v1, p1, Ll/y80;->j:Ljavax/net/ssl/HostnameVerifier;

    .line 74
    .line 75
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_0

    .line 80
    .line 81
    iget-object v0, p0, Ll/y80;->k:Ll/xq4;

    .line 82
    .line 83
    iget-object v1, p1, Ll/y80;->k:Ll/xq4;

    .line 84
    .line 85
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_0

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/y80;->l()Ll/rnl;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ll/rnl;->y()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    invoke-virtual {p1}, Ll/y80;->l()Ll/rnl;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Ll/rnl;->y()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-ne p0, p1, :cond_0

    .line 108
    .line 109
    const/4 p0, 0x1

    .line 110
    return p0

    .line 111
    :cond_0
    const/4 p0, 0x0

    .line 112
    return p0
.end method

.method public e()Ljavax/net/ssl/HostnameVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->j:Ljavax/net/ssl/HostnameVerifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Ll/y80;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/y80;->a:Ll/rnl;

    .line 6
    .line 7
    check-cast p1, Ll/y80;

    .line 8
    .line 9
    iget-object v1, p1, Ll/y80;->a:Ll/rnl;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/rnl;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/y80;->d(Ll/y80;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public f()Ljava/util/List;
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
    iget-object p0, p0, Ll/y80;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/net/Proxy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->h:Ljava/net/Proxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ll/ce1;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->d:Ll/ce1;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y80;->a:Ll/rnl;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rnl;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x20f

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    mul-int/lit8 v1, v1, 0x1f

    .line 11
    .line 12
    iget-object v0, p0, Ll/y80;->b:Ll/o6e;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    add-int/2addr v1, v0

    .line 19
    mul-int/lit8 v1, v1, 0x1f

    .line 20
    .line 21
    iget-object v0, p0, Ll/y80;->d:Ll/ce1;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr v1, v0

    .line 28
    mul-int/lit8 v1, v1, 0x1f

    .line 29
    .line 30
    iget-object v0, p0, Ll/y80;->e:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/2addr v1, v0

    .line 37
    mul-int/lit8 v1, v1, 0x1f

    .line 38
    .line 39
    iget-object v0, p0, Ll/y80;->f:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr v1, v0

    .line 46
    mul-int/lit8 v1, v1, 0x1f

    .line 47
    .line 48
    iget-object v0, p0, Ll/y80;->g:Ljava/net/ProxySelector;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    add-int/2addr v1, v0

    .line 55
    mul-int/lit8 v1, v1, 0x1f

    .line 56
    .line 57
    iget-object v0, p0, Ll/y80;->h:Ljava/net/Proxy;

    .line 58
    .line 59
    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr v1, v0

    .line 64
    mul-int/lit8 v1, v1, 0x1f

    .line 65
    .line 66
    iget-object v0, p0, Ll/y80;->i:Ljavax/net/ssl/SSLSocketFactory;

    .line 67
    .line 68
    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr v1, v0

    .line 73
    mul-int/lit8 v1, v1, 0x1f

    .line 74
    .line 75
    iget-object v0, p0, Ll/y80;->j:Ljavax/net/ssl/HostnameVerifier;

    .line 76
    .line 77
    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr v1, v0

    .line 82
    mul-int/lit8 v1, v1, 0x1f

    .line 83
    .line 84
    iget-object p0, p0, Ll/y80;->k:Ll/xq4;

    .line 85
    .line 86
    invoke-static {p0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    add-int/2addr v1, p0

    .line 91
    return v1
.end method

.method public i()Ljava/net/ProxySelector;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->g:Ljava/net/ProxySelector;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ljavax/net/SocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->c:Ljavax/net/SocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ljavax/net/ssl/SSLSocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->i:Ljavax/net/ssl/SSLSocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Ll/rnl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y80;->a:Ll/rnl;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Address{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/y80;->a:Ll/rnl;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/rnl;->m()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ":"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/y80;->a:Ll/rnl;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/rnl;->y()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/y80;->h:Ljava/net/Proxy;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const-string v1, ", proxy="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/y80;->h:Ljava/net/Proxy;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const-string v1, ", proxySelector="

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/y80;->g:Ljava/net/ProxySelector;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    :goto_0
    const-string p0, "}"

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

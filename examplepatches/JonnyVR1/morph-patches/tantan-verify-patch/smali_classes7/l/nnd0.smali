.class public final Ll/nnd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/y80;

.field public final b:Ljava/net/Proxy;

.field public final c:Ljava/net/InetSocketAddress;


# direct methods
.method public constructor <init>(Ll/y80;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Ll/nnd0;->a:Ll/y80;

    .line 12
    .line 13
    iput-object p2, p0, Ll/nnd0;->b:Ljava/net/Proxy;

    .line 14
    .line 15
    iput-object p3, p0, Ll/nnd0;->c:Ljava/net/InetSocketAddress;

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, "inetSocketAddress == null"

    .line 19
    .line 20
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw v0

    .line 24
    :cond_1
    const-string p0, "proxy == null"

    .line 25
    .line 26
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw v0

    .line 30
    :cond_2
    const-string p0, "address == null"

    .line 31
    .line 32
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw v0
.end method


# virtual methods
.method public a()Ll/y80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnd0;->a:Ll/y80;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/net/Proxy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnd0;->b:Ljava/net/Proxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nnd0;->a:Ll/y80;

    .line 2
    .line 3
    iget-object v0, v0, Ll/y80;->i:Ljavax/net/ssl/SSLSocketFactory;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/nnd0;->b:Ljava/net/Proxy;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public d()Ljava/net/InetSocketAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nnd0;->c:Ljava/net/InetSocketAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Ll/nnd0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/nnd0;

    .line 6
    .line 7
    iget-object v0, p1, Ll/nnd0;->a:Ll/y80;

    .line 8
    .line 9
    iget-object v1, p0, Ll/nnd0;->a:Ll/y80;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/y80;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p1, Ll/nnd0;->b:Ljava/net/Proxy;

    .line 18
    .line 19
    iget-object v1, p0, Ll/nnd0;->b:Ljava/net/Proxy;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/net/Proxy;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p1, p1, Ll/nnd0;->c:Ljava/net/InetSocketAddress;

    .line 28
    .line 29
    iget-object p0, p0, Ll/nnd0;->c:Ljava/net/InetSocketAddress;

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ljava/net/InetSocketAddress;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nnd0;->a:Ll/y80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/y80;->hashCode()I

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
    iget-object v0, p0, Ll/nnd0;->b:Ljava/net/Proxy;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/net/Proxy;->hashCode()I

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
    iget-object p0, p0, Ll/nnd0;->c:Ljava/net/InetSocketAddress;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->hashCode()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    add-int/2addr v1, p0

    .line 28
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Route{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/nnd0;->c:Ljava/net/InetSocketAddress;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "}"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

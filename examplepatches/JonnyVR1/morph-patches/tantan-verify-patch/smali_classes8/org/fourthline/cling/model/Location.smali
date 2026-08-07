.class public Lorg/fourthline/cling/model/Location;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected final networkAddress:Lorg/fourthline/cling/model/NetworkAddress;

.field protected final path:Ljava/lang/String;

.field protected final url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/NetworkAddress;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/model/Location;->networkAddress:Lorg/fourthline/cling/model/NetworkAddress;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/model/Location;->path:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1}, Lorg/fourthline/cling/model/NetworkAddress;->getAddress()Ljava/net/InetAddress;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1}, Lorg/fourthline/cling/model/NetworkAddress;->getPort()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    invoke-static {v0, p1, p2}, Lorg/fourthline/cling/model/Location;->createAbsoluteURL(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/net/URL;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lorg/fourthline/cling/model/Location;->url:Ljava/net/URL;

    .line 21
    .line 22
    return-void
.end method

.method private static createAbsoluteURL(Ljava/net/InetAddress;ILjava/lang/String;)Ljava/net/URL;
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 2
    .line 3
    const-string v1, "http"

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, v1, p0, p1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 15
    .line 16
    const-string p2, "Address, port, and URI can not be converted to URL"

    .line 17
    .line 18
    invoke-direct {p1, p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lorg/fourthline/cling/model/Location;

    .line 20
    .line 21
    iget-object v2, p0, Lorg/fourthline/cling/model/Location;->networkAddress:Lorg/fourthline/cling/model/NetworkAddress;

    .line 22
    .line 23
    iget-object v3, p1, Lorg/fourthline/cling/model/Location;->networkAddress:Lorg/fourthline/cling/model/NetworkAddress;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lorg/fourthline/cling/model/NetworkAddress;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_2

    .line 30
    .line 31
    return v1

    .line 32
    :cond_2
    iget-object p0, p0, Lorg/fourthline/cling/model/Location;->path:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p1, p1, Lorg/fourthline/cling/model/Location;->path:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_3

    .line 41
    .line 42
    return v1

    .line 43
    :cond_3
    return v0

    .line 44
    :cond_4
    :goto_0
    return v1
.end method

.method public getNetworkAddress()Lorg/fourthline/cling/model/NetworkAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/Location;->networkAddress:Lorg/fourthline/cling/model/NetworkAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/Location;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getURL()Ljava/net/URL;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/Location;->url:Ljava/net/URL;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/model/Location;->networkAddress:Lorg/fourthline/cling/model/NetworkAddress;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/fourthline/cling/model/NetworkAddress;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object p0, p0, Lorg/fourthline/cling/model/Location;->path:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method

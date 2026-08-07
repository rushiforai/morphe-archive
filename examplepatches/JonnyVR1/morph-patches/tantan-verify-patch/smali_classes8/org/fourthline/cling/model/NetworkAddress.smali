.class public Lorg/fourthline/cling/model/NetworkAddress;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected address:Ljava/net/InetAddress;

.field protected hardwareAddress:[B

.field protected port:I


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lorg/fourthline/cling/model/NetworkAddress;-><init>(Ljava/net/InetAddress;I[B)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;I[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/model/NetworkAddress;->address:Ljava/net/InetAddress;

    .line 5
    .line 6
    iput p2, p0, Lorg/fourthline/cling/model/NetworkAddress;->port:I

    .line 7
    .line 8
    iput-object p3, p0, Lorg/fourthline/cling/model/NetworkAddress;->hardwareAddress:[B

    .line 9
    .line 10
    return-void
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
    if-eqz p1, :cond_5

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
    check-cast p1, Lorg/fourthline/cling/model/NetworkAddress;

    .line 20
    .line 21
    iget v2, p0, Lorg/fourthline/cling/model/NetworkAddress;->port:I

    .line 22
    .line 23
    iget v3, p1, Lorg/fourthline/cling/model/NetworkAddress;->port:I

    .line 24
    .line 25
    if-eq v2, v3, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    iget-object v2, p0, Lorg/fourthline/cling/model/NetworkAddress;->address:Ljava/net/InetAddress;

    .line 29
    .line 30
    iget-object v3, p1, Lorg/fourthline/cling/model/NetworkAddress;->address:Ljava/net/InetAddress;

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_3

    .line 37
    .line 38
    return v1

    .line 39
    :cond_3
    iget-object p0, p0, Lorg/fourthline/cling/model/NetworkAddress;->hardwareAddress:[B

    .line 40
    .line 41
    iget-object p1, p1, Lorg/fourthline/cling/model/NetworkAddress;->hardwareAddress:[B

    .line 42
    .line 43
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_4

    .line 48
    .line 49
    return v1

    .line 50
    :cond_4
    return v0

    .line 51
    :cond_5
    :goto_0
    return v1
.end method

.method public getAddress()Ljava/net/InetAddress;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/NetworkAddress;->address:Ljava/net/InetAddress;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHardwareAddress()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/NetworkAddress;->hardwareAddress:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getPort()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/fourthline/cling/model/NetworkAddress;->port:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/model/NetworkAddress;->address:Ljava/net/InetAddress;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/net/InetAddress;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget v1, p0, Lorg/fourthline/cling/model/NetworkAddress;->port:I

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    mul-int/lit8 v0, v0, 0x1f

    .line 13
    .line 14
    iget-object p0, p0, Lorg/fourthline/cling/model/NetworkAddress;->hardwareAddress:[B

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([B)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    add-int/2addr v0, p0

    .line 25
    return v0
.end method

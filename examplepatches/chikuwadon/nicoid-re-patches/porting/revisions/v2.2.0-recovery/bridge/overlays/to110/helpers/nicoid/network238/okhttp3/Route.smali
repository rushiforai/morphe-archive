.class public final Lnicoid/network238/okhttp3/Route;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0004\u0008\n\u0010\u000bB!\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000cJ\r\u0010\u0002\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u0011J\r\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0008\u0012J\r\u0010\u0006\u001a\u00020\u0007H\u0007\u00a2\u0006\u0002\u0008\u0013J\u0006\u0010\u0014\u001a\u00020\u0015J\u0013\u0010\u0016\u001a\u00020\u00152\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u0018\u001a\u00020\u0019H\u0016J\u0008\u0010\u001a\u001a\u00020\u001bH\u0016R\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\rR\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u000eR\u0013\u0010\u0006\u001a\u00020\u00078\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u000fR\u0015\u0010\u0008\u001a\u0004\u0018\u00010\t8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\u0010\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Route;",
        "",
        "address",
        "Lnicoid/network238/okhttp3/Address;",
        "proxy",
        "Ljava/net/Proxy;",
        "socketAddress",
        "Ljava/net/InetSocketAddress;",
        "echConfigList",
        "Lnicoid/network238/okio/ByteString;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lnicoid/network238/okio/ByteString;)V",
        "(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V",
        "()Lnicoid/network238/okhttp3/Address;",
        "()Ljava/net/Proxy;",
        "()Ljava/net/InetSocketAddress;",
        "()Lnicoid/network238/okio/ByteString;",
        "-deprecated_address",
        "-deprecated_proxy",
        "-deprecated_socketAddress",
        "requiresTunnel",
        "",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "",
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


# instance fields
.field private final address:Lnicoid/network238/okhttp3/Address;

.field private final echConfigList:Lnicoid/network238/okio/ByteString;

.field private final proxy:Ljava/net/Proxy;

.field private final socketAddress:Ljava/net/InetSocketAddress;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lnicoid/network238/okhttp3/Route;-><init>(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lnicoid/network238/okio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lnicoid/network238/okio/ByteString;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    .line 42
    iput-object p2, p0, Lnicoid/network238/okhttp3/Route;->proxy:Ljava/net/Proxy;

    .line 43
    iput-object p3, p0, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    .line 44
    iput-object p4, p0, Lnicoid/network238/okhttp3/Route;->echConfigList:Lnicoid/network238/okio/ByteString;

    return-void
.end method


# virtual methods
.method public final -deprecated_address()Lnicoid/network238/okhttp3/Address;
    .registers 2

    .line 58
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    return-object v0
.end method

.method public final -deprecated_proxy()Ljava/net/Proxy;
    .registers 2

    .line 66
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public final -deprecated_socketAddress()Ljava/net/InetSocketAddress;
    .registers 2

    .line 74
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method public final address()Lnicoid/network238/okhttp3/Address;
    .registers 2

    .line 35
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    return-object v0
.end method

.method public final echConfigList()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 44
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->echConfigList:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 89
    instance-of v0, p1, Lnicoid/network238/okhttp3/Route;

    if-eqz v0, :cond_0

    .line 90
    check-cast p1, Lnicoid/network238/okhttp3/Route;

    iget-object v0, p1, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p1, Lnicoid/network238/okhttp3/Route;->proxy:Ljava/net/Proxy;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->proxy:Ljava/net/Proxy;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p1, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    iget-object p1, p1, Lnicoid/network238/okhttp3/Route;->echConfigList:Lnicoid/network238/okio/ByteString;

    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->echConfigList:Lnicoid/network238/okio/ByteString;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .registers 3

    .line 97
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    .line 98
    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v1}, Ljava/net/Proxy;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 99
    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 100
    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->echConfigList:Lnicoid/network238/okio/ByteString;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public final proxy()Ljava/net/Proxy;
    .registers 2

    .line 42
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public final requiresTunnel()Z
    .registers 3

    .line 83
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 84
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->sslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    if-nez v0, :cond_1

    .line 85
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->protocols()Ljava/util/List;

    move-result-object v0

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lnicoid/network238/okhttp3/Protocol;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public final socketAddress()Ljava/net/InetSocketAddress;
    .registers 2

    .line 43
    iget-object v0, p0, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 13

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    .line 115
    iget-object v2, p0, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v3

    .line 118
    :goto_0
    const/16 v4, 0x3a

    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-static {v1, v4, v5, v6, v3}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v7

    const-string v8, "]"

    const-string v9, "["

    if-eqz v7, :cond_1

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 119
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    :goto_1
    iget-object v7, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v7

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v7

    iget-object v10, p0, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v10}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v10

    const-string v11, ":"

    if-ne v7, v10, :cond_2

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    goto :goto_2

    .line 122
    :cond_2
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    iget-object v7, p0, Lnicoid/network238/okhttp3/Route;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v7

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    :goto_2
    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 127
    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->proxy:Ljava/net/Proxy;

    .line 128
    sget-object v7, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-static {v1, v7}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, " at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 129
    :cond_3
    const-string v1, " via proxy "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3
    if-nez v2, :cond_4

    .line 133
    const-string v1, "<unresolved>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    :cond_4
    nop

    .line 134
    invoke-static {v2, v4, v5, v6, v3}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 135
    :cond_5
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    :goto_4
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->socketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    :cond_6
    iget-object v1, p0, Lnicoid/network238/okhttp3/Route;->echConfigList:Lnicoid/network238/okio/ByteString;

    if-eqz v1, :cond_7

    .line 142
    const-string v1, " with ECH"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.class public final Lnicoid/network238/okhttp3/Dns$Record$IpAddress;
.super Lnicoid/network238/okhttp3/Dns$Record;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Dns$Record;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IpAddress"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0013\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rH\u0096\u0002J\u0008\u0010\u000e\u001a\u00020\u000fH\u0016J\u0008\u0010\u0010\u001a\u00020\u0003H\u0016R\u0013\u0010\u0004\u001a\u00020\u00058\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u0008R\u0016\u0010\u0002\u001a\u00020\u00038\u0017X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\t\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Dns$Record$IpAddress;",
        "Lnicoid/network238/okhttp3/Dns$Record;",
        "hostname",
        "",
        "address",
        "Ljava/net/InetAddress;",
        "<init>",
        "(Ljava/lang/String;Ljava/net/InetAddress;)V",
        "()Ljava/net/InetAddress;",
        "()Ljava/lang/String;",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "",
        "toString",
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
.field private final address:Ljava/net/InetAddress;

.field private final hostname:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/net/InetAddress;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/Dns$Record;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 161
    iput-object p2, p0, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->address:Ljava/net/InetAddress;

    .line 165
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    iput-object p2, p0, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->hostname:Ljava/lang/String;

    return-void

    .line 166
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unexpected hostname: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public final address()Ljava/net/InetAddress;
    .registers 2

    .line 161
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->address:Ljava/net/InetAddress;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    .line 168
    instance-of v0, p1, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->hostname()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->hostname()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->address:Ljava/net/InetAddress;

    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->address:Ljava/net/InetAddress;

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic getHostname()Ljava/lang/String;
    .registers 2

    .line 159
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->hostname()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .line 170
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->hostname()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->address:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public hostname()Ljava/lang/String;
    .registers 2

    .line 164
    iget-object v0, p0, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->hostname()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->address:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

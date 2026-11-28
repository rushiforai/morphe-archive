.class public final Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IpAddress"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0011\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0007H\u00c6\u0003J\'\u0010\u0013\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u00c6\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u00d6\u0003J\t\u0010\u0018\u001a\u00020\u0005H\u00d6\u0001J\t\u0010\u0019\u001a\u00020\u0003H\u00d6\u0001R\u0014\u0010\u0002\u001a\u00020\u0003X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u001a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;",
        "Lnicoid/network238/okhttp3/internal/dns/ResourceRecord;",
        "name",
        "",
        "timeToLive",
        "",
        "address",
        "Ljava/net/InetAddress;",
        "<init>",
        "(Ljava/lang/String;ILjava/net/InetAddress;)V",
        "getName",
        "()Ljava/lang/String;",
        "getTimeToLive",
        "()I",
        "getAddress",
        "()Ljava/net/InetAddress;",
        "component1",
        "component2",
        "component3",
        "copy",
        "equals",
        "",
        "other",
        "",
        "hashCode",
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

.field private final name:Ljava/lang/String;

.field private final timeToLive:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/net/InetAddress;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->name:Ljava/lang/String;

    .line 85
    iput p2, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->timeToLive:I

    .line 86
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->address:Ljava/net/InetAddress;

    return-void
.end method

.method public static synthetic copy$default(Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;Ljava/lang/String;ILjava/net/InetAddress;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->name:Ljava/lang/String;

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget p2, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->timeToLive:I

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->address:Ljava/net/InetAddress;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->copy(Ljava/lang/String;ILjava/net/InetAddress;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()I
    .registers 2

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->timeToLive:I

    return v0
.end method

.method public final component3()Ljava/net/InetAddress;
    .registers 2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->address:Ljava/net/InetAddress;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;ILjava/net/InetAddress;)Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    invoke-direct {v0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;-><init>(Ljava/lang/String;ILjava/net/InetAddress;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    if-eqz v0, :cond_0

    check-cast p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->name:Ljava/lang/String;

    iget-object v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->name:Ljava/lang/String;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->timeToLive:I

    iget v1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->timeToLive:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->address:Ljava/net/InetAddress;

    iget-object p1, p1, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->address:Ljava/net/InetAddress;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public final getAddress()Ljava/net/InetAddress;
    .registers 2

    .line 86
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->address:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 84
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeToLive()I
    .registers 2

    .line 85
    iget v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->timeToLive:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->timeToLive:I

    invoke-static {v1}, Ljava/lang/Integer;->hashCode(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->address:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "IpAddress(name="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", timeToLive="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->timeToLive:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", address="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->address:Ljava/net/InetAddress;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

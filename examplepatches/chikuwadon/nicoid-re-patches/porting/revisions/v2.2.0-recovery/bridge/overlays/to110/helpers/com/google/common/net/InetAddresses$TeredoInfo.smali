.class public final Lcom/google/common/net/InetAddresses$TeredoInfo;
.super Ljava/lang/Object;
.source "InetAddresses.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/net/InetAddresses;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TeredoInfo"
.end annotation


# instance fields
.field private final client:Ljava/net/Inet4Address;

.field private final flags:I

.field private final port:I

.field private final server:Ljava/net/Inet4Address;


# direct methods
.method public constructor <init>(Ljava/net/Inet4Address;Ljava/net/Inet4Address;II)V
    .registers 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "server",
            "client",
            "port",
            "flags"
        }
    .end annotation

    .line 774
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    const v1, 0xffff

    const/4 v2, 0x0

    if-ltz p3, :cond_0

    if-gt p3, v1, :cond_0

    move v3, v0

    goto :goto_0

    :cond_0
    move v3, v2

    .line 775
    :goto_0
    const-string v4, "port \'%s\' is out of range (0 <= port <= 0xffff)"

    invoke-static {v3, v4, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    if-ltz p4, :cond_1

    if-le p4, v1, :cond_2

    :cond_1
    move v0, v2

    .line 777
    :cond_2
    const-string v1, "flags \'%s\' is out of range (0 <= flags <= 0xffff)"

    invoke-static {v0, v1, p4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 782
    # getter for: Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;
    invoke-static {}, Lcom/google/common/net/InetAddresses;->access$200()Ljava/net/Inet4Address;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/net/Inet4Address;

    iput-object p1, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->server:Ljava/net/Inet4Address;

    .line 783
    # getter for: Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;
    invoke-static {}, Lcom/google/common/net/InetAddresses;->access$200()Ljava/net/Inet4Address;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/net/Inet4Address;

    iput-object p1, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->client:Ljava/net/Inet4Address;

    .line 784
    iput p3, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->port:I

    .line 785
    iput p4, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->flags:I

    return-void
.end method


# virtual methods
.method public getClient()Ljava/net/Inet4Address;
    .registers 1

    .line 793
    iget-object p0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->client:Ljava/net/Inet4Address;

    return-object p0
.end method

.method public getFlags()I
    .registers 1

    .line 801
    iget p0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->flags:I

    return p0
.end method

.method public getPort()I
    .registers 1

    .line 797
    iget p0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->port:I

    return p0
.end method

.method public getServer()Ljava/net/Inet4Address;
    .registers 1

    .line 789
    iget-object p0, p0, Lcom/google/common/net/InetAddresses$TeredoInfo;->server:Ljava/net/Inet4Address;

    return-object p0
.end method

.class Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;
.super Lorg/eclipse/jetty/client/ContentExchange;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/HttpDestination;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ConnectExchange"
.end annotation


# instance fields
.field private final exchange:Lorg/eclipse/jetty/client/HttpExchange;

.field private final proxyEndPoint:Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;

.field final synthetic this$0:Lorg/eclipse/jetty/client/HttpDestination;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/client/HttpDestination;Lorg/eclipse/jetty/client/Address;Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;Lorg/eclipse/jetty/client/HttpExchange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->this$0:Lorg/eclipse/jetty/client/HttpDestination;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/client/ContentExchange;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->proxyEndPoint:Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;

    .line 7
    .line 8
    iput-object p4, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 9
    .line 10
    const-string p1, "CONNECT"

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setMethod(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p4}, Lorg/eclipse/jetty/client/HttpExchange;->getVersion()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setVersion(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Lorg/eclipse/jetty/client/Address;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setRequestURI(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string p2, "Host"

    .line 30
    .line 31
    invoke-virtual {p0, p2, p1}, Lorg/eclipse/jetty/client/HttpExchange;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string p1, "Proxy-Connection"

    .line 35
    .line 36
    const-string p2, "keep-alive"

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/client/HttpExchange;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const-string p1, "User-Agent"

    .line 42
    .line 43
    const-string p2, "Jetty-Client"

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/client/HttpExchange;->addRequestHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public onConnectionFailed(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->this$0:Lorg/eclipse/jetty/client/HttpDestination;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpDestination;->onConnectionFailed(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onException(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->this$0:Lorg/eclipse/jetty/client/HttpDestination;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/client/HttpDestination;->access$000(Lorg/eclipse/jetty/client/HttpDestination;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 13
    .line 14
    const/16 v1, 0x9

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListener;->onException(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onExpire()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->this$0:Lorg/eclipse/jetty/client/HttpDestination;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/client/HttpDestination;->access$000(Lorg/eclipse/jetty/client/HttpDestination;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 13
    .line 14
    const/16 v1, 0x8

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onExpire()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onResponseComplete()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/CachedExchange;->getResponseStatus()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->proxyEndPoint:Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->upgrade()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/16 v1, 0x1f8

    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->onExpire()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    new-instance v1, Ljava/net/ProtocolException;

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "Proxy: "

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->proxyEndPoint:Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;

    .line 33
    .line 34
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->getRemoteAddr()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, ":"

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->proxyEndPoint:Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;

    .line 47
    .line 48
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->getRemotePort()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v3, " didn\'t return http return code 200, but "

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v0, " while trying to request: "

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 69
    .line 70
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->getAddress()Lorg/eclipse/jetty/client/Address;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/Address;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-direct {v1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/client/HttpDestination$ConnectExchange;->onException(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.class public Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/AsyncEndPoint;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/SelectConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UpgradableEndPoint"
.end annotation


# instance fields
.field _endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

.field _engine:Ljavax/net/ssl/SSLEngine;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/io/AsyncEndPoint;Ljavax/net/ssl/SSLEngine;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_engine:Ljavax/net/ssl/SSLEngine;

    .line 5
    .line 6
    iput-object p1, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public asyncDispatch()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->asyncDispatch()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public blockReadable(J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/EndPoint;->blockReadable(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public blockWritable(J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/EndPoint;->blockWritable(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public cancelTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/AsyncEndPoint;->cancelTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public dispatch()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->asyncDispatch()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public fill(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/EndPoint;->fill(Lorg/eclipse/jetty/io/Buffer;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public flush(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public flush(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    invoke-interface {p0, p1, p2, p3}, Lorg/eclipse/jetty/io/EndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)I

    move-result p0

    return p0
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->flush()V

    return-void
.end method

.method public getConnection()Lorg/eclipse/jetty/io/Connection;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/ConnectedEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocalAddr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getLocalAddr()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocalHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getLocalHost()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocalPort()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getLocalPort()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMaxIdleTime()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getMaxIdleTime()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRemoteAddr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getRemoteAddr()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRemoteHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getRemoteHost()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRemotePort()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getRemotePort()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTransport()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getTransport()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hasProgressed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->hasProgressed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isBlocking()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->isBlocking()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isCheckForIdle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->isCheckForIdle()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isInputShutdown()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->isInputShutdown()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isOpen()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->isOpen()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isOutputShutdown()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->isOutputShutdown()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isWritable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->isWritable()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onIdleExpired(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/AsyncEndPoint;->onIdleExpired(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public scheduleTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lorg/eclipse/jetty/io/AsyncEndPoint;->scheduleTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public scheduleWrite()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->scheduleWrite()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCheckForIdle(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/AsyncEndPoint;->setCheckForIdle(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setConnection(Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/ConnectedEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMaxIdleTime(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/EndPoint;->setMaxIdleTime(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public shutdownInput()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->shutdownInput()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public shutdownOutput()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Upgradable:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public upgrade()V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/io/ConnectedEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/eclipse/jetty/client/AsyncHttpConnection;

    .line 8
    .line 9
    new-instance v1, Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 10
    .line 11
    iget-object v2, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_engine:Ljavax/net/ssl/SSLEngine;

    .line 12
    .line 13
    iget-object v3, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 14
    .line 15
    invoke-direct {v1, v2, v3}, Lorg/eclipse/jetty/io/nio/SslConnection;-><init>(Ljavax/net/ssl/SSLEngine;Lorg/eclipse/jetty/io/EndPoint;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 19
    .line 20
    invoke-interface {v2, v1}, Lorg/eclipse/jetty/io/ConnectedEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->getSslEndPoint()Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, p0, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->_endp:Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 28
    .line 29
    invoke-virtual {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->getSslEndPoint()Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-interface {v2, v0}, Lorg/eclipse/jetty/io/ConnectedEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lorg/eclipse/jetty/client/SelectConnector;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-string v3, "upgrade {} to {} for {}"

    .line 41
    .line 42
    filled-new-array {p0, v1, v0}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {v2, v3, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

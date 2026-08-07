.class public Lorg/eclipse/jetty/server/nio/SelectChannelConnector;
.super Lorg/eclipse/jetty/server/nio/AbstractNIOConnector;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;
    }
.end annotation


# instance fields
.field protected _acceptChannel:Ljava/nio/channels/ServerSocketChannel;

.field private _localPort:I

.field private _lowResourcesConnections:I

.field private _lowResourcesMaxIdleTime:I

.field private final _manager:Lorg/eclipse/jetty/io/nio/SelectorManager;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/nio/AbstractNIOConnector;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_localPort:I

    .line 6
    .line 7
    new-instance v0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {v0, p0, v1}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;-><init>(Lorg/eclipse/jetty/server/nio/SelectChannelConnector;Lorg/eclipse/jetty/server/nio/SelectChannelConnector$1;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getMaxIdleTime()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-long v1, v1

    .line 20
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/nio/SelectorManager;->setMaxIdleTime(J)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;Z)Z

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/lit8 v0, v0, 0x3

    .line 36
    .line 37
    div-int/lit8 v0, v0, 0x4

    .line 38
    .line 39
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/AbstractConnector;->setAcceptors(I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic access$100(Lorg/eclipse/jetty/server/nio/SelectChannelConnector;Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionOpened(Lorg/eclipse/jetty/io/Connection;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lorg/eclipse/jetty/server/nio/SelectChannelConnector;Lorg/eclipse/jetty/io/Connection;Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionUpgraded(Lorg/eclipse/jetty/io/Connection;Lorg/eclipse/jetty/io/Connection;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public accept(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object p1, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 3
    .line 4
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->isOpen()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 14
    .line 15
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isStarted()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/nio/channels/ServerSocketChannel;->accept()Ljava/nio/channels/SocketChannel;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p1, v0}, Ljava/nio/channels/SelectableChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/AbstractConnector;->configure(Ljava/net/Socket;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/nio/SelectorManager;->register(Ljava/nio/channels/SocketChannel;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p1
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->removeBean(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->isOpen()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 27
    .line 28
    const/4 v0, -0x2

    .line 29
    iput v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_localPort:I

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-void

    .line 33
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw v0
.end method

.method public customize(Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Request;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p2, v0, v1}, Lorg/eclipse/jetty/server/Request;->setTimeStamp(J)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_maxIdleTime:I

    .line 9
    .line 10
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/EndPoint;->setMaxIdleTime(I)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0, p1, p2}, Lorg/eclipse/jetty/server/AbstractConnector;->customize(Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Request;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public doStart()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getAcceptors()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/io/nio/SelectorManager;->setSelectSets(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getMaxIdleTime()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    int-to-long v1, v1

    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/nio/SelectorManager;->setMaxIdleTime(J)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->getLowResourcesConnections()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-long v1, v1

    .line 27
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/nio/SelectorManager;->setLowResourcesConnections(J)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->getLowResourcesMaxIdleTime()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-long v1, v1

    .line 37
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/nio/SelectorManager;->setLowResourcesMaxIdleTime(J)V

    .line 38
    .line 39
    .line 40
    invoke-super {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->doStart()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public endPointClosed(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionClosed(Lorg/eclipse/jetty/io/Connection;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public declared-synchronized getConnection()Ljava/lang/Object;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public getLocalPort()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_localPort:I

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    throw v0
.end method

.method public getLowResourcesConnections()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_lowResourcesConnections:I

    .line 2
    .line 3
    return p0
.end method

.method public getLowResourcesMaxIdleTime()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_lowResourcesMaxIdleTime:I

    .line 2
    .line 3
    return p0
.end method

.method public getSelectorManager()Lorg/eclipse/jetty/io/nio/SelectorManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;)Lorg/eclipse/jetty/io/nio/AsyncConnection;
    .locals 1

    .line 1
    new-instance p1, Lorg/eclipse/jetty/server/AsyncHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p1, p0, p2, v0}, Lorg/eclipse/jetty/server/AsyncHttpConnection;-><init>(Lorg/eclipse/jetty/server/Connector;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Server;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method public newEndPoint(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;)Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 2
    .line 3
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_maxIdleTime:I

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, p3, p0}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;-><init>(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->getManager()Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p3}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p0, p1, v0, p2}, Lorg/eclipse/jetty/io/nio/SelectorManager;->newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;Ljava/lang/Object;)Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public open()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 3
    .line 4
    if-nez v0, :cond_2

    .line 5
    .line 6
    invoke-static {}, Ljava/nio/channels/ServerSocketChannel;->open()Ljava/nio/channels/ServerSocketChannel;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Ljava/nio/channels/SelectableChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getReuseAddress()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, Ljava/net/ServerSocket;->setReuseAddress(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getHost()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    new-instance v0, Ljava/net/InetSocketAddress;

    .line 36
    .line 37
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getPort()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-direct {v0, v1}, Ljava/net/InetSocketAddress;-><init>(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    goto :goto_2

    .line 47
    :cond_0
    new-instance v0, Ljava/net/InetSocketAddress;

    .line 48
    .line 49
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getHost()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getPort()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getAcceptQueueSize()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {v1, v0, v2}, Ljava/net/ServerSocket;->bind(Ljava/net/SocketAddress;I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/nio/channels/ServerSocketChannel;->socket()Ljava/net/ServerSocket;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ljava/net/ServerSocket;->getLocalPort()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_localPort:I

    .line 84
    .line 85
    if-lez v0, :cond_1

    .line 86
    .line 87
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_acceptChannel:Ljava/nio/channels/ServerSocketChannel;

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_1
    new-instance v0, Ljava/io/IOException;

    .line 94
    .line 95
    const-string v1, "Server channel not bound"

    .line 96
    .line 97
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    throw v0

    .line 101
    :cond_2
    :goto_1
    monitor-exit p0

    .line 102
    return-void

    .line 103
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    throw v0
.end method

.method public persist(Lorg/eclipse/jetty/io/EndPoint;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/io/AsyncEndPoint;->setCheckForIdle(Z)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Lorg/eclipse/jetty/server/AbstractConnector;->persist(Lorg/eclipse/jetty/io/EndPoint;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setLowResourcesConnections(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_lowResourcesConnections:I

    .line 2
    .line 3
    return-void
.end method

.method public setLowResourcesMaxIdleTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_lowResourcesMaxIdleTime:I

    .line 2
    .line 3
    invoke-super {p0, p1}, Lorg/eclipse/jetty/server/AbstractConnector;->setLowResourcesMaxIdleTime(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMaxIdleTime(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/io/nio/SelectorManager;->setMaxIdleTime(J)V

    .line 5
    .line 6
    .line 7
    invoke-super {p0, p1}, Lorg/eclipse/jetty/server/AbstractConnector;->setMaxIdleTime(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setThreadPool(Lorg/eclipse/jetty/util/thread/ThreadPool;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/server/AbstractConnector;->setThreadPool(Lorg/eclipse/jetty/util/thread/ThreadPool;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->removeBean(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->_manager:Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;Z)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

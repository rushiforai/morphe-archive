.class Lorg/eclipse/jetty/client/SelectConnector$Manager;
.super Lorg/eclipse/jetty/io/nio/SelectorManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/SelectConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Manager"
.end annotation


# instance fields
.field LOG:Lorg/eclipse/jetty/util/log/Logger;

.field final synthetic this$0:Lorg/eclipse/jetty/client/SelectConnector;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/client/SelectConnector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/io/nio/SelectorManager;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lorg/eclipse/jetty/client/SelectConnector;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 11
    .line 12
    return-void
.end method

.method private declared-synchronized newSslEngine(Ljava/nio/channels/SocketChannel;)Ljavax/net/ssl/SSLEngine;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 3
    .line 4
    invoke-static {v0}, Lorg/eclipse/jetty/client/SelectConnector;->access$100(Lorg/eclipse/jetty/client/SelectConnector;)Lorg/eclipse/jetty/client/HttpClient;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpClient;->getSslContextFactory()Lorg/eclipse/jetty/util/ssl/SslContextFactory;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ljava/net/Socket;->getPort()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {v0, v1, p1}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->newSslEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/ssl/SslContextFactory;->newSslEngine()Ljavax/net/ssl/SSLEngine;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_0
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLEngine;->setUseClientMode(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ljavax/net/ssl/SSLEngine;->beginHandshake()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    .line 52
    monitor-exit p0

    .line 53
    return-object p1

    .line 54
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw p1
.end method


# virtual methods
.method public connectionFailed(Ljava/nio/channels/SocketChannel;Ljava/lang/Throwable;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/client/SelectConnector;->access$200(Lorg/eclipse/jetty/client/SelectConnector;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/thread/Timeout$Task;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    instance-of v0, p3, Lorg/eclipse/jetty/client/HttpDestination;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    check-cast p3, Lorg/eclipse/jetty/client/HttpDestination;

    .line 23
    .line 24
    invoke-virtual {p3, p2}, Lorg/eclipse/jetty/client/HttpDestination;->onConnectionFailed(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jetty/io/nio/SelectorManager;->connectionFailed(Ljava/nio/channels/SocketChannel;Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public dispatch(Ljava/lang/Runnable;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/client/SelectConnector;->access$100(Lorg/eclipse/jetty/client/SelectConnector;)Lorg/eclipse/jetty/client/HttpClient;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpClient;->_threadPool:Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/util/thread/ThreadPool;->dispatch(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public endPointClosed(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
    .locals 0

    return-void
.end method

.method public endPointOpened(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
    .locals 0

    return-void
.end method

.method public endPointUpgraded(Lorg/eclipse/jetty/io/ConnectedEndPoint;Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    return-void
.end method

.method public newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;Ljava/lang/Object;)Lorg/eclipse/jetty/io/nio/AsyncConnection;
    .locals 0

    .line 1
    new-instance p1, Lorg/eclipse/jetty/client/AsyncHttpConnection;

    .line 2
    .line 3
    iget-object p3, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 4
    .line 5
    invoke-static {p3}, Lorg/eclipse/jetty/client/SelectConnector;->access$100(Lorg/eclipse/jetty/client/SelectConnector;)Lorg/eclipse/jetty/client/HttpClient;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p3}, Lorg/eclipse/jetty/client/HttpClient;->getRequestBuffers()Lorg/eclipse/jetty/io/Buffers;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 14
    .line 15
    invoke-static {p0}, Lorg/eclipse/jetty/client/SelectConnector;->access$100(Lorg/eclipse/jetty/client/SelectConnector;)Lorg/eclipse/jetty/client/HttpClient;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpClient;->getResponseBuffers()Lorg/eclipse/jetty/io/Buffers;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {p1, p3, p0, p2}, Lorg/eclipse/jetty/client/AsyncHttpConnection;-><init>(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public newEndPoint(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;)Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/client/SelectConnector;->access$200(Lorg/eclipse/jetty/client/SelectConnector;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/thread/Timeout$Task;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 19
    .line 20
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 27
    .line 28
    iget-object v1, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 29
    .line 30
    invoke-static {v1}, Lorg/eclipse/jetty/client/SelectConnector;->access$200(Lorg/eclipse/jetty/client/SelectConnector;)Ljava/util/Map;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "Channels with connection pending: {}"

    .line 47
    .line 48
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-virtual {p3}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lorg/eclipse/jetty/client/HttpDestination;

    .line 56
    .line 57
    new-instance v1, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 58
    .line 59
    iget-object v2, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 60
    .line 61
    invoke-static {v2}, Lorg/eclipse/jetty/client/SelectConnector;->access$100(Lorg/eclipse/jetty/client/SelectConnector;)Lorg/eclipse/jetty/client/HttpClient;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpClient;->getIdleTimeout()J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    long-to-int v2, v2

    .line 70
    invoke-direct {v1, p1, p2, p3, v2}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;-><init>(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;I)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpDestination;->isSecure()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_2

    .line 78
    .line 79
    iget-object v2, p0, Lorg/eclipse/jetty/client/SelectConnector$Manager;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 80
    .line 81
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpDestination;->isProxied()Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    filled-new-array {p1, v3}, [Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    const-string v4, "secure to {}, proxied={}"

    .line 94
    .line 95
    invoke-interface {v2, v4, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    new-instance v2, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;

    .line 99
    .line 100
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/client/SelectConnector$Manager;->newSslEngine(Ljava/nio/channels/SocketChannel;)Ljavax/net/ssl/SSLEngine;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-direct {v2, v1, p0}, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;-><init>(Lorg/eclipse/jetty/io/AsyncEndPoint;Ljavax/net/ssl/SSLEngine;)V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    move-object v2, v1

    .line 109
    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->getManager()Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p3}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p0, p1, v2, p2}, Lorg/eclipse/jetty/io/nio/SelectorManager;->newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;Ljava/lang/Object;)Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-interface {v2, p0}, Lorg/eclipse/jetty/io/ConnectedEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 122
    .line 123
    .line 124
    check-cast p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->setDestination(Lorg/eclipse/jetty/client/HttpDestination;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpDestination;->isSecure()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_3

    .line 134
    .line 135
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpDestination;->isProxied()Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-nez p1, :cond_3

    .line 140
    .line 141
    check-cast v2, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;

    .line 142
    .line 143
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;->upgrade()V

    .line 144
    .line 145
    .line 146
    :cond_3
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/client/HttpDestination;->onNewConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;)V

    .line 147
    .line 148
    .line 149
    return-object v1
.end method

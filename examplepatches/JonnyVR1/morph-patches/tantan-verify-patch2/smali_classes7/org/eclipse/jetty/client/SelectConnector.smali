.class Lorg/eclipse/jetty/client/SelectConnector;
.super Lorg/eclipse/jetty/util/component/AggregateLifeCycle;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/client/HttpClient$Connector;
.implements Lorg/eclipse/jetty/util/component/Dumpable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/client/SelectConnector$UpgradableEndPoint;,
        Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;,
        Lorg/eclipse/jetty/client/SelectConnector$Manager;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private final _connectingChannels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/nio/channels/SocketChannel;",
            "Lorg/eclipse/jetty/util/thread/Timeout$Task;",
            ">;"
        }
    .end annotation
.end field

.field private final _httpClient:Lorg/eclipse/jetty/client/HttpClient;

.field private final _selectorManager:Lorg/eclipse/jetty/client/SelectConnector$Manager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/client/SelectConnector;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/client/SelectConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/client/HttpClient;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/eclipse/jetty/client/SelectConnector$Manager;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/client/SelectConnector$Manager;-><init>(Lorg/eclipse/jetty/client/SelectConnector;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector;->_selectorManager:Lorg/eclipse/jetty/client/SelectConnector$Manager;

    .line 10
    .line 11
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lorg/eclipse/jetty/client/SelectConnector;->_connectingChannels:Ljava/util/Map;

    .line 17
    .line 18
    iput-object p1, p0, Lorg/eclipse/jetty/client/SelectConnector;->_httpClient:Lorg/eclipse/jetty/client/HttpClient;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p0, p1, v1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;Z)Z

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/component/AggregateLifeCycle;->addBean(Ljava/lang/Object;Z)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic access$000()Lorg/eclipse/jetty/util/log/Logger;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/client/SelectConnector;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100(Lorg/eclipse/jetty/client/SelectConnector;)Lorg/eclipse/jetty/client/HttpClient;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector;->_httpClient:Lorg/eclipse/jetty/client/HttpClient;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lorg/eclipse/jetty/client/SelectConnector;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector;->_connectingChannels:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public startConnection(Lorg/eclipse/jetty/client/HttpDestination;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Ljava/nio/channels/SocketChannel;->open()Ljava/nio/channels/SocketChannel;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p1}, Lorg/eclipse/jetty/client/HttpDestination;->isProxied()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lorg/eclipse/jetty/client/HttpDestination;->getProxy()Lorg/eclipse/jetty/client/Address;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :catch_1
    move-exception p0

    .line 20
    goto :goto_2

    .line 21
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jetty/client/HttpDestination;->getAddress()Lorg/eclipse/jetty/client/Address;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :goto_0
    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const/4 v3, 0x1

    .line 30
    invoke-virtual {v2, v3}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lorg/eclipse/jetty/client/SelectConnector;->_httpClient:Lorg/eclipse/jetty/client/HttpClient;

    .line 34
    .line 35
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpClient;->isConnectBlocking()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v3, 0x0

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/Address;->toSocketAddress()Ljava/net/InetSocketAddress;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v4, p0, Lorg/eclipse/jetty/client/SelectConnector;->_httpClient:Lorg/eclipse/jetty/client/HttpClient;

    .line 51
    .line 52
    invoke-virtual {v4}, Lorg/eclipse/jetty/client/HttpClient;->getConnectTimeout()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {v2, v1, v4}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v3}, Ljava/nio/channels/SelectableChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector;->_selectorManager:Lorg/eclipse/jetty/client/SelectConnector$Manager;

    .line 63
    .line 64
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/io/nio/SelectorManager;->register(Ljava/nio/channels/SocketChannel;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-virtual {v0, v3}, Ljava/nio/channels/SelectableChannel;->configureBlocking(Z)Ljava/nio/channels/SelectableChannel;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/Address;->toSocketAddress()Ljava/net/InetSocketAddress;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Ljava/nio/channels/SocketChannel;->connect(Ljava/net/SocketAddress;)Z

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lorg/eclipse/jetty/client/SelectConnector;->_selectorManager:Lorg/eclipse/jetty/client/SelectConnector$Manager;

    .line 79
    .line 80
    invoke-virtual {v1, v0, p1}, Lorg/eclipse/jetty/io/nio/SelectorManager;->register(Ljava/nio/channels/SocketChannel;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    new-instance v1, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;

    .line 84
    .line 85
    invoke-direct {v1, p0, v0, p1}, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;-><init>(Lorg/eclipse/jetty/client/SelectConnector;Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/client/HttpDestination;)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lorg/eclipse/jetty/client/SelectConnector;->_httpClient:Lorg/eclipse/jetty/client/HttpClient;

    .line 89
    .line 90
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpClient;->getConnectTimeout()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    int-to-long v3, v3

    .line 95
    invoke-virtual {v2, v1, v3, v4}, Lorg/eclipse/jetty/client/HttpClient;->schedule(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector;->_connectingChannels:Ljava/util/Map;

    .line 99
    .line 100
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/nio/channels/UnresolvedAddressException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :goto_1
    if-eqz v0, :cond_2

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V

    .line 107
    .line 108
    .line 109
    :cond_2
    invoke-virtual {p1, p0}, Lorg/eclipse/jetty/client/HttpDestination;->onConnectionFailed(Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :goto_2
    if-eqz v0, :cond_3

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V

    .line 116
    .line 117
    .line 118
    :cond_3
    invoke-virtual {p1, p0}, Lorg/eclipse/jetty/client/HttpDestination;->onConnectionFailed(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    :goto_3
    return-void
.end method

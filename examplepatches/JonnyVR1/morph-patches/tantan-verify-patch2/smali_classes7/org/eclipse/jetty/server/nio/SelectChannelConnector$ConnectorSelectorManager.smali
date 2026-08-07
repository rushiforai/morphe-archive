.class final Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;
.super Lorg/eclipse/jetty/io/nio/SelectorManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/nio/SelectChannelConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ConnectorSelectorManager"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/server/nio/SelectChannelConnector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;->this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/io/nio/SelectorManager;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/server/nio/SelectChannelConnector;Lorg/eclipse/jetty/server/nio/SelectChannelConnector$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;-><init>(Lorg/eclipse/jetty/server/nio/SelectChannelConnector;)V

    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Runnable;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;->this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AbstractConnector;->getThreadPool()Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;->this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Server;->getThreadPool()Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    invoke-interface {v0, p1}, Lorg/eclipse/jetty/util/thread/ThreadPool;->dispatch(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public endPointClosed(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;->this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->endPointClosed(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public endPointOpened(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;->this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->access$100(Lorg/eclipse/jetty/server/nio/SelectChannelConnector;Lorg/eclipse/jetty/io/Connection;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public endPointUpgraded(Lorg/eclipse/jetty/io/ConnectedEndPoint;Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;->this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;

    .line 2
    .line 3
    invoke-interface {p1}, Lorg/eclipse/jetty/io/ConnectedEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p2, p1}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->access$200(Lorg/eclipse/jetty/server/nio/SelectChannelConnector;Lorg/eclipse/jetty/io/Connection;Lorg/eclipse/jetty/io/Connection;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;Ljava/lang/Object;)Lorg/eclipse/jetty/io/nio/AsyncConnection;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;->this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;)Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public newEndPoint(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;)Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/SelectChannelConnector$ConnectorSelectorManager;->this$0:Lorg/eclipse/jetty/server/nio/SelectChannelConnector;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->newEndPoint(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;)Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

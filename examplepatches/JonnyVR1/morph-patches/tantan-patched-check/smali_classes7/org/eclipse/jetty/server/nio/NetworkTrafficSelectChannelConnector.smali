.class public Lorg/eclipse/jetty/server/nio/NetworkTrafficSelectChannelConnector;
.super Lorg/eclipse/jetty/server/nio/SelectChannelConnector;
.source "SourceFile"


# instance fields
.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/eclipse/jetty/io/NetworkTrafficListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/server/nio/NetworkTrafficSelectChannelConnector;->listeners:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public addNetworkTrafficListener(Lorg/eclipse/jetty/io/NetworkTrafficListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/NetworkTrafficSelectChannelConnector;->listeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public endPointClosed(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/server/nio/SelectChannelConnector;->endPointClosed(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lorg/eclipse/jetty/io/nio/NetworkTrafficSelectChannelEndPoint;

    .line 5
    .line 6
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/nio/NetworkTrafficSelectChannelEndPoint;->notifyClosed()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public newEndPoint(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;)Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/eclipse/jetty/io/nio/NetworkTrafficSelectChannelEndPoint;

    .line 2
    .line 3
    iget v4, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_maxIdleTime:I

    .line 4
    .line 5
    iget-object v5, p0, Lorg/eclipse/jetty/server/nio/NetworkTrafficSelectChannelConnector;->listeners:Ljava/util/List;

    .line 6
    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move-object v3, p3

    .line 10
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/io/nio/NetworkTrafficSelectChannelEndPoint;-><init>(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;ILjava/util/List;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v2}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->getManager()Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v3}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, v1, v0, p1}, Lorg/eclipse/jetty/io/nio/SelectorManager;->newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;Ljava/lang/Object;)Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/nio/NetworkTrafficSelectChannelEndPoint;->notifyOpened()V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public removeNetworkTrafficListener(Lorg/eclipse/jetty/io/NetworkTrafficListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/nio/NetworkTrafficSelectChannelConnector;->listeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.class Lorg/eclipse/jetty/server/handler/ConnectHandler$Manager;
.super Lorg/eclipse/jetty/io/nio/SelectorManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/handler/ConnectHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Manager"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/handler/ConnectHandler;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/server/handler/ConnectHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/ConnectHandler$Manager;->this$0:Lorg/eclipse/jetty/server/handler/ConnectHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/io/nio/SelectorManager;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/server/handler/ConnectHandler;Lorg/eclipse/jetty/server/handler/ConnectHandler$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/server/handler/ConnectHandler$Manager;-><init>(Lorg/eclipse/jetty/server/handler/ConnectHandler;)V

    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Runnable;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ConnectHandler$Manager;->this$0:Lorg/eclipse/jetty/server/handler/ConnectHandler;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ConnectHandler;->access$200(Lorg/eclipse/jetty/server/handler/ConnectHandler;)Lorg/eclipse/jetty/util/thread/ThreadPool;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/util/thread/ThreadPool;->dispatch(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public endPointClosed(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
    .locals 0

    return-void
.end method

.method public endPointOpened(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->getSelectionKey()Ljava/nio/channels/SelectionKey;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lorg/eclipse/jetty/server/handler/ConnectHandler$ProxyToServerConnection;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ConnectHandler$ProxyToServerConnection;->ready()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public endPointUpgraded(Lorg/eclipse/jetty/io/ConnectedEndPoint;Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    return-void
.end method

.method public newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;Ljava/lang/Object;)Lorg/eclipse/jetty/io/nio/AsyncConnection;
    .locals 0

    .line 1
    check-cast p3, Lorg/eclipse/jetty/server/handler/ConnectHandler$ProxyToServerConnection;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-virtual {p3, p0, p1}, Lorg/eclipse/jetty/server/handler/ConnectHandler$ProxyToServerConnection;->setTimeStamp(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3, p2}, Lorg/eclipse/jetty/server/handler/ConnectHandler$ProxyToServerConnection;->setEndPoint(Lorg/eclipse/jetty/io/AsyncEndPoint;)V

    .line 11
    .line 12
    .line 13
    return-object p3
.end method

.method public newEndPoint(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;)Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/net/Socket;->getSoTimeout()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-direct {v0, p1, p2, p3, v1}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;-><init>(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/nio/channels/SelectionKey;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->getManager()Lorg/eclipse/jetty/io/nio/SelectorManager;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p3}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-virtual {p2, p1, v0, p3}, Lorg/eclipse/jetty/io/nio/SelectorManager;->newConnection(Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/io/AsyncEndPoint;Ljava/lang/Object;)Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ConnectHandler$Manager;->this$0:Lorg/eclipse/jetty/server/handler/ConnectHandler;

    .line 30
    .line 31
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ConnectHandler;->access$100(Lorg/eclipse/jetty/server/handler/ConnectHandler;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->setMaxIdleTime(I)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

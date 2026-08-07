.class Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;
.super Lorg/eclipse/jetty/util/thread/Timeout$Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/SelectConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ConnectTimeout"
.end annotation


# instance fields
.field private final channel:Ljava/nio/channels/SocketChannel;

.field private final destination:Lorg/eclipse/jetty/client/HttpDestination;

.field final synthetic this$0:Lorg/eclipse/jetty/client/SelectConnector;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/client/SelectConnector;Ljava/nio/channels/SocketChannel;Lorg/eclipse/jetty/client/HttpDestination;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;->this$0:Lorg/eclipse/jetty/client/SelectConnector;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/util/thread/Timeout$Task;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;->channel:Ljava/nio/channels/SocketChannel;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;->destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public expired()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;->channel:Ljava/nio/channels/SocketChannel;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->isConnectionPending()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lorg/eclipse/jetty/client/SelectConnector;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;->channel:Ljava/nio/channels/SocketChannel;

    .line 14
    .line 15
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Channel {} timed out while connecting, closing it"

    .line 20
    .line 21
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;->channel:Ljava/nio/channels/SocketChannel;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    move-exception v0

    .line 31
    invoke-static {}, Lorg/eclipse/jetty/client/SelectConnector;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/client/SelectConnector$ConnectTimeout;->destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 39
    .line 40
    new-instance v0, Ljava/net/SocketTimeoutException;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/net/SocketTimeoutException;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->onConnectionFailed(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

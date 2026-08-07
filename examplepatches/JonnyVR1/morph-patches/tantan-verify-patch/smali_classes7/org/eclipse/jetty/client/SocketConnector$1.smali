.class Lorg/eclipse/jetty/client/SocketConnector$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/client/SocketConnector;->startConnection(Lorg/eclipse/jetty/client/HttpDestination;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/client/SocketConnector;

.field final synthetic val$connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

.field final synthetic val$destination:Lorg/eclipse/jetty/client/HttpDestination;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/client/SocketConnector;Lorg/eclipse/jetty/client/AbstractHttpConnection;Lorg/eclipse/jetty/client/HttpDestination;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->this$0:Lorg/eclipse/jetty/client/SocketConnector;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 3
    .line 4
    :goto_0
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Connection;->handle()Lorg/eclipse/jetty/io/Connection;

    .line 5
    .line 6
    .line 7
    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    if-eq v2, v1, :cond_0

    .line 9
    .line 10
    move-object v1, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 13
    .line 14
    iget-object p0, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 15
    .line 16
    invoke-virtual {v1, p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    invoke-static {}, Lorg/eclipse/jetty/client/SocketConnector;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    goto :goto_2

    .line 29
    :catchall_0
    move-exception v1

    .line 30
    goto :goto_3

    .line 31
    :catch_1
    move-exception v1

    .line 32
    :try_start_2
    instance-of v2, v1, Ljava/io/InterruptedIOException;

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-static {}, Lorg/eclipse/jetty/client/SocketConnector;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-interface {v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    invoke-static {}, Lorg/eclipse/jetty/client/SocketConnector;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/client/HttpDestination;->onException(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    .line 55
    .line 56
    :goto_1
    :try_start_3
    iget-object v1, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 57
    .line 58
    iget-object p0, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 59
    .line 60
    invoke-virtual {v1, p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 61
    .line 62
    .line 63
    :goto_2
    return-void

    .line 64
    :goto_3
    :try_start_4
    iget-object v2, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 65
    .line 66
    iget-object p0, p0, Lorg/eclipse/jetty/client/SocketConnector$1;->val$connection:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 67
    .line 68
    invoke-virtual {v2, p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->returnConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;Z)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 69
    .line 70
    .line 71
    goto :goto_4

    .line 72
    :catch_2
    move-exception p0

    .line 73
    invoke-static {}, Lorg/eclipse/jetty/client/SocketConnector;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :goto_4
    throw v1
.end method

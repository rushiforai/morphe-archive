.class Lorg/eclipse/jetty/server/LocalConnector$Request;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/LocalConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Request"
.end annotation


# instance fields
.field private final _keepOpen:Z

.field private final _latch:Ljava/util/concurrent/CountDownLatch;

.field private final _requestsBuffer:Lorg/eclipse/jetty/io/ByteArrayBuffer;

.field private volatile _responsesBuffer:Lorg/eclipse/jetty/io/ByteArrayBuffer;

.field final synthetic this$0:Lorg/eclipse/jetty/server/LocalConnector;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/server/LocalConnector;Lorg/eclipse/jetty/io/ByteArrayBuffer;ZLjava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->this$0:Lorg/eclipse/jetty/server/LocalConnector;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_requestsBuffer:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 7
    .line 8
    iput-boolean p3, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_keepOpen:Z

    .line 9
    .line 10
    iput-object p4, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_latch:Ljava/util/concurrent/CountDownLatch;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/server/LocalConnector;Lorg/eclipse/jetty/io/ByteArrayBuffer;ZLjava/util/concurrent/CountDownLatch;Lorg/eclipse/jetty/server/LocalConnector$1;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/eclipse/jetty/server/LocalConnector$Request;-><init>(Lorg/eclipse/jetty/server/LocalConnector;Lorg/eclipse/jetty/io/ByteArrayBuffer;ZLjava/util/concurrent/CountDownLatch;)V

    return-void
.end method


# virtual methods
.method public getResponsesBuffer()Lorg/eclipse/jetty/io/ByteArrayBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_responsesBuffer:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 5

    .line 1
    :try_start_0
    new-instance v0, Lorg/eclipse/jetty/server/LocalConnector$Request$1;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_requestsBuffer:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 4
    .line 5
    invoke-virtual {v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->asArray()[B

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/16 v2, 0x400

    .line 10
    .line 11
    invoke-direct {v0, p0, v1, v2}, Lorg/eclipse/jetty/server/LocalConnector$Request$1;-><init>(Lorg/eclipse/jetty/server/LocalConnector$Request;[BI)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->setGrowOutput(Z)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Lorg/eclipse/jetty/server/BlockingHttpConnection;

    .line 19
    .line 20
    iget-object v2, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->this$0:Lorg/eclipse/jetty/server/LocalConnector;

    .line 21
    .line 22
    invoke-virtual {v2}, Lorg/eclipse/jetty/server/AbstractConnector;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-direct {v1, v2, v0, v3}, Lorg/eclipse/jetty/server/BlockingHttpConnection;-><init>(Lorg/eclipse/jetty/server/Connector;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Server;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->this$0:Lorg/eclipse/jetty/server/LocalConnector;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionOpened(Lorg/eclipse/jetty/io/Connection;)V

    .line 35
    .line 36
    .line 37
    iget-boolean v2, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_keepOpen:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 38
    .line 39
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->getIn()Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-lez v3, :cond_1

    .line 48
    .line 49
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->isOpen()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_1

    .line 54
    .line 55
    :goto_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-interface {v3}, Lorg/eclipse/jetty/io/Connection;->handle()Lorg/eclipse/jetty/io/Connection;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    if-eq v4, v3, :cond_0

    .line 64
    .line 65
    invoke-virtual {v0, v4}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception v3

    .line 70
    goto :goto_5

    .line 71
    :catch_0
    move-exception v3

    .line 72
    goto :goto_2

    .line 73
    :catch_1
    move-exception v3

    .line 74
    goto :goto_3

    .line 75
    :cond_1
    if-nez v2, :cond_2

    .line 76
    .line 77
    :try_start_2
    iget-object v2, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->this$0:Lorg/eclipse/jetty/server/LocalConnector;

    .line 78
    .line 79
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionClosed(Lorg/eclipse/jetty/io/Connection;)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :catchall_1
    move-exception v0

    .line 84
    goto :goto_6

    .line 85
    :cond_2
    :goto_1
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->getOut()Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_responsesBuffer:Lorg/eclipse/jetty/io/ByteArrayBuffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :goto_2
    :try_start_3
    invoke-static {}, Lorg/eclipse/jetty/server/LocalConnector;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-interface {v4, v3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 97
    .line 98
    .line 99
    :try_start_4
    iget-object v2, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->this$0:Lorg/eclipse/jetty/server/LocalConnector;

    .line 100
    .line 101
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionClosed(Lorg/eclipse/jetty/io/Connection;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :goto_3
    :try_start_5
    invoke-static {}, Lorg/eclipse/jetty/server/LocalConnector;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-interface {v4, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 110
    .line 111
    .line 112
    :try_start_6
    iget-object v2, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->this$0:Lorg/eclipse/jetty/server/LocalConnector;

    .line 113
    .line 114
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionClosed(Lorg/eclipse/jetty/io/Connection;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :goto_4
    iget-object p0, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_latch:Ljava/util/concurrent/CountDownLatch;

    .line 119
    .line 120
    if-eqz p0, :cond_3

    .line 121
    .line 122
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 123
    .line 124
    .line 125
    :cond_3
    return-void

    .line 126
    :goto_5
    if-nez v2, :cond_4

    .line 127
    .line 128
    :try_start_7
    iget-object v2, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->this$0:Lorg/eclipse/jetty/server/LocalConnector;

    .line 129
    .line 130
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionClosed(Lorg/eclipse/jetty/io/Connection;)V

    .line 131
    .line 132
    .line 133
    :cond_4
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->getOut()Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_responsesBuffer:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 138
    .line 139
    throw v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 140
    :goto_6
    iget-object p0, p0, Lorg/eclipse/jetty/server/LocalConnector$Request;->_latch:Ljava/util/concurrent/CountDownLatch;

    .line 141
    .line 142
    if-eqz p0, :cond_5

    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 145
    .line 146
    .line 147
    :cond_5
    throw v0
.end method

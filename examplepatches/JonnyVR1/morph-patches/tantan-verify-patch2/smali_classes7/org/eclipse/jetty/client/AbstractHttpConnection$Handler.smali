.class Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;
.super Lorg/eclipse/jetty/http/HttpParser$EventHandler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/AbstractHttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Handler"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/client/AbstractHttpConnection;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/client/AbstractHttpConnection;Lorg/eclipse/jetty/client/AbstractHttpConnection$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;-><init>(Lorg/eclipse/jetty/client/AbstractHttpConnection;)V

    return-void
.end method


# virtual methods
.method public content(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseContent(Lorg/eclipse/jetty/io/Buffer;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public earlyEOF()V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->isDone()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/16 v0, 0x9

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Lorg/eclipse/jetty/io/EofException;

    .line 26
    .line 27
    const-string v1, "early EOF"

    .line 28
    .line 29
    invoke-direct {v0, v1}, Lorg/eclipse/jetty/io/EofException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListener;->onException(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public headerComplete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x6

    .line 8
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public messageComplete(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x7

    .line 8
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public parsedHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v1, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 17
    .line 18
    sget-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 19
    .line 20
    invoke-virtual {v1, p2}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_connectionHeader:Lorg/eclipse/jetty/io/Buffer;

    .line 25
    .line 26
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public startRequest(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public startResponse(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    iget-object v0, v0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->access$200()Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 p2, 0x0

    .line 12
    new-array p2, p2, [Ljava/lang/Object;

    .line 13
    .line 14
    const-string p3, "No exchange for response"

    .line 15
    .line 16
    invoke-interface {p1, p3, p2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 20
    .line 21
    invoke-static {p0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->access$300(Lorg/eclipse/jetty/client/AbstractHttpConnection;)Lorg/eclipse/jetty/io/EndPoint;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->close()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/16 v1, 0x64

    .line 30
    .line 31
    if-eq p2, v1, :cond_2

    .line 32
    .line 33
    const/16 v1, 0x66

    .line 34
    .line 35
    if-eq p2, v1, :cond_2

    .line 36
    .line 37
    const/16 v1, 0xc8

    .line 38
    .line 39
    if-eq p2, v1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string v1, "CONNECT"

    .line 43
    .line 44
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->getMethod()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 55
    .line 56
    iget-object v1, v1, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/http/HttpParser;->setHeadResponse(Z)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    new-instance v1, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;

    .line 64
    .line 65
    iget-object v2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 66
    .line 67
    invoke-direct {v1, v2, v0}, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;-><init>(Lorg/eclipse/jetty/client/AbstractHttpConnection;Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 74
    .line 75
    sget-object v2, Lorg/eclipse/jetty/http/HttpVersions;->HTTP_1_1_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 76
    .line 77
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    iput-boolean v2, v1, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_http11:Z

    .line 82
    .line 83
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$Handler;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 84
    .line 85
    iput p2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_status:I

    .line 86
    .line 87
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-interface {p0, p1, p2, p3}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 92
    .line 93
    .line 94
    const/4 p0, 0x5

    .line 95
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 96
    .line 97
    .line 98
    return-void
.end method

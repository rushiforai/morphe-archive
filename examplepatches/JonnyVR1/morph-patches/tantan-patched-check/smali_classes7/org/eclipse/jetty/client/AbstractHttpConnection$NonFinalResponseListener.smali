.class Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/client/HttpEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/AbstractHttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NonFinalResponseListener"
.end annotation


# instance fields
.field final _exchange:Lorg/eclipse/jetty/client/HttpExchange;

.field final _next:Lorg/eclipse/jetty/client/HttpEventListener;

.field final synthetic this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/client/AbstractHttpConnection;Lorg/eclipse/jetty/client/HttpExchange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 7
    .line 8
    invoke-virtual {p2}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onConnectionFailed(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListener;->onConnectionFailed(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onException(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/client/HttpEventListener;->onException(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onExpire()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 9
    .line 10
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onExpire()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onRequestCommitted()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onRequestComplete()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onResponseComplete()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setStatus(I)Z

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 15
    .line 16
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->reset()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onResponseContent(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onResponseHeaderComplete()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onResponseHeaderComplete()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onRetry()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$NonFinalResponseListener;->_next:Lorg/eclipse/jetty/client/HttpEventListener;

    .line 9
    .line 10
    invoke-interface {p0}, Lorg/eclipse/jetty/client/HttpEventListener;->onRetry()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

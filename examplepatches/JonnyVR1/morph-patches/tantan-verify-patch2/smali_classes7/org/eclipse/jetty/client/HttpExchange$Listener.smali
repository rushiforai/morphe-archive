.class Lorg/eclipse/jetty/client/HttpExchange$Listener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/client/HttpEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/HttpExchange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Listener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/client/HttpExchange;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/client/HttpExchange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/client/HttpExchange;Lorg/eclipse/jetty/client/HttpExchange$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange$Listener;-><init>(Lorg/eclipse/jetty/client/HttpExchange;)V

    return-void
.end method


# virtual methods
.method public onConnectionFailed(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->onConnectionFailed(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 7
    .line 8
    invoke-static {p0}, Lorg/eclipse/jetty/client/HttpExchange;->access$100(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 14
    .line 15
    invoke-static {p0}, Lorg/eclipse/jetty/client/HttpExchange;->access$100(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 16
    .line 17
    .line 18
    throw p1
.end method

.method public onException(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->onException(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 7
    .line 8
    invoke-static {p0}, Lorg/eclipse/jetty/client/HttpExchange;->access$100(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 14
    .line 15
    invoke-static {p0}, Lorg/eclipse/jetty/client/HttpExchange;->access$100(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 16
    .line 17
    .line 18
    throw p1
.end method

.method public onExpire()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->onExpire()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 7
    .line 8
    invoke-static {p0}, Lorg/eclipse/jetty/client/HttpExchange;->access$100(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 14
    .line 15
    invoke-static {p0}, Lorg/eclipse/jetty/client/HttpExchange;->access$100(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public onRequestCommitted()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->onRequestCommitted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onRequestComplete()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 3
    .line 4
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpExchange;->onRequestComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 11
    .line 12
    iput-boolean v0, v2, Lorg/eclipse/jetty/client/HttpExchange;->_onRequestCompleteDone:Z

    .line 13
    .line 14
    iget-boolean v0, v2, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 15
    .line 16
    iget-boolean v3, v2, Lorg/eclipse/jetty/client/HttpExchange;->_onResponseCompleteDone:Z

    .line 17
    .line 18
    or-int/2addr v0, v3

    .line 19
    iput-boolean v0, v2, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 32
    .line 33
    .line 34
    monitor-exit v1

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0

    .line 38
    :catchall_1
    move-exception v1

    .line 39
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 40
    .line 41
    monitor-enter v2

    .line 42
    :try_start_2
    iget-object v3, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 43
    .line 44
    iput-boolean v0, v3, Lorg/eclipse/jetty/client/HttpExchange;->_onRequestCompleteDone:Z

    .line 45
    .line 46
    iget-boolean v0, v3, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 47
    .line 48
    iget-boolean v4, v3, Lorg/eclipse/jetty/client/HttpExchange;->_onResponseCompleteDone:Z

    .line 49
    .line 50
    or-int/2addr v0, v4

    .line 51
    iput-boolean v0, v3, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 56
    .line 57
    .line 58
    goto :goto_2

    .line 59
    :catchall_2
    move-exception p0

    .line 60
    goto :goto_3

    .line 61
    :cond_1
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 64
    .line 65
    .line 66
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 67
    throw v1

    .line 68
    :goto_3
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 69
    throw p0
.end method

.method public onResponseComplete()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 3
    .line 4
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpExchange;->onResponseComplete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 11
    .line 12
    iput-boolean v0, v2, Lorg/eclipse/jetty/client/HttpExchange;->_onResponseCompleteDone:Z

    .line 13
    .line 14
    iget-boolean v0, v2, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 15
    .line 16
    iget-boolean v3, v2, Lorg/eclipse/jetty/client/HttpExchange;->_onRequestCompleteDone:Z

    .line 17
    .line 18
    or-int/2addr v0, v3

    .line 19
    iput-boolean v0, v2, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 32
    .line 33
    .line 34
    monitor-exit v1

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0

    .line 38
    :catchall_1
    move-exception v1

    .line 39
    iget-object v2, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 40
    .line 41
    monitor-enter v2

    .line 42
    :try_start_2
    iget-object v3, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 43
    .line 44
    iput-boolean v0, v3, Lorg/eclipse/jetty/client/HttpExchange;->_onResponseCompleteDone:Z

    .line 45
    .line 46
    iget-boolean v0, v3, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 47
    .line 48
    iget-boolean v4, v3, Lorg/eclipse/jetty/client/HttpExchange;->_onRequestCompleteDone:Z

    .line 49
    .line 50
    or-int/2addr v0, v4

    .line 51
    iput-boolean v0, v3, Lorg/eclipse/jetty/client/HttpExchange;->_onDone:Z

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {v3}, Lorg/eclipse/jetty/client/HttpExchange;->disassociate()Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 56
    .line 57
    .line 58
    goto :goto_2

    .line 59
    :catchall_2
    move-exception p0

    .line 60
    goto :goto_3

    .line 61
    :cond_1
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 64
    .line 65
    .line 66
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 67
    throw v1

    .line 68
    :goto_3
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 69
    throw p0
.end method

.method public onResponseContent(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->onResponseContent(Lorg/eclipse/jetty/io/Buffer;)V

    .line 4
    .line 5
    .line 6
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
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/client/HttpExchange;->onResponseHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

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
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->onResponseHeaderComplete()V

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

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jetty/client/HttpExchange;->onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onRetry()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setRetryStatus(Z)V

    .line 5
    .line 6
    .line 7
    :try_start_0
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$Listener;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/client/HttpExchange;->onRetry()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    sget-object v0, Lorg/eclipse/jetty/client/HttpExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 15
    .line 16
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.class public Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/AsyncEndPoint;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/io/nio/SslConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SslEndPoint"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/io/nio/SslConnection;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/io/nio/SslConnection;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public asyncDispatch()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->asyncDispatch()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public blockReadable(J)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v2, p1, v2

    .line 8
    .line 9
    if-lez v2, :cond_0

    .line 10
    .line 11
    add-long/2addr p1, v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-wide p1, 0x7fffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    :goto_0
    cmp-long v2, v0, p1

    .line 19
    .line 20
    if-gez v2, :cond_2

    .line 21
    .line 22
    iget-object v3, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    invoke-static {v3, v4, v4}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$900(Lorg/eclipse/jetty/io/nio/SslConnection;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 33
    .line 34
    invoke-static {v2}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1000(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/EndPoint;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sub-long v0, p1, v0

    .line 39
    .line 40
    invoke-interface {v2, v0, v1}, Lorg/eclipse/jetty/io/EndPoint;->blockReadable(J)Z

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    :goto_1
    if-gez v2, :cond_3

    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_3
    const/4 p0, 0x0

    .line 53
    return p0
.end method

.method public blockWritable(J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/EndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/EndPoint;->blockWritable(J)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public cancelTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/AsyncEndPoint;->cancelTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$300(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 8
    .line 9
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$200(Lorg/eclipse/jetty/io/nio/SslConnection;)Ljavax/net/ssl/SSLSession;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "{} ssl endp.close"

    .line 18
    .line 19
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 23
    .line 24
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$800(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/EndPoint;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->close()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public dispatch()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->dispatch()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public fill(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, p1, v2}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$900(Lorg/eclipse/jetty/io/nio/SslConnection;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)Z

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    sub-int/2addr p1, v0

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->isInputShutdown()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, -0x1

    .line 25
    return p0

    .line 26
    :cond_0
    return p1
.end method

.method public flush(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v0

    .line 43
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    const/4 v1, 0x0

    invoke-static {p0, v1, p1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$900(Lorg/eclipse/jetty/io/nio/SslConnection;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)Z

    .line 44
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method public flush(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_1
    if-eqz p3, :cond_2

    .line 28
    .line 29
    invoke-interface {p3}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_2
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$900(Lorg/eclipse/jetty/io/nio/SslConnection;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)Z

    return-void
.end method

.method public getConnection()Lorg/eclipse/jetty/io/Connection;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1500(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getEndpoint()Lorg/eclipse/jetty/io/AsyncEndPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocalAddr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getLocalAddr()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getLocalHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getLocalHost()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getLocalPort()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getLocalPort()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getMaxIdleTime()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getMaxIdleTime()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getRemoteAddr()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getRemoteAddr()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getRemoteHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getRemoteHost()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getRemotePort()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getRemotePort()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getSslEngine()Ljavax/net/ssl/SSLEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$000(Lorg/eclipse/jetty/io/nio/SslConnection;)Ljavax/net/ssl/SSLEngine;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTransport()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1300(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/EndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public hasProgressed()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1400(Lorg/eclipse/jetty/io/nio/SslConnection;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public isBlocking()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isCheckForIdle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->isCheckForIdle()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isInputShutdown()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 5
    .line 6
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$500(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/EndPoint;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lorg/eclipse/jetty/io/EndPoint;->isInputShutdown()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 17
    .line 18
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$600(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/NIOBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 25
    .line 26
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$600(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/NIOBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_2

    .line 39
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 40
    .line 41
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$700(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/NIOBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 48
    .line 49
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$700(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/NIOBuffer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    :cond_1
    const/4 p0, 0x1

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    const/4 p0, 0x0

    .line 62
    :goto_1
    monitor-exit v0

    .line 63
    return p0

    .line 64
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    throw p0
.end method

.method public isOpen()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1200(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/EndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->isOpen()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isOutputShutdown()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 5
    .line 6
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$400(Lorg/eclipse/jetty/io/nio/SslConnection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->isOpen()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 19
    .line 20
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$000(Lorg/eclipse/jetty/io/nio/SslConnection;)Ljavax/net/ssl/SSLEngine;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljavax/net/ssl/SSLEngine;->isOutboundDone()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    goto :goto_1

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_2

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 36
    :goto_1
    monitor-exit v0

    .line 37
    return p0

    .line 38
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method

.method public isWritable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->isWritable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public onIdleExpired(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/io/AsyncEndPoint;->onIdleExpired(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public scheduleTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1, p2, p3}, Lorg/eclipse/jetty/io/AsyncEndPoint;->scheduleTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public scheduleWrite()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/io/AsyncEndPoint;->scheduleWrite()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setCheckForIdle(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/AsyncEndPoint;->setCheckForIdle(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setConnection(Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    check-cast p1, Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1502(Lorg/eclipse/jetty/io/nio/SslConnection;Lorg/eclipse/jetty/io/nio/AsyncConnection;)Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setMaxIdleTime(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$100(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/AsyncEndPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/io/EndPoint;->setMaxIdleTime(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public shutdownInput()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$300(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 8
    .line 9
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$200(Lorg/eclipse/jetty/io/nio/SslConnection;)Ljavax/net/ssl/SSLSession;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v1, "{} ssl endp.ishut!"

    .line 18
    .line 19
    invoke-interface {v0, v1, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public shutdownOutput()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 5
    .line 6
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$300(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/util/log/Logger;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "{} ssl endp.oshut {}"

    .line 11
    .line 12
    iget-object v3, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 13
    .line 14
    invoke-static {v3}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$200(Lorg/eclipse/jetty/io/nio/SslConnection;)Ljavax/net/ssl/SSLSession;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    filled-new-array {v3, p0}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-interface {v1, v2, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 26
    .line 27
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$000(Lorg/eclipse/jetty/io/nio/SslConnection;)Ljavax/net/ssl/SSLEngine;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljavax/net/ssl/SSLEngine;->closeOutbound()V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-static {v1, v2}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$402(Lorg/eclipse/jetty/io/nio/SslConnection;Z)Z

    .line 38
    .line 39
    .line 40
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->flush()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$700(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/NIOBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 8
    .line 9
    invoke-static {v1}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1600(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/NIOBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 14
    .line 15
    invoke-static {v2}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$600(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/NIOBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const/4 v3, -0x1

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    move v0, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    :goto_0
    if-nez v1, :cond_1

    .line 29
    .line 30
    move v1, v3

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    :goto_1
    if-nez v2, :cond_2

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_2
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    :goto_2
    iget-object v2, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 44
    .line 45
    invoke-static {v2}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$000(Lorg/eclipse/jetty/io/nio/SslConnection;)Ljavax/net/ssl/SSLEngine;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2}, Ljavax/net/ssl/SSLEngine;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 66
    .line 67
    invoke-static {v0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1700(Lorg/eclipse/jetty/io/nio/SslConnection;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 76
    .line 77
    invoke-static {v0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$400(Lorg/eclipse/jetty/io/nio/SslConnection;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SslConnection$SslEndPoint;->this$0:Lorg/eclipse/jetty/io/nio/SslConnection;

    .line 86
    .line 87
    invoke-static {p0}, Lorg/eclipse/jetty/io/nio/SslConnection;->access$1500(Lorg/eclipse/jetty/io/nio/SslConnection;)Lorg/eclipse/jetty/io/nio/AsyncConnection;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    filled-new-array/range {v4 .. v10}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string v0, "SSL %s i/o/u=%d/%d/%d ishut=%b oshut=%b {%s}"

    .line 96
    .line 97
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0
.end method

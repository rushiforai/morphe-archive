.class public abstract Lorg/eclipse/jetty/server/nio/AbstractNIOConnector;
.super Lorg/eclipse/jetty/server/AbstractConnector;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/server/nio/NIOConnector;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/AbstractConnector;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 5
    .line 6
    sget-object v1, Lorg/eclipse/jetty/io/Buffers$Type;->DIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 12
    .line 13
    sget-object v2, Lorg/eclipse/jetty/io/Buffers$Type;->INDIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestHeaderType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseHeaderType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public getUseDirectBuffers()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractConnector;->getRequestBufferType()Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lorg/eclipse/jetty/io/Buffers$Type;->DIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public setUseDirectBuffers(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget-object v1, Lorg/eclipse/jetty/io/Buffers$Type;->DIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v1, Lorg/eclipse/jetty/io/Buffers$Type;->INDIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 9
    .line 10
    :goto_0
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setRequestBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractConnector;->_buffers:Lorg/eclipse/jetty/http/HttpBuffersImpl;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    sget-object p1, Lorg/eclipse/jetty/io/Buffers$Type;->DIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    sget-object p1, Lorg/eclipse/jetty/io/Buffers$Type;->INDIRECT:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 21
    .line 22
    :goto_1
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->setResponseBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

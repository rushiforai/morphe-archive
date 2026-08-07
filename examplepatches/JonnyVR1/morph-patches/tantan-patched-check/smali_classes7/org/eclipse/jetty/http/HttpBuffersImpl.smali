.class public Lorg/eclipse/jetty/http/HttpBuffersImpl;
.super Lorg/eclipse/jetty/util/component/AbstractLifeCycle;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/http/HttpBuffers;


# instance fields
.field private _maxBuffers:I

.field private _requestBufferSize:I

.field private _requestBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

.field private _requestBuffers:Lorg/eclipse/jetty/io/Buffers;

.field private _requestHeaderSize:I

.field private _requestHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

.field private _responseBufferSize:I

.field private _responseBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

.field private _responseBuffers:Lorg/eclipse/jetty/io/Buffers;

.field private _responseHeaderSize:I

.field private _responseHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x4000

    .line 5
    .line 6
    iput v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBufferSize:I

    .line 7
    .line 8
    const/16 v0, 0x1800

    .line 9
    .line 10
    iput v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestHeaderSize:I

    .line 11
    .line 12
    const v1, 0x8000

    .line 13
    .line 14
    .line 15
    iput v1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBufferSize:I

    .line 16
    .line 17
    iput v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseHeaderSize:I

    .line 18
    .line 19
    const/16 v0, 0x400

    .line 20
    .line 21
    iput v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_maxBuffers:I

    .line 22
    .line 23
    sget-object v0, Lorg/eclipse/jetty/io/Buffers$Type;->BYTE_ARRAY:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 24
    .line 25
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 26
    .line 27
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 28
    .line 29
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 30
    .line 31
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public doStart()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    iget v1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestHeaderSize:I

    .line 4
    .line 5
    iget-object v2, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 6
    .line 7
    iget v3, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBufferSize:I

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getMaxBuffers()I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    move-object v4, v2

    .line 14
    invoke-static/range {v0 .. v5}, Lorg/eclipse/jetty/io/BuffersFactory;->newBuffers(Lorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;I)Lorg/eclipse/jetty/io/Buffers;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 19
    .line 20
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 21
    .line 22
    iget v2, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseHeaderSize:I

    .line 23
    .line 24
    iget-object v3, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 25
    .line 26
    iget v4, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBufferSize:I

    .line 27
    .line 28
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpBuffersImpl;->getMaxBuffers()I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    move-object v5, v3

    .line 33
    invoke-static/range {v1 .. v6}, Lorg/eclipse/jetty/io/BuffersFactory;->newBuffers(Lorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;ILorg/eclipse/jetty/io/Buffers$Type;I)Lorg/eclipse/jetty/io/Buffers;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 38
    .line 39
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->doStart()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public doStop()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 3
    .line 4
    iput-object v0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 5
    .line 6
    return-void
.end method

.method public getMaxBuffers()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_maxBuffers:I

    .line 2
    .line 3
    return p0
.end method

.method public getRequestBufferSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBufferSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getRequestBufferType()Lorg/eclipse/jetty/io/Buffers$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestBuffers()Lorg/eclipse/jetty/io/Buffers;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestHeaderSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestHeaderSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getRequestHeaderType()Lorg/eclipse/jetty/io/Buffers$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponseBufferSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBufferSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getResponseBufferType()Lorg/eclipse/jetty/io/Buffers$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponseBuffers()Lorg/eclipse/jetty/io/Buffers;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponseHeaderSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseHeaderSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getResponseHeaderType()Lorg/eclipse/jetty/io/Buffers$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMaxBuffers(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_maxBuffers:I

    .line 2
    .line 3
    return-void
.end method

.method public setRequestBufferSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBufferSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setRequestBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestBuffers(Lorg/eclipse/jetty/io/Buffers;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestHeaderSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestHeaderSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setRequestHeaderType(Lorg/eclipse/jetty/io/Buffers$Type;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    return-void
.end method

.method public setResponseBufferSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBufferSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setResponseBufferType(Lorg/eclipse/jetty/io/Buffers$Type;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBufferType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    return-void
.end method

.method public setResponseBuffers(Lorg/eclipse/jetty/io/Buffers;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 2
    .line 3
    return-void
.end method

.method public setResponseHeaderSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseHeaderSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setResponseHeaderType(Lorg/eclipse/jetty/io/Buffers$Type;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseHeaderType:Lorg/eclipse/jetty/io/Buffers$Type;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_requestBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "/"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpBuffersImpl;->_responseBuffers:Lorg/eclipse/jetty/io/Buffers;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

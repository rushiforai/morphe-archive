.class public Lorg/eclipse/jetty/io/ByteArrayEndPoint;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/ConnectedEndPoint;


# instance fields
.field protected _closed:Z

.field protected _connection:Lorg/eclipse/jetty/io/Connection;

.field protected _growOutput:Z

.field protected _in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

.field protected _inBytes:[B

.field protected _maxIdleTime:I

.field protected _nonBlocking:Z

.field protected _out:Lorg/eclipse/jetty/io/ByteArrayBuffer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_inBytes:[B

    .line 5
    .line 6
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([B)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 12
    .line 13
    new-instance p1, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 14
    .line 15
    invoke-direct {p1, p2}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public blockReadable(J)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public blockWritable(J)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_closed:Z

    .line 3
    .line 4
    return-void
.end method

.method public fill(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 16
    .line 17
    invoke-interface {p1, v0}, Lorg/eclipse/jetty/io/Buffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->skip(I)I

    .line 24
    .line 25
    .line 26
    return p1

    .line 27
    :cond_0
    iget-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->length()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-boolean p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_nonBlocking:Z

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->close()V

    .line 44
    .line 45
    .line 46
    const/4 p0, -0x1

    .line 47
    return p0

    .line 48
    :cond_2
    const-string p0, "CLOSED"

    .line 49
    .line 50
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method public flush(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_closed:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_3

    .line 5
    .line 6
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_growOutput:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v2, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 15
    .line 16
    invoke-virtual {v2}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->space()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-le v0, v2, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 23
    .line 24
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->compact()V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v2, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 32
    .line 33
    invoke-virtual {v2}, Lorg/eclipse/jetty/io/ByteArrayBuffer;->space()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-le v0, v2, :cond_1

    .line 38
    .line 39
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 40
    .line 41
    iget-object v2, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 42
    .line 43
    invoke-virtual {v2}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    add-int/2addr v2, v3

    .line 52
    invoke-direct {v0, v2}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 56
    .line 57
    invoke-virtual {v2}, Lorg/eclipse/jetty/io/AbstractBuffer;->putIndex()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    invoke-virtual {v2, v1, v3}, Lorg/eclipse/jetty/io/AbstractBuffer;->peek(II)Lorg/eclipse/jetty/io/Buffer;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 69
    .line 70
    invoke-virtual {v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-lez v1, :cond_0

    .line 75
    .line 76
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->mark()V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 80
    .line 81
    invoke-virtual {v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->getIndex()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 86
    .line 87
    .line 88
    :cond_0
    iput-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 89
    .line 90
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 91
    .line 92
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->put(Lorg/eclipse/jetty/io/Buffer;)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->isImmutable()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_2

    .line 101
    .line 102
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/io/Buffer;->skip(I)I

    .line 103
    .line 104
    .line 105
    :cond_2
    return p0

    .line 106
    :cond_3
    const-string p0, "CLOSED"

    .line 107
    .line 108
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return v1
.end method

.method public flush(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_closed:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    if-eqz p1, :cond_0

    .line 114
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 115
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    move-result v1

    :cond_0
    if-eqz p1, :cond_2

    .line 116
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    .line 117
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result p1

    if-lez p1, :cond_3

    .line 118
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    move-result p1

    add-int/2addr v1, p1

    :cond_3
    if-eqz p2, :cond_4

    .line 119
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result p1

    if-nez p1, :cond_5

    :cond_4
    if-eqz p3, :cond_5

    .line 120
    invoke-interface {p3}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result p1

    if-lez p1, :cond_5

    .line 121
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    move-result p0

    add-int/2addr v1, p0

    :cond_5
    return v1

    .line 122
    :cond_6
    const-string p0, "CLOSED"

    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    return v1
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    return-void
.end method

.method public getConnection()Lorg/eclipse/jetty/io/Connection;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_connection:Lorg/eclipse/jetty/io/Connection;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIn()Lorg/eclipse/jetty/io/ByteArrayBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalAddr()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getLocalHost()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getLocalPort()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getMaxIdleTime()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_maxIdleTime:I

    .line 2
    .line 3
    return p0
.end method

.method public getOut()Lorg/eclipse/jetty/io/ByteArrayBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRemoteAddr()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRemoteHost()Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRemotePort()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getTransport()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_inBytes:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public isBlocking()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_nonBlocking:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public isGrowOutput()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_growOutput:Z

    .line 2
    .line 3
    return p0
.end method

.method public isInputShutdown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_closed:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNonBlocking()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_nonBlocking:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_closed:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public isOutputShutdown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_closed:Z

    .line 2
    .line 3
    return p0
.end method

.method public reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_closed:Z

    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->clear()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_inBytes:[B

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 19
    .line 20
    array-length v0, v0

    .line 21
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public setConnection(Lorg/eclipse/jetty/io/Connection;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_connection:Lorg/eclipse/jetty/io/Connection;

    .line 2
    .line 3
    return-void
.end method

.method public setGrowOutput(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_growOutput:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIn(Lorg/eclipse/jetty/io/ByteArrayBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_in:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 2
    .line 3
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
    iput p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_maxIdleTime:I

    .line 2
    .line 3
    return-void
.end method

.method public setNonBlocking(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_nonBlocking:Z

    .line 2
    .line 3
    return-void
.end method

.method public setOut(Lorg/eclipse/jetty/io/ByteArrayBuffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->_out:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 2
    .line 3
    return-void
.end method

.method public shutdownInput()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->close()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public shutdownOutput()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->close()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

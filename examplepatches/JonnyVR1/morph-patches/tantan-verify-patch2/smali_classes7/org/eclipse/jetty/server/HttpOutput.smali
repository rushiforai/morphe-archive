.class public Lorg/eclipse/jetty/server/HttpOutput;
.super Ll/ese0;
.source "SourceFile"


# instance fields
.field _bytes:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

.field _characterEncoding:Ljava/lang/String;

.field _chars:[C

.field private _closed:Z

.field protected final _connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

.field _converter:Ljava/io/Writer;

.field protected final _generator:Lorg/eclipse/jetty/http/AbstractGenerator;

.field private _onebyte:Lorg/eclipse/jetty/io/ByteArrayBuffer;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ese0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 5
    .line 6
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getGenerator()Lorg/eclipse/jetty/http/Generator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 11
    .line 12
    iput-object p1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 13
    .line 14
    return-void
.end method

.method private write(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_closed:Z

    .line 2
    .line 3
    const-string v1, "Closed"

    .line 4
    .line 5
    if-nez v0, :cond_7

    .line 6
    .line 7
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/AbstractGenerator;->isOpen()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_6

    .line 14
    .line 15
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/AbstractGenerator;->isBufferFull()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v2, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/HttpOutput;->getMaxIdleTime()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    int-to-long v3, v0

    .line 30
    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jetty/http/AbstractGenerator;->blockForOutput(J)V

    .line 31
    .line 32
    .line 33
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_closed:Z

    .line 34
    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 38
    .line 39
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/AbstractGenerator;->isOpen()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    new-instance p0, Lorg/eclipse/jetty/io/EofException;

    .line 47
    .line 48
    invoke-direct {p0}, Lorg/eclipse/jetty/io/EofException;-><init>()V

    .line 49
    .line 50
    .line 51
    throw p0

    .line 52
    :cond_1
    invoke-static {v1}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    const/4 v0, 0x0

    .line 57
    invoke-interface {v2, p1, v0}, Lorg/eclipse/jetty/http/Generator;->addContent(Lorg/eclipse/jetty/io/Buffer;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 61
    .line 62
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/AbstractGenerator;->isAllContentWritten()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/HttpOutput;->flush()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/HttpOutput;->close()V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    iget-object v1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 76
    .line 77
    invoke-virtual {v1}, Lorg/eclipse/jetty/http/AbstractGenerator;->isBufferFull()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_4

    .line 82
    .line 83
    iget-object v1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 84
    .line 85
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->commitResponse(Z)V

    .line 86
    .line 87
    .line 88
    :cond_4
    :goto_1
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-lez v0, :cond_5

    .line 93
    .line 94
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 95
    .line 96
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/AbstractGenerator;->isOpen()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 103
    .line 104
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/HttpOutput;->getMaxIdleTime()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    int-to-long v1, v1

    .line 109
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/http/AbstractGenerator;->blockForOutput(J)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_5
    return-void

    .line 114
    :cond_6
    new-instance p0, Lorg/eclipse/jetty/io/EofException;

    .line 115
    .line 116
    invoke-direct {p0}, Lorg/eclipse/jetty/io/EofException;-><init>()V

    .line 117
    .line 118
    .line 119
    throw p0

    .line 120
    :cond_7
    invoke-static {v1}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method


# virtual methods
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
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_closed:Z

    .line 3
    .line 4
    return-void
.end method

.method public flush()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/HttpOutput;->getMaxIdleTime()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-long v1, p0

    .line 8
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/http/AbstractGenerator;->flush(J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getMaxIdleTime()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getMaxIdleTime()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isClosed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_closed:Z

    .line 2
    .line 3
    return p0
.end method

.method public isWritten()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_generator:Lorg/eclipse/jetty/http/AbstractGenerator;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/AbstractGenerator;->getContentWritten()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public print(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/HttpOutput;->write([B)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public reopen()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_closed:Z

    .line 3
    .line 4
    return-void
.end method

.method public write(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_onebyte:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    if-nez v0, :cond_0

    .line 126
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_onebyte:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    goto :goto_0

    .line 127
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->clear()V

    .line 128
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpOutput;->_onebyte:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    int-to-byte p1, p1

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->put(B)V

    .line 129
    iget-object p1, p0, Lorg/eclipse/jetty/server/HttpOutput;->_onebyte:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    invoke-direct {p0, p1}, Lorg/eclipse/jetty/server/HttpOutput;->write(Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public write([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    invoke-direct {v0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([B)V

    invoke-direct {p0, v0}, Lorg/eclipse/jetty/server/HttpOutput;->write(Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

.method public write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    invoke-direct {v0, p1, p2, p3}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>([BII)V

    invoke-direct {p0, v0}, Lorg/eclipse/jetty/server/HttpOutput;->write(Lorg/eclipse/jetty/io/Buffer;)V

    return-void
.end method

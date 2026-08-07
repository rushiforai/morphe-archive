.class public Lorg/eclipse/jetty/io/bio/StreamEndPoint;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/EndPoint;


# instance fields
.field _in:Ljava/io/InputStream;

.field _ishut:Z

.field _maxIdleTime:I

.field _oshut:Z

.field _out:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public blockReadable(J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p0, 0x1

    return p0
.end method

.method public blockWritable(J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p0, 0x1

    return p0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 10
    .line 11
    iget-object v1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 16
    .line 17
    .line 18
    :cond_1
    iput-object v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    .line 19
    .line 20
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
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_ishut:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    return v2

    .line 13
    :cond_1
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->space()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-gtz v0, :cond_3

    .line 18
    .line 19
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->hasContent()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    return v2

    .line 26
    :cond_2
    const-string p0, "FULL"

    .line 27
    .line 28
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return v2

    .line 32
    :cond_3
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 33
    .line 34
    invoke-interface {p1, v2, v0}, Lorg/eclipse/jetty/io/Buffer;->readFrom(Ljava/io/InputStream;I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-gez p1, :cond_4

    .line 39
    .line 40
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->shutdownInput()V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    :cond_4
    return p1

    .line 44
    :catch_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->idleExpired()V

    .line 45
    .line 46
    .line 47
    return v1
.end method

.method public flush(Lorg/eclipse/jetty/io/Buffer;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_oshut:Z

    if-eqz v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 60
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    if-nez v0, :cond_1

    const/4 p0, 0x0

    return p0

    .line 61
    :cond_1
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 62
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    invoke-interface {p1, p0}, Lorg/eclipse/jetty/io/Buffer;->writeTo(Ljava/io/OutputStream;)V

    .line 63
    :cond_2
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->isImmutable()Z

    move-result p0

    if-nez p0, :cond_3

    .line 64
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    :cond_3
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
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-ge p1, v0, :cond_1

    .line 14
    .line 15
    return p1

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :cond_1
    if-eqz p2, :cond_4

    .line 18
    .line 19
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-gez p2, :cond_3

    .line 30
    .line 31
    if-lez p1, :cond_2

    .line 32
    .line 33
    return p1

    .line 34
    :cond_2
    return p2

    .line 35
    :cond_3
    add-int/2addr p1, p2

    .line 36
    if-ge p2, v0, :cond_4

    .line 37
    .line 38
    return p1

    .line 39
    :cond_4
    if-eqz p3, :cond_7

    .line 40
    .line 41
    invoke-interface {p3}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-lez p2, :cond_7

    .line 46
    .line 47
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->flush(Lorg/eclipse/jetty/io/Buffer;)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-gez p0, :cond_6

    .line 52
    .line 53
    if-lez p1, :cond_5

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_5
    return p0

    .line 57
    :cond_6
    add-int/2addr p1, p0

    .line 58
    :cond_7
    :goto_0
    return p1
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    if-eqz p0, :cond_0

    .line 66
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    :cond_0
    return-void
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

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
    iget p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_maxIdleTime:I

    .line 2
    .line 3
    return p0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

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

    const/4 p0, 0x0

    return-object p0
.end method

.method public idleExpired()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public isBlocking()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final isClosed()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->isOpen()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public isInputShutdown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_ishut:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOpen()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isOutputShutdown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_oshut:Z

    .line 2
    .line 3
    return p0
.end method

.method public setInputStream(Ljava/io/InputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

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
    iput p1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_maxIdleTime:I

    .line 2
    .line 3
    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    .line 2
    .line 3
    return-void
.end method

.method public shutdownInput()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_ishut:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_oshut:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public shutdownOutput()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_oshut:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_ishut:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

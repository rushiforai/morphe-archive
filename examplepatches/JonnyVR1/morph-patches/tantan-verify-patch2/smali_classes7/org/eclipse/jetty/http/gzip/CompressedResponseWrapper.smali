.class public abstract Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;
.super Ll/gnl;
.source "SourceFile"


# static fields
.field public static final DEFAULT_BUFFER_SIZE:I = 0x2000

.field public static final DEFAULT_MIN_COMPRESS_SIZE:I = 0x100


# instance fields
.field private _bufferSize:I

.field private _compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

.field private _contentLength:J

.field private _mimeTypes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _minCompressSize:I

.field private _noCompression:Z

.field protected _request:Ljavax/servlet/http/HttpServletRequest;

.field private _writer:Ljava/io/PrintWriter;


# direct methods
.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 2

    .line 1
    invoke-direct {p0, p2}, Ll/gnl;-><init>(Ljavax/servlet/http/HttpServletResponse;)V

    .line 2
    .line 3
    .line 4
    const/16 p2, 0x2000

    .line 5
    .line 6
    iput p2, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_bufferSize:I

    .line 7
    .line 8
    const/16 p2, 0x100

    .line 9
    .line 10
    iput p2, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_minCompressSize:I

    .line 11
    .line 12
    const-wide/16 v0, -0x1

    .line 13
    .line 14
    iput-wide v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 15
    .line 16
    iput-object p1, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_request:Ljavax/servlet/http/HttpServletRequest;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "content-length"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    iput-wide p1, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 14
    .line 15
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->setContentLength(J)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string v0, "content-type"

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setContentType(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const-string v0, "content-encoding"

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-super {p0, p1, p2}, Ll/gnl;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/mse0;->isCommitted()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-nez p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->noCompression()V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void

    .line 56
    :cond_3
    invoke-super {p0, p1, p2}, Ll/gnl;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public finish()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 6
    .line 7
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->isClosed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->finish()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public flushBuffer()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->finish()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-virtual {p0}, Ll/mse0;->getResponse()Ll/lse0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ll/lse0;->flushBuffer()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public getOutputStream()Ll/ese0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mse0;->getResponse()Ll/lse0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/lse0;->isCommitted()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_noCompression:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    move-object v1, p0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_request:Ljavax/servlet/http/HttpServletRequest;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/mse0;->getResponse()Ll/lse0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    move-object v3, v0

    .line 28
    check-cast v3, Ljavax/servlet/http/HttpServletResponse;

    .line 29
    .line 30
    iget-wide v4, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 31
    .line 32
    iget v6, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_bufferSize:I

    .line 33
    .line 34
    iget v7, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_minCompressSize:I

    .line 35
    .line 36
    move-object v1, p0

    .line 37
    invoke-virtual/range {v1 .. v7}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->newCompressedStream(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, v1, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :goto_0
    iget-wide v2, v1, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 45
    .line 46
    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setContentLength(J)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ll/mse0;->getResponse()Ll/lse0;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_2
    move-object v1, p0

    .line 59
    iget-object p0, v1, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 60
    .line 61
    if-nez p0, :cond_3

    .line 62
    .line 63
    :goto_1
    iget-object p0, v1, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_3
    const-string p0, "getWriter() called"

    .line 67
    .line 68
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const/4 p0, 0x0

    .line 72
    return-object p0
.end method

.method public getWriter()Ljava/io/PrintWriter;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/mse0;->getResponse()Ll/lse0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ll/lse0;->isCommitted()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_noCompression:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :cond_0
    move-object v1, p0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_request:Ljavax/servlet/http/HttpServletRequest;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/mse0;->getResponse()Ll/lse0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    move-object v3, v0

    .line 32
    check-cast v3, Ljavax/servlet/http/HttpServletResponse;

    .line 33
    .line 34
    iget-wide v4, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 35
    .line 36
    iget v6, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_bufferSize:I

    .line 37
    .line 38
    iget v7, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_minCompressSize:I

    .line 39
    .line 40
    move-object v1, p0

    .line 41
    invoke-virtual/range {v1 .. v7}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->newCompressedStream(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iput-object p0, v1, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/mse0;->getCharacterEncoding()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v1, p0, v0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->newWriter(Ljava/io/OutputStream;Ljava/lang/String;)Ljava/io/PrintWriter;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iput-object p0, v1, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :goto_0
    iget-wide v2, v1, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 59
    .line 60
    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setContentLength(J)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ll/mse0;->getResponse()Ll/lse0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {p0}, Ll/lse0;->getWriter()Ljava/io/PrintWriter;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_2
    const-string p0, "getOutputStream() called"

    .line 73
    .line 74
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const/4 p0, 0x0

    .line 78
    return-object p0

    .line 79
    :cond_3
    move-object v1, p0

    .line 80
    :goto_1
    iget-object p0, v1, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 81
    .line 82
    return-object p0
.end method

.method public abstract newCompressedStream(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public newWriter(Ljava/io/OutputStream;Ljava/lang/String;)Ljava/io/PrintWriter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/io/PrintWriter;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Ljava/io/OutputStreamWriter;

    .line 10
    .line 11
    invoke-direct {v0, p1, p2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public noCompression()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_noCompression:Z

    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doNotCompress()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/mse0;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->resetBuffer()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 13
    .line 14
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_noCompression:Z

    .line 18
    .line 19
    const-wide/16 v0, -0x1

    .line 20
    .line 21
    iput-wide v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 22
    .line 23
    return-void
.end method

.method public resetBuffer()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/mse0;->resetBuffer()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->resetBuffer()V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_writer:Ljava/io/PrintWriter;

    .line 13
    .line 14
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 15
    .line 16
    return-void
.end method

.method public sendError(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->resetBuffer()V

    .line 9
    invoke-super {p0, p1}, Ll/gnl;->sendError(I)V

    return-void
.end method

.method public sendError(ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->resetBuffer()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Ll/gnl;->sendError(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public sendRedirect(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->resetBuffer()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/gnl;->sendRedirect(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setBufferSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_bufferSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setContentLength(I)V
    .locals 2

    int-to-long v0, p1

    .line 51
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setContentLength(J)V

    return-void
.end method

.method public setContentLength(J)V
    .locals 4

    .line 1
    iput-wide p1, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 2
    .line 3
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->setContentLength(J)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_noCompression:Z

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    cmp-long p1, p1, v0

    .line 18
    .line 19
    if-ltz p1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/mse0;->getResponse()Ll/lse0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ljavax/servlet/http/HttpServletResponse;

    .line 26
    .line 27
    iget-wide v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 28
    .line 29
    const-wide/32 v2, 0x7fffffff

    .line 30
    .line 31
    .line 32
    cmp-long p0, v0, v2

    .line 33
    .line 34
    if-gez p0, :cond_1

    .line 35
    .line 36
    long-to-int p0, v0

    .line 37
    invoke-interface {p1, p0}, Ll/lse0;->setContentLength(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const-string p0, "Content-Length"

    .line 42
    .line 43
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-interface {p1, p0, p2}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/mse0;->setContentType(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string v0, ";"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->getOutputStream()Ljava/io/OutputStream;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-nez v0, :cond_4

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_mimeTypes:Ljava/util/Set;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    const-string v0, "gzip"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_mimeTypes:Ljava/util/Set;

    .line 44
    .line 45
    if-eqz v0, :cond_4

    .line 46
    .line 47
    if-eqz p1, :cond_3

    .line 48
    .line 49
    invoke-static {p1}, Lorg/eclipse/jetty/util/StringUtil;->asciiToLowerCase(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_4

    .line 58
    .line 59
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->noCompression()V

    .line 60
    .line 61
    .line 62
    :cond_4
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "content-length"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide p1

    .line 13
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setContentLength(J)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "content-type"

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->setContentType(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    const-string v0, "content-encoding"

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-super {p0, p1, p2}, Ll/gnl;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/mse0;->isCommitted()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->noCompression()V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void

    .line 50
    :cond_3
    invoke-super {p0, p1, p2}, Ll/gnl;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public setIntHeader(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const-string v0, "content-length"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    int-to-long p1, p2

    .line 10
    iput-wide p1, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_contentLength:J

    .line 11
    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_compressedStream:Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->setContentLength(J)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    invoke-super {p0, p1, p2}, Ll/gnl;->setIntHeader(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setMimeTypes(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_mimeTypes:Ljava/util/Set;

    .line 2
    .line 3
    return-void
.end method

.method public setMinCompressSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->_minCompressSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setStatus(I)V
    .locals 1

    .line 26
    invoke-super {p0, p1}, Ll/gnl;->setStatus(I)V

    const/16 v0, 0xc8

    if-lt p1, v0, :cond_1

    const/16 v0, 0xcc

    if-eq p1, v0, :cond_1

    const/16 v0, 0xcd

    if-eq p1, v0, :cond_1

    const/16 v0, 0x12c

    if-lt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->noCompression()V

    return-void
.end method

.method public setStatus(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/gnl;->setStatus(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/16 p2, 0xc8

    .line 5
    .line 6
    if-lt p1, p2, :cond_1

    .line 7
    .line 8
    const/16 p2, 0xcc

    .line 9
    .line 10
    if-eq p1, p2, :cond_1

    .line 11
    .line 12
    const/16 p2, 0xcd

    .line 13
    .line 14
    if-eq p1, p2, :cond_1

    .line 15
    .line 16
    const/16 p2, 0x12c

    .line 17
    .line 18
    if-lt p1, p2, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/CompressedResponseWrapper;->noCompression()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

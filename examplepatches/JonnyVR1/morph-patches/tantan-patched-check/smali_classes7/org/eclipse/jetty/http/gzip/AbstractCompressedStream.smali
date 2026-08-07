.class public abstract Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;
.super Ll/ese0;
.source "SourceFile"


# instance fields
.field protected _bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

.field protected _bufferSize:I

.field protected _closed:Z

.field protected _compressedOutputStream:Ljava/util/zip/DeflaterOutputStream;

.field protected _contentLength:J

.field protected _doNotCompress:Z

.field private final _encoding:Ljava/lang/String;

.field protected _minCompressSize:I

.field protected _out:Ljava/io/OutputStream;

.field protected _request:Ljavax/servlet/http/HttpServletRequest;

.field protected _response:Ljavax/servlet/http/HttpServletResponse;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;JII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/ese0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_encoding:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_request:Ljavax/servlet/http/HttpServletRequest;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 9
    .line 10
    iput-wide p4, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 11
    .line 12
    iput p6, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bufferSize:I

    .line 13
    .line 14
    iput p7, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_minCompressSize:I

    .line 15
    .line 16
    if-nez p7, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doCompress()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private checkOut(I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_7

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/lse0;->isCommitted()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-wide v3, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 20
    .line 21
    cmp-long v0, v3, v1

    .line 22
    .line 23
    if-ltz v0, :cond_0

    .line 24
    .line 25
    iget v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_minCompressSize:I

    .line 26
    .line 27
    int-to-long v0, v0

    .line 28
    cmp-long v0, v3, v0

    .line 29
    .line 30
    if-gez v0, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_minCompressSize:I

    .line 34
    .line 35
    if-le p1, v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doCompress()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    new-instance p1, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 42
    .line 43
    iget v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bufferSize:I

    .line 44
    .line 45
    invoke-direct {p1, v0}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;-><init>(I)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 49
    .line 50
    iput-object p1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doNotCompress()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 58
    .line 59
    if-eqz v0, :cond_6

    .line 60
    .line 61
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 62
    .line 63
    invoke-interface {v0}, Ll/lse0;->isCommitted()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_5

    .line 68
    .line 69
    iget-wide v3, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 70
    .line 71
    cmp-long v0, v3, v1

    .line 72
    .line 73
    if-ltz v0, :cond_4

    .line 74
    .line 75
    iget v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_minCompressSize:I

    .line 76
    .line 77
    int-to-long v0, v0

    .line 78
    cmp-long v0, v3, v0

    .line 79
    .line 80
    if-gez v0, :cond_4

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 84
    .line 85
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getBuf()[B

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    array-length v0, v0

    .line 90
    iget-object v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 91
    .line 92
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    sub-int/2addr v0, v1

    .line 97
    if-lt p1, v0, :cond_6

    .line 98
    .line 99
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doCompress()V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doNotCompress()V

    .line 104
    .line 105
    .line 106
    :cond_6
    return-void

    .line 107
    :cond_7
    const-string p0, "CLOSED"

    .line 108
    .line 109
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method


# virtual methods
.method public close()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_closed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_request:Ljavax/servlet/http/HttpServletRequest;

    .line 7
    .line 8
    const-string v1, "javax.servlet.include.request_uri"

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->flush()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 21
    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    iget-wide v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 25
    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    cmp-long v1, v1, v3

    .line 29
    .line 30
    if-gez v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    int-to-long v0, v0

    .line 37
    iput-wide v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 38
    .line 39
    :cond_2
    iget-wide v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 40
    .line 41
    iget v2, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_minCompressSize:I

    .line 42
    .line 43
    int-to-long v2, v2

    .line 44
    cmp-long v0, v0, v2

    .line 45
    .line 46
    if-gez v0, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doNotCompress()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doCompress()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 57
    .line 58
    if-nez v0, :cond_5

    .line 59
    .line 60
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doNotCompress()V

    .line 61
    .line 62
    .line 63
    :cond_5
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_compressedOutputStream:Ljava/util/zip/DeflaterOutputStream;

    .line 64
    .line 65
    if-eqz v0, :cond_6

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/util/zip/DeflaterOutputStream;->close()V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_6
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 74
    .line 75
    .line 76
    :goto_1
    const/4 v0, 0x1

    .line 77
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_closed:Z

    .line 78
    .line 79
    return-void
.end method

.method public abstract createStream()Ljava/util/zip/DeflaterOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public doCompress()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_compressedOutputStream:Ljava/util/zip/DeflaterOutputStream;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/lse0;->isCommitted()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_encoding:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "Content-Encoding"

    .line 16
    .line 17
    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljavax/servlet/http/HttpServletResponse;->containsHeader(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->createStream()Ljava/util/zip/DeflaterOutputStream;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_compressedOutputStream:Ljava/util/zip/DeflaterOutputStream;

    .line 33
    .line 34
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 35
    .line 36
    iget-object v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getBuf()[B

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 45
    .line 46
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doNotCompress()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method public doNotCompress()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_compressedOutputStream:Ljava/util/zip/DeflaterOutputStream;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_doNotCompress:Z

    .line 17
    .line 18
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 25
    .line 26
    iget-wide v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->setContentLength(J)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 36
    .line 37
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getBuf()[B

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v2, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 42
    .line 43
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-virtual {v1, v0, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 49
    .line 50
    .line 51
    :cond_2
    const/4 v0, 0x0

    .line 52
    iput-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    const-string p0, "Compressed output stream is already assigned."

    .line 56
    .line 57
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public finish()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    :cond_0
    iget-wide v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v2, v0, v2

    .line 18
    .line 19
    if-lez v2, :cond_1

    .line 20
    .line 21
    iget v2, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_minCompressSize:I

    .line 22
    .line 23
    int-to-long v2, v2

    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-gez v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doNotCompress()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doCompress()V

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_compressedOutputStream:Ljava/util/zip/DeflaterOutputStream;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    iget-boolean v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_closed:Z

    .line 40
    .line 41
    if-nez v1, :cond_3

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    iput-boolean v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_closed:Z

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/util/zip/DeflaterOutputStream;->close()V

    .line 47
    .line 48
    .line 49
    :cond_3
    return-void
.end method

.method public flush()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    :cond_0
    iget-wide v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-lez v2, :cond_1

    .line 16
    .line 17
    iget v2, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_minCompressSize:I

    .line 18
    .line 19
    int-to-long v2, v2

    .line 20
    cmp-long v0, v0, v2

    .line 21
    .line 22
    if-gez v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doNotCompress()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->doCompress()V

    .line 29
    .line 30
    .line 31
    :cond_2
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 2
    .line 3
    return-object p0
.end method

.method public isClosed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_closed:Z

    .line 2
    .line 3
    return p0
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

.method public resetBuffer()V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/lse0;->isCommitted()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_closed:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 14
    .line 15
    iput-object v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_bOut:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 16
    .line 17
    iget-object v2, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_compressedOutputStream:Ljava/util/zip/DeflaterOutputStream;

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 22
    .line 23
    const-string v3, "Content-Encoding"

    .line 24
    .line 25
    invoke-interface {v2, v3, v1}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iput-object v1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_compressedOutputStream:Ljava/util/zip/DeflaterOutputStream;

    .line 29
    .line 30
    iput-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_doNotCompress:Z

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const-string p0, "Committed"

    .line 34
    .line 35
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public setContentLength(J)V
    .locals 2

    .line 1
    iput-wide p1, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_contentLength:J

    .line 2
    .line 3
    iget-boolean v0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_doNotCompress:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    cmp-long v0, p1, v0

    .line 10
    .line 11
    if-ltz v0, :cond_1

    .line 12
    .line 13
    const-wide/32 v0, 0x7fffffff

    .line 14
    .line 15
    .line 16
    cmp-long v0, p1, v0

    .line 17
    .line 18
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 19
    .line 20
    if-gez v0, :cond_0

    .line 21
    .line 22
    long-to-int p1, p1

    .line 23
    invoke-interface {p0, p1}, Ll/lse0;->setContentLength(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string v0, "Content-Length"

    .line 28
    .line 29
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p0, v0, p1}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_response:Ljavax/servlet/http/HttpServletResponse;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public write(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->checkOut(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public write([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    array-length v0, p1

    invoke-direct {p0, v0}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->checkOut(I)V

    .line 12
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method public write([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-direct {p0, p3}, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->checkOut(I)V

    .line 14
    iget-object p0, p0, Lorg/eclipse/jetty/http/gzip/AbstractCompressedStream;->_out:Ljava/io/OutputStream;

    invoke-virtual {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    return-void
.end method

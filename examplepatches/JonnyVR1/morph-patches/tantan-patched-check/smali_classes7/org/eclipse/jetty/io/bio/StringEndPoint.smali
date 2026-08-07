.class public Lorg/eclipse/jetty/io/bio/StringEndPoint;
.super Lorg/eclipse/jetty/io/bio/StreamEndPoint;
.source "SourceFile"


# instance fields
.field _bin:Ljava/io/ByteArrayInputStream;

.field _bout:Ljava/io/ByteArrayOutputStream;

.field _encoding:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, v0}, Lorg/eclipse/jetty/io/bio/StreamEndPoint;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 3
    .line 4
    .line 5
    const-string v0, "UTF-8"

    .line 6
    .line 7
    iput-object v0, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_encoding:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    new-array v1, v1, [B

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_bin:Ljava/io/ByteArrayInputStream;

    .line 18
    .line 19
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_bout:Ljava/io/ByteArrayOutputStream;

    .line 25
    .line 26
    iget-object v1, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_bin:Ljava/io/ByteArrayInputStream;

    .line 27
    .line 28
    iput-object v1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 29
    .line 30
    iput-object v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lorg/eclipse/jetty/io/bio/StringEndPoint;-><init>()V

    if-eqz p1, :cond_0

    .line 34
    iput-object p1, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_encoding:Ljava/lang/String;

    :cond_0
    return-void
.end method


# virtual methods
.method public getOutput()Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_bout:Ljava/io/ByteArrayOutputStream;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_encoding:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_bout:Ljava/io/ByteArrayOutputStream;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :catch_0
    move-exception v0

    .line 21
    new-instance v1, Lorg/eclipse/jetty/io/bio/StringEndPoint$1;

    .line 22
    .line 23
    iget-object v2, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_encoding:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {v1, p0, v2, v0}, Lorg/eclipse/jetty/io/bio/StringEndPoint$1;-><init>(Lorg/eclipse/jetty/io/bio/StringEndPoint;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 26
    .line 27
    .line 28
    throw v1
.end method

.method public hasMore()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_bin:Ljava/io/ByteArrayInputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->available()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lez p0, :cond_0

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

.method public setInput(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_encoding:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_bin:Ljava/io/ByteArrayInputStream;

    .line 13
    .line 14
    iput-object v0, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_in:Ljava/io/InputStream;

    .line 15
    .line 16
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lorg/eclipse/jetty/io/bio/StringEndPoint;->_bout:Ljava/io/ByteArrayOutputStream;

    .line 22
    .line 23
    iput-object p1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_out:Ljava/io/OutputStream;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_ishut:Z

    .line 27
    .line 28
    iput-boolean p1, p0, Lorg/eclipse/jetty/io/bio/StreamEndPoint;->_oshut:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception p0

    .line 32
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p1
.end method

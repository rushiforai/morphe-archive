.class public Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;
.super Ljava/io/Writer;
.source "SourceFile"


# instance fields
.field private _bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

.field private _buf:[B

.field private _fixed:Z

.field private _size:I

.field private _writer:Ljava/io/OutputStreamWriter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 6
    .line 7
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_writer:Ljava/io/OutputStreamWriter;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_fixed:Z

    .line 11
    .line 12
    const/16 v0, 0x800

    .line 13
    .line 14
    new-array v0, v0, [B

    .line 15
    .line 16
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 21
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_writer:Ljava/io/OutputStreamWriter;

    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_fixed:Z

    .line 23
    new-array p1, p1, [B

    iput-object p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 26
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_writer:Ljava/io/OutputStreamWriter;

    .line 27
    iput-object p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_fixed:Z

    return-void
.end method

.method private writeEncoded([CII)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 6
    .line 7
    mul-int/lit8 v1, p3, 0x2

    .line 8
    .line 9
    invoke-direct {v0, v1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 13
    .line 14
    new-instance v0, Ljava/io/OutputStreamWriter;

    .line 15
    .line 16
    iget-object v1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 17
    .line 18
    const-string v2, "ISO-8859-1"

    .line 19
    .line 20
    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_writer:Ljava/io/OutputStreamWriter;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_writer:Ljava/io/OutputStreamWriter;

    .line 30
    .line 31
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStreamWriter;->write([CII)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_writer:Ljava/io/OutputStreamWriter;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/io/OutputStreamWriter;->flush()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 40
    .line 41
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->ensureSpareCapacity(I)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 49
    .line 50
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getBuf()[B

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p2, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 55
    .line 56
    iget p3, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 57
    .line 58
    iget-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 59
    .line 60
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {p1, v1, p2, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 66
    .line 67
    .line 68
    iget p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 69
    .line 70
    iget-object p2, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_bout:Lorg/eclipse/jetty/util/ByteArrayOutputStream2;

    .line 71
    .line 72
    invoke-virtual {p2}, Lorg/eclipse/jetty/util/ByteArrayOutputStream2;->getCount()I

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    add-int/2addr p1, p2

    .line 77
    iput p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 78
    .line 79
    return-void
.end method


# virtual methods
.method public capacity()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public close()V
    .locals 0

    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 3
    .line 4
    return-void
.end method

.method public ensureSpareCapacity(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 2
    .line 3
    add-int v1, v0, p1

    .line 4
    .line 5
    iget-object v2, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 6
    .line 7
    array-length v3, v2

    .line 8
    if-le v1, v3, :cond_1

    .line 9
    .line 10
    iget-boolean v1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_fixed:Z

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    array-length v1, v2

    .line 15
    add-int/2addr v1, p1

    .line 16
    mul-int/lit8 v1, v1, 0x4

    .line 17
    .line 18
    div-int/lit8 v1, v1, 0x3

    .line 19
    .line 20
    new-array p1, v1, [B

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v2, v1, p1, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 30
    .line 31
    array-length p0, p0

    .line 32
    const-string p1, "Buffer overflow: "

    .line 33
    .line 34
    invoke-static {p1, p0}, Ll/yll;->a(Ljava/lang/String;I)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public flush()V
    .locals 0

    return-void
.end method

.method public getBuf()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getByteArray()[B
    .locals 3

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v1
.end method

.method public getLock()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ljava/io/Writer;->lock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public resetWriter()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 3
    .line 4
    return-void
.end method

.method public setLength(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 2
    .line 3
    return-void
.end method

.method public size()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 2
    .line 3
    return p0
.end method

.method public spareCapacity()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget p0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 5
    .line 6
    sub-int/2addr v0, p0

    .line 7
    return v0
.end method

.method public write(C)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 62
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->ensureSpareCapacity(I)V

    if-ltz p1, :cond_0

    const/16 v1, 0x7f

    if-gt p1, v1, :cond_0

    .line 63
    iget-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    iget v1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    int-to-byte p0, p1

    aput-byte p0, v0, v1

    return-void

    .line 64
    :cond_0
    new-array v1, v0, [C

    const/4 v2, 0x0

    aput-char p1, v1, v2

    .line 65
    invoke-direct {p0, v1, v2, v0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->writeEncoded([CII)V

    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    const-string p1, "null"

    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->write(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->ensureSpareCapacity(I)V

    .line 16
    .line 17
    .line 18
    :goto_0
    if-ge v0, v1, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ltz v2, :cond_1

    .line 25
    .line 26
    const/16 v3, 0x7f

    .line 27
    .line 28
    if-gt v2, v3, :cond_1

    .line 29
    .line 30
    iget-object v3, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 31
    .line 32
    iget v4, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 33
    .line 34
    add-int/lit8 v5, v4, 0x1

    .line 35
    .line 36
    iput v5, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 37
    .line 38
    int-to-byte v2, v2

    .line 39
    aput-byte v2, v3, v4

    .line 40
    .line 41
    add-int/lit8 v0, v0, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    sub-int/2addr v1, v0

    .line 49
    invoke-direct {p0, p1, v0, v1}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->writeEncoded([CII)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->ensureSpareCapacity(I)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_1

    add-int v1, p2, v0

    .line 67
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ltz v2, :cond_0

    const/16 v3, 0x7f

    if-gt v2, v3, :cond_0

    .line 68
    iget-object v1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    iget v3, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 69
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    sub-int/2addr p3, v0

    invoke-direct {p0, p1, v1, p3}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->writeEncoded([CII)V

    :cond_1
    return-void
.end method

.method public write([C)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    array-length v0, p1

    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->ensureSpareCapacity(I)V

    const/4 v0, 0x0

    .line 54
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 55
    aget-char v1, p1, v0

    if-ltz v1, :cond_0

    const/16 v2, 0x7f

    if-gt v1, v2, :cond_0

    .line 56
    iget-object v2, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    iget v3, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    int-to-byte v1, v1

    aput-byte v1, v2, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    :cond_0
    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-direct {p0, p1, v0, v1}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->writeEncoded([CII)V

    :cond_1
    return-void
.end method

.method public write([CII)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 58
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->ensureSpareCapacity(I)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_1

    add-int v1, p2, v0

    .line 59
    aget-char v2, p1, v1

    if-ltz v2, :cond_0

    const/16 v3, 0x7f

    if-gt v2, v3, :cond_0

    .line 60
    iget-object v1, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    iget v3, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    sub-int/2addr p3, v0

    .line 61
    invoke-direct {p0, p1, v1, p3}, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->writeEncoded([CII)V

    :cond_1
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_buf:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget p0, p0, Lorg/eclipse/jetty/util/ByteArrayISO8859Writer;->_size:I

    .line 5
    .line 6
    invoke-virtual {p1, v0, v1, p0}, Ljava/io/OutputStream;->write([BII)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

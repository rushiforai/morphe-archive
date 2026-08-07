.class public Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;
.super Ljava/io/OutputStream;
.source "SourceFile"


# static fields
.field private static final FCOMMENT:I = 0x10

.field private static final FNAME:I = 0x8


# instance fields
.field private closed:Z

.field private final crc:Ljava/util/zip/CRC32;

.field private final deflateBuffer:[B

.field private final deflater:Ljava/util/zip/Deflater;

.field private final out:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1

    .line 35
    new-instance v0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;

    invoke-direct {v0}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;-><init>(Ljava/io/OutputStream;Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x200

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflateBuffer:[B

    .line 9
    .line 10
    new-instance v0, Ljava/util/zip/CRC32;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->crc:Ljava/util/zip/CRC32;

    .line 16
    .line 17
    iput-object p1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 18
    .line 19
    new-instance p1, Ljava/util/zip/Deflater;

    .line 20
    .line 21
    invoke-virtual {p2}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->getCompressionLevel()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-direct {p1, v0, v1}, Ljava/util/zip/Deflater;-><init>(IZ)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 30
    .line 31
    invoke-direct {p0, p2}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->writeHeader(Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private deflate()V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflateBuffer:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-virtual {v0, v1, v3, v2}, Ljava/util/zip/Deflater;->deflate([BII)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 14
    .line 15
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflateBuffer:[B

    .line 16
    .line 17
    invoke-virtual {v1, p0, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private writeHeader(Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->getFilename()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->getComment()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/16 v2, 0xa

    .line 10
    .line 11
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    const/16 v3, -0x74e1

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    const/16 v3, 0x8

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v3, v4

    .line 35
    :goto_0
    if-eqz v1, :cond_1

    .line 36
    .line 37
    const/16 v5, 0x10

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v5, v4

    .line 41
    :goto_1
    or-int/2addr v3, v5

    .line 42
    int-to-byte v3, v3

    .line 43
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->getModificationTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v5

    .line 50
    const-wide/16 v7, 0x3e8

    .line 51
    .line 52
    div-long/2addr v5, v7

    .line 53
    long-to-int v3, v5

    .line 54
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->getCompressionLevel()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    const/16 v5, 0x9

    .line 62
    .line 63
    if-ne v3, v5, :cond_2

    .line 64
    .line 65
    const/4 v3, 0x2

    .line 66
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    const/4 v5, 0x1

    .line 71
    if-ne v3, v5, :cond_3

    .line 72
    .line 73
    const/4 v3, 0x4

    .line 74
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    :goto_2
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipParameters;->getOperatingSystem()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    int-to-byte p1, p1

    .line 86
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 90
    .line 91
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 96
    .line 97
    .line 98
    const-string p1, "ISO-8859-1"

    .line 99
    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    iget-object v2, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 103
    .line 104
    invoke-virtual {v0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 112
    .line 113
    invoke-virtual {v0, v4}, Ljava/io/OutputStream;->write(I)V

    .line 114
    .line 115
    .line 116
    :cond_4
    if-eqz v1, :cond_5

    .line 117
    .line 118
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 119
    .line 120
    invoke-virtual {v1, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 128
    .line 129
    invoke-virtual {p0, v4}, Ljava/io/OutputStream;->write(I)V

    .line 130
    .line 131
    .line 132
    :cond_5
    return-void
.end method

.method private writeTrailer()V
    .locals 3

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->crc:Ljava/util/zip/CRC32;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    long-to-int v1, v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/util/zip/Deflater;->getTotalIn()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->closed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->finish()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/zip/Deflater;->end()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 17
    .line 18
    .line 19
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->closed:Z

    .line 20
    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v1

    .line 23
    iget-object v2, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/util/zip/Deflater;->end()V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 31
    .line 32
    .line 33
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->closed:Z

    .line 34
    .line 35
    throw v1

    .line 36
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finished()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finish()V

    .line 12
    .line 13
    .line 14
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finished()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflate()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->writeTrailer()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public flush()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->out:Ljava/io/OutputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public write(I)V
    .locals 3

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v0, 0x1

    .line 41
    new-array v1, v0, [B

    const/4 v2, 0x0

    aput-byte p1, v1, v2

    invoke-virtual {p0, v1, v2, v0}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->write([BII)V

    return-void
.end method

.method public write([B)V
    .locals 2

    .line 40
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finished()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    if-lez p3, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflater:Ljava/util/zip/Deflater;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->needsInput()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->deflate()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/gzip/GzipCompressorOutputStream;->crc:Ljava/util/zip/CRC32;

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :cond_2
    const-string p0, "Cannot write more data, the end of the compressed data stream has been reached"

    .line 35
    .line 36
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

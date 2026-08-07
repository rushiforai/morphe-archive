.class public Lnet/jpountz/lz4/LZ4CompressorWithLength;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final compressor:Lnet/jpountz/lz4/LZ4Compressor;


# direct methods
.method public constructor <init>(Lnet/jpountz/lz4/LZ4Compressor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compressor:Lnet/jpountz/lz4/LZ4Compressor;

    .line 5
    .line 6
    return-void
.end method

.method private putOriginalLength(Ljava/nio/ByteBuffer;II)V
    .locals 1

    .line 1
    int-to-byte p0, p3

    .line 2
    invoke-virtual {p1, p2, p0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    .line 5
    add-int/lit8 p0, p2, 0x1

    .line 6
    .line 7
    shr-int/lit8 v0, p3, 0x8

    .line 8
    .line 9
    int-to-byte v0, v0

    .line 10
    invoke-virtual {p1, p0, v0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    add-int/lit8 p0, p2, 0x2

    .line 14
    .line 15
    shr-int/lit8 v0, p3, 0x10

    .line 16
    .line 17
    int-to-byte v0, v0

    .line 18
    invoke-virtual {p1, p0, v0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    add-int/lit8 p2, p2, 0x3

    .line 22
    .line 23
    shr-int/lit8 p0, p3, 0x18

    .line 24
    .line 25
    int-to-byte p0, p0

    .line 26
    invoke-virtual {p1, p2, p0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private putOriginalLength([BII)V
    .locals 1

    int-to-byte p0, p3

    .line 30
    aput-byte p0, p1, p2

    add-int/lit8 p0, p2, 0x1

    shr-int/lit8 v0, p3, 0x8

    int-to-byte v0, v0

    .line 31
    aput-byte v0, p1, p0

    add-int/lit8 p0, p2, 0x2

    shr-int/lit8 v0, p3, 0x10

    int-to-byte v0, v0

    .line 32
    aput-byte v0, p1, p0

    add-int/lit8 p2, p2, 0x3

    shr-int/lit8 p0, p3, 0x18

    int-to-byte p0, p0

    .line 33
    aput-byte p0, p1, p2

    return-void
.end method


# virtual methods
.method public compress(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I
    .locals 7

    .line 49
    iget-object v0, p0, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compressor:Lnet/jpountz/lz4/LZ4Compressor;

    add-int/lit8 v5, p5, 0x4

    add-int/lit8 v6, p6, -0x4

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lnet/jpountz/lz4/LZ4Compressor;->compress(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I

    move-result p1

    .line 50
    invoke-direct {p0, v4, p5, v3}, Lnet/jpountz/lz4/LZ4CompressorWithLength;->putOriginalLength(Ljava/nio/ByteBuffer;II)V

    add-int/lit8 p1, p1, 0x4

    return p1
.end method

.method public compress([BII[BI)I
    .locals 8

    .line 45
    array-length v0, p4

    sub-int v7, v0, p5

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v7}, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compress([BII[BII)I

    move-result p0

    return p0
.end method

.method public compress([BII[BII)I
    .locals 7

    .line 46
    iget-object v0, p0, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compressor:Lnet/jpountz/lz4/LZ4Compressor;

    add-int/lit8 v5, p5, 0x4

    add-int/lit8 v6, p6, -0x4

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lnet/jpountz/lz4/LZ4Compressor;->compress([BII[BII)I

    move-result p1

    .line 47
    invoke-direct {p0, v4, p5, v3}, Lnet/jpountz/lz4/LZ4CompressorWithLength;->putOriginalLength([BII)V

    add-int/lit8 p1, p1, 0x4

    return p1
.end method

.method public compress([B[B)I
    .locals 6

    .line 44
    array-length v3, p1

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    invoke-virtual/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compress([BII[BI)I

    move-result p0

    return p0
.end method

.method public compress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    invoke-virtual {p2}, Ljava/nio/Buffer;->position()I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    invoke-virtual {p2}, Ljava/nio/Buffer;->remaining()I

    .line 14
    .line 15
    .line 16
    move-result v6

    .line 17
    move-object v0, p0

    .line 18
    move-object v1, p1

    .line 19
    move-object v4, p2

    .line 20
    invoke-virtual/range {v0 .. v6}, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compress(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v4}, Ljava/nio/Buffer;->position()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    add-int/2addr p1, p0

    .line 36
    invoke-virtual {v4, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public compress([B)[B
    .locals 2

    const/4 v0, 0x0

    .line 48
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compress([BII)[B

    move-result-object p0

    return-object p0
.end method

.method public compress([BII)[B
    .locals 7

    .line 40
    invoke-virtual {p0, p3}, Lnet/jpountz/lz4/LZ4CompressorWithLength;->maxCompressedLength(I)I

    move-result v0

    .line 41
    new-array v5, v0, [B

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    .line 42
    invoke-virtual/range {v1 .. v6}, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compress([BII[BI)I

    move-result p0

    .line 43
    invoke-static {v5, p0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    return-object p0
.end method

.method public maxCompressedLength(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lnet/jpountz/lz4/LZ4CompressorWithLength;->compressor:Lnet/jpountz/lz4/LZ4Compressor;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lnet/jpountz/lz4/LZ4Compressor;->maxCompressedLength(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x4

    .line 8
    .line 9
    return p0
.end method

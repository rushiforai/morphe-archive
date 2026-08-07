.class public Lnet/jpountz/lz4/LZ4DecompressorWithLength;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;


# direct methods
.method public constructor <init>(Lnet/jpountz/lz4/LZ4FastDecompressor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

    .line 5
    .line 6
    return-void
.end method

.method public static getDecompressedLength(Ljava/nio/ByteBuffer;)I
    .locals 1

    .line 40
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    move-result v0

    invoke-static {p0, v0}, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->getDecompressedLength(Ljava/nio/ByteBuffer;I)I

    move-result p0

    return p0
.end method

.method public static getDecompressedLength(Ljava/nio/ByteBuffer;I)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit16 v0, v0, 0xff

    .line 6
    .line 7
    add-int/lit8 v1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    and-int/lit16 v1, v1, 0xff

    .line 14
    .line 15
    shl-int/lit8 v1, v1, 0x8

    .line 16
    .line 17
    or-int/2addr v0, v1

    .line 18
    add-int/lit8 v1, p1, 0x2

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    and-int/lit16 v1, v1, 0xff

    .line 25
    .line 26
    shl-int/lit8 v1, v1, 0x10

    .line 27
    .line 28
    or-int/2addr v0, v1

    .line 29
    add-int/lit8 p1, p1, 0x3

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    shl-int/lit8 p0, p0, 0x18

    .line 36
    .line 37
    or-int/2addr p0, v0

    .line 38
    return p0
.end method

.method public static getDecompressedLength([B)I
    .locals 1

    const/4 v0, 0x0

    .line 41
    invoke-static {p0, v0}, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->getDecompressedLength([BI)I

    move-result p0

    return p0
.end method

.method public static getDecompressedLength([BI)I
    .locals 2

    .line 39
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v0

    return p0
.end method


# virtual methods
.method public decompress(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)I
    .locals 6

    .line 52
    invoke-static {p1, p2}, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->getDecompressedLength(Ljava/nio/ByteBuffer;I)I

    move-result v5

    .line 53
    iget-object v0, p0, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

    add-int/lit8 v2, p2, 0x4

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4FastDecompressor;->decompress(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)I

    move-result p0

    add-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public decompress([BI[BI)I
    .locals 6

    .line 46
    invoke-static {p1, p2}, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->getDecompressedLength([BI)I

    move-result v5

    .line 47
    iget-object v0, p0, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

    add-int/lit8 v2, p2, 0x4

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lnet/jpountz/lz4/LZ4FastDecompressor;->decompress([BI[BII)I

    move-result p0

    add-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public decompress([B[B)I
    .locals 1

    const/4 v0, 0x0

    .line 51
    invoke-virtual {p0, p1, v0, p2, v0}, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->decompress([BI[BI)I

    move-result p0

    return p0
.end method

.method public decompress(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1, v0}, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->getDecompressedLength(Ljava/nio/ByteBuffer;I)I

    .line 6
    .line 7
    .line 8
    move-result v6

    .line 9
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/lit8 v3, p0, 0x4

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/nio/Buffer;->position()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    move-object v2, p1

    .line 22
    move-object v4, p2

    .line 23
    invoke-virtual/range {v1 .. v6}, Lnet/jpountz/lz4/LZ4FastDecompressor;->decompress(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    add-int/lit8 p1, p1, 0x4

    .line 32
    .line 33
    add-int/2addr p1, p0

    .line 34
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4}, Ljava/nio/Buffer;->position()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    add-int/2addr p0, v6

    .line 42
    invoke-virtual {v4, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public decompress([B)[B
    .locals 1

    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, p1, v0}, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->decompress([BI)[B

    move-result-object p0

    return-object p0
.end method

.method public decompress([BI)[B
    .locals 1

    .line 49
    invoke-static {p1, p2}, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->getDecompressedLength([BI)I

    move-result v0

    .line 50
    iget-object p0, p0, Lnet/jpountz/lz4/LZ4DecompressorWithLength;->decompressor:Lnet/jpountz/lz4/LZ4FastDecompressor;

    add-int/lit8 p2, p2, 0x4

    invoke-virtual {p0, p1, p2, v0}, Lnet/jpountz/lz4/LZ4FastDecompressor;->decompress([BII)[B

    move-result-object p0

    return-object p0
.end method

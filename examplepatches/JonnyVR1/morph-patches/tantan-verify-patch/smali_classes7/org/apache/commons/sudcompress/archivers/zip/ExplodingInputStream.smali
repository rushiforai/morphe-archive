.class Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;
.super Ljava/io/InputStream;
.source "SourceFile"


# instance fields
.field private bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

.field private final buffer:Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;

.field private final dictionarySize:I

.field private distanceTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

.field private final in:Ljava/io/InputStream;

.field private lengthTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

.field private literalTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

.field private final minimumMatchLength:I

.field private final numberOfTrees:I

.field private treeSizes:J

.field private uncompressedCount:J


# direct methods
.method public constructor <init>(IILjava/io/InputStream;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;

    .line 5
    .line 6
    const v1, 0x8000

    .line 7
    .line 8
    .line 9
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->buffer:Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->uncompressedCount:J

    .line 17
    .line 18
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->treeSizes:J

    .line 19
    .line 20
    const/16 v0, 0x1000

    .line 21
    .line 22
    if-eq p1, v0, :cond_1

    .line 23
    .line 24
    const/16 v0, 0x2000

    .line 25
    .line 26
    if-ne p1, v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p0, "The dictionary size must be 4096 or 8192"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    throw p0

    .line 36
    :cond_1
    :goto_0
    const/4 v0, 0x2

    .line 37
    if-eq p2, v0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    if-ne p2, v0, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    const-string p0, "The number of trees must be 2 or 3"

    .line 44
    .line 45
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    throw p0

    .line 50
    :cond_3
    :goto_1
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->dictionarySize:I

    .line 51
    .line 52
    iput p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->numberOfTrees:I

    .line 53
    .line 54
    iput p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->minimumMatchLength:I

    .line 55
    .line 56
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->in:Ljava/io/InputStream;

    .line 57
    .line 58
    return-void
.end method

.method private fillBuffer()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->init()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/BitStream;->nextBit()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, -0x1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    const/4 v2, 0x1

    .line 15
    if-ne v0, v2, :cond_3

    .line 16
    .line 17
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->literalTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 18
    .line 19
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->read(Lorg/apache/commons/sudcompress/archivers/zip/BitStream;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/BitStream;->nextByte()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    :goto_0
    if-ne v0, v1, :cond_2

    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_2
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->buffer:Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;->put(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_3
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->dictionarySize:I

    .line 42
    .line 43
    const/16 v3, 0x1000

    .line 44
    .line 45
    if-ne v0, v3, :cond_4

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    goto :goto_1

    .line 49
    :cond_4
    const/4 v0, 0x7

    .line 50
    :goto_1
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 51
    .line 52
    invoke-virtual {v3, v0}, Lorg/apache/commons/sudcompress/archivers/zip/BitStream;->nextBits(I)J

    .line 53
    .line 54
    .line 55
    move-result-wide v3

    .line 56
    long-to-int v3, v3

    .line 57
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->distanceTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 58
    .line 59
    iget-object v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 60
    .line 61
    invoke-virtual {v4, v5}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->read(Lorg/apache/commons/sudcompress/archivers/zip/BitStream;)I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-ne v4, v1, :cond_5

    .line 66
    .line 67
    if-gtz v3, :cond_5

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_5
    shl-int v0, v4, v0

    .line 71
    .line 72
    or-int/2addr v0, v3

    .line 73
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->lengthTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 74
    .line 75
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 76
    .line 77
    invoke-virtual {v1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->read(Lorg/apache/commons/sudcompress/archivers/zip/BitStream;)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    const/16 v3, 0x3f

    .line 82
    .line 83
    if-ne v1, v3, :cond_7

    .line 84
    .line 85
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 86
    .line 87
    const/16 v4, 0x8

    .line 88
    .line 89
    invoke-virtual {v3, v4}, Lorg/apache/commons/sudcompress/archivers/zip/BitStream;->nextBits(I)J

    .line 90
    .line 91
    .line 92
    move-result-wide v3

    .line 93
    const-wide/16 v5, -0x1

    .line 94
    .line 95
    cmp-long v5, v3, v5

    .line 96
    .line 97
    if-nez v5, :cond_6

    .line 98
    .line 99
    :goto_2
    return-void

    .line 100
    :cond_6
    int-to-long v5, v1

    .line 101
    add-long/2addr v5, v3

    .line 102
    long-to-int v1, v5

    .line 103
    :cond_7
    iget v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->minimumMatchLength:I

    .line 104
    .line 105
    add-int/2addr v1, v3

    .line 106
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->buffer:Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;

    .line 107
    .line 108
    add-int/2addr v0, v2

    .line 109
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;->copy(II)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method private init()V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ll/ezg0;

    .line 6
    .line 7
    new-instance v1, Ll/hwg0;

    .line 8
    .line 9
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->in:Ljava/io/InputStream;

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ll/hwg0;-><init>(Ljava/io/InputStream;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/ezg0;-><init>(Ljava/io/InputStream;)V

    .line 15
    .line 16
    .line 17
    :try_start_0
    iget v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->numberOfTrees:I

    .line 18
    .line 19
    const/4 v2, 0x3

    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    const/16 v1, 0x100

    .line 23
    .line 24
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->decode(Ljava/io/InputStream;I)Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->literalTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    const/16 v1, 0x40

    .line 34
    .line 35
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->decode(Ljava/io/InputStream;I)Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->lengthTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 40
    .line 41
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->decode(Ljava/io/InputStream;I)Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->distanceTree:Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 46
    .line 47
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->treeSizes:J

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/ezg0;->getBytesRead()J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    add-long/2addr v1, v3

    .line 54
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->treeSizes:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 57
    .line 58
    .line 59
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 60
    .line 61
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->in:Ljava/io/InputStream;

    .line 62
    .line 63
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/BitStream;-><init>(Ljava/io/InputStream;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 67
    .line 68
    return-void

    .line 69
    :goto_1
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :catchall_1
    move-exception v0

    .line 74
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    :goto_2
    throw p0

    .line 78
    :cond_1
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->in:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCompressedCount()J
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->bits:Lorg/apache/commons/sudcompress/archivers/zip/BitStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/drg0;->getBytesRead()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->treeSizes:J

    .line 8
    .line 9
    add-long/2addr v0, v2

    .line 10
    return-wide v0
.end method

.method public getUncompressedCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->uncompressedCount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public read()I
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->buffer:Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;->available()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->fillBuffer()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->buffer:Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;

    .line 13
    .line 14
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/CircularBuffer;->get()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, -0x1

    .line 19
    if-le v0, v1, :cond_1

    .line 20
    .line 21
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->uncompressedCount:J

    .line 22
    .line 23
    const-wide/16 v3, 0x1

    .line 24
    .line 25
    add-long/2addr v1, v3

    .line 26
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ExplodingInputStream;->uncompressedCount:J

    .line 27
    .line 28
    :cond_1
    return v0
.end method

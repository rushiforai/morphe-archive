.class Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;
.super Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;
.source "SourceFile"


# static fields
.field private static final MAX_CODE_SIZE:I = 0xd

.field private static final MAX_TABLE_SIZE:I = 0x2000


# instance fields
.field private final isUsed:[Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 1
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;-><init>(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x9

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->setClearCode(I)V

    .line 9
    .line 10
    .line 11
    const/16 p1, 0xd

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->initializeTables(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getPrefixesLength()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    new-array p1, p1, [Z

    .line 21
    .line 22
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    :goto_0
    const/16 v0, 0x100

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    if-ge p1, v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    .line 31
    .line 32
    aput-boolean v1, v0, p1

    .line 33
    .line 34
    add-int/lit8 p1, p1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getClearCode()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    add-int/2addr p1, v1

    .line 42
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->setTableSize(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private partialClear()V
    .locals 8

    .line 1
    const/16 v0, 0x2000

    .line 2
    .line 3
    new-array v1, v0, [Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    .line 8
    .line 9
    array-length v5, v4

    .line 10
    const/4 v6, -0x1

    .line 11
    const/4 v7, 0x1

    .line 12
    if-ge v3, v5, :cond_1

    .line 13
    .line 14
    aget-boolean v4, v4, v3

    .line 15
    .line 16
    if-eqz v4, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v3}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getPrefix(I)I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-eq v4, v6, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v3}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getPrefix(I)I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    aput-boolean v7, v1, v4

    .line 29
    .line 30
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getClearCode()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    add-int/2addr v3, v7

    .line 38
    :goto_1
    if-ge v3, v0, :cond_3

    .line 39
    .line 40
    aget-boolean v4, v1, v3

    .line 41
    .line 42
    if-nez v4, :cond_2

    .line 43
    .line 44
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    .line 45
    .line 46
    aput-boolean v2, v4, v3

    .line 47
    .line 48
    invoke-virtual {p0, v3, v6}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->setPrefix(II)V

    .line 49
    .line 50
    .line 51
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_3
    return-void
.end method


# virtual methods
.method public addEntry(IB)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getTableSize()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :goto_0
    const/16 v1, 0x2000

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    .line 10
    .line 11
    aget-boolean v2, v2, v0

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->setTableSize(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, p2, v1}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->addEntry(IBI)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-ltz p1, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    .line 28
    .line 29
    const/4 p2, 0x1

    .line 30
    aput-boolean p2, p0, p1

    .line 31
    .line 32
    :cond_1
    return p1
.end method

.method public decompressNextSymbol()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->readNextCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getClearCode()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    if-ne v0, v1, :cond_5

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->readNextCode()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ltz v0, :cond_4

    .line 22
    .line 23
    if-ne v0, v3, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getCodeSize()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/16 v1, 0xd

    .line 30
    .line 31
    if-ge v0, v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->incrementCodeSize()V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const-string p0, "Attempt to increase code size beyond maximum"

    .line 38
    .line 39
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_2
    const/4 v1, 0x2

    .line 45
    if-ne v0, v1, :cond_3

    .line 46
    .line 47
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;->partialClear()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->getClearCode()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    add-int/2addr v0, v3

    .line 55
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->setTableSize(I)V

    .line 56
    .line 57
    .line 58
    :goto_1
    return v2

    .line 59
    :cond_3
    const-string p0, "Invalid clear code subcode "

    .line 60
    .line 61
    invoke-static {v0, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    const-string p0, "Unexpected EOF;"

    .line 70
    .line 71
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_5
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnshrinkingInputStream;->isUsed:[Z

    .line 76
    .line 77
    aget-boolean v1, v1, v0

    .line 78
    .line 79
    if-nez v1, :cond_6

    .line 80
    .line 81
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->addRepeatOfPreviousCode()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    move v2, v3

    .line 86
    :cond_6
    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->expandCodeToOutputStack(IZ)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    return p0
.end method

.class public abstract Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;
.super Ll/gjg0;
.source "SourceFile"


# static fields
.field protected static final DEFAULT_CODE_SIZE:I = 0x9

.field protected static final UNUSED_PREFIX:I = -0x1


# instance fields
.field private characters:[B

.field private clearCode:I

.field private codeSize:I

.field protected final in:Ll/drg0;

.field private final oneByte:[B

.field private outputStack:[B

.field private outputStackLocation:I

.field private prefixes:[I

.field private previousCode:I

.field private previousCodeFirstChar:B

.field private tableSize:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 3

    .line 1
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gjg0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    new-array v1, v1, [B

    .line 8
    .line 9
    iput-object v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->oneByte:[B

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->clearCode:I

    .line 13
    .line 14
    const/16 v2, 0x9

    .line 15
    .line 16
    iput v2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->codeSize:I

    .line 17
    .line 18
    iput v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->previousCode:I

    .line 19
    .line 20
    new-instance v1, Ll/drg0;

    .line 21
    .line 22
    invoke-direct {v1, p1, v0}, Ll/drg0;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->in:Ll/drg0;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public abstract addEntry(IB)I
.end method

.method public addEntry(IBI)I
    .locals 1

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->tableSize:I

    .line 2
    .line 3
    if-ge v0, p3, :cond_0

    .line 4
    .line 5
    iget-object p3, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->prefixes:[I

    .line 6
    .line 7
    aput p1, p3, v0

    .line 8
    .line 9
    iget-object p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->characters:[B

    .line 10
    .line 11
    aput-byte p2, p1, v0

    .line 12
    .line 13
    add-int/lit8 p1, v0, 0x1

    .line 14
    .line 15
    iput p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->tableSize:I

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    const/4 p0, -0x1

    .line 19
    return p0
.end method

.method public addRepeatOfPreviousCode()I
    .locals 2

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->previousCode:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-byte v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->previousCodeFirstChar:B

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->addEntry(IB)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const-string p0, "The first code can\'t be a reference to its preceding code"

    .line 14
    .line 15
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->in:Ll/drg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/drg0;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract decompressNextSymbol()I
.end method

.method public expandCodeToOutputStack(IZ)I
    .locals 4

    .line 1
    move v0, p1

    .line 2
    :goto_0
    if-ltz v0, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStack:[B

    .line 5
    .line 6
    iget v2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 7
    .line 8
    add-int/lit8 v2, v2, -0x1

    .line 9
    .line 10
    iput v2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 11
    .line 12
    iget-object v3, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->characters:[B

    .line 13
    .line 14
    aget-byte v3, v3, v0

    .line 15
    .line 16
    aput-byte v3, v1, v2

    .line 17
    .line 18
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->prefixes:[I

    .line 19
    .line 20
    aget v0, v1, v0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->previousCode:I

    .line 24
    .line 25
    const/4 v1, -0x1

    .line 26
    if-eq v0, v1, :cond_1

    .line 27
    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    iget-object p2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStack:[B

    .line 31
    .line 32
    iget v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 33
    .line 34
    aget-byte p2, p2, v1

    .line 35
    .line 36
    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->addEntry(IB)I

    .line 37
    .line 38
    .line 39
    :cond_1
    iput p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->previousCode:I

    .line 40
    .line 41
    iget-object p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStack:[B

    .line 42
    .line 43
    iget p2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 44
    .line 45
    aget-byte p1, p1, p2

    .line 46
    .line 47
    iput-byte p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->previousCodeFirstChar:B

    .line 48
    .line 49
    return p2
.end method

.method public getClearCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->clearCode:I

    .line 2
    .line 3
    return p0
.end method

.method public getCodeSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->codeSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getCompressedCount()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->in:Ll/drg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/drg0;->getBytesRead()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getPrefix(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->prefixes:[I

    .line 2
    .line 3
    aget p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public getPrefixesLength()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->prefixes:[I

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public getTableSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->tableSize:I

    .line 2
    .line 3
    return p0
.end method

.method public incrementCodeSize()V
    .locals 1

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->codeSize:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->codeSize:I

    .line 6
    .line 7
    return-void
.end method

.method public initializeTables(I)V
    .locals 2

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    shl-int p1, v0, p1

    .line 5
    .line 6
    new-array v0, p1, [I

    .line 7
    .line 8
    iput-object v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->prefixes:[I

    .line 9
    .line 10
    new-array v0, p1, [B

    .line 11
    .line 12
    iput-object v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->characters:[B

    .line 13
    .line 14
    new-array v0, p1, [B

    .line 15
    .line 16
    iput-object v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStack:[B

    .line 17
    .line 18
    iput p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    :goto_0
    const/16 v0, 0x100

    .line 22
    .line 23
    if-ge p1, v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->prefixes:[I

    .line 26
    .line 27
    const/4 v1, -0x1

    .line 28
    aput v1, v0, p1

    .line 29
    .line 30
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->characters:[B

    .line 31
    .line 32
    int-to-byte v1, p1

    .line 33
    aput-byte v1, v0, p1

    .line 34
    .line 35
    add-int/lit8 p1, p1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    const-string p0, "maxCodeSize is "

    .line 40
    .line 41
    const-string v0, ", must be bigger than 0"

    .line 42
    .line 43
    invoke-static {p0, p1, v0}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public initializeTables(II)V
    .locals 4

    if-lez p1, :cond_2

    const/4 v0, -0x1

    if-le p2, v0, :cond_1

    const/4 v0, 0x1

    shl-int/2addr v0, p1

    int-to-long v0, v0

    const-wide/16 v2, 0x6

    mul-long/2addr v0, v2

    const/16 v2, 0xa

    shr-long/2addr v0, v2

    int-to-long v2, p2

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    goto :goto_0

    .line 47
    :cond_0
    new-instance p0, LSudbreak/Suddo;

    invoke-direct {p0, p2, v0, v1}, LSudbreak/Suddo;-><init>(IJ)V

    throw p0

    .line 48
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->initializeTables(I)V

    return-void

    .line 49
    :cond_2
    const-string p0, "maxCodeSize is "

    const-string p2, ", must be bigger than 0"

    invoke-static {p0, p1, p2}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    return-void
.end method

.method public read()I
    .locals 1

    .line 82
    iget-object v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->oneByte:[B

    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v0

    if-gez v0, :cond_0

    return v0

    .line 83
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->oneByte:[B

    const/4 v0, 0x0

    aget-byte p0, p0, v0

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public read([BII)I
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStack:[B

    .line 6
    .line 7
    array-length v1, v1

    .line 8
    iget v2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 9
    .line 10
    sub-int/2addr v1, v2

    .line 11
    if-lez v1, :cond_1

    .line 12
    .line 13
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStack:[B

    .line 18
    .line 19
    iget v3, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 20
    .line 21
    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    iget v2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 25
    .line 26
    add-int/2addr v2, v1

    .line 27
    iput v2, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move v1, v0

    .line 31
    :goto_0
    sub-int v2, p3, v1

    .line 32
    .line 33
    if-lez v2, :cond_5

    .line 34
    .line 35
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->decompressNextSymbol()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-gez v3, :cond_3

    .line 40
    .line 41
    if-lez v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ll/gjg0;->count(I)V

    .line 44
    .line 45
    .line 46
    return v1

    .line 47
    :cond_2
    return v3

    .line 48
    :cond_3
    add-int v3, p2, v1

    .line 49
    .line 50
    iget-object v4, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStack:[B

    .line 51
    .line 52
    array-length v4, v4

    .line 53
    iget v5, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 54
    .line 55
    sub-int/2addr v4, v5

    .line 56
    if-lez v4, :cond_4

    .line 57
    .line 58
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iget-object v4, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStack:[B

    .line 63
    .line 64
    iget v5, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 65
    .line 66
    invoke-static {v4, v5, p1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    iget v3, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 70
    .line 71
    add-int/2addr v3, v2

    .line 72
    iput v3, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->outputStackLocation:I

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_4
    move v2, v0

    .line 76
    :goto_1
    add-int/2addr v1, v2

    .line 77
    goto :goto_0

    .line 78
    :cond_5
    invoke-virtual {p0, v1}, Ll/gjg0;->count(I)V

    .line 79
    .line 80
    .line 81
    return v1
.end method

.method public readNextCode()I
    .locals 2

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->codeSize:I

    .line 2
    .line 3
    const/16 v1, 0x1f

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->in:Ll/drg0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/drg0;->readBits(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    long-to-int p0, v0

    .line 14
    return p0

    .line 15
    :cond_0
    const-string p0, "Code size must not be bigger than 31"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public resetCodeSize()V
    .locals 1

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->setCodeSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public resetPreviousCode()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->previousCode:I

    .line 3
    .line 4
    return-void
.end method

.method public setClearCode(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    sub-int/2addr p1, v0

    .line 3
    shl-int p1, v0, p1

    .line 4
    .line 5
    iput p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->clearCode:I

    .line 6
    .line 7
    return-void
.end method

.method public setCodeSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->codeSize:I

    .line 2
    .line 3
    return-void
.end method

.method public setPrefix(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->prefixes:[I

    .line 2
    .line 3
    aput p2, p0, p1

    .line 4
    .line 5
    return-void
.end method

.method public setTableSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/sudcompress/compressors/lzw/Suddo;->tableSize:I

    .line 2
    .line 3
    return-void
.end method

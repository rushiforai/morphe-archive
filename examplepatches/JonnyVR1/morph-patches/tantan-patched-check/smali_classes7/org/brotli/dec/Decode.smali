.class final Lorg/brotli/dec/Decode;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final CODE_LENGTH_CODES:I = 0x12

.field private static final CODE_LENGTH_CODE_ORDER:[I

.field private static final CODE_LENGTH_REPEAT_CODE:I = 0x10

.field private static final DEFAULT_CODE_LENGTH:I = 0x8

.field private static final DISTANCE_CONTEXT_BITS:I = 0x2

.field private static final DISTANCE_SHORT_CODE_INDEX_OFFSET:[I

.field private static final DISTANCE_SHORT_CODE_VALUE_OFFSET:[I

.field private static final FIXED_TABLE:[I

.field private static final HUFFMAN_TABLE_BITS:I = 0x8

.field private static final HUFFMAN_TABLE_MASK:I = 0xff

.field private static final LITERAL_CONTEXT_BITS:I = 0x6

.field private static final NUM_BLOCK_LENGTH_CODES:I = 0x1a

.field private static final NUM_DISTANCE_SHORT_CODES:I = 0x10

.field private static final NUM_INSERT_AND_COPY_CODES:I = 0x2c0

.field private static final NUM_LITERAL_CODES:I = 0x100


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x12

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/brotli/dec/Decode;->CODE_LENGTH_CODE_ORDER:[I

    .line 9
    .line 10
    const/16 v0, 0x10

    .line 11
    .line 12
    new-array v1, v0, [I

    .line 13
    .line 14
    fill-array-data v1, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v1, Lorg/brotli/dec/Decode;->DISTANCE_SHORT_CODE_INDEX_OFFSET:[I

    .line 18
    .line 19
    new-array v1, v0, [I

    .line 20
    .line 21
    fill-array-data v1, :array_2

    .line 22
    .line 23
    .line 24
    sput-object v1, Lorg/brotli/dec/Decode;->DISTANCE_SHORT_CODE_VALUE_OFFSET:[I

    .line 25
    .line 26
    new-array v0, v0, [I

    .line 27
    .line 28
    fill-array-data v0, :array_3

    .line 29
    .line 30
    .line 31
    sput-object v0, Lorg/brotli/dec/Decode;->FIXED_TABLE:[I

    .line 32
    .line 33
    return-void

    .line 34
    nop

    .line 35
    :array_0
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0x0
        0x5
        0x11
        0x6
        0x10
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
    .end array-data

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_1
    .array-data 4
        0x3
        0x2
        0x1
        0x0
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        -0x1
        0x1
        -0x2
        0x2
        -0x3
        0x3
        -0x1
        0x1
        -0x2
        0x2
        -0x3
        0x3
    .end array-data

    :array_3
    .array-data 4
        0x20000
        0x20004
        0x20003
        0x30002
        0x20000
        0x20004
        0x20003
        0x40001
        0x20000
        0x20004
        0x20003
        0x30002
        0x20000
        0x20004
        0x20003
        0x40005
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static copyUncompressedData(Lorg/brotli/dec/State;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/brotli/dec/State;->ringBuffer:[B

    .line 4
    .line 5
    iget v2, p0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-gtz v2, :cond_0

    .line 9
    .line 10
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->reload(Lorg/brotli/dec/BitReader;)V

    .line 11
    .line 12
    .line 13
    iput v3, p0, Lorg/brotli/dec/State;->runningState:I

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget v4, p0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 17
    .line 18
    iget v5, p0, Lorg/brotli/dec/State;->pos:I

    .line 19
    .line 20
    sub-int/2addr v4, v5

    .line 21
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget v4, p0, Lorg/brotli/dec/State;->pos:I

    .line 26
    .line 27
    invoke-static {v0, v1, v4, v2}, Lorg/brotli/dec/BitReader;->copyBytes(Lorg/brotli/dec/BitReader;[BII)V

    .line 28
    .line 29
    .line 30
    iget v1, p0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 31
    .line 32
    sub-int/2addr v1, v2

    .line 33
    iput v1, p0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 34
    .line 35
    iget v1, p0, Lorg/brotli/dec/State;->pos:I

    .line 36
    .line 37
    add-int/2addr v1, v2

    .line 38
    iput v1, p0, Lorg/brotli/dec/State;->pos:I

    .line 39
    .line 40
    iget v2, p0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 41
    .line 42
    if-ne v1, v2, :cond_1

    .line 43
    .line 44
    const/4 v0, 0x5

    .line 45
    iput v0, p0, Lorg/brotli/dec/State;->nextRunningState:I

    .line 46
    .line 47
    iput v2, p0, Lorg/brotli/dec/State;->bytesToWrite:I

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput v0, p0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 51
    .line 52
    const/16 v0, 0xc

    .line 53
    .line 54
    iput v0, p0, Lorg/brotli/dec/State;->runningState:I

    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->reload(Lorg/brotli/dec/BitReader;)V

    .line 58
    .line 59
    .line 60
    iput v3, p0, Lorg/brotli/dec/State;->runningState:I

    .line 61
    .line 62
    return-void
.end method

.method private static decodeBlockTypeAndLength(Lorg/brotli/dec/State;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/brotli/dec/State;->blockTypeRb:[I

    .line 4
    .line 5
    mul-int/lit8 v2, p1, 0x2

    .line 6
    .line 7
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 8
    .line 9
    .line 10
    iget-object v3, p0, Lorg/brotli/dec/State;->blockTypeTrees:[I

    .line 11
    .line 12
    mul-int/lit16 v4, p1, 0x438

    .line 13
    .line 14
    invoke-static {v3, v4, v0}, Lorg/brotli/dec/Decode;->readSymbol([IILorg/brotli/dec/BitReader;)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    iget-object v5, p0, Lorg/brotli/dec/State;->blockLength:[I

    .line 19
    .line 20
    iget-object v6, p0, Lorg/brotli/dec/State;->blockLenTrees:[I

    .line 21
    .line 22
    invoke-static {v6, v4, v0}, Lorg/brotli/dec/Decode;->readBlockLength([IILorg/brotli/dec/BitReader;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    aput v0, v5, p1

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    if-ne v3, v0, :cond_0

    .line 30
    .line 31
    add-int/lit8 v3, v2, 0x1

    .line 32
    .line 33
    aget v3, v1, v3

    .line 34
    .line 35
    add-int/2addr v3, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    if-nez v3, :cond_1

    .line 38
    .line 39
    aget v3, v1, v2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    add-int/lit8 v3, v3, -0x2

    .line 43
    .line 44
    :goto_0
    iget-object p0, p0, Lorg/brotli/dec/State;->numBlockTypes:[I

    .line 45
    .line 46
    aget p0, p0, p1

    .line 47
    .line 48
    if-lt v3, p0, :cond_2

    .line 49
    .line 50
    sub-int/2addr v3, p0

    .line 51
    :cond_2
    add-int/lit8 p0, v2, 0x1

    .line 52
    .line 53
    aget p1, v1, p0

    .line 54
    .line 55
    aput p1, v1, v2

    .line 56
    .line 57
    aput v3, v1, p0

    .line 58
    .line 59
    return-void
.end method

.method private static decodeCommandBlockSwitch(Lorg/brotli/dec/State;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lorg/brotli/dec/Decode;->decodeBlockTypeAndLength(Lorg/brotli/dec/State;I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lorg/brotli/dec/State;->hGroup1:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 6
    .line 7
    iget-object v0, v0, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 8
    .line 9
    iget-object v1, p0, Lorg/brotli/dec/State;->blockTypeRb:[I

    .line 10
    .line 11
    const/4 v2, 0x3

    .line 12
    aget v1, v1, v2

    .line 13
    .line 14
    aget v0, v0, v1

    .line 15
    .line 16
    iput v0, p0, Lorg/brotli/dec/State;->treeCommandOffset:I

    .line 17
    .line 18
    return-void
.end method

.method private static decodeContextMap(I[BLorg/brotli/dec/BitReader;)I
    .locals 8

    .line 1
    invoke-static {p2}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lorg/brotli/dec/Decode;->decodeVarLenUnsignedByte(Lorg/brotli/dec/BitReader;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    add-int/2addr v0, v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-static {p1, v2, p0}, Lorg/brotli/dec/Utils;->fillWithZeroes([BII)V

    .line 14
    .line 15
    .line 16
    return v0

    .line 17
    :cond_0
    invoke-static {p2, v1}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-ne v3, v1, :cond_1

    .line 22
    .line 23
    move v3, v1

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move v3, v2

    .line 26
    :goto_0
    if-eqz v3, :cond_2

    .line 27
    .line 28
    const/4 v3, 0x4

    .line 29
    invoke-static {p2, v3}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    add-int/2addr v3, v1

    .line 34
    goto :goto_1

    .line 35
    :cond_2
    move v3, v2

    .line 36
    :goto_1
    const/16 v4, 0x438

    .line 37
    .line 38
    new-array v4, v4, [I

    .line 39
    .line 40
    add-int v5, v0, v3

    .line 41
    .line 42
    invoke-static {v5, v4, v2, p2}, Lorg/brotli/dec/Decode;->readHuffmanCode(I[IILorg/brotli/dec/BitReader;)V

    .line 43
    .line 44
    .line 45
    move v5, v2

    .line 46
    :cond_3
    :goto_2
    if-ge v5, p0, :cond_7

    .line 47
    .line 48
    invoke-static {p2}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p2}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v4, v2, p2}, Lorg/brotli/dec/Decode;->readSymbol([IILorg/brotli/dec/BitReader;)I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-nez v6, :cond_4

    .line 59
    .line 60
    aput-byte v2, p1, v5

    .line 61
    .line 62
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_4
    if-gt v6, v3, :cond_6

    .line 66
    .line 67
    shl-int v7, v1, v6

    .line 68
    .line 69
    invoke-static {p2, v6}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    add-int/2addr v7, v6

    .line 74
    :goto_4
    if-eqz v7, :cond_3

    .line 75
    .line 76
    if-ge v5, p0, :cond_5

    .line 77
    .line 78
    aput-byte v2, p1, v5

    .line 79
    .line 80
    add-int/lit8 v5, v5, 0x1

    .line 81
    .line 82
    add-int/lit8 v7, v7, -0x1

    .line 83
    .line 84
    goto :goto_4

    .line 85
    :cond_5
    const-string p0, "Corrupted context map"

    .line 86
    .line 87
    invoke-static {p0}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const/4 p0, 0x0

    .line 91
    return p0

    .line 92
    :cond_6
    sub-int/2addr v6, v3

    .line 93
    int-to-byte v6, v6

    .line 94
    aput-byte v6, p1, v5

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_7
    invoke-static {p2, v1}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-ne p2, v1, :cond_8

    .line 102
    .line 103
    invoke-static {p1, p0}, Lorg/brotli/dec/Decode;->inverseMoveToFrontTransform([BI)V

    .line 104
    .line 105
    .line 106
    :cond_8
    return v0
.end method

.method private static decodeDistanceBlockSwitch(Lorg/brotli/dec/State;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {p0, v0}, Lorg/brotli/dec/Decode;->decodeBlockTypeAndLength(Lorg/brotli/dec/State;I)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lorg/brotli/dec/State;->blockTypeRb:[I

    .line 6
    .line 7
    const/4 v2, 0x5

    .line 8
    aget v1, v1, v2

    .line 9
    .line 10
    shl-int/lit8 v0, v1, 0x2

    .line 11
    .line 12
    iput v0, p0, Lorg/brotli/dec/State;->distContextMapSlice:I

    .line 13
    .line 14
    return-void
.end method

.method private static decodeLiteralBlockSwitch(Lorg/brotli/dec/State;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lorg/brotli/dec/Decode;->decodeBlockTypeAndLength(Lorg/brotli/dec/State;I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lorg/brotli/dec/State;->blockTypeRb:[I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    aget v0, v0, v1

    .line 9
    .line 10
    shl-int/lit8 v2, v0, 0x6

    .line 11
    .line 12
    iput v2, p0, Lorg/brotli/dec/State;->contextMapSlice:I

    .line 13
    .line 14
    iget-object v3, p0, Lorg/brotli/dec/State;->contextMap:[B

    .line 15
    .line 16
    aget-byte v2, v3, v2

    .line 17
    .line 18
    and-int/lit16 v2, v2, 0xff

    .line 19
    .line 20
    iput v2, p0, Lorg/brotli/dec/State;->literalTreeIndex:I

    .line 21
    .line 22
    iget-object v3, p0, Lorg/brotli/dec/State;->hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 23
    .line 24
    iget-object v3, v3, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 25
    .line 26
    aget v2, v3, v2

    .line 27
    .line 28
    iput v2, p0, Lorg/brotli/dec/State;->literalTree:I

    .line 29
    .line 30
    iget-object v2, p0, Lorg/brotli/dec/State;->contextModes:[B

    .line 31
    .line 32
    aget-byte v0, v2, v0

    .line 33
    .line 34
    sget-object v2, Lorg/brotli/dec/Context;->LOOKUP_OFFSETS:[I

    .line 35
    .line 36
    aget v3, v2, v0

    .line 37
    .line 38
    iput v3, p0, Lorg/brotli/dec/State;->contextLookupOffset1:I

    .line 39
    .line 40
    add-int/2addr v0, v1

    .line 41
    aget v0, v2, v0

    .line 42
    .line 43
    iput v0, p0, Lorg/brotli/dec/State;->contextLookupOffset2:I

    .line 44
    .line 45
    return-void
.end method

.method private static decodeMetaBlockLength(Lorg/brotli/dec/BitReader;Lorg/brotli/dec/State;)V
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-ne v1, v0, :cond_0

    .line 8
    .line 9
    move v1, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v1, v2

    .line 12
    :goto_0
    iput-boolean v1, p1, Lorg/brotli/dec/State;->inputEnd:Z

    .line 13
    .line 14
    iput v2, p1, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 15
    .line 16
    iput-boolean v2, p1, Lorg/brotli/dec/State;->isUncompressed:Z

    .line 17
    .line 18
    iput-boolean v2, p1, Lorg/brotli/dec/State;->isMetadata:Z

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-static {p0, v0}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    goto/16 :goto_6

    .line 29
    .line 30
    :cond_1
    const/4 v1, 0x2

    .line 31
    invoke-static {p0, v1}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    const/4 v4, 0x4

    .line 36
    add-int/2addr v3, v4

    .line 37
    const/4 v5, 0x7

    .line 38
    const-string v6, "Exuberant nibble"

    .line 39
    .line 40
    if-ne v3, v5, :cond_6

    .line 41
    .line 42
    iput-boolean v0, p1, Lorg/brotli/dec/State;->isMetadata:Z

    .line 43
    .line 44
    invoke-static {p0, v0}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-nez v3, :cond_5

    .line 49
    .line 50
    invoke-static {p0, v1}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_2

    .line 55
    .line 56
    goto :goto_6

    .line 57
    :cond_2
    move v3, v2

    .line 58
    :goto_1
    if-ge v3, v1, :cond_9

    .line 59
    .line 60
    const/16 v4, 0x8

    .line 61
    .line 62
    invoke-static {p0, v4}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-nez v4, :cond_4

    .line 67
    .line 68
    add-int/lit8 v5, v3, 0x1

    .line 69
    .line 70
    if-ne v5, v1, :cond_4

    .line 71
    .line 72
    if-gt v1, v0, :cond_3

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_3
    invoke-static {v6}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    :goto_2
    iget v5, p1, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 80
    .line 81
    mul-int/lit8 v7, v3, 0x8

    .line 82
    .line 83
    shl-int/2addr v4, v7

    .line 84
    or-int/2addr v4, v5

    .line 85
    iput v4, p1, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 86
    .line 87
    add-int/lit8 v3, v3, 0x1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_5
    const-string p0, "Corrupted reserved bit"

    .line 91
    .line 92
    invoke-static {p0}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_6
    move v1, v2

    .line 97
    :goto_3
    if-ge v1, v3, :cond_9

    .line 98
    .line 99
    invoke-static {p0, v4}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    if-nez v5, :cond_8

    .line 104
    .line 105
    add-int/lit8 v7, v1, 0x1

    .line 106
    .line 107
    if-ne v7, v3, :cond_8

    .line 108
    .line 109
    if-gt v3, v4, :cond_7

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_7
    invoke-static {v6}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_8
    :goto_4
    iget v7, p1, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 117
    .line 118
    mul-int/lit8 v8, v1, 0x4

    .line 119
    .line 120
    shl-int/2addr v5, v8

    .line 121
    or-int/2addr v5, v7

    .line 122
    iput v5, p1, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 123
    .line 124
    add-int/lit8 v1, v1, 0x1

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_9
    iget v1, p1, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 128
    .line 129
    add-int/2addr v1, v0

    .line 130
    iput v1, p1, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 131
    .line 132
    iget-boolean v1, p1, Lorg/brotli/dec/State;->inputEnd:Z

    .line 133
    .line 134
    if-nez v1, :cond_b

    .line 135
    .line 136
    invoke-static {p0, v0}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-ne p0, v0, :cond_a

    .line 141
    .line 142
    goto :goto_5

    .line 143
    :cond_a
    move v0, v2

    .line 144
    :goto_5
    iput-boolean v0, p1, Lorg/brotli/dec/State;->isUncompressed:Z

    .line 145
    .line 146
    :cond_b
    :goto_6
    return-void
.end method

.method private static decodeVarLenUnsignedByte(Lorg/brotli/dec/BitReader;)I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-static {p0, v1}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    invoke-static {p0, v1}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    shl-int/2addr v0, v1

    .line 21
    add-int/2addr p0, v0

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static decompress(Lorg/brotli/dec/State;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lorg/brotli/dec/State;->runningState:I

    .line 4
    .line 5
    if-eqz v1, :cond_24

    .line 6
    .line 7
    const/16 v2, 0xb

    .line 8
    .line 9
    if-eq v1, v2, :cond_23

    .line 10
    .line 11
    iget-object v1, v0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 12
    .line 13
    iget v2, v0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    sub-int/2addr v2, v3

    .line 17
    iget-object v4, v0, Lorg/brotli/dec/State;->ringBuffer:[B

    .line 18
    .line 19
    :goto_0
    iget v5, v0, Lorg/brotli/dec/State;->runningState:I

    .line 20
    .line 21
    const-string v6, "Invalid metablock length"

    .line 22
    .line 23
    const/16 v7, 0xa

    .line 24
    .line 25
    if-eq v5, v7, :cond_20

    .line 26
    .line 27
    const/16 v10, 0xc

    .line 28
    .line 29
    if-eq v5, v10, :cond_1d

    .line 30
    .line 31
    const/16 v11, 0x8

    .line 32
    .line 33
    const-string v7, "Invalid backward reference"

    .line 34
    .line 35
    const/4 v8, 0x4

    .line 36
    const/4 v9, 0x7

    .line 37
    const/4 v12, 0x6

    .line 38
    const/4 v13, 0x2

    .line 39
    const/4 v14, 0x3

    .line 40
    const/4 v15, 0x0

    .line 41
    packed-switch v5, :pswitch_data_0

    .line 42
    .line 43
    .line 44
    new-instance v1, Lorg/brotli/dec/BrotliRuntimeException;

    .line 45
    .line 46
    iget v0, v0, Lorg/brotli/dec/State;->runningState:I

    .line 47
    .line 48
    new-instance v2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v3, "Unexpected state "

    .line 51
    .line 52
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-direct {v1, v0}, Lorg/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw v1

    .line 66
    :pswitch_0
    iget v5, v0, Lorg/brotli/dec/State;->copyLength:I

    .line 67
    .line 68
    if-lt v5, v8, :cond_2

    .line 69
    .line 70
    const/16 v6, 0x18

    .line 71
    .line 72
    if-gt v5, v6, :cond_2

    .line 73
    .line 74
    sget-object v6, Lorg/brotli/dec/Dictionary;->OFFSETS_BY_LENGTH:[I

    .line 75
    .line 76
    aget v6, v6, v5

    .line 77
    .line 78
    iget v8, v0, Lorg/brotli/dec/State;->distance:I

    .line 79
    .line 80
    iget v9, v0, Lorg/brotli/dec/State;->maxDistance:I

    .line 81
    .line 82
    sub-int/2addr v8, v9

    .line 83
    sub-int/2addr v8, v3

    .line 84
    sget-object v9, Lorg/brotli/dec/Dictionary;->SIZE_BITS_BY_LENGTH:[I

    .line 85
    .line 86
    aget v9, v9, v5

    .line 87
    .line 88
    shl-int v12, v3, v9

    .line 89
    .line 90
    sub-int/2addr v12, v3

    .line 91
    and-int/2addr v12, v8

    .line 92
    ushr-int/2addr v8, v9

    .line 93
    mul-int/2addr v12, v5

    .line 94
    add-int/2addr v6, v12

    .line 95
    sget-object v5, Lorg/brotli/dec/Transform;->TRANSFORMS:[Lorg/brotli/dec/Transform;

    .line 96
    .line 97
    array-length v9, v5

    .line 98
    if-ge v8, v9, :cond_1

    .line 99
    .line 100
    move-object v9, v5

    .line 101
    iget v5, v0, Lorg/brotli/dec/State;->copyDst:I

    .line 102
    .line 103
    move v7, v6

    .line 104
    invoke-static {}, Lorg/brotli/dec/Dictionary;->getData()[B

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    move v12, v8

    .line 109
    iget v8, v0, Lorg/brotli/dec/State;->copyLength:I

    .line 110
    .line 111
    aget-object v9, v9, v12

    .line 112
    .line 113
    invoke-static/range {v4 .. v9}, Lorg/brotli/dec/Transform;->transformDictionaryWord([BI[BIILorg/brotli/dec/Transform;)I

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    iget v6, v0, Lorg/brotli/dec/State;->copyDst:I

    .line 118
    .line 119
    add-int/2addr v6, v5

    .line 120
    iput v6, v0, Lorg/brotli/dec/State;->copyDst:I

    .line 121
    .line 122
    iget v7, v0, Lorg/brotli/dec/State;->pos:I

    .line 123
    .line 124
    add-int/2addr v7, v5

    .line 125
    iput v7, v0, Lorg/brotli/dec/State;->pos:I

    .line 126
    .line 127
    iget v7, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 128
    .line 129
    sub-int/2addr v7, v5

    .line 130
    iput v7, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 131
    .line 132
    iget v5, v0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 133
    .line 134
    if-lt v6, v5, :cond_0

    .line 135
    .line 136
    iput v11, v0, Lorg/brotli/dec/State;->nextRunningState:I

    .line 137
    .line 138
    iput v5, v0, Lorg/brotli/dec/State;->bytesToWrite:I

    .line 139
    .line 140
    iput v15, v0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 141
    .line 142
    iput v10, v0, Lorg/brotli/dec/State;->runningState:I

    .line 143
    .line 144
    :goto_1
    move/from16 v18, v3

    .line 145
    .line 146
    goto/16 :goto_a

    .line 147
    .line 148
    :cond_0
    iput v14, v0, Lorg/brotli/dec/State;->runningState:I

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_1
    invoke-static {v7}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_2
    invoke-static {v7}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :pswitch_1
    iget v5, v0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 160
    .line 161
    iget v6, v0, Lorg/brotli/dec/State;->copyDst:I

    .line 162
    .line 163
    sub-int/2addr v6, v5

    .line 164
    invoke-static {v4, v5, v4, v15, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    .line 166
    .line 167
    iput v14, v0, Lorg/brotli/dec/State;->runningState:I

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :pswitch_2
    move/from16 v18, v3

    .line 171
    .line 172
    goto/16 :goto_7

    .line 173
    .line 174
    :pswitch_3
    invoke-static {v0}, Lorg/brotli/dec/Decode;->copyUncompressedData(Lorg/brotli/dec/State;)V

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :goto_2
    :pswitch_4
    iget v5, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 179
    .line 180
    if-lez v5, :cond_3

    .line 181
    .line 182
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 183
    .line 184
    .line 185
    invoke-static {v1, v11}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 186
    .line 187
    .line 188
    iget v5, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 189
    .line 190
    sub-int/2addr v5, v3

    .line 191
    iput v5, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_3
    iput v3, v0, Lorg/brotli/dec/State;->runningState:I

    .line 195
    .line 196
    goto :goto_1

    .line 197
    :pswitch_5
    invoke-static {v0}, Lorg/brotli/dec/Decode;->readMetablockHuffmanCodesAndContextMaps(Lorg/brotli/dec/State;)V

    .line 198
    .line 199
    .line 200
    iput v14, v0, Lorg/brotli/dec/State;->runningState:I

    .line 201
    .line 202
    :pswitch_6
    iget v5, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 203
    .line 204
    if-gtz v5, :cond_4

    .line 205
    .line 206
    iput v3, v0, Lorg/brotli/dec/State;->runningState:I

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_4
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 210
    .line 211
    .line 212
    iget-object v5, v0, Lorg/brotli/dec/State;->blockLength:[I

    .line 213
    .line 214
    aget v5, v5, v3

    .line 215
    .line 216
    if-nez v5, :cond_5

    .line 217
    .line 218
    invoke-static {v0}, Lorg/brotli/dec/Decode;->decodeCommandBlockSwitch(Lorg/brotli/dec/State;)V

    .line 219
    .line 220
    .line 221
    :cond_5
    iget-object v5, v0, Lorg/brotli/dec/State;->blockLength:[I

    .line 222
    .line 223
    aget v6, v5, v3

    .line 224
    .line 225
    sub-int/2addr v6, v3

    .line 226
    aput v6, v5, v3

    .line 227
    .line 228
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 229
    .line 230
    .line 231
    iget-object v5, v0, Lorg/brotli/dec/State;->hGroup1:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 232
    .line 233
    iget-object v5, v5, Lorg/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 234
    .line 235
    iget v6, v0, Lorg/brotli/dec/State;->treeCommandOffset:I

    .line 236
    .line 237
    invoke-static {v5, v6, v1}, Lorg/brotli/dec/Decode;->readSymbol([IILorg/brotli/dec/BitReader;)I

    .line 238
    .line 239
    .line 240
    move-result v5

    .line 241
    ushr-int/lit8 v6, v5, 0x6

    .line 242
    .line 243
    iput v15, v0, Lorg/brotli/dec/State;->distanceCode:I

    .line 244
    .line 245
    if-lt v6, v13, :cond_6

    .line 246
    .line 247
    add-int/lit8 v6, v6, -0x2

    .line 248
    .line 249
    const/4 v11, -0x1

    .line 250
    iput v11, v0, Lorg/brotli/dec/State;->distanceCode:I

    .line 251
    .line 252
    :cond_6
    sget-object v11, Lorg/brotli/dec/Prefix;->INSERT_RANGE_LUT:[I

    .line 253
    .line 254
    aget v11, v11, v6

    .line 255
    .line 256
    ushr-int/lit8 v16, v5, 0x3

    .line 257
    .line 258
    and-int/lit8 v16, v16, 0x7

    .line 259
    .line 260
    add-int v11, v11, v16

    .line 261
    .line 262
    sget-object v16, Lorg/brotli/dec/Prefix;->COPY_RANGE_LUT:[I

    .line 263
    .line 264
    aget v6, v16, v6

    .line 265
    .line 266
    and-int/lit8 v5, v5, 0x7

    .line 267
    .line 268
    add-int/2addr v6, v5

    .line 269
    sget-object v5, Lorg/brotli/dec/Prefix;->INSERT_LENGTH_OFFSET:[I

    .line 270
    .line 271
    aget v5, v5, v11

    .line 272
    .line 273
    sget-object v16, Lorg/brotli/dec/Prefix;->INSERT_LENGTH_N_BITS:[I

    .line 274
    .line 275
    aget v11, v16, v11

    .line 276
    .line 277
    invoke-static {v1, v11}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 278
    .line 279
    .line 280
    move-result v11

    .line 281
    add-int/2addr v5, v11

    .line 282
    iput v5, v0, Lorg/brotli/dec/State;->insertLength:I

    .line 283
    .line 284
    sget-object v5, Lorg/brotli/dec/Prefix;->COPY_LENGTH_OFFSET:[I

    .line 285
    .line 286
    aget v5, v5, v6

    .line 287
    .line 288
    sget-object v11, Lorg/brotli/dec/Prefix;->COPY_LENGTH_N_BITS:[I

    .line 289
    .line 290
    aget v6, v11, v6

    .line 291
    .line 292
    invoke-static {v1, v6}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 293
    .line 294
    .line 295
    move-result v6

    .line 296
    add-int/2addr v5, v6

    .line 297
    iput v5, v0, Lorg/brotli/dec/State;->copyLength:I

    .line 298
    .line 299
    iput v15, v0, Lorg/brotli/dec/State;->j:I

    .line 300
    .line 301
    iput v12, v0, Lorg/brotli/dec/State;->runningState:I

    .line 302
    .line 303
    :pswitch_7
    iget-boolean v5, v0, Lorg/brotli/dec/State;->trivialLiteralContext:Z

    .line 304
    .line 305
    if-eqz v5, :cond_a

    .line 306
    .line 307
    :cond_7
    iget v5, v0, Lorg/brotli/dec/State;->j:I

    .line 308
    .line 309
    iget v6, v0, Lorg/brotli/dec/State;->insertLength:I

    .line 310
    .line 311
    if-ge v5, v6, :cond_9

    .line 312
    .line 313
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 314
    .line 315
    .line 316
    iget-object v5, v0, Lorg/brotli/dec/State;->blockLength:[I

    .line 317
    .line 318
    aget v5, v5, v15

    .line 319
    .line 320
    if-nez v5, :cond_8

    .line 321
    .line 322
    invoke-static {v0}, Lorg/brotli/dec/Decode;->decodeLiteralBlockSwitch(Lorg/brotli/dec/State;)V

    .line 323
    .line 324
    .line 325
    :cond_8
    iget-object v5, v0, Lorg/brotli/dec/State;->blockLength:[I

    .line 326
    .line 327
    aget v6, v5, v15

    .line 328
    .line 329
    sub-int/2addr v6, v3

    .line 330
    aput v6, v5, v15

    .line 331
    .line 332
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 333
    .line 334
    .line 335
    iget v5, v0, Lorg/brotli/dec/State;->pos:I

    .line 336
    .line 337
    iget-object v6, v0, Lorg/brotli/dec/State;->hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 338
    .line 339
    iget-object v6, v6, Lorg/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 340
    .line 341
    iget v11, v0, Lorg/brotli/dec/State;->literalTree:I

    .line 342
    .line 343
    invoke-static {v6, v11, v1}, Lorg/brotli/dec/Decode;->readSymbol([IILorg/brotli/dec/BitReader;)I

    .line 344
    .line 345
    .line 346
    move-result v6

    .line 347
    int-to-byte v6, v6

    .line 348
    aput-byte v6, v4, v5

    .line 349
    .line 350
    iget v5, v0, Lorg/brotli/dec/State;->j:I

    .line 351
    .line 352
    add-int/2addr v5, v3

    .line 353
    iput v5, v0, Lorg/brotli/dec/State;->j:I

    .line 354
    .line 355
    iget v5, v0, Lorg/brotli/dec/State;->pos:I

    .line 356
    .line 357
    add-int/lit8 v6, v5, 0x1

    .line 358
    .line 359
    iput v6, v0, Lorg/brotli/dec/State;->pos:I

    .line 360
    .line 361
    if-ne v5, v2, :cond_7

    .line 362
    .line 363
    iput v12, v0, Lorg/brotli/dec/State;->nextRunningState:I

    .line 364
    .line 365
    iget v5, v0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 366
    .line 367
    iput v5, v0, Lorg/brotli/dec/State;->bytesToWrite:I

    .line 368
    .line 369
    iput v15, v0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 370
    .line 371
    iput v10, v0, Lorg/brotli/dec/State;->runningState:I

    .line 372
    .line 373
    :cond_9
    move/from16 v18, v3

    .line 374
    .line 375
    move/from16 v16, v13

    .line 376
    .line 377
    goto/16 :goto_4

    .line 378
    .line 379
    :cond_a
    iget v5, v0, Lorg/brotli/dec/State;->pos:I

    .line 380
    .line 381
    add-int/lit8 v6, v5, -0x1

    .line 382
    .line 383
    and-int/2addr v6, v2

    .line 384
    aget-byte v6, v4, v6

    .line 385
    .line 386
    and-int/lit16 v6, v6, 0xff

    .line 387
    .line 388
    sub-int/2addr v5, v13

    .line 389
    and-int/2addr v5, v2

    .line 390
    aget-byte v5, v4, v5

    .line 391
    .line 392
    and-int/lit16 v5, v5, 0xff

    .line 393
    .line 394
    :goto_3
    iget v11, v0, Lorg/brotli/dec/State;->j:I

    .line 395
    .line 396
    move/from16 v16, v13

    .line 397
    .line 398
    iget v13, v0, Lorg/brotli/dec/State;->insertLength:I

    .line 399
    .line 400
    if-ge v11, v13, :cond_d

    .line 401
    .line 402
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 403
    .line 404
    .line 405
    iget-object v11, v0, Lorg/brotli/dec/State;->blockLength:[I

    .line 406
    .line 407
    aget v11, v11, v15

    .line 408
    .line 409
    if-nez v11, :cond_b

    .line 410
    .line 411
    invoke-static {v0}, Lorg/brotli/dec/Decode;->decodeLiteralBlockSwitch(Lorg/brotli/dec/State;)V

    .line 412
    .line 413
    .line 414
    :cond_b
    iget-object v11, v0, Lorg/brotli/dec/State;->contextMap:[B

    .line 415
    .line 416
    iget v13, v0, Lorg/brotli/dec/State;->contextMapSlice:I

    .line 417
    .line 418
    sget-object v17, Lorg/brotli/dec/Context;->LOOKUP:[I

    .line 419
    .line 420
    move/from16 v18, v3

    .line 421
    .line 422
    iget v3, v0, Lorg/brotli/dec/State;->contextLookupOffset1:I

    .line 423
    .line 424
    add-int/2addr v3, v6

    .line 425
    aget v3, v17, v3

    .line 426
    .line 427
    iget v9, v0, Lorg/brotli/dec/State;->contextLookupOffset2:I

    .line 428
    .line 429
    add-int/2addr v9, v5

    .line 430
    aget v5, v17, v9

    .line 431
    .line 432
    or-int/2addr v3, v5

    .line 433
    add-int/2addr v13, v3

    .line 434
    aget-byte v3, v11, v13

    .line 435
    .line 436
    and-int/lit16 v3, v3, 0xff

    .line 437
    .line 438
    iget-object v5, v0, Lorg/brotli/dec/State;->blockLength:[I

    .line 439
    .line 440
    aget v9, v5, v15

    .line 441
    .line 442
    add-int/lit8 v9, v9, -0x1

    .line 443
    .line 444
    aput v9, v5, v15

    .line 445
    .line 446
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 447
    .line 448
    .line 449
    iget-object v5, v0, Lorg/brotli/dec/State;->hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 450
    .line 451
    iget-object v9, v5, Lorg/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 452
    .line 453
    iget-object v5, v5, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 454
    .line 455
    aget v3, v5, v3

    .line 456
    .line 457
    invoke-static {v9, v3, v1}, Lorg/brotli/dec/Decode;->readSymbol([IILorg/brotli/dec/BitReader;)I

    .line 458
    .line 459
    .line 460
    move-result v3

    .line 461
    iget v5, v0, Lorg/brotli/dec/State;->pos:I

    .line 462
    .line 463
    int-to-byte v9, v3

    .line 464
    aput-byte v9, v4, v5

    .line 465
    .line 466
    iget v9, v0, Lorg/brotli/dec/State;->j:I

    .line 467
    .line 468
    add-int/lit8 v9, v9, 0x1

    .line 469
    .line 470
    iput v9, v0, Lorg/brotli/dec/State;->j:I

    .line 471
    .line 472
    add-int/lit8 v9, v5, 0x1

    .line 473
    .line 474
    iput v9, v0, Lorg/brotli/dec/State;->pos:I

    .line 475
    .line 476
    if-ne v5, v2, :cond_c

    .line 477
    .line 478
    iput v12, v0, Lorg/brotli/dec/State;->nextRunningState:I

    .line 479
    .line 480
    iget v3, v0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 481
    .line 482
    iput v3, v0, Lorg/brotli/dec/State;->bytesToWrite:I

    .line 483
    .line 484
    iput v15, v0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 485
    .line 486
    iput v10, v0, Lorg/brotli/dec/State;->runningState:I

    .line 487
    .line 488
    goto :goto_4

    .line 489
    :cond_c
    move v5, v6

    .line 490
    move/from16 v13, v16

    .line 491
    .line 492
    const/4 v9, 0x7

    .line 493
    move v6, v3

    .line 494
    move/from16 v3, v18

    .line 495
    .line 496
    goto :goto_3

    .line 497
    :cond_d
    move/from16 v18, v3

    .line 498
    .line 499
    :goto_4
    iget v3, v0, Lorg/brotli/dec/State;->runningState:I

    .line 500
    .line 501
    if-eq v3, v12, :cond_e

    .line 502
    .line 503
    goto/16 :goto_a

    .line 504
    .line 505
    :cond_e
    iget v3, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 506
    .line 507
    iget v5, v0, Lorg/brotli/dec/State;->insertLength:I

    .line 508
    .line 509
    sub-int/2addr v3, v5

    .line 510
    iput v3, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 511
    .line 512
    if-gtz v3, :cond_f

    .line 513
    .line 514
    iput v14, v0, Lorg/brotli/dec/State;->runningState:I

    .line 515
    .line 516
    goto/16 :goto_a

    .line 517
    .line 518
    :cond_f
    iget v3, v0, Lorg/brotli/dec/State;->distanceCode:I

    .line 519
    .line 520
    if-gez v3, :cond_12

    .line 521
    .line 522
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 523
    .line 524
    .line 525
    iget-object v3, v0, Lorg/brotli/dec/State;->blockLength:[I

    .line 526
    .line 527
    aget v3, v3, v16

    .line 528
    .line 529
    if-nez v3, :cond_10

    .line 530
    .line 531
    invoke-static {v0}, Lorg/brotli/dec/Decode;->decodeDistanceBlockSwitch(Lorg/brotli/dec/State;)V

    .line 532
    .line 533
    .line 534
    :cond_10
    iget-object v3, v0, Lorg/brotli/dec/State;->blockLength:[I

    .line 535
    .line 536
    aget v5, v3, v16

    .line 537
    .line 538
    add-int/lit8 v5, v5, -0x1

    .line 539
    .line 540
    aput v5, v3, v16

    .line 541
    .line 542
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 543
    .line 544
    .line 545
    iget-object v3, v0, Lorg/brotli/dec/State;->hGroup2:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 546
    .line 547
    iget-object v5, v3, Lorg/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 548
    .line 549
    iget-object v3, v3, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 550
    .line 551
    iget-object v6, v0, Lorg/brotli/dec/State;->distContextMap:[B

    .line 552
    .line 553
    iget v9, v0, Lorg/brotli/dec/State;->distContextMapSlice:I

    .line 554
    .line 555
    iget v11, v0, Lorg/brotli/dec/State;->copyLength:I

    .line 556
    .line 557
    if-le v11, v8, :cond_11

    .line 558
    .line 559
    move v11, v14

    .line 560
    goto :goto_5

    .line 561
    :cond_11
    add-int/lit8 v11, v11, -0x2

    .line 562
    .line 563
    :goto_5
    add-int/2addr v9, v11

    .line 564
    aget-byte v6, v6, v9

    .line 565
    .line 566
    and-int/lit16 v6, v6, 0xff

    .line 567
    .line 568
    aget v3, v3, v6

    .line 569
    .line 570
    invoke-static {v5, v3, v1}, Lorg/brotli/dec/Decode;->readSymbol([IILorg/brotli/dec/BitReader;)I

    .line 571
    .line 572
    .line 573
    move-result v3

    .line 574
    iput v3, v0, Lorg/brotli/dec/State;->distanceCode:I

    .line 575
    .line 576
    iget v5, v0, Lorg/brotli/dec/State;->numDirectDistanceCodes:I

    .line 577
    .line 578
    if-lt v3, v5, :cond_12

    .line 579
    .line 580
    sub-int/2addr v3, v5

    .line 581
    iget v6, v0, Lorg/brotli/dec/State;->distancePostfixMask:I

    .line 582
    .line 583
    and-int/2addr v6, v3

    .line 584
    iget v9, v0, Lorg/brotli/dec/State;->distancePostfixBits:I

    .line 585
    .line 586
    ushr-int/2addr v3, v9

    .line 587
    iput v3, v0, Lorg/brotli/dec/State;->distanceCode:I

    .line 588
    .line 589
    ushr-int/lit8 v9, v3, 0x1

    .line 590
    .line 591
    add-int/lit8 v9, v9, 0x1

    .line 592
    .line 593
    and-int/lit8 v3, v3, 0x1

    .line 594
    .line 595
    add-int/lit8 v3, v3, 0x2

    .line 596
    .line 597
    shl-int/2addr v3, v9

    .line 598
    sub-int/2addr v3, v8

    .line 599
    add-int/2addr v5, v6

    .line 600
    invoke-static {v1, v9}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 601
    .line 602
    .line 603
    move-result v6

    .line 604
    add-int/2addr v3, v6

    .line 605
    iget v6, v0, Lorg/brotli/dec/State;->distancePostfixBits:I

    .line 606
    .line 607
    shl-int/2addr v3, v6

    .line 608
    add-int/2addr v5, v3

    .line 609
    iput v5, v0, Lorg/brotli/dec/State;->distanceCode:I

    .line 610
    .line 611
    :cond_12
    iget v3, v0, Lorg/brotli/dec/State;->distanceCode:I

    .line 612
    .line 613
    iget-object v5, v0, Lorg/brotli/dec/State;->distRb:[I

    .line 614
    .line 615
    iget v6, v0, Lorg/brotli/dec/State;->distRbIdx:I

    .line 616
    .line 617
    invoke-static {v3, v5, v6}, Lorg/brotli/dec/Decode;->translateShortCodes(I[II)I

    .line 618
    .line 619
    .line 620
    move-result v3

    .line 621
    iput v3, v0, Lorg/brotli/dec/State;->distance:I

    .line 622
    .line 623
    if-ltz v3, :cond_1a

    .line 624
    .line 625
    iget v5, v0, Lorg/brotli/dec/State;->maxDistance:I

    .line 626
    .line 627
    iget v6, v0, Lorg/brotli/dec/State;->maxBackwardDistance:I

    .line 628
    .line 629
    if-eq v5, v6, :cond_13

    .line 630
    .line 631
    iget v5, v0, Lorg/brotli/dec/State;->pos:I

    .line 632
    .line 633
    if-ge v5, v6, :cond_13

    .line 634
    .line 635
    iput v5, v0, Lorg/brotli/dec/State;->maxDistance:I

    .line 636
    .line 637
    goto :goto_6

    .line 638
    :cond_13
    iput v6, v0, Lorg/brotli/dec/State;->maxDistance:I

    .line 639
    .line 640
    :goto_6
    iget v5, v0, Lorg/brotli/dec/State;->pos:I

    .line 641
    .line 642
    iput v5, v0, Lorg/brotli/dec/State;->copyDst:I

    .line 643
    .line 644
    iget v5, v0, Lorg/brotli/dec/State;->maxDistance:I

    .line 645
    .line 646
    if-le v3, v5, :cond_14

    .line 647
    .line 648
    const/16 v3, 0x9

    .line 649
    .line 650
    iput v3, v0, Lorg/brotli/dec/State;->runningState:I

    .line 651
    .line 652
    goto/16 :goto_a

    .line 653
    .line 654
    :cond_14
    iget v5, v0, Lorg/brotli/dec/State;->distanceCode:I

    .line 655
    .line 656
    if-lez v5, :cond_15

    .line 657
    .line 658
    iget-object v5, v0, Lorg/brotli/dec/State;->distRb:[I

    .line 659
    .line 660
    iget v6, v0, Lorg/brotli/dec/State;->distRbIdx:I

    .line 661
    .line 662
    and-int/lit8 v8, v6, 0x3

    .line 663
    .line 664
    aput v3, v5, v8

    .line 665
    .line 666
    add-int/lit8 v6, v6, 0x1

    .line 667
    .line 668
    iput v6, v0, Lorg/brotli/dec/State;->distRbIdx:I

    .line 669
    .line 670
    :cond_15
    iget v3, v0, Lorg/brotli/dec/State;->copyLength:I

    .line 671
    .line 672
    iget v5, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 673
    .line 674
    if-gt v3, v5, :cond_19

    .line 675
    .line 676
    iput v15, v0, Lorg/brotli/dec/State;->j:I

    .line 677
    .line 678
    const/4 v3, 0x7

    .line 679
    iput v3, v0, Lorg/brotli/dec/State;->runningState:I

    .line 680
    .line 681
    :goto_7
    iget v3, v0, Lorg/brotli/dec/State;->pos:I

    .line 682
    .line 683
    iget v5, v0, Lorg/brotli/dec/State;->distance:I

    .line 684
    .line 685
    sub-int v5, v3, v5

    .line 686
    .line 687
    and-int/2addr v5, v2

    .line 688
    iget v6, v0, Lorg/brotli/dec/State;->copyLength:I

    .line 689
    .line 690
    iget v7, v0, Lorg/brotli/dec/State;->j:I

    .line 691
    .line 692
    sub-int/2addr v6, v7

    .line 693
    add-int v7, v5, v6

    .line 694
    .line 695
    if-ge v7, v2, :cond_18

    .line 696
    .line 697
    add-int v7, v3, v6

    .line 698
    .line 699
    if-ge v7, v2, :cond_18

    .line 700
    .line 701
    :goto_8
    if-ge v15, v6, :cond_16

    .line 702
    .line 703
    add-int/lit8 v7, v3, 0x1

    .line 704
    .line 705
    add-int/lit8 v8, v5, 0x1

    .line 706
    .line 707
    aget-byte v5, v4, v5

    .line 708
    .line 709
    aput-byte v5, v4, v3

    .line 710
    .line 711
    add-int/lit8 v15, v15, 0x1

    .line 712
    .line 713
    move v3, v7

    .line 714
    move v5, v8

    .line 715
    goto :goto_8

    .line 716
    :cond_16
    iget v3, v0, Lorg/brotli/dec/State;->j:I

    .line 717
    .line 718
    add-int/2addr v3, v6

    .line 719
    iput v3, v0, Lorg/brotli/dec/State;->j:I

    .line 720
    .line 721
    iget v3, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 722
    .line 723
    sub-int/2addr v3, v6

    .line 724
    iput v3, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 725
    .line 726
    iget v3, v0, Lorg/brotli/dec/State;->pos:I

    .line 727
    .line 728
    add-int/2addr v3, v6

    .line 729
    iput v3, v0, Lorg/brotli/dec/State;->pos:I

    .line 730
    .line 731
    :cond_17
    const/4 v3, 0x7

    .line 732
    goto :goto_9

    .line 733
    :cond_18
    iget v3, v0, Lorg/brotli/dec/State;->j:I

    .line 734
    .line 735
    iget v5, v0, Lorg/brotli/dec/State;->copyLength:I

    .line 736
    .line 737
    if-ge v3, v5, :cond_17

    .line 738
    .line 739
    iget v5, v0, Lorg/brotli/dec/State;->pos:I

    .line 740
    .line 741
    iget v6, v0, Lorg/brotli/dec/State;->distance:I

    .line 742
    .line 743
    sub-int v6, v5, v6

    .line 744
    .line 745
    and-int/2addr v6, v2

    .line 746
    aget-byte v6, v4, v6

    .line 747
    .line 748
    aput-byte v6, v4, v5

    .line 749
    .line 750
    iget v6, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 751
    .line 752
    add-int/lit8 v6, v6, -0x1

    .line 753
    .line 754
    iput v6, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 755
    .line 756
    add-int/lit8 v3, v3, 0x1

    .line 757
    .line 758
    iput v3, v0, Lorg/brotli/dec/State;->j:I

    .line 759
    .line 760
    add-int/lit8 v3, v5, 0x1

    .line 761
    .line 762
    iput v3, v0, Lorg/brotli/dec/State;->pos:I

    .line 763
    .line 764
    if-ne v5, v2, :cond_18

    .line 765
    .line 766
    const/4 v3, 0x7

    .line 767
    iput v3, v0, Lorg/brotli/dec/State;->nextRunningState:I

    .line 768
    .line 769
    iget v5, v0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 770
    .line 771
    iput v5, v0, Lorg/brotli/dec/State;->bytesToWrite:I

    .line 772
    .line 773
    iput v15, v0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 774
    .line 775
    iput v10, v0, Lorg/brotli/dec/State;->runningState:I

    .line 776
    .line 777
    :goto_9
    iget v5, v0, Lorg/brotli/dec/State;->runningState:I

    .line 778
    .line 779
    if-ne v5, v3, :cond_1b

    .line 780
    .line 781
    iput v14, v0, Lorg/brotli/dec/State;->runningState:I

    .line 782
    .line 783
    goto :goto_a

    .line 784
    :cond_19
    invoke-static {v7}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 785
    .line 786
    .line 787
    return-void

    .line 788
    :cond_1a
    const-string v0, "Negative distance"

    .line 789
    .line 790
    invoke-static {v0}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 791
    .line 792
    .line 793
    return-void

    .line 794
    :pswitch_8
    move/from16 v18, v3

    .line 795
    .line 796
    iget v2, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 797
    .line 798
    if-ltz v2, :cond_1c

    .line 799
    .line 800
    invoke-static {v0}, Lorg/brotli/dec/Decode;->readMetablockInfo(Lorg/brotli/dec/State;)V

    .line 801
    .line 802
    .line 803
    iget v2, v0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 804
    .line 805
    add-int/lit8 v2, v2, -0x1

    .line 806
    .line 807
    iget-object v4, v0, Lorg/brotli/dec/State;->ringBuffer:[B

    .line 808
    .line 809
    :cond_1b
    :goto_a
    move/from16 v3, v18

    .line 810
    .line 811
    goto/16 :goto_0

    .line 812
    .line 813
    :cond_1c
    invoke-static {v6}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 814
    .line 815
    .line 816
    return-void

    .line 817
    :cond_1d
    move/from16 v18, v3

    .line 818
    .line 819
    invoke-static {v0}, Lorg/brotli/dec/Decode;->writeRingBuffer(Lorg/brotli/dec/State;)Z

    .line 820
    .line 821
    .line 822
    move-result v3

    .line 823
    if-nez v3, :cond_1e

    .line 824
    .line 825
    goto :goto_b

    .line 826
    :cond_1e
    iget v3, v0, Lorg/brotli/dec/State;->pos:I

    .line 827
    .line 828
    iget v5, v0, Lorg/brotli/dec/State;->maxBackwardDistance:I

    .line 829
    .line 830
    if-lt v3, v5, :cond_1f

    .line 831
    .line 832
    iput v5, v0, Lorg/brotli/dec/State;->maxDistance:I

    .line 833
    .line 834
    :cond_1f
    and-int/2addr v3, v2

    .line 835
    iput v3, v0, Lorg/brotli/dec/State;->pos:I

    .line 836
    .line 837
    iget v3, v0, Lorg/brotli/dec/State;->nextRunningState:I

    .line 838
    .line 839
    iput v3, v0, Lorg/brotli/dec/State;->runningState:I

    .line 840
    .line 841
    goto :goto_a

    .line 842
    :cond_20
    move/from16 v18, v3

    .line 843
    .line 844
    if-ne v5, v7, :cond_22

    .line 845
    .line 846
    iget v2, v0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 847
    .line 848
    if-ltz v2, :cond_21

    .line 849
    .line 850
    invoke-static {v1}, Lorg/brotli/dec/BitReader;->jumpToByteBoundary(Lorg/brotli/dec/BitReader;)V

    .line 851
    .line 852
    .line 853
    iget-object v0, v0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 854
    .line 855
    move/from16 v1, v18

    .line 856
    .line 857
    invoke-static {v0, v1}, Lorg/brotli/dec/BitReader;->checkHealth(Lorg/brotli/dec/BitReader;Z)V

    .line 858
    .line 859
    .line 860
    return-void

    .line 861
    :cond_21
    invoke-static {v6}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 862
    .line 863
    .line 864
    :cond_22
    :goto_b
    return-void

    .line 865
    :cond_23
    const-string v0, "Can\'t decompress after close"

    .line 866
    .line 867
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 868
    .line 869
    .line 870
    return-void

    .line 871
    :cond_24
    const-string v0, "Can\'t decompress until initialized"

    .line 872
    .line 873
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 874
    .line 875
    .line 876
    return-void

    .line 877
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_3
        :pswitch_7
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static inverseMoveToFrontTransform([BI)V
    .locals 4

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    if-ge v3, v0, :cond_0

    .line 8
    .line 9
    aput v3, v1, v3

    .line 10
    .line 11
    add-int/lit8 v3, v3, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    :goto_1
    if-ge v2, p1, :cond_2

    .line 15
    .line 16
    aget-byte v0, p0, v2

    .line 17
    .line 18
    and-int/lit16 v0, v0, 0xff

    .line 19
    .line 20
    aget v3, v1, v0

    .line 21
    .line 22
    int-to-byte v3, v3

    .line 23
    aput-byte v3, p0, v2

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-static {v1, v0}, Lorg/brotli/dec/Decode;->moveToFront([II)V

    .line 28
    .line 29
    .line 30
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    return-void
.end method

.method private static maybeReallocateRingBuffer(Lorg/brotli/dec/State;)V
    .locals 6

    .line 1
    iget v0, p0, Lorg/brotli/dec/State;->maxRingBufferSize:I

    .line 2
    .line 3
    int-to-long v1, v0

    .line 4
    iget-wide v3, p0, Lorg/brotli/dec/State;->expectedTotalSize:J

    .line 5
    .line 6
    cmp-long v1, v1, v3

    .line 7
    .line 8
    if-lez v1, :cond_1

    .line 9
    .line 10
    long-to-int v1, v3

    .line 11
    iget-object v2, p0, Lorg/brotli/dec/State;->customDictionary:[B

    .line 12
    .line 13
    array-length v2, v2

    .line 14
    add-int/2addr v1, v2

    .line 15
    :goto_0
    shr-int/lit8 v2, v0, 0x1

    .line 16
    .line 17
    if-le v2, v1, :cond_0

    .line 18
    .line 19
    move v0, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-boolean v1, p0, Lorg/brotli/dec/State;->inputEnd:Z

    .line 22
    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    const/16 v1, 0x4000

    .line 26
    .line 27
    if-ge v0, v1, :cond_1

    .line 28
    .line 29
    iget v2, p0, Lorg/brotli/dec/State;->maxRingBufferSize:I

    .line 30
    .line 31
    if-lt v2, v1, :cond_1

    .line 32
    .line 33
    move v0, v1

    .line 34
    :cond_1
    iget v1, p0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 35
    .line 36
    if-gt v0, v1, :cond_2

    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    add-int/lit8 v2, v0, 0x25

    .line 40
    .line 41
    new-array v2, v2, [B

    .line 42
    .line 43
    iget-object v3, p0, Lorg/brotli/dec/State;->ringBuffer:[B

    .line 44
    .line 45
    const/4 v4, 0x0

    .line 46
    if-eqz v3, :cond_3

    .line 47
    .line 48
    invoke-static {v3, v4, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 49
    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_3
    iget-object v1, p0, Lorg/brotli/dec/State;->customDictionary:[B

    .line 53
    .line 54
    array-length v3, v1

    .line 55
    if-eqz v3, :cond_5

    .line 56
    .line 57
    array-length v3, v1

    .line 58
    iget v5, p0, Lorg/brotli/dec/State;->maxBackwardDistance:I

    .line 59
    .line 60
    if-le v3, v5, :cond_4

    .line 61
    .line 62
    sub-int/2addr v3, v5

    .line 63
    goto :goto_1

    .line 64
    :cond_4
    move v5, v3

    .line 65
    move v3, v4

    .line 66
    :goto_1
    invoke-static {v1, v3, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    iput v5, p0, Lorg/brotli/dec/State;->pos:I

    .line 70
    .line 71
    iput v5, p0, Lorg/brotli/dec/State;->bytesToIgnore:I

    .line 72
    .line 73
    :cond_5
    :goto_2
    iput-object v2, p0, Lorg/brotli/dec/State;->ringBuffer:[B

    .line 74
    .line 75
    iput v0, p0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 76
    .line 77
    return-void
.end method

.method private static moveToFront([II)V
    .locals 2

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    :goto_0
    if-lez p1, :cond_0

    .line 4
    .line 5
    add-int/lit8 v1, p1, -0x1

    .line 6
    .line 7
    aget v1, p0, v1

    .line 8
    .line 9
    aput v1, p0, p1

    .line 10
    .line 11
    add-int/lit8 p1, p1, -0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    aput v0, p0, p1

    .line 16
    .line 17
    return-void
.end method

.method private static readBlockLength([IILorg/brotli/dec/BitReader;)I
    .locals 1

    .line 1
    invoke-static {p2}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2}, Lorg/brotli/dec/Decode;->readSymbol([IILorg/brotli/dec/BitReader;)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    sget-object p1, Lorg/brotli/dec/Prefix;->BLOCK_LENGTH_N_BITS:[I

    .line 9
    .line 10
    aget p1, p1, p0

    .line 11
    .line 12
    sget-object v0, Lorg/brotli/dec/Prefix;->BLOCK_LENGTH_OFFSET:[I

    .line 13
    .line 14
    aget p0, v0, p0

    .line 15
    .line 16
    invoke-static {p2, p1}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    add-int/2addr p0, p1

    .line 21
    return p0
.end method

.method public static readHuffmanCode(I[IILorg/brotli/dec/BitReader;)V
    .locals 14

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 4
    .line 5
    .line 6
    new-array v1, p0, [I

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-static {v0, v2}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x1

    .line 15
    if-ne v3, v5, :cond_7

    .line 16
    .line 17
    add-int/lit8 v3, p0, -0x1

    .line 18
    .line 19
    const/4 v6, 0x4

    .line 20
    new-array v6, v6, [I

    .line 21
    .line 22
    invoke-static {v0, v2}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 23
    .line 24
    .line 25
    move-result v7

    .line 26
    add-int/2addr v7, v5

    .line 27
    move v8, v4

    .line 28
    :goto_0
    if-eqz v3, :cond_0

    .line 29
    .line 30
    shr-int/lit8 v3, v3, 0x1

    .line 31
    .line 32
    add-int/lit8 v8, v8, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v3, v4

    .line 36
    :goto_1
    if-ge v3, v7, :cond_1

    .line 37
    .line 38
    invoke-static {v0, v8}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    rem-int/2addr v9, p0

    .line 43
    aput v9, v6, v3

    .line 44
    .line 45
    aput v2, v1, v9

    .line 46
    .line 47
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    aget v3, v6, v4

    .line 51
    .line 52
    aput v5, v1, v3

    .line 53
    .line 54
    if-eq v7, v5, :cond_d

    .line 55
    .line 56
    if-eq v7, v2, :cond_5

    .line 57
    .line 58
    const/4 v3, 0x3

    .line 59
    if-eq v7, v3, :cond_4

    .line 60
    .line 61
    aget v7, v6, v4

    .line 62
    .line 63
    aget v8, v6, v5

    .line 64
    .line 65
    if-eq v7, v8, :cond_2

    .line 66
    .line 67
    aget v9, v6, v2

    .line 68
    .line 69
    if-eq v7, v9, :cond_2

    .line 70
    .line 71
    aget v10, v6, v3

    .line 72
    .line 73
    if-eq v7, v10, :cond_2

    .line 74
    .line 75
    if-eq v8, v9, :cond_2

    .line 76
    .line 77
    if-eq v8, v10, :cond_2

    .line 78
    .line 79
    if-eq v9, v10, :cond_2

    .line 80
    .line 81
    move v7, v5

    .line 82
    goto :goto_2

    .line 83
    :cond_2
    move v7, v4

    .line 84
    :goto_2
    invoke-static {v0, v5}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-ne v0, v5, :cond_3

    .line 89
    .line 90
    aget v0, v6, v2

    .line 91
    .line 92
    aput v3, v1, v0

    .line 93
    .line 94
    aget v0, v6, v3

    .line 95
    .line 96
    aput v3, v1, v0

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :cond_3
    aget v0, v6, v4

    .line 100
    .line 101
    aput v2, v1, v0

    .line 102
    .line 103
    :goto_3
    move v5, v7

    .line 104
    goto :goto_6

    .line 105
    :cond_4
    aget v0, v6, v4

    .line 106
    .line 107
    aget v3, v6, v5

    .line 108
    .line 109
    if-eq v0, v3, :cond_c

    .line 110
    .line 111
    aget v2, v6, v2

    .line 112
    .line 113
    if-eq v0, v2, :cond_c

    .line 114
    .line 115
    if-eq v3, v2, :cond_c

    .line 116
    .line 117
    move v4, v5

    .line 118
    goto :goto_5

    .line 119
    :cond_5
    aget v0, v6, v4

    .line 120
    .line 121
    aget v2, v6, v5

    .line 122
    .line 123
    if-eq v0, v2, :cond_6

    .line 124
    .line 125
    move v4, v5

    .line 126
    :cond_6
    aput v5, v1, v2

    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_7
    const/16 v2, 0x12

    .line 130
    .line 131
    new-array v6, v2, [I

    .line 132
    .line 133
    const/16 v7, 0x20

    .line 134
    .line 135
    move v9, v4

    .line 136
    move v8, v7

    .line 137
    :goto_4
    if-ge v3, v2, :cond_9

    .line 138
    .line 139
    if-lez v8, :cond_9

    .line 140
    .line 141
    sget-object v10, Lorg/brotli/dec/Decode;->CODE_LENGTH_CODE_ORDER:[I

    .line 142
    .line 143
    aget v10, v10, v3

    .line 144
    .line 145
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 146
    .line 147
    .line 148
    iget-wide v11, v0, Lorg/brotli/dec/BitReader;->accumulator:J

    .line 149
    .line 150
    iget v13, v0, Lorg/brotli/dec/BitReader;->bitOffset:I

    .line 151
    .line 152
    ushr-long/2addr v11, v13

    .line 153
    long-to-int v11, v11

    .line 154
    and-int/lit8 v11, v11, 0xf

    .line 155
    .line 156
    sget-object v12, Lorg/brotli/dec/Decode;->FIXED_TABLE:[I

    .line 157
    .line 158
    aget v11, v12, v11

    .line 159
    .line 160
    shr-int/lit8 v12, v11, 0x10

    .line 161
    .line 162
    add-int/2addr v13, v12

    .line 163
    iput v13, v0, Lorg/brotli/dec/BitReader;->bitOffset:I

    .line 164
    .line 165
    const v12, 0xffff

    .line 166
    .line 167
    .line 168
    and-int/2addr v11, v12

    .line 169
    aput v11, v6, v10

    .line 170
    .line 171
    if-eqz v11, :cond_8

    .line 172
    .line 173
    shr-int v10, v7, v11

    .line 174
    .line 175
    sub-int/2addr v8, v10

    .line 176
    add-int/lit8 v9, v9, 0x1

    .line 177
    .line 178
    :cond_8
    add-int/lit8 v3, v3, 0x1

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_9
    if-eq v9, v5, :cond_a

    .line 182
    .line 183
    if-nez v8, :cond_b

    .line 184
    .line 185
    :cond_a
    move v4, v5

    .line 186
    :cond_b
    invoke-static {v6, p0, v1, v0}, Lorg/brotli/dec/Decode;->readHuffmanCodeLengths([II[ILorg/brotli/dec/BitReader;)V

    .line 187
    .line 188
    .line 189
    :cond_c
    :goto_5
    move v5, v4

    .line 190
    :cond_d
    :goto_6
    if-eqz v5, :cond_e

    .line 191
    .line 192
    const/16 v0, 0x8

    .line 193
    .line 194
    move/from16 v3, p2

    .line 195
    .line 196
    invoke-static {p1, v3, v0, v1, p0}, Lorg/brotli/dec/Huffman;->buildHuffmanTable([III[II)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_e
    const-string p0, "Can\'t readHuffmanCode"

    .line 201
    .line 202
    invoke-static {p0}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method private static readHuffmanCodeLengths([II[ILorg/brotli/dec/BitReader;)V
    .locals 10

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    const/4 v1, 0x5

    .line 6
    const/16 v2, 0x12

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-static {v0, v3, v1, p0, v2}, Lorg/brotli/dec/Huffman;->buildHuffmanTable([III[II)V

    .line 10
    .line 11
    .line 12
    const/16 p0, 0x8

    .line 13
    .line 14
    const v1, 0x8000

    .line 15
    .line 16
    .line 17
    move v4, v1

    .line 18
    move v2, v3

    .line 19
    move v5, v2

    .line 20
    move v6, v5

    .line 21
    :goto_0
    if-ge v2, p1, :cond_8

    .line 22
    .line 23
    if-lez v4, :cond_8

    .line 24
    .line 25
    invoke-static {p3}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p3}, Lorg/brotli/dec/BitReader;->fillBitWindow(Lorg/brotli/dec/BitReader;)V

    .line 29
    .line 30
    .line 31
    iget-wide v7, p3, Lorg/brotli/dec/BitReader;->accumulator:J

    .line 32
    .line 33
    iget v9, p3, Lorg/brotli/dec/BitReader;->bitOffset:I

    .line 34
    .line 35
    ushr-long/2addr v7, v9

    .line 36
    long-to-int v7, v7

    .line 37
    and-int/lit8 v7, v7, 0x1f

    .line 38
    .line 39
    aget v7, v0, v7

    .line 40
    .line 41
    shr-int/lit8 v8, v7, 0x10

    .line 42
    .line 43
    add-int/2addr v9, v8

    .line 44
    iput v9, p3, Lorg/brotli/dec/BitReader;->bitOffset:I

    .line 45
    .line 46
    const v8, 0xffff

    .line 47
    .line 48
    .line 49
    and-int/2addr v7, v8

    .line 50
    const/16 v8, 0x10

    .line 51
    .line 52
    if-ge v7, v8, :cond_1

    .line 53
    .line 54
    add-int/lit8 v6, v2, 0x1

    .line 55
    .line 56
    aput v7, p2, v2

    .line 57
    .line 58
    if-eqz v7, :cond_0

    .line 59
    .line 60
    shr-int p0, v1, v7

    .line 61
    .line 62
    sub-int/2addr v4, p0

    .line 63
    move v2, v6

    .line 64
    move p0, v7

    .line 65
    :goto_1
    move v6, v3

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    move v2, v6

    .line 68
    goto :goto_1

    .line 69
    :cond_1
    add-int/lit8 v9, v7, -0xe

    .line 70
    .line 71
    if-ne v7, v8, :cond_2

    .line 72
    .line 73
    move v7, p0

    .line 74
    goto :goto_2

    .line 75
    :cond_2
    move v7, v3

    .line 76
    :goto_2
    if-eq v5, v7, :cond_3

    .line 77
    .line 78
    move v6, v3

    .line 79
    move v5, v7

    .line 80
    :cond_3
    if-lez v6, :cond_4

    .line 81
    .line 82
    add-int/lit8 v7, v6, -0x2

    .line 83
    .line 84
    shl-int/2addr v7, v9

    .line 85
    goto :goto_3

    .line 86
    :cond_4
    move v7, v6

    .line 87
    :goto_3
    invoke-static {p3, v9}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    add-int/lit8 v8, v8, 0x3

    .line 92
    .line 93
    add-int/2addr v7, v8

    .line 94
    sub-int v6, v7, v6

    .line 95
    .line 96
    add-int v8, v2, v6

    .line 97
    .line 98
    if-gt v8, p1, :cond_7

    .line 99
    .line 100
    move v8, v3

    .line 101
    :goto_4
    if-ge v8, v6, :cond_5

    .line 102
    .line 103
    add-int/lit8 v9, v2, 0x1

    .line 104
    .line 105
    aput v5, p2, v2

    .line 106
    .line 107
    add-int/lit8 v8, v8, 0x1

    .line 108
    .line 109
    move v2, v9

    .line 110
    goto :goto_4

    .line 111
    :cond_5
    if-eqz v5, :cond_6

    .line 112
    .line 113
    rsub-int/lit8 v8, v5, 0xf

    .line 114
    .line 115
    shl-int/2addr v6, v8

    .line 116
    sub-int/2addr v4, v6

    .line 117
    :cond_6
    move v6, v7

    .line 118
    goto :goto_0

    .line 119
    :cond_7
    const-string p0, "symbol + repeatDelta > numSymbols"

    .line 120
    .line 121
    invoke-static {p0}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_8
    if-nez v4, :cond_9

    .line 126
    .line 127
    sub-int/2addr p1, v2

    .line 128
    invoke-static {p2, v2, p1}, Lorg/brotli/dec/Utils;->fillWithZeroes([III)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_9
    const-string p0, "Unused space"

    .line 133
    .line 134
    invoke-static {p0}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method private static readMetablockHuffmanCodesAndContextMaps(Lorg/brotli/dec/State;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    const/4 v3, 0x3

    .line 6
    const/4 v4, 0x1

    .line 7
    if-ge v2, v3, :cond_1

    .line 8
    .line 9
    iget-object v3, p0, Lorg/brotli/dec/State;->numBlockTypes:[I

    .line 10
    .line 11
    invoke-static {v0}, Lorg/brotli/dec/Decode;->decodeVarLenUnsignedByte(Lorg/brotli/dec/BitReader;)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    add-int/2addr v5, v4

    .line 16
    aput v5, v3, v2

    .line 17
    .line 18
    iget-object v3, p0, Lorg/brotli/dec/State;->blockLength:[I

    .line 19
    .line 20
    const/high16 v5, 0x10000000

    .line 21
    .line 22
    aput v5, v3, v2

    .line 23
    .line 24
    iget-object v3, p0, Lorg/brotli/dec/State;->numBlockTypes:[I

    .line 25
    .line 26
    aget v3, v3, v2

    .line 27
    .line 28
    if-le v3, v4, :cond_0

    .line 29
    .line 30
    add-int/lit8 v3, v3, 0x2

    .line 31
    .line 32
    iget-object v4, p0, Lorg/brotli/dec/State;->blockTypeTrees:[I

    .line 33
    .line 34
    mul-int/lit16 v5, v2, 0x438

    .line 35
    .line 36
    invoke-static {v3, v4, v5, v0}, Lorg/brotli/dec/Decode;->readHuffmanCode(I[IILorg/brotli/dec/BitReader;)V

    .line 37
    .line 38
    .line 39
    const/16 v3, 0x1a

    .line 40
    .line 41
    iget-object v4, p0, Lorg/brotli/dec/State;->blockLenTrees:[I

    .line 42
    .line 43
    invoke-static {v3, v4, v5, v0}, Lorg/brotli/dec/Decode;->readHuffmanCode(I[IILorg/brotli/dec/BitReader;)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lorg/brotli/dec/State;->blockLength:[I

    .line 47
    .line 48
    iget-object v4, p0, Lorg/brotli/dec/State;->blockLenTrees:[I

    .line 49
    .line 50
    invoke-static {v4, v5, v0}, Lorg/brotli/dec/Decode;->readBlockLength([IILorg/brotli/dec/BitReader;)I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    aput v4, v3, v2

    .line 55
    .line 56
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 60
    .line 61
    .line 62
    const/4 v2, 0x2

    .line 63
    invoke-static {v0, v2}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    iput v5, p0, Lorg/brotli/dec/State;->distancePostfixBits:I

    .line 68
    .line 69
    const/4 v5, 0x4

    .line 70
    invoke-static {v0, v5}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    iget v7, p0, Lorg/brotli/dec/State;->distancePostfixBits:I

    .line 75
    .line 76
    shl-int/2addr v6, v7

    .line 77
    add-int/lit8 v6, v6, 0x10

    .line 78
    .line 79
    iput v6, p0, Lorg/brotli/dec/State;->numDirectDistanceCodes:I

    .line 80
    .line 81
    shl-int v8, v4, v7

    .line 82
    .line 83
    sub-int/2addr v8, v4

    .line 84
    iput v8, p0, Lorg/brotli/dec/State;->distancePostfixMask:I

    .line 85
    .line 86
    const/16 v8, 0x30

    .line 87
    .line 88
    shl-int v7, v8, v7

    .line 89
    .line 90
    add-int/2addr v6, v7

    .line 91
    iget-object v7, p0, Lorg/brotli/dec/State;->numBlockTypes:[I

    .line 92
    .line 93
    aget v7, v7, v1

    .line 94
    .line 95
    new-array v7, v7, [B

    .line 96
    .line 97
    iput-object v7, p0, Lorg/brotli/dec/State;->contextModes:[B

    .line 98
    .line 99
    move v7, v1

    .line 100
    :goto_1
    iget-object v8, p0, Lorg/brotli/dec/State;->numBlockTypes:[I

    .line 101
    .line 102
    aget v8, v8, v1

    .line 103
    .line 104
    if-ge v7, v8, :cond_3

    .line 105
    .line 106
    add-int/lit8 v9, v7, 0x60

    .line 107
    .line 108
    invoke-static {v9, v8}, Ljava/lang/Math;->min(II)I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    :goto_2
    if-ge v7, v8, :cond_2

    .line 113
    .line 114
    iget-object v9, p0, Lorg/brotli/dec/State;->contextModes:[B

    .line 115
    .line 116
    invoke-static {v0, v2}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 117
    .line 118
    .line 119
    move-result v10

    .line 120
    shl-int/2addr v10, v4

    .line 121
    int-to-byte v10, v10

    .line 122
    aput-byte v10, v9, v7

    .line 123
    .line 124
    add-int/lit8 v7, v7, 0x1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_2
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_3
    shl-int/lit8 v7, v8, 0x6

    .line 132
    .line 133
    new-array v7, v7, [B

    .line 134
    .line 135
    iput-object v7, p0, Lorg/brotli/dec/State;->contextMap:[B

    .line 136
    .line 137
    shl-int/lit8 v8, v8, 0x6

    .line 138
    .line 139
    invoke-static {v8, v7, v0}, Lorg/brotli/dec/Decode;->decodeContextMap(I[BLorg/brotli/dec/BitReader;)I

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    iput-boolean v4, p0, Lorg/brotli/dec/State;->trivialLiteralContext:Z

    .line 144
    .line 145
    move v8, v1

    .line 146
    :goto_3
    iget-object v9, p0, Lorg/brotli/dec/State;->numBlockTypes:[I

    .line 147
    .line 148
    aget v10, v9, v1

    .line 149
    .line 150
    shl-int/lit8 v10, v10, 0x6

    .line 151
    .line 152
    if-ge v8, v10, :cond_5

    .line 153
    .line 154
    iget-object v10, p0, Lorg/brotli/dec/State;->contextMap:[B

    .line 155
    .line 156
    aget-byte v10, v10, v8

    .line 157
    .line 158
    shr-int/lit8 v11, v8, 0x6

    .line 159
    .line 160
    if-eq v10, v11, :cond_4

    .line 161
    .line 162
    iput-boolean v1, p0, Lorg/brotli/dec/State;->trivialLiteralContext:Z

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_4
    add-int/lit8 v8, v8, 0x1

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_5
    :goto_4
    aget v8, v9, v2

    .line 169
    .line 170
    shl-int/lit8 v9, v8, 0x2

    .line 171
    .line 172
    new-array v9, v9, [B

    .line 173
    .line 174
    iput-object v9, p0, Lorg/brotli/dec/State;->distContextMap:[B

    .line 175
    .line 176
    shl-int/2addr v8, v2

    .line 177
    invoke-static {v8, v9, v0}, Lorg/brotli/dec/Decode;->decodeContextMap(I[BLorg/brotli/dec/BitReader;)I

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    iget-object v9, p0, Lorg/brotli/dec/State;->hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 182
    .line 183
    const/16 v10, 0x100

    .line 184
    .line 185
    invoke-static {v9, v10, v7}, Lorg/brotli/dec/HuffmanTreeGroup;->init(Lorg/brotli/dec/HuffmanTreeGroup;II)V

    .line 186
    .line 187
    .line 188
    iget-object v7, p0, Lorg/brotli/dec/State;->hGroup1:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 189
    .line 190
    iget-object v9, p0, Lorg/brotli/dec/State;->numBlockTypes:[I

    .line 191
    .line 192
    aget v9, v9, v4

    .line 193
    .line 194
    const/16 v10, 0x2c0

    .line 195
    .line 196
    invoke-static {v7, v10, v9}, Lorg/brotli/dec/HuffmanTreeGroup;->init(Lorg/brotli/dec/HuffmanTreeGroup;II)V

    .line 197
    .line 198
    .line 199
    iget-object v7, p0, Lorg/brotli/dec/State;->hGroup2:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 200
    .line 201
    invoke-static {v7, v6, v8}, Lorg/brotli/dec/HuffmanTreeGroup;->init(Lorg/brotli/dec/HuffmanTreeGroup;II)V

    .line 202
    .line 203
    .line 204
    iget-object v6, p0, Lorg/brotli/dec/State;->hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 205
    .line 206
    invoke-static {v6, v0}, Lorg/brotli/dec/HuffmanTreeGroup;->decode(Lorg/brotli/dec/HuffmanTreeGroup;Lorg/brotli/dec/BitReader;)V

    .line 207
    .line 208
    .line 209
    iget-object v6, p0, Lorg/brotli/dec/State;->hGroup1:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 210
    .line 211
    invoke-static {v6, v0}, Lorg/brotli/dec/HuffmanTreeGroup;->decode(Lorg/brotli/dec/HuffmanTreeGroup;Lorg/brotli/dec/BitReader;)V

    .line 212
    .line 213
    .line 214
    iget-object v6, p0, Lorg/brotli/dec/State;->hGroup2:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 215
    .line 216
    invoke-static {v6, v0}, Lorg/brotli/dec/HuffmanTreeGroup;->decode(Lorg/brotli/dec/HuffmanTreeGroup;Lorg/brotli/dec/BitReader;)V

    .line 217
    .line 218
    .line 219
    iput v1, p0, Lorg/brotli/dec/State;->contextMapSlice:I

    .line 220
    .line 221
    iput v1, p0, Lorg/brotli/dec/State;->distContextMapSlice:I

    .line 222
    .line 223
    sget-object v0, Lorg/brotli/dec/Context;->LOOKUP_OFFSETS:[I

    .line 224
    .line 225
    iget-object v6, p0, Lorg/brotli/dec/State;->contextModes:[B

    .line 226
    .line 227
    aget-byte v6, v6, v1

    .line 228
    .line 229
    aget v7, v0, v6

    .line 230
    .line 231
    iput v7, p0, Lorg/brotli/dec/State;->contextLookupOffset1:I

    .line 232
    .line 233
    add-int/2addr v6, v4

    .line 234
    aget v0, v0, v6

    .line 235
    .line 236
    iput v0, p0, Lorg/brotli/dec/State;->contextLookupOffset2:I

    .line 237
    .line 238
    iput v1, p0, Lorg/brotli/dec/State;->literalTreeIndex:I

    .line 239
    .line 240
    iget-object v0, p0, Lorg/brotli/dec/State;->hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 241
    .line 242
    iget-object v0, v0, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 243
    .line 244
    aget v0, v0, v1

    .line 245
    .line 246
    iput v0, p0, Lorg/brotli/dec/State;->literalTree:I

    .line 247
    .line 248
    iget-object v0, p0, Lorg/brotli/dec/State;->hGroup1:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 249
    .line 250
    iget-object v0, v0, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 251
    .line 252
    aget v0, v0, v1

    .line 253
    .line 254
    iput v0, p0, Lorg/brotli/dec/State;->treeCommandOffset:I

    .line 255
    .line 256
    iget-object p0, p0, Lorg/brotli/dec/State;->blockTypeRb:[I

    .line 257
    .line 258
    aput v4, p0, v5

    .line 259
    .line 260
    aput v4, p0, v2

    .line 261
    .line 262
    aput v4, p0, v1

    .line 263
    .line 264
    const/4 v0, 0x5

    .line 265
    aput v1, p0, v0

    .line 266
    .line 267
    aput v1, p0, v3

    .line 268
    .line 269
    aput v1, p0, v4

    .line 270
    .line 271
    return-void
.end method

.method private static readMetablockInfo(Lorg/brotli/dec/State;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 2
    .line 3
    iget-boolean v1, p0, Lorg/brotli/dec/State;->inputEnd:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    iput v0, p0, Lorg/brotli/dec/State;->nextRunningState:I

    .line 10
    .line 11
    iget v0, p0, Lorg/brotli/dec/State;->pos:I

    .line 12
    .line 13
    iput v0, p0, Lorg/brotli/dec/State;->bytesToWrite:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 17
    .line 18
    const/16 v0, 0xc

    .line 19
    .line 20
    iput v0, p0, Lorg/brotli/dec/State;->runningState:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v1, p0, Lorg/brotli/dec/State;->hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    iput-object v2, v1, Lorg/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 27
    .line 28
    iput-object v2, v1, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 29
    .line 30
    iget-object v1, p0, Lorg/brotli/dec/State;->hGroup1:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 31
    .line 32
    iput-object v2, v1, Lorg/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 33
    .line 34
    iput-object v2, v1, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 35
    .line 36
    iget-object v1, p0, Lorg/brotli/dec/State;->hGroup2:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 37
    .line 38
    iput-object v2, v1, Lorg/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 39
    .line 40
    iput-object v2, v1, Lorg/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 41
    .line 42
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->readMoreInput(Lorg/brotli/dec/BitReader;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, p0}, Lorg/brotli/dec/Decode;->decodeMetaBlockLength(Lorg/brotli/dec/BitReader;Lorg/brotli/dec/State;)V

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 49
    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    iget-boolean v1, p0, Lorg/brotli/dec/State;->isMetadata:Z

    .line 53
    .line 54
    if-nez v1, :cond_1

    .line 55
    .line 56
    goto :goto_3

    .line 57
    :cond_1
    iget-boolean v1, p0, Lorg/brotli/dec/State;->isUncompressed:Z

    .line 58
    .line 59
    if-nez v1, :cond_3

    .line 60
    .line 61
    iget-boolean v1, p0, Lorg/brotli/dec/State;->isMetadata:Z

    .line 62
    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    const/4 v0, 0x2

    .line 67
    iput v0, p0, Lorg/brotli/dec/State;->runningState:I

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_3
    :goto_0
    invoke-static {v0}, Lorg/brotli/dec/BitReader;->jumpToByteBoundary(Lorg/brotli/dec/BitReader;)V

    .line 71
    .line 72
    .line 73
    iget-boolean v0, p0, Lorg/brotli/dec/State;->isMetadata:Z

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    const/4 v0, 0x4

    .line 78
    goto :goto_1

    .line 79
    :cond_4
    const/4 v0, 0x5

    .line 80
    :goto_1
    iput v0, p0, Lorg/brotli/dec/State;->runningState:I

    .line 81
    .line 82
    :goto_2
    iget-boolean v0, p0, Lorg/brotli/dec/State;->isMetadata:Z

    .line 83
    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_5
    iget-wide v0, p0, Lorg/brotli/dec/State;->expectedTotalSize:J

    .line 88
    .line 89
    iget v2, p0, Lorg/brotli/dec/State;->metaBlockLength:I

    .line 90
    .line 91
    int-to-long v2, v2

    .line 92
    add-long/2addr v0, v2

    .line 93
    iput-wide v0, p0, Lorg/brotli/dec/State;->expectedTotalSize:J

    .line 94
    .line 95
    iget v0, p0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 96
    .line 97
    iget v1, p0, Lorg/brotli/dec/State;->maxRingBufferSize:I

    .line 98
    .line 99
    if-ge v0, v1, :cond_6

    .line 100
    .line 101
    invoke-static {p0}, Lorg/brotli/dec/Decode;->maybeReallocateRingBuffer(Lorg/brotli/dec/State;)V

    .line 102
    .line 103
    .line 104
    :cond_6
    :goto_3
    return-void
.end method

.method private static readSymbol([IILorg/brotli/dec/BitReader;)I
    .locals 6

    .line 1
    iget-wide v0, p2, Lorg/brotli/dec/BitReader;->accumulator:J

    .line 2
    .line 3
    iget v2, p2, Lorg/brotli/dec/BitReader;->bitOffset:I

    .line 4
    .line 5
    ushr-long/2addr v0, v2

    .line 6
    long-to-int v0, v0

    .line 7
    and-int/lit16 v1, v0, 0xff

    .line 8
    .line 9
    add-int/2addr p1, v1

    .line 10
    aget v1, p0, p1

    .line 11
    .line 12
    shr-int/lit8 v3, v1, 0x10

    .line 13
    .line 14
    const v4, 0xffff

    .line 15
    .line 16
    .line 17
    and-int/2addr v1, v4

    .line 18
    const/16 v5, 0x8

    .line 19
    .line 20
    if-gt v3, v5, :cond_0

    .line 21
    .line 22
    add-int/2addr v2, v3

    .line 23
    iput v2, p2, Lorg/brotli/dec/BitReader;->bitOffset:I

    .line 24
    .line 25
    return v1

    .line 26
    :cond_0
    add-int/2addr p1, v1

    .line 27
    const/4 v1, 0x1

    .line 28
    shl-int v3, v1, v3

    .line 29
    .line 30
    sub-int/2addr v3, v1

    .line 31
    and-int/2addr v0, v3

    .line 32
    ushr-int/2addr v0, v5

    .line 33
    add-int/2addr p1, v0

    .line 34
    aget p0, p0, p1

    .line 35
    .line 36
    shr-int/lit8 p1, p0, 0x10

    .line 37
    .line 38
    add-int/2addr p1, v5

    .line 39
    add-int/2addr v2, p1

    .line 40
    iput v2, p2, Lorg/brotli/dec/BitReader;->bitOffset:I

    .line 41
    .line 42
    and-int/2addr p0, v4

    .line 43
    return p0
.end method

.method public static setCustomDictionary(Lorg/brotli/dec/State;[B)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    new-array p1, p1, [B

    .line 5
    .line 6
    :cond_0
    iput-object p1, p0, Lorg/brotli/dec/State;->customDictionary:[B

    .line 7
    .line 8
    return-void
.end method

.method private static translateShortCodes(I[II)I
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-ge p0, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lorg/brotli/dec/Decode;->DISTANCE_SHORT_CODE_INDEX_OFFSET:[I

    .line 6
    .line 7
    aget v0, v0, p0

    .line 8
    .line 9
    add-int/2addr p2, v0

    .line 10
    and-int/lit8 p2, p2, 0x3

    .line 11
    .line 12
    aget p1, p1, p2

    .line 13
    .line 14
    sget-object p2, Lorg/brotli/dec/Decode;->DISTANCE_SHORT_CODE_VALUE_OFFSET:[I

    .line 15
    .line 16
    aget p0, p2, p0

    .line 17
    .line 18
    add-int/2addr p1, p0

    .line 19
    return p1

    .line 20
    :cond_0
    add-int/lit8 p0, p0, -0xf

    .line 21
    .line 22
    return p0
.end method

.method private static writeRingBuffer(Lorg/brotli/dec/State;)Z
    .locals 7

    .line 1
    iget v0, p0, Lorg/brotli/dec/State;->bytesToIgnore:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, p0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 7
    .line 8
    add-int/2addr v2, v0

    .line 9
    iput v2, p0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 10
    .line 11
    iput v1, p0, Lorg/brotli/dec/State;->bytesToIgnore:I

    .line 12
    .line 13
    :cond_0
    iget v0, p0, Lorg/brotli/dec/State;->outputLength:I

    .line 14
    .line 15
    iget v2, p0, Lorg/brotli/dec/State;->outputUsed:I

    .line 16
    .line 17
    sub-int/2addr v0, v2

    .line 18
    iget v2, p0, Lorg/brotli/dec/State;->bytesToWrite:I

    .line 19
    .line 20
    iget v3, p0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 21
    .line 22
    sub-int/2addr v2, v3

    .line 23
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Lorg/brotli/dec/State;->ringBuffer:[B

    .line 30
    .line 31
    iget v3, p0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 32
    .line 33
    iget-object v4, p0, Lorg/brotli/dec/State;->output:[B

    .line 34
    .line 35
    iget v5, p0, Lorg/brotli/dec/State;->outputOffset:I

    .line 36
    .line 37
    iget v6, p0, Lorg/brotli/dec/State;->outputUsed:I

    .line 38
    .line 39
    add-int/2addr v5, v6

    .line 40
    invoke-static {v2, v3, v4, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    iget v2, p0, Lorg/brotli/dec/State;->outputUsed:I

    .line 44
    .line 45
    add-int/2addr v2, v0

    .line 46
    iput v2, p0, Lorg/brotli/dec/State;->outputUsed:I

    .line 47
    .line 48
    iget v2, p0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 49
    .line 50
    add-int/2addr v2, v0

    .line 51
    iput v2, p0, Lorg/brotli/dec/State;->bytesWritten:I

    .line 52
    .line 53
    :cond_1
    iget v0, p0, Lorg/brotli/dec/State;->outputUsed:I

    .line 54
    .line 55
    iget p0, p0, Lorg/brotli/dec/State;->outputLength:I

    .line 56
    .line 57
    if-ge v0, p0, :cond_2

    .line 58
    .line 59
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_2
    return v1
.end method

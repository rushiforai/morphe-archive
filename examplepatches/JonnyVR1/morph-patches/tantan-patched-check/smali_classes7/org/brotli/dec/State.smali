.class final Lorg/brotli/dec/State;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final blockLenTrees:[I

.field final blockLength:[I

.field final blockTypeRb:[I

.field final blockTypeTrees:[I

.field final br:Lorg/brotli/dec/BitReader;

.field bytesToIgnore:I

.field bytesToWrite:I

.field bytesWritten:I

.field contextLookupOffset1:I

.field contextLookupOffset2:I

.field contextMap:[B

.field contextMapSlice:I

.field contextModes:[B

.field copyDst:I

.field copyLength:I

.field customDictionary:[B

.field distContextMap:[B

.field distContextMapSlice:I

.field final distRb:[I

.field distRbIdx:I

.field distance:I

.field distanceCode:I

.field distancePostfixBits:I

.field distancePostfixMask:I

.field expectedTotalSize:J

.field final hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

.field final hGroup1:Lorg/brotli/dec/HuffmanTreeGroup;

.field final hGroup2:Lorg/brotli/dec/HuffmanTreeGroup;

.field inputEnd:Z

.field insertLength:I

.field isMetadata:Z

.field isUncompressed:Z

.field j:I

.field literalTree:I

.field literalTreeIndex:I

.field maxBackwardDistance:I

.field maxDistance:I

.field maxRingBufferSize:I

.field metaBlockLength:I

.field nextRunningState:I

.field final numBlockTypes:[I

.field numDirectDistanceCodes:I

.field output:[B

.field outputLength:I

.field outputOffset:I

.field outputUsed:I

.field pos:I

.field ringBuffer:[B

.field ringBufferSize:I

.field runningState:I

.field treeCommandOffset:I

.field trivialLiteralContext:Z


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/brotli/dec/State;->runningState:I

    .line 6
    .line 7
    new-instance v1, Lorg/brotli/dec/BitReader;

    .line 8
    .line 9
    invoke-direct {v1}, Lorg/brotli/dec/BitReader;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 13
    .line 14
    const/16 v1, 0xca8

    .line 15
    .line 16
    new-array v2, v1, [I

    .line 17
    .line 18
    iput-object v2, p0, Lorg/brotli/dec/State;->blockTypeTrees:[I

    .line 19
    .line 20
    new-array v1, v1, [I

    .line 21
    .line 22
    iput-object v1, p0, Lorg/brotli/dec/State;->blockLenTrees:[I

    .line 23
    .line 24
    new-instance v1, Lorg/brotli/dec/HuffmanTreeGroup;

    .line 25
    .line 26
    invoke-direct {v1}, Lorg/brotli/dec/HuffmanTreeGroup;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lorg/brotli/dec/State;->hGroup0:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 30
    .line 31
    new-instance v1, Lorg/brotli/dec/HuffmanTreeGroup;

    .line 32
    .line 33
    invoke-direct {v1}, Lorg/brotli/dec/HuffmanTreeGroup;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lorg/brotli/dec/State;->hGroup1:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 37
    .line 38
    new-instance v1, Lorg/brotli/dec/HuffmanTreeGroup;

    .line 39
    .line 40
    invoke-direct {v1}, Lorg/brotli/dec/HuffmanTreeGroup;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lorg/brotli/dec/State;->hGroup2:Lorg/brotli/dec/HuffmanTreeGroup;

    .line 44
    .line 45
    const/4 v1, 0x3

    .line 46
    new-array v2, v1, [I

    .line 47
    .line 48
    iput-object v2, p0, Lorg/brotli/dec/State;->blockLength:[I

    .line 49
    .line 50
    new-array v1, v1, [I

    .line 51
    .line 52
    iput-object v1, p0, Lorg/brotli/dec/State;->numBlockTypes:[I

    .line 53
    .line 54
    const/4 v1, 0x6

    .line 55
    new-array v1, v1, [I

    .line 56
    .line 57
    iput-object v1, p0, Lorg/brotli/dec/State;->blockTypeRb:[I

    .line 58
    .line 59
    const/16 v1, 0xb

    .line 60
    .line 61
    const/4 v2, 0x4

    .line 62
    const/16 v3, 0x10

    .line 63
    .line 64
    const/16 v4, 0xf

    .line 65
    .line 66
    filled-new-array {v3, v4, v1, v2}, [I

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, p0, Lorg/brotli/dec/State;->distRb:[I

    .line 71
    .line 72
    iput v0, p0, Lorg/brotli/dec/State;->pos:I

    .line 73
    .line 74
    iput v0, p0, Lorg/brotli/dec/State;->maxDistance:I

    .line 75
    .line 76
    iput v0, p0, Lorg/brotli/dec/State;->distRbIdx:I

    .line 77
    .line 78
    iput-boolean v0, p0, Lorg/brotli/dec/State;->trivialLiteralContext:Z

    .line 79
    .line 80
    iput v0, p0, Lorg/brotli/dec/State;->literalTreeIndex:I

    .line 81
    .line 82
    iput v0, p0, Lorg/brotli/dec/State;->ringBufferSize:I

    .line 83
    .line 84
    const-wide/16 v1, 0x0

    .line 85
    .line 86
    iput-wide v1, p0, Lorg/brotli/dec/State;->expectedTotalSize:J

    .line 87
    .line 88
    new-array v1, v0, [B

    .line 89
    .line 90
    iput-object v1, p0, Lorg/brotli/dec/State;->customDictionary:[B

    .line 91
    .line 92
    iput v0, p0, Lorg/brotli/dec/State;->bytesToIgnore:I

    .line 93
    .line 94
    return-void
.end method

.method public static close(Lorg/brotli/dec/State;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/brotli/dec/State;->runningState:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/16 v1, 0xb

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iput v1, p0, Lorg/brotli/dec/State;->runningState:I

    .line 11
    .line 12
    iget-object p0, p0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 13
    .line 14
    invoke-static {p0}, Lorg/brotli/dec/BitReader;->close(Lorg/brotli/dec/BitReader;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    const-string p0, "State MUST be initialized"

    .line 19
    .line 20
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private static decodeWindowBits(Lorg/brotli/dec/BitReader;)I
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/16 p0, 0x10

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    const/4 v0, 0x3

    .line 12
    invoke-static {p0, v0}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/16 v2, 0x11

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    add-int/2addr v1, v2

    .line 21
    return v1

    .line 22
    :cond_1
    invoke-static {p0, v0}, Lorg/brotli/dec/BitReader;->readBits(Lorg/brotli/dec/BitReader;I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    add-int/lit8 p0, p0, 0x8

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    return v2
.end method

.method public static setInput(Lorg/brotli/dec/State;Ljava/io/InputStream;)V
    .locals 1

    .line 1
    iget v0, p0, Lorg/brotli/dec/State;->runningState:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 6
    .line 7
    invoke-static {v0, p1}, Lorg/brotli/dec/BitReader;->init(Lorg/brotli/dec/BitReader;Ljava/io/InputStream;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lorg/brotli/dec/State;->br:Lorg/brotli/dec/BitReader;

    .line 11
    .line 12
    invoke-static {p1}, Lorg/brotli/dec/State;->decodeWindowBits(Lorg/brotli/dec/BitReader;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/16 v0, 0x9

    .line 17
    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    shl-int p1, v0, p1

    .line 22
    .line 23
    iput p1, p0, Lorg/brotli/dec/State;->maxRingBufferSize:I

    .line 24
    .line 25
    add-int/lit8 p1, p1, -0x10

    .line 26
    .line 27
    iput p1, p0, Lorg/brotli/dec/State;->maxBackwardDistance:I

    .line 28
    .line 29
    iput v0, p0, Lorg/brotli/dec/State;->runningState:I

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const-string p0, "Invalid \'windowBits\' code"

    .line 33
    .line 34
    invoke-static {p0}, Lorg/brotli/dec/a;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const-string p0, "State MUST be uninitialized"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

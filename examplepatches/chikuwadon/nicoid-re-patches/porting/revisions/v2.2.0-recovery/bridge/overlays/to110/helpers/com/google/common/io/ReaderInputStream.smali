.class final Lcom/google/common/io/ReaderInputStream;
.super Ljava/io/InputStream;
.source "ReaderInputStream.java"


# instance fields
.field private byteBuffer:Ljava/nio/ByteBuffer;

.field private charBuffer:Ljava/nio/CharBuffer;

.field private doneFlushing:Z

.field private draining:Z

.field private final encoder:Ljava/nio/charset/CharsetEncoder;

.field private endOfInput:Z

.field private final reader:Ljava/io/Reader;

.field private final singleByte:[B


# direct methods
.method constructor <init>(Ljava/io/Reader;Ljava/nio/charset/Charset;I)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "reader",
            "charset",
            "bufferSize"
        }
    .end annotation

    .line 90
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object p2

    sget-object v0, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    .line 91
    invoke-virtual {p2, v0}, Ljava/nio/charset/CharsetEncoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    move-result-object p2

    sget-object v0, Ljava/nio/charset/CodingErrorAction;->REPLACE:Ljava/nio/charset/CodingErrorAction;

    .line 92
    invoke-virtual {p2, v0}, Ljava/nio/charset/CharsetEncoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    move-result-object p2

    .line 87
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/io/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/nio/charset/CharsetEncoder;I)V

    return-void
.end method

.method constructor <init>(Ljava/io/Reader;Ljava/nio/charset/CharsetEncoder;I)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "reader",
            "encoder",
            "bufferSize"
        }
    .end annotation

    .line 105
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x1

    .line 53
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/google/common/io/ReaderInputStream;->singleByte:[B

    .line 106
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/Reader;

    iput-object p1, p0, Lcom/google/common/io/ReaderInputStream;->reader:Ljava/io/Reader;

    .line 107
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/nio/charset/CharsetEncoder;

    iput-object p1, p0, Lcom/google/common/io/ReaderInputStream;->encoder:Ljava/nio/charset/CharsetEncoder;

    if-gtz p3, :cond_0

    const/4 v0, 0x0

    .line 108
    :cond_0
    const-string p1, "bufferSize must be positive: %s"

    invoke-static {v0, p1, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    .line 109
    invoke-virtual {p2}, Ljava/nio/charset/CharsetEncoder;->reset()Ljava/nio/charset/CharsetEncoder;

    .line 111
    invoke-static {p3}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    .line 112
    invoke-static {p1}, Lcom/google/common/io/Java8Compatibility;->flip(Ljava/nio/Buffer;)V

    .line 114
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    return-void
.end method

.method private static availableCapacity(Ljava/nio/Buffer;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 234
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    move-result v0

    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method private drain([BII)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation

    .line 256
    iget-object v0, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 257
    iget-object p0, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p1, p2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    return p3
.end method

.method private static grow(Ljava/nio/CharBuffer;)Ljava/nio/CharBuffer;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buf"
        }
    .end annotation

    .line 195
    invoke-virtual {p0}, Ljava/nio/CharBuffer;->array()[C

    move-result-object v0

    invoke-virtual {p0}, Ljava/nio/CharBuffer;->capacity()I

    move-result v1

    shl-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([CI)[C

    move-result-object v0

    .line 196
    invoke-static {v0}, Ljava/nio/CharBuffer;->wrap([C)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 197
    invoke-virtual {p0}, Ljava/nio/CharBuffer;->position()I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/common/io/Java8Compatibility;->position(Ljava/nio/Buffer;I)V

    .line 198
    invoke-virtual {p0}, Ljava/nio/CharBuffer;->limit()I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/io/Java8Compatibility;->limit(Ljava/nio/Buffer;I)V

    return-object v0
.end method

.method private readMoreChars()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 212
    iget-object v0, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    invoke-static {v0}, Lcom/google/common/io/ReaderInputStream;->availableCapacity(Ljava/nio/Buffer;)I

    move-result v0

    if-nez v0, :cond_1

    .line 213
    iget-object v0, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->position()I

    move-result v0

    .line 218
    iget-object v1, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    if-lez v0, :cond_0

    .line 215
    invoke-virtual {v1}, Ljava/nio/CharBuffer;->compact()Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/io/Java8Compatibility;->flip(Ljava/nio/Buffer;)V

    goto :goto_0

    .line 218
    :cond_0
    invoke-static {v1}, Lcom/google/common/io/ReaderInputStream;->grow(Ljava/nio/CharBuffer;)Ljava/nio/CharBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    .line 223
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->limit()I

    move-result v0

    .line 224
    iget-object v1, p0, Lcom/google/common/io/ReaderInputStream;->reader:Ljava/io/Reader;

    iget-object v2, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    invoke-virtual {v2}, Ljava/nio/CharBuffer;->array()[C

    move-result-object v2

    iget-object v3, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    invoke-static {v3}, Lcom/google/common/io/ReaderInputStream;->availableCapacity(Ljava/nio/Buffer;)I

    move-result v3

    invoke-virtual {v1, v2, v0, v3}, Ljava/io/Reader;->read([CII)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    const/4 v0, 0x1

    .line 226
    iput-boolean v0, p0, Lcom/google/common/io/ReaderInputStream;->endOfInput:Z

    return-void

    .line 228
    :cond_2
    iget-object p0, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    add-int/2addr v0, v1

    invoke-static {p0, v0}, Lcom/google/common/io/Java8Compatibility;->limit(Ljava/nio/Buffer;I)V

    return-void
.end method

.method private startDraining(Z)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "overflow"
        }
    .end annotation

    .line 243
    iget-object v0, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/google/common/io/Java8Compatibility;->flip(Ljava/nio/Buffer;)V

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 244
    iget-object p1, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    if-nez p1, :cond_0

    .line 245
    iget-object p1, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result p1

    shl-int/2addr p1, v0

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    return-void

    .line 247
    :cond_0
    iput-boolean v0, p0, Lcom/google/common/io/ReaderInputStream;->draining:Z

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    iget-object p0, p0, Lcom/google/common/io/ReaderInputStream;->reader:Ljava/io/Reader;

    invoke-virtual {p0}, Ljava/io/Reader;->close()V

    return-void
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lcom/google/common/io/ReaderInputStream;->singleByte:[B

    invoke-virtual {p0, v0}, Lcom/google/common/io/ReaderInputStream;->read([B)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object p0, p0, Lcom/google/common/io/ReaderInputStream;->singleByte:[B

    const/4 v0, 0x0

    aget-byte p0, p0, v0

    invoke-static {p0}, Ljava/lang/Byte;->toUnsignedInt(B)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public read([BII)I
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    add-int v0, p2, p3

    .line 132
    array-length v1, p1

    invoke-static {p2, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    const/4 v0, 0x0

    if-nez p3, :cond_0

    return v0

    .line 139
    :cond_0
    iget-boolean v1, p0, Lcom/google/common/io/ReaderInputStream;->endOfInput:Z

    move v2, v0

    .line 145
    :goto_0
    iget-boolean v3, p0, Lcom/google/common/io/ReaderInputStream;->draining:Z

    if-eqz v3, :cond_3

    add-int v3, p2, v2

    sub-int v4, p3, v2

    .line 146
    invoke-direct {p0, p1, v3, v4}, Lcom/google/common/io/ReaderInputStream;->drain([BII)I

    move-result v3

    add-int/2addr v2, v3

    if-eq v2, p3, :cond_1

    .line 147
    iget-boolean v3, p0, Lcom/google/common/io/ReaderInputStream;->doneFlushing:Z

    if-nez v3, :cond_1

    .line 150
    iput-boolean v0, p0, Lcom/google/common/io/ReaderInputStream;->draining:Z

    .line 151
    iget-object v3, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v3}, Lcom/google/common/io/Java8Compatibility;->clear(Ljava/nio/Buffer;)V

    goto :goto_1

    :cond_1
    if-lez v2, :cond_2

    return v2

    :cond_2
    const/4 p0, -0x1

    return p0

    .line 158
    :cond_3
    :goto_1
    iget-boolean v3, p0, Lcom/google/common/io/ReaderInputStream;->doneFlushing:Z

    if-eqz v3, :cond_4

    .line 159
    sget-object v3, Ljava/nio/charset/CoderResult;->UNDERFLOW:Ljava/nio/charset/CoderResult;

    goto :goto_2

    .line 163
    :cond_4
    iget-object v3, p0, Lcom/google/common/io/ReaderInputStream;->encoder:Ljava/nio/charset/CharsetEncoder;

    if-eqz v1, :cond_5

    .line 161
    iget-object v4, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v4}, Ljava/nio/charset/CharsetEncoder;->flush(Ljava/nio/ByteBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v3

    goto :goto_2

    .line 163
    :cond_5
    iget-object v4, p0, Lcom/google/common/io/ReaderInputStream;->charBuffer:Ljava/nio/CharBuffer;

    iget-object v5, p0, Lcom/google/common/io/ReaderInputStream;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-boolean v6, p0, Lcom/google/common/io/ReaderInputStream;->endOfInput:Z

    invoke-virtual {v3, v4, v5, v6}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;Ljava/nio/ByteBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v3

    .line 166
    :goto_2
    invoke-virtual {v3}, Ljava/nio/charset/CoderResult;->isOverflow()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_6

    .line 168
    invoke-direct {p0, v5}, Lcom/google/common/io/ReaderInputStream;->startDraining(Z)V

    goto :goto_0

    .line 170
    :cond_6
    invoke-virtual {v3}, Ljava/nio/charset/CoderResult;->isUnderflow()Z

    move-result v4

    if-eqz v4, :cond_9

    if-eqz v1, :cond_7

    .line 176
    iput-boolean v5, p0, Lcom/google/common/io/ReaderInputStream;->doneFlushing:Z

    .line 177
    invoke-direct {p0, v0}, Lcom/google/common/io/ReaderInputStream;->startDraining(Z)V

    goto :goto_0

    .line 179
    :cond_7
    iget-boolean v3, p0, Lcom/google/common/io/ReaderInputStream;->endOfInput:Z

    if-eqz v3, :cond_8

    move v1, v5

    goto :goto_1

    .line 182
    :cond_8
    invoke-direct {p0}, Lcom/google/common/io/ReaderInputStream;->readMoreChars()V

    goto :goto_1

    .line 184
    :cond_9
    invoke-virtual {v3}, Ljava/nio/charset/CoderResult;->isError()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 186
    invoke-virtual {v3}, Ljava/nio/charset/CoderResult;->throwException()V

    return v0
.end method

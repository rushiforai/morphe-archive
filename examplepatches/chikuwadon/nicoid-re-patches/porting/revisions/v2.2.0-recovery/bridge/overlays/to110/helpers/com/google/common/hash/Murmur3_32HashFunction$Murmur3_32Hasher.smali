.class final Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;
.super Lcom/google/common/hash/AbstractHasher;
.source "Murmur3_32HashFunction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/Murmur3_32HashFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Murmur3_32Hasher"
.end annotation


# instance fields
.field private buffer:J

.field private h1:I

.field private isDone:Z

.field private length:I

.field private shift:I


# direct methods
.method constructor <init>(I)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "seed"
        }
    .end annotation

    .line 279
    invoke-direct {p0}, Lcom/google/common/hash/AbstractHasher;-><init>()V

    .line 280
    iput p1, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->h1:I

    const/4 p1, 0x0

    .line 281
    iput p1, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->length:I

    .line 282
    iput-boolean p1, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->isDone:Z

    return-void
.end method

.method private update(IJ)V
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "nBytes",
            "update"
        }
    .end annotation

    .line 287
    iget-wide v0, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->buffer:J

    const-wide v2, 0xffffffffL

    and-long/2addr p2, v2

    iget v2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->shift:I

    shl-long/2addr p2, v2

    or-long/2addr v0, p2

    iput-wide v0, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->buffer:J

    shl-int/lit8 p2, p1, 0x3

    add-int/2addr v2, p2

    .line 288
    iput v2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->shift:I

    .line 289
    iget p2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->length:I

    add-int/2addr p2, p1

    iput p2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->length:I

    const/16 p1, 0x20

    if-lt v2, p1, :cond_0

    .line 292
    iget p2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->h1:I

    long-to-int p3, v0

    # invokes: Lcom/google/common/hash/Murmur3_32HashFunction;->mixK1(I)I
    invoke-static {p3}, Lcom/google/common/hash/Murmur3_32HashFunction;->access$000(I)I

    move-result p3

    # invokes: Lcom/google/common/hash/Murmur3_32HashFunction;->mixH1(II)I
    invoke-static {p2, p3}, Lcom/google/common/hash/Murmur3_32HashFunction;->access$100(II)I

    move-result p2

    iput p2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->h1:I

    .line 293
    iget-wide p2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->buffer:J

    ushr-long/2addr p2, p1

    iput-wide p2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->buffer:J

    .line 294
    iget p2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->shift:I

    sub-int/2addr p2, p1

    iput p2, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->shift:I

    :cond_0
    return-void
.end method


# virtual methods
.method public hash()Lcom/google/common/hash/HashCode;
    .registers 4

    .line 404
    iget-boolean v0, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->isDone:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 405
    iput-boolean v1, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->isDone:Z

    .line 406
    iget v0, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->h1:I

    iget-wide v1, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->buffer:J

    long-to-int v1, v1

    # invokes: Lcom/google/common/hash/Murmur3_32HashFunction;->mixK1(I)I
    invoke-static {v1}, Lcom/google/common/hash/Murmur3_32HashFunction;->access$000(I)I

    move-result v1

    xor-int/2addr v0, v1

    iput v0, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->h1:I

    .line 407
    iget p0, p0, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->length:I

    # invokes: Lcom/google/common/hash/Murmur3_32HashFunction;->fmix(II)Lcom/google/common/hash/HashCode;
    invoke-static {v0, p0}, Lcom/google/common/hash/Murmur3_32HashFunction;->access$600(II)Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public putByte(B)Lcom/google/common/hash/Hasher;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    and-int/lit16 p1, p1, 0xff

    int-to-long v0, p1

    const/4 p1, 0x1

    .line 301
    invoke-direct {p0, p1, v0, v1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    return-object p0
.end method

.method public bridge synthetic putByte(B)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "b"
        }
    .end annotation

    .line 272
    invoke-virtual {p0, p1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putByte(B)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 322
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    .line 323
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 324
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/4 v2, 0x4

    if-lt v1, v2, :cond_0

    .line 325
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putInt(I)Lcom/google/common/hash/Hasher;

    goto :goto_0

    .line 327
    :cond_0
    :goto_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 328
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putByte(B)Lcom/google/common/hash/Hasher;

    goto :goto_1

    .line 330
    :cond_1
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    return-object p0
.end method

.method public putBytes([BII)Lcom/google/common/hash/Hasher;
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "off",
            "len"
        }
    .end annotation

    add-int v0, p2, p3

    .line 308
    array-length v1, p1

    invoke-static {p2, v0, v1}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v1, v0, 0x4

    if-gt v1, p3, :cond_0

    add-int/2addr v0, p2

    .line 311
    # invokes: Lcom/google/common/hash/Murmur3_32HashFunction;->getIntLittleEndian([BI)I
    invoke-static {p1, v0}, Lcom/google/common/hash/Murmur3_32HashFunction;->access$200([BI)I

    move-result v0

    int-to-long v2, v0

    const/4 v0, 0x4

    invoke-direct {p0, v0, v2, v3}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    move v0, v1

    goto :goto_0

    :cond_0
    :goto_1
    if-ge v0, p3, :cond_1

    add-int v1, p2, v0

    .line 314
    aget-byte v1, p1, v1

    invoke-virtual {p0, v1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putByte(B)Lcom/google/common/hash/Hasher;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-object p0
.end method

.method public bridge synthetic putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 272
    invoke-virtual {p0, p1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putBytes([BII)Lcom/google/common/hash/PrimitiveSink;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x1000
        }
        names = {
            "bytes",
            "off",
            "len"
        }
    .end annotation

    .line 272
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putBytes([BII)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putChar(C)Lcom/google/common/hash/Hasher;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    const/4 v0, 0x2

    int-to-long v1, p1

    .line 352
    invoke-direct {p0, v0, v1, v2}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    return-object p0
.end method

.method public bridge synthetic putChar(C)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "c"
        }
    .end annotation

    .line 272
    invoke-virtual {p0, p1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putChar(C)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putInt(I)Lcom/google/common/hash/Hasher;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "i"
        }
    .end annotation

    const/4 v0, 0x4

    int-to-long v1, p1

    .line 337
    invoke-direct {p0, v0, v1, v2}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    return-object p0
.end method

.method public bridge synthetic putInt(I)Lcom/google/common/hash/PrimitiveSink;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "i"
        }
    .end annotation

    .line 272
    invoke-virtual {p0, p1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putInt(I)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putLong(J)Lcom/google/common/hash/Hasher;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "l"
        }
    .end annotation

    long-to-int v0, p1

    int-to-long v0, v0

    const/4 v2, 0x4

    .line 344
    invoke-direct {p0, v2, v0, v1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    const/16 v0, 0x20

    ushr-long/2addr p1, v0

    .line 345
    invoke-direct {p0, v2, p1, p2}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    return-object p0
.end method

.method public bridge synthetic putLong(J)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "l"
        }
    .end annotation

    .line 272
    invoke-virtual {p0, p1, p2}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putLong(J)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public putString(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lcom/google/common/hash/Hasher;
    .registers 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "input",
            "charset"
        }
    .end annotation

    .line 359
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 360
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    add-int/lit8 v2, v1, 0x4

    const/4 v3, 0x4

    const/16 v4, 0x80

    if-gt v2, v0, :cond_0

    .line 365
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    add-int/lit8 v6, v1, 0x1

    .line 366
    invoke-interface {p1, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    add-int/lit8 v7, v1, 0x2

    .line 367
    invoke-interface {p1, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    add-int/lit8 v8, v1, 0x3

    .line 368
    invoke-interface {p1, v8}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v8

    if-ge v5, v4, :cond_0

    if-ge v6, v4, :cond_0

    if-ge v7, v4, :cond_0

    if-ge v8, v4, :cond_0

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v5, v6

    shl-int/lit8 v7, v7, 0x10

    or-int/2addr v5, v7

    shl-int/lit8 v8, v8, 0x18

    or-int/2addr v5, v8

    int-to-long v4, v5

    .line 370
    invoke-direct {p0, v3, v4, v5}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    move v1, v2

    goto :goto_0

    :cond_0
    :goto_1
    if-ge v1, v0, :cond_5

    .line 378
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/4 v5, 0x1

    if-ge v2, v4, :cond_1

    int-to-long v6, v2

    .line 380
    invoke-direct {p0, v5, v6, v7}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    goto :goto_2

    :cond_1
    const/16 v6, 0x800

    if-ge v2, v6, :cond_2

    .line 382
    # invokes: Lcom/google/common/hash/Murmur3_32HashFunction;->charToTwoUtf8Bytes(C)J
    invoke-static {v2}, Lcom/google/common/hash/Murmur3_32HashFunction;->access$300(C)J

    move-result-wide v6

    const/4 v2, 0x2

    invoke-direct {p0, v2, v6, v7}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    goto :goto_2

    :cond_2
    const v6, 0xd800

    if-lt v2, v6, :cond_4

    const v6, 0xdfff

    if-gt v2, v6, :cond_4

    .line 386
    invoke-static {p1, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v6

    if-ne v6, v2, :cond_3

    .line 389
    invoke-interface {p1, v1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putBytes([B)Lcom/google/common/hash/Hasher;

    return-object p0

    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 393
    # invokes: Lcom/google/common/hash/Murmur3_32HashFunction;->codePointToFourUtf8Bytes(I)J
    invoke-static {v6}, Lcom/google/common/hash/Murmur3_32HashFunction;->access$500(I)J

    move-result-wide v6

    invoke-direct {p0, v3, v6, v7}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    goto :goto_2

    .line 384
    :cond_4
    # invokes: Lcom/google/common/hash/Murmur3_32HashFunction;->charToThreeUtf8Bytes(C)J
    invoke-static {v2}, Lcom/google/common/hash/Murmur3_32HashFunction;->access$400(C)J

    move-result-wide v6

    const/4 v2, 0x3

    invoke-direct {p0, v2, v6, v7}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->update(IJ)V

    :goto_2
    add-int/2addr v1, v5

    goto :goto_1

    :cond_5
    return-object p0

    .line 398
    :cond_6
    invoke-super {p0, p1, p2}, Lcom/google/common/hash/AbstractHasher;->putString(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putString(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "input",
            "charset"
        }
    .end annotation

    .line 272
    invoke-virtual {p0, p1, p2}, Lcom/google/common/hash/Murmur3_32HashFunction$Murmur3_32Hasher;->putString(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lcom/google/common/hash/Hasher;

    move-result-object p0

    return-object p0
.end method

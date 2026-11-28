.class Lcom/google/common/io/ByteSource$ByteArrayByteSource;
.super Lcom/google/common/io/ByteSource;
.source "ByteSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/ByteSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArrayByteSource"
.end annotation


# instance fields
.field final bytes:[B

.field final length:I

.field final offset:I


# direct methods
.method constructor <init>([B)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    const/4 v0, 0x0

    .line 570
    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/google/common/io/ByteSource$ByteArrayByteSource;-><init>([BII)V

    return-void
.end method

.method constructor <init>([BII)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "offset",
            "length"
        }
    .end annotation

    .line 574
    invoke-direct {p0}, Lcom/google/common/io/ByteSource;-><init>()V

    .line 575
    iput-object p1, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->bytes:[B

    .line 576
    iput p2, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->offset:I

    .line 577
    iput p3, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    return-void
.end method


# virtual methods
.method public copyTo(Ljava/io/OutputStream;)J
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "output"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 620
    iget-object v0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->bytes:[B

    iget v1, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->offset:I

    iget v2, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 621
    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    int-to-long p0, p0

    return-wide p0
.end method

.method public hash(Lcom/google/common/hash/HashFunction;)Lcom/google/common/hash/HashCode;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hashFunction"
        }
    .end annotation

    .line 626
    iget-object v0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->bytes:[B

    iget v1, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->offset:I

    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    invoke-interface {p1, v0, v1, p0}, Lcom/google/common/hash/HashFunction;->hashBytes([BII)Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 592
    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public openBufferedStream()Ljava/io/InputStream;
    .registers 1

    .line 587
    invoke-virtual {p0}, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->openStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public final openStream()Ljava/io/InputStream;
    .registers 4

    .line 582
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->bytes:[B

    iget v2, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->offset:I

    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    invoke-direct {v0, v1, v2, p0}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    return-object v0
.end method

.method public read(Lcom/google/common/io/ByteProcessor;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "processor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/io/ByteProcessor<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 614
    iget-object v0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->bytes:[B

    iget v1, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->offset:I

    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    invoke-interface {p1, v0, v1, p0}, Lcom/google/common/io/ByteProcessor;->processBytes([BII)Z

    .line 615
    invoke-interface {p1}, Lcom/google/common/io/ByteProcessor;->getResult()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public read()[B
    .registers 3

    .line 607
    iget-object v0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->bytes:[B

    iget v1, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->offset:I

    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    add-int/2addr p0, v1

    invoke-static {v0, v1, p0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    return-object p0
.end method

.method public size()J
    .registers 3

    .line 597
    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    int-to-long v0, p0

    return-wide v0
.end method

.method public sizeIfKnown()Lcom/google/common/base/Optional;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 602
    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    int-to-long v0, p0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object p0

    return-object p0
.end method

.method public slice(JJ)Lcom/google/common/io/ByteSource;
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "offset",
            "length"
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ltz v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    .line 631
    :goto_0
    const-string v5, "offset (%s) may not be negative"

    invoke-static {v2, v5, p1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    cmp-long v0, p3, v0

    if-gez v0, :cond_1

    move v3, v4

    .line 632
    :cond_1
    const-string v0, "length (%s) may not be negative"

    invoke-static {v3, v0, p3, p4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 634
    iget v0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    int-to-long v0, v0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    .line 635
    iget v0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    int-to-long v0, v0

    sub-long/2addr v0, p1

    invoke-static {p3, p4, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p3

    .line 636
    iget v0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->offset:I

    long-to-int p1, p1

    add-int/2addr v0, p1

    .line 637
    new-instance p1, Lcom/google/common/io/ByteSource$ByteArrayByteSource;

    iget-object p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->bytes:[B

    long-to-int p2, p3

    invoke-direct {p1, p0, v0, p2}, Lcom/google/common/io/ByteSource$ByteArrayByteSource;-><init>([BII)V

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 642
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ByteSource.wrap("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 643
    invoke-static {}, Lcom/google/common/io/BaseEncoding;->base16()Lcom/google/common/io/BaseEncoding;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->bytes:[B

    iget v3, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->offset:I

    iget p0, p0, Lcom/google/common/io/ByteSource$ByteArrayByteSource;->length:I

    invoke-virtual {v1, v2, v3, p0}, Lcom/google/common/io/BaseEncoding;->encode([BII)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x1e

    const-string v2, "..."

    invoke-static {p0, v1, v2}, Lcom/google/common/base/Ascii;->truncate(Ljava/lang/CharSequence;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

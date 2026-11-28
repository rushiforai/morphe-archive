.class final Lcom/google/common/io/ByteSource$SlicedByteSource;
.super Lcom/google/common/io/ByteSource;
.source "ByteSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/ByteSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SlicedByteSource"
.end annotation


# instance fields
.field final length:J

.field final offset:J

.field final synthetic this$0:Lcom/google/common/io/ByteSource;


# direct methods
.method constructor <init>(Lcom/google/common/io/ByteSource;JJ)V
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "offset",
            "length"
        }
    .end annotation

    .line 488
    iput-object p1, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->this$0:Lcom/google/common/io/ByteSource;

    invoke-direct {p0}, Lcom/google/common/io/ByteSource;-><init>()V

    const-wide/16 v0, 0x0

    cmp-long p1, p2, v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ltz p1, :cond_0

    move p1, v2

    goto :goto_0

    :cond_0
    move p1, v3

    .line 489
    :goto_0
    const-string v4, "offset (%s) may not be negative"

    invoke-static {p1, v4, p2, p3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    cmp-long p1, p4, v0

    if-gez p1, :cond_1

    move v2, v3

    .line 490
    :cond_1
    const-string p1, "length (%s) may not be negative"

    invoke-static {v2, p1, p4, p5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 491
    iput-wide p2, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->offset:J

    .line 492
    iput-wide p4, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->length:J

    return-void
.end method

.method private sliceStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 506
    iget-wide v0, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->offset:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 509
    :try_start_0
    invoke-static {p1, v0, v1}, Lcom/google/common/io/ByteStreams;->skipUpTo(Ljava/io/InputStream;J)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 520
    iget-wide v2, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->offset:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 522
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 523
    new-instance p0, Ljava/io/ByteArrayInputStream;

    const/4 p1, 0x0

    new-array p1, p1, [B

    invoke-direct {p0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object p0

    :catchall_0
    move-exception p0

    .line 511
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v0

    .line 512
    invoke-virtual {v0, p1}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    .line 514
    :try_start_1
    invoke-virtual {v0, p0}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object p0

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p0

    .line 516
    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    .line 517
    throw p0

    .line 526
    :cond_0
    iget-wide v0, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->length:J

    invoke-static {p1, v0, v1}, Lcom/google/common/io/ByteStreams;->limit(Ljava/io/InputStream;J)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public isEmpty()Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 541
    iget-wide v0, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->length:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    invoke-super {p0}, Lcom/google/common/io/ByteSource;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public openBufferedStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 502
    iget-object v0, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->this$0:Lcom/google/common/io/ByteSource;

    invoke-virtual {v0}, Lcom/google/common/io/ByteSource;->openBufferedStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/common/io/ByteSource$SlicedByteSource;->sliceStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public openStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 497
    iget-object v0, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->this$0:Lcom/google/common/io/ByteSource;

    invoke-virtual {v0}, Lcom/google/common/io/ByteSource;->openStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/common/io/ByteSource$SlicedByteSource;->sliceStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public sizeIfKnown()Lcom/google/common/base/Optional;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/base/Optional<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 546
    iget-object v0, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->this$0:Lcom/google/common/io/ByteSource;

    invoke-virtual {v0}, Lcom/google/common/io/ByteSource;->sizeIfKnown()Lcom/google/common/base/Optional;

    move-result-object v0

    .line 547
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 548
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 549
    iget-wide v2, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->offset:J

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 550
    iget-wide v4, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->length:J

    sub-long/2addr v0, v2

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object p0

    return-object p0

    .line 552
    :cond_0
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

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

    .line 531
    :goto_0
    const-string v5, "offset (%s) may not be negative"

    invoke-static {v2, v5, p1, p2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    cmp-long v2, p3, v0

    if-gez v2, :cond_1

    move v3, v4

    .line 532
    :cond_1
    const-string v2, "length (%s) may not be negative"

    invoke-static {v3, v2, p3, p4}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;J)V

    .line 533
    iget-wide v2, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->length:J

    sub-long/2addr v2, p1

    cmp-long v0, v2, v0

    if-gtz v0, :cond_2

    .line 535
    invoke-static {}, Lcom/google/common/io/ByteSource;->empty()Lcom/google/common/io/ByteSource;

    move-result-object p0

    return-object p0

    .line 536
    :cond_2
    iget-object v0, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->this$0:Lcom/google/common/io/ByteSource;

    iget-wide v4, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->offset:J

    add-long/2addr v4, p1

    invoke-static {p3, p4, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    invoke-virtual {v0, v4, v5, p0, p1}, Lcom/google/common/io/ByteSource;->slice(JJ)Lcom/google/common/io/ByteSource;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 557
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->this$0:Lcom/google/common/io/ByteSource;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".slice("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->offset:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/common/io/ByteSource$SlicedByteSource;->length:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.class public final Lnicoid/network238/okio/DeflaterSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0019\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007B\u0019\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0008J\u0018\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0010\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\nH\u0002J\u0008\u0010\u0013\u001a\u00020\u000cH\u0016J\r\u0010\u0014\u001a\u00020\u000cH\u0000\u00a2\u0006\u0002\u0008\u0015J\u0008\u0010\u0016\u001a\u00020\u000cH\u0016J\u0008\u0010\u0017\u001a\u00020\u0018H\u0016J\u0008\u0010\u0019\u001a\u00020\u001aH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001b"
    }
    d2 = {
        "Lnicoid/network238/okio/DeflaterSink;",
        "Lnicoid/network238/okio/Sink;",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "deflater",
        "Ljava/util/zip/Deflater;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSink;Ljava/util/zip/Deflater;)V",
        "(Lnicoid/network238/okio/Sink;Ljava/util/zip/Deflater;)V",
        "closed",
        "",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "deflate",
        "syncFlush",
        "flush",
        "finishDeflate",
        "finishDeflate$okio",
        "close",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "toString",
        "",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private closed:Z

.field private final deflater:Ljava/util/zip/Deflater;

.field private final sink:Lnicoid/network238/okio/BufferedSink;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSink;Ljava/util/zip/Deflater;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lnicoid/network238/okio/DeflaterSink;->sink:Lnicoid/network238/okio/BufferedSink;

    .line 25
    iput-object p2, p0, Lnicoid/network238/okio/DeflaterSink;->deflater:Ljava/util/zip/Deflater;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Sink;Ljava/util/zip/Deflater;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okio/DeflaterSink;-><init>(Lnicoid/network238/okio/BufferedSink;Ljava/util/zip/Deflater;)V

    return-void
.end method

.method private final deflate(Z)V
    .registers 10

    const-string v0, "Deflater already closed"

    .line 62
    iget-object v1, p0, Lnicoid/network238/okio/DeflaterSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v1}, Lnicoid/network238/okio/BufferedSink;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v1

    :cond_0
    :goto_0
    nop

    .line 64
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 74
    :try_start_0
    iget-object v3, p0, Lnicoid/network238/okio/DeflaterSink;->deflater:Ljava/util/zip/Deflater;

    if-eqz p1, :cond_1

    .line 72
    iget-object v4, v2, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v2, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v6, v5, 0x2000

    const/4 v7, 0x2

    invoke-virtual {v3, v4, v5, v6, v7}, Ljava/util/zip/Deflater;->deflate([BIII)I

    move-result v3

    goto :goto_1

    .line 74
    :cond_1
    iget-object v4, v2, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v2, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v6, v5, 0x2000

    invoke-virtual {v3, v4, v5, v6}, Ljava/util/zip/Deflater;->deflate([BII)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    if-lez v3, :cond_2

    .line 85
    iget v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v4, v3

    iput v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 86
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    int-to-long v2, v3

    add-long/2addr v4, v2

    invoke-virtual {v1, v4, v5}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 87
    iget-object v2, p0, Lnicoid/network238/okio/DeflaterSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    goto :goto_0

    .line 88
    :cond_2
    iget-object v3, p0, Lnicoid/network238/okio/DeflaterSink;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v3}, Ljava/util/zip/Deflater;->needsInput()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 89
    iget p1, v2, Lnicoid/network238/okio/Segment;->pos:I

    iget v0, v2, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p1, v0, :cond_3

    .line 91
    invoke-virtual {v2}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p1

    iput-object p1, v1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 92
    invoke-static {v2}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_3
    return-void

    :catch_0
    move-exception p1

    .line 81
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception p1

    .line 78
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    iget-boolean v0, p0, Lnicoid/network238/okio/DeflaterSink;->closed:Z

    if-nez v0, :cond_2

    .line 118
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okio/DeflaterSink;->finishDeflate$okio()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 124
    :goto_0
    :try_start_1
    iget-object v1, p0, Lnicoid/network238/okio/DeflaterSink;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->end()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v1

    if-nez v0, :cond_0

    move-object v0, v1

    .line 130
    :cond_0
    :goto_1
    :try_start_2
    iget-object v1, p0, Lnicoid/network238/okio/DeflaterSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v1}, Lnicoid/network238/okio/Sink;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v1

    if-nez v0, :cond_1

    move-object v0, v1

    .line 135
    :cond_1
    :goto_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/okio/DeflaterSink;->closed:Z

    if-nez v0, :cond_3

    :cond_2
    return-void

    .line 137
    :cond_3
    throw v0
.end method

.method public final finishDeflate$okio()V
    .registers 2

    .line 106
    iget-object v0, p0, Lnicoid/network238/okio/DeflaterSink;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finish()V

    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnicoid/network238/okio/DeflaterSink;->deflate(Z)V

    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lnicoid/network238/okio/DeflaterSink;->deflate(Z)V

    .line 102
    iget-object v0, p0, Lnicoid/network238/okio/DeflaterSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 140
    iget-object v0, p0, Lnicoid/network238/okio/DeflaterSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DeflaterSink("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okio/DeflaterSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    .line 38
    iget-object v0, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    .line 145
    invoke-static {p2, p3, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 40
    iget-object v3, p0, Lnicoid/network238/okio/DeflaterSink;->deflater:Ljava/util/zip/Deflater;

    iget-object v4, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v0, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {v3, v4, v5, v2}, Ljava/util/zip/Deflater;->setInput([BII)V

    .line 43
    invoke-direct {p0, v1}, Lnicoid/network238/okio/DeflaterSink;->deflate(Z)V

    .line 46
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v5, v2

    sub-long/2addr v3, v5

    invoke-virtual {p1, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 47
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v1, v2

    iput v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 48
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v1, v2, :cond_0

    .line 49
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 50
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_0
    sub-long/2addr p2, v5

    goto :goto_0

    .line 58
    :cond_1
    iget-object p1, p0, Lnicoid/network238/okio/DeflaterSink;->deflater:Ljava/util/zip/Deflater;

    invoke-static {}, Lnicoid/network238/okio/internal/_ZlibJvmKt;->getEMPTY_BYTE_ARRAY()[B

    move-result-object p2

    invoke-virtual {p1, p2, v1, v1}, Ljava/util/zip/Deflater;->setInput([BII)V

    return-void
.end method

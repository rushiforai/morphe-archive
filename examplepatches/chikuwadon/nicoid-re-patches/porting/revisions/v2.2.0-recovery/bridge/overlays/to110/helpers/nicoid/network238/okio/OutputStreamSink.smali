.class final Lnicoid/network238/okio/OutputStreamSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0018\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0016J\u0008\u0010\u000e\u001a\u00020\tH\u0016J\u0008\u0010\u000f\u001a\u00020\tH\u0016J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016J\u0008\u0010\u0010\u001a\u00020\u0011H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okio/OutputStreamSink;",
        "Lnicoid/network238/okio/Sink;",
        "out",
        "Ljava/io/OutputStream;",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "<init>",
        "(Ljava/io/OutputStream;Lnicoid/network238/okio/Timeout;)V",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "flush",
        "close",
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
.field private final out:Ljava/io/OutputStream;

.field private final timeout:Lnicoid/network238/okio/Timeout;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lnicoid/network238/okio/Timeout;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lnicoid/network238/okio/OutputStreamSink;->out:Ljava/io/OutputStream;

    .line 47
    iput-object p2, p0, Lnicoid/network238/okio/OutputStreamSink;->timeout:Lnicoid/network238/okio/Timeout;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .line 72
    iget-object v0, p0, Lnicoid/network238/okio/OutputStreamSink;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    return-void
.end method

.method public flush()V
    .registers 2

    .line 70
    iget-object v0, p0, Lnicoid/network238/okio/OutputStreamSink;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 74
    iget-object v0, p0, Lnicoid/network238/okio/OutputStreamSink;->timeout:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "sink("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okio/OutputStreamSink;->out:Ljava/io/OutputStream;

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
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    .line 54
    iget-object v0, p0, Lnicoid/network238/okio/OutputStreamSink;->timeout:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->throwIfReached()V

    .line 55
    iget-object v0, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    .line 235
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    .line 57
    iget-object v2, p0, Lnicoid/network238/okio/OutputStreamSink;->out:Ljava/io/OutputStream;

    iget-object v3, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v4, v0, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {v2, v3, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 59
    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v2, v1

    iput v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v1, v1

    sub-long/2addr p2, v1

    .line 61
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {p1, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 63
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v1, v2, :cond_0

    .line 64
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 65
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_0
    goto :goto_0

    :cond_1
    return-void
.end method

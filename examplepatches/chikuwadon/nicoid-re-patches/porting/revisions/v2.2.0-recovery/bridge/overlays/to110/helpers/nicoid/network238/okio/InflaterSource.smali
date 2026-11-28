.class public final Lnicoid/network238/okio/InflaterSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0019\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007B\u0019\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0008J\u0018\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u000eH\u0016J\u0016\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u000eJ\u0006\u0010\u0013\u001a\u00020\u000cJ\u0008\u0010\u0014\u001a\u00020\u0015H\u0002J\u0008\u0010\u0016\u001a\u00020\u0017H\u0016J\u0008\u0010\u0018\u001a\u00020\u0015H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okio/InflaterSource;",
        "Lnicoid/network238/okio/Source;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "inflater",
        "Ljava/util/zip/Inflater;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;Ljava/util/zip/Inflater;)V",
        "(Lnicoid/network238/okio/Source;Ljava/util/zip/Inflater;)V",
        "bufferBytesHeldByInflater",
        "",
        "closed",
        "",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "readOrInflate",
        "refill",
        "releaseBytesAfterInflate",
        "",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
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
.field private bufferBytesHeldByInflater:I

.field private closed:Z

.field private final inflater:Ljava/util/zip/Inflater;

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;Ljava/util/zip/Inflater;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lnicoid/network238/okio/InflaterSource;->source:Lnicoid/network238/okio/BufferedSource;

    .line 27
    iput-object p2, p0, Lnicoid/network238/okio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okio/Source;Ljava/util/zip/Inflater;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    invoke-static {p1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lnicoid/network238/okio/InflaterSource;-><init>(Lnicoid/network238/okio/BufferedSource;Ljava/util/zip/Inflater;)V

    return-void
.end method

.method private final releaseBytesAfterInflate()V
    .registers 5

    .line 116
    iget v0, p0, Lnicoid/network238/okio/InflaterSource;->bufferBytesHeldByInflater:I

    if-nez v0, :cond_0

    return-void

    .line 117
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v1}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v1

    sub-int/2addr v0, v1

    .line 118
    iget v1, p0, Lnicoid/network238/okio/InflaterSource;->bufferBytesHeldByInflater:I

    sub-int/2addr v1, v0

    iput v1, p0, Lnicoid/network238/okio/InflaterSource;->bufferBytesHeldByInflater:I

    .line 119
    iget-object v1, p0, Lnicoid/network238/okio/InflaterSource;->source:Lnicoid/network238/okio/BufferedSource;

    int-to-long v2, v0

    invoke-interface {v1, v2, v3}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    iget-boolean v0, p0, Lnicoid/network238/okio/InflaterSource;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/InflaterSource;->closed:Z

    .line 129
    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/InflaterSource;->readOrInflate(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    return-wide v0

    .line 44
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->finished()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->needsDictionary()Z

    move-result v0

    if-nez v0, :cond_2

    .line 45
    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p1, Ljava/io/EOFException;

    const-string p2, "source exhausted prematurely"

    invoke-direct {p1, p2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const-wide/16 p1, -0x1

    return-wide p1
.end method

.method public final readOrInflate(Lnicoid/network238/okio/Buffer;J)J
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_4

    .line 60
    iget-boolean v3, p0, Lnicoid/network238/okio/InflaterSource;->closed:Z

    if-nez v3, :cond_3

    if-nez v2, :cond_0

    goto :goto_0

    .line 65
    :cond_0
    const/4 v2, 0x1

    :try_start_0
    invoke-virtual {p1, v2}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 66
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v3, v3, 0x2000

    int-to-long v3, v3

    .line 134
    invoke-static {p2, p3, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    long-to-int p2, p2

    .line 69
    invoke-virtual {p0}, Lnicoid/network238/okio/InflaterSource;->refill()Z

    .line 72
    iget-object p3, p0, Lnicoid/network238/okio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    iget-object v3, v2, Lnicoid/network238/okio/Segment;->data:[B

    iget v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    invoke-virtual {p3, v3, v4, p2}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result p2

    .line 75
    invoke-direct {p0}, Lnicoid/network238/okio/InflaterSource;->releaseBytesAfterInflate()V

    if-lez p2, :cond_1

    .line 79
    iget p3, v2, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr p3, p2

    iput p3, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 80
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    int-to-long p2, p2

    add-long/2addr v0, p2

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-wide p2

    .line 85
    :cond_1
    iget p2, v2, Lnicoid/network238/okio/Segment;->pos:I

    iget p3, v2, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p2, p3, :cond_2

    .line 86
    invoke-virtual {v2}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p2

    iput-object p2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 87
    invoke-static {v2}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    :goto_0
    return-wide v0

    :catch_0
    move-exception p1

    .line 92
    new-instance p2, Ljava/io/IOException;

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 60
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 59
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "byteCount < 0: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final refill()Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 105
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    .line 108
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    iget-object v0, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v2, v3

    iput v2, p0, Lnicoid/network238/okio/InflaterSource;->bufferBytesHeldByInflater:I

    .line 110
    iget-object v4, p0, Lnicoid/network238/okio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    iget-object v0, v0, Lnicoid/network238/okio/Segment;->data:[B

    invoke-virtual {v4, v0, v3, v2}, Ljava/util/zip/Inflater;->setInput([BII)V

    return v1
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 122
    iget-object v0, p0, Lnicoid/network238/okio/InflaterSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

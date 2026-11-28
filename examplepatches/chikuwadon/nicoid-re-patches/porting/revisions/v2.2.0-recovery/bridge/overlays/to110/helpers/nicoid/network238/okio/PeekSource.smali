.class public final Lnicoid/network238/okio/PeekSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0018\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u000fH\u0016J\u0008\u0010\u0013\u001a\u00020\u0014H\u0016J\u0008\u0010\u0015\u001a\u00020\u0016H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lnicoid/network238/okio/PeekSource;",
        "Lnicoid/network238/okio/Source;",
        "upstream",
        "Lnicoid/network238/okio/BufferedSource;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;)V",
        "buffer",
        "Lnicoid/network238/okio/Buffer;",
        "expectedSegment",
        "Lnicoid/network238/okio/Segment;",
        "expectedPos",
        "",
        "closed",
        "",
        "pos",
        "",
        "read",
        "sink",
        "byteCount",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
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
.field private final buffer:Lnicoid/network238/okio/Buffer;

.field private closed:Z

.field private expectedPos:I

.field private expectedSegment:Lnicoid/network238/okio/Segment;

.field private pos:J

.field private final upstream:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lnicoid/network238/okio/PeekSource;->upstream:Lnicoid/network238/okio/BufferedSource;

    .line 31
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/PeekSource;->buffer:Lnicoid/network238/okio/Buffer;

    .line 32
    iget-object p1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    iput-object p1, p0, Lnicoid/network238/okio/PeekSource;->expectedSegment:Lnicoid/network238/okio/Segment;

    if-eqz p1, :cond_0

    .line 33
    iget p1, p1, Lnicoid/network238/okio/Segment;->pos:I

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    iput p1, p0, Lnicoid/network238/okio/PeekSource;->expectedPos:I

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/PeekSource;->closed:Z

    return-void
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_6

    .line 40
    iget-boolean v3, p0, Lnicoid/network238/okio/PeekSource;->closed:Z

    if-nez v3, :cond_5

    .line 44
    iget-object v3, p0, Lnicoid/network238/okio/PeekSource;->expectedSegment:Lnicoid/network238/okio/Segment;

    if-eqz v3, :cond_1

    .line 45
    iget-object v4, p0, Lnicoid/network238/okio/PeekSource;->buffer:Lnicoid/network238/okio/Buffer;

    iget-object v4, v4, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-ne v3, v4, :cond_0

    iget v3, p0, Lnicoid/network238/okio/PeekSource;->expectedPos:I

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v4, v4, Lnicoid/network238/okio/Segment;->pos:I

    if-ne v3, v4, :cond_0

    goto :goto_0

    .line 43
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Peek source is invalid because upstream source was used"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    if-nez v2, :cond_2

    return-wide v0

    .line 50
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okio/PeekSource;->upstream:Lnicoid/network238/okio/BufferedSource;

    iget-wide v1, p0, Lnicoid/network238/okio/PeekSource;->pos:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    invoke-interface {v0, v1, v2}, Lnicoid/network238/okio/BufferedSource;->request(J)Z

    move-result v0

    if-nez v0, :cond_3

    const-wide/16 p1, -0x1

    return-wide p1

    .line 52
    :cond_3
    iget-object v0, p0, Lnicoid/network238/okio/PeekSource;->expectedSegment:Lnicoid/network238/okio/Segment;

    if-nez v0, :cond_4

    iget-object v0, p0, Lnicoid/network238/okio/PeekSource;->buffer:Lnicoid/network238/okio/Buffer;

    iget-object v0, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v0, :cond_4

    .line 56
    iput-object v0, p0, Lnicoid/network238/okio/PeekSource;->expectedSegment:Lnicoid/network238/okio/Segment;

    .line 57
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, v0, Lnicoid/network238/okio/Segment;->pos:I

    iput v0, p0, Lnicoid/network238/okio/PeekSource;->expectedPos:I

    .line 60
    :cond_4
    iget-object v0, p0, Lnicoid/network238/okio/PeekSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    iget-wide v2, p0, Lnicoid/network238/okio/PeekSource;->pos:J

    sub-long/2addr v0, v2

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    .line 61
    iget-object v2, p0, Lnicoid/network238/okio/PeekSource;->buffer:Lnicoid/network238/okio/Buffer;

    iget-wide v4, p0, Lnicoid/network238/okio/PeekSource;->pos:J

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lnicoid/network238/okio/Buffer;->copyTo(Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;

    .line 62
    iget-wide p1, p0, Lnicoid/network238/okio/PeekSource;->pos:J

    add-long/2addr p1, v6

    iput-wide p1, p0, Lnicoid/network238/okio/PeekSource;->pos:J

    return-wide v6

    .line 40
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 39
    :cond_6
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

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 67
    iget-object v0, p0, Lnicoid/network238/okio/PeekSource;->upstream:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

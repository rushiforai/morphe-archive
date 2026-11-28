.class public final Lnicoid/network238/okio/CipherSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0018\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0018\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0015\u001a\u00020\u0013H\u0002J\u0008\u0010\u0016\u001a\u00020\u000fH\u0016J\u0008\u0010\u0017\u001a\u00020\u0018H\u0016J\u0008\u0010\u0019\u001a\u00020\u000fH\u0016J\n\u0010\u001a\u001a\u0004\u0018\u00010\u001bH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okio/CipherSink;",
        "Lnicoid/network238/okio/Sink;",
        "sink",
        "Lnicoid/network238/okio/BufferedSink;",
        "cipher",
        "Ljavax/crypto/Cipher;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSink;Ljavax/crypto/Cipher;)V",
        "getCipher",
        "()Ljavax/crypto/Cipher;",
        "blockSize",
        "",
        "closed",
        "",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "update",
        "remaining",
        "flush",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
        "doFinal",
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
.field private final blockSize:I

.field private final cipher:Ljavax/crypto/Cipher;

.field private closed:Z

.field private final sink:Lnicoid/network238/okio/BufferedSink;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSink;Ljavax/crypto/Cipher;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    .line 23
    iput-object p2, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    .line 25
    invoke-virtual {p2}, Ljavax/crypto/Cipher;->getBlockSize()I

    move-result p1

    iput p1, p0, Lnicoid/network238/okio/CipherSink;->blockSize:I

    if-lez p1, :cond_0

    return-void

    .line 30
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Block cipher required "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private final doFinal()Ljava/lang/Throwable;
    .registers 9

    .line 110
    iget-object v0, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/16 v2, 0x2000

    if-le v0, v2, :cond_1

    .line 118
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    iget-object v2, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v2}, Ljavax/crypto/Cipher;->doFinal()[B

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0, v2}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    return-object v1

    :catchall_0
    move-exception v0

    return-object v0

    :cond_1
    nop

    .line 126
    iget-object v2, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSink;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v2

    .line 129
    invoke-virtual {v2, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v0

    .line 132
    :try_start_1
    iget-object v3, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    iget-object v4, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v0, Lnicoid/network238/okio/Segment;->limit:I

    invoke-virtual {v3, v4, v5}, Ljavax/crypto/Cipher;->doFinal([BI)I

    move-result v3

    .line 134
    iget v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v4, v3

    iput v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    .line 135
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    int-to-long v6, v3

    add-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v1

    .line 140
    :goto_0
    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v3, v4, :cond_2

    .line 141
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v3

    iput-object v3, v2, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 142
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_2
    return-object v1
.end method

.method private final update(Lnicoid/network238/okio/Buffer;J)I
    .registers 14

    .line 46
    iget-object v0, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    .line 150
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    .line 48
    iget-object v2, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSink;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v2

    .line 51
    iget-object v3, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v3, v1}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v3

    move v7, v1

    :goto_0
    const/16 v1, 0x2000

    if-le v3, v1, :cond_1

    .line 53
    iget v1, p0, Lnicoid/network238/okio/CipherSink;->blockSize:I

    if-gt v7, v1, :cond_0

    .line 57
    iget-object v0, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    iget-object v1, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okio/Buffer;->readByteArray(J)[B

    move-result-object p1

    invoke-virtual {v1, p1}, Ljavax/crypto/Cipher;->update([B)[B

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0, p1}, Lnicoid/network238/okio/BufferedSink;->write([B)Lnicoid/network238/okio/BufferedSink;

    long-to-int p1, p2

    return p1

    :cond_0
    sub-int/2addr v7, v1

    .line 61
    iget-object v1, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v1, v7}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v3

    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {v2, v3}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object p2

    .line 65
    iget-object v4, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    iget-object v5, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget-object v8, p2, Lnicoid/network238/okio/Segment;->data:[B

    iget v9, p2, Lnicoid/network238/okio/Segment;->limit:I

    invoke-virtual/range {v4 .. v9}, Ljavax/crypto/Cipher;->update([BII[BI)I

    move-result p3

    .line 67
    iget v1, p2, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v1, p3

    iput v1, p2, Lnicoid/network238/okio/Segment;->limit:I

    .line 68
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v5, p3

    add-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 71
    iget p3, p2, Lnicoid/network238/okio/Segment;->pos:I

    iget v1, p2, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p3, v1, :cond_2

    .line 72
    invoke-virtual {p2}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p3

    iput-object p3, v2, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 73
    invoke-static {p2}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    .line 76
    :cond_2
    iget-object p2, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {p2}, Lnicoid/network238/okio/BufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    .line 79
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p2

    int-to-long v1, v7

    sub-long/2addr p2, v1

    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 80
    iget p2, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr p2, v7

    iput p2, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 81
    iget p3, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p2, p3, :cond_3

    .line 82
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p2

    iput-object p2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 83
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_3
    return v7
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    iget-boolean v0, p0, Lnicoid/network238/okio/CipherSink;->closed:Z

    if-nez v0, :cond_1

    .line 96
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/CipherSink;->closed:Z

    .line 98
    invoke-direct {p0}, Lnicoid/network238/okio/CipherSink;->doFinal()Ljava/lang/Throwable;

    move-result-object v0

    .line 101
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v1}, Lnicoid/network238/okio/Sink;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    if-nez v0, :cond_0

    move-object v0, v1

    :cond_0
    :goto_0
    if-nez v0, :cond_2

    :cond_1
    return-void

    .line 106
    :cond_2
    throw v0
.end method

.method public flush()V
    .registers 2

    .line 89
    iget-object v0, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSink;->flush()V

    return-void
.end method

.method public final getCipher()Ljavax/crypto/Cipher;
    .registers 2

    .line 23
    iget-object v0, p0, Lnicoid/network238/okio/CipherSink;->cipher:Ljavax/crypto/Cipher;

    return-object v0
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 91
    iget-object v0, p0, Lnicoid/network238/okio/CipherSink;->sink:Lnicoid/network238/okio/BufferedSink;

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 36
    iget-boolean p2, p0, Lnicoid/network238/okio/CipherSink;->closed:Z

    if-nez p2, :cond_1

    move-wide p2, v4

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 40
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okio/CipherSink;->update(Lnicoid/network238/okio/Buffer;J)I

    move-result v0

    int-to-long v0, v0

    sub-long/2addr p2, v0

    goto :goto_0

    :cond_0
    return-void

    .line 36
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.class public final Lnicoid/network238/okio/CipherSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0018\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\r2\u0006\u0010\u0014\u001a\u00020\u0012H\u0016J\u0008\u0010\u0015\u001a\u00020\u0016H\u0002J\u0008\u0010\u0017\u001a\u00020\u0016H\u0002J\u0008\u0010\u0018\u001a\u00020\u0016H\u0002J\u0008\u0010\u0019\u001a\u00020\u001aH\u0016J\u0008\u0010\u001b\u001a\u00020\u0016H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okio/CipherSource;",
        "Lnicoid/network238/okio/Source;",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "cipher",
        "Ljavax/crypto/Cipher;",
        "<init>",
        "(Lnicoid/network238/okio/BufferedSource;Ljavax/crypto/Cipher;)V",
        "getCipher",
        "()Ljavax/crypto/Cipher;",
        "blockSize",
        "",
        "buffer",
        "Lnicoid/network238/okio/Buffer;",
        "final",
        "",
        "closed",
        "read",
        "",
        "sink",
        "byteCount",
        "refill",
        "",
        "update",
        "doFinal",
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
.field private final blockSize:I

.field private final buffer:Lnicoid/network238/okio/Buffer;

.field private final cipher:Ljavax/crypto/Cipher;

.field private closed:Z

.field private final:Z

.field private final source:Lnicoid/network238/okio/BufferedSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/BufferedSource;Ljavax/crypto/Cipher;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lnicoid/network238/okio/CipherSource;->source:Lnicoid/network238/okio/BufferedSource;

    .line 23
    iput-object p2, p0, Lnicoid/network238/okio/CipherSource;->cipher:Ljavax/crypto/Cipher;

    .line 25
    invoke-virtual {p2}, Ljavax/crypto/Cipher;->getBlockSize()I

    move-result p1

    iput p1, p0, Lnicoid/network238/okio/CipherSource;->blockSize:I

    .line 26
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    if-lez p1, :cond_0

    return-void

    .line 32
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

.method private final doFinal()V
    .registers 8

    .line 94
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->cipher:Ljavax/crypto/Cipher;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 98
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v0

    .line 100
    iget-object v1, p0, Lnicoid/network238/okio/CipherSource;->cipher:Ljavax/crypto/Cipher;

    iget-object v2, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {v1, v2, v3}, Ljavax/crypto/Cipher;->doFinal([BI)I

    move-result v1

    .line 102
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v2, v1

    iput v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    .line 103
    iget-object v2, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v5, v1

    add-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 106
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v1, v2, :cond_1

    .line 107
    iget-object v1, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v2

    iput-object v2, v1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 108
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private final refill()V
    .registers 5

    .line 47
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lnicoid/network238/okio/CipherSource;->final:Z

    if-nez v0, :cond_1

    .line 48
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/CipherSource;->final:Z

    .line 50
    invoke-direct {p0}, Lnicoid/network238/okio/CipherSource;->doFinal()V

    return-void

    .line 53
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okio/CipherSource;->update()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final update()V
    .registers 10

    .line 59
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/BufferedSource;->getBuffer()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    iget-object v0, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    .line 63
    iget-object v2, p0, Lnicoid/network238/okio/CipherSource;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v2, v1}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v2

    move v6, v1

    :goto_0
    const/16 v1, 0x2000

    if-le v2, v1, :cond_1

    .line 65
    iget v1, p0, Lnicoid/network238/okio/CipherSource;->blockSize:I

    if-gt v6, v1, :cond_0

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/CipherSource;->final:Z

    .line 70
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    iget-object v1, p0, Lnicoid/network238/okio/CipherSource;->cipher:Ljavax/crypto/Cipher;

    iget-object v2, p0, Lnicoid/network238/okio/CipherSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v2}, Lnicoid/network238/okio/BufferedSource;->readByteArray()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    return-void

    :cond_0
    sub-int/2addr v6, v1

    .line 74
    iget-object v1, p0, Lnicoid/network238/okio/CipherSource;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v1, v6}, Ljavax/crypto/Cipher;->getOutputSize(I)I

    move-result v2

    goto :goto_0

    .line 76
    :cond_1
    iget-object v1, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1, v2}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 79
    iget-object v3, p0, Lnicoid/network238/okio/CipherSource;->cipher:Ljavax/crypto/Cipher;

    iget-object v4, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget-object v7, v1, Lnicoid/network238/okio/Segment;->data:[B

    iget v8, v1, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual/range {v3 .. v8}, Ljavax/crypto/Cipher;->update([BII[BI)I

    move-result v0

    .line 81
    iget-object v2, p0, Lnicoid/network238/okio/CipherSource;->source:Lnicoid/network238/okio/BufferedSource;

    int-to-long v3, v6

    invoke-interface {v2, v3, v4}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    .line 83
    iget v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v2, v0

    iput v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 84
    iget-object v2, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v5, v0

    add-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 87
    iget v0, v1, Lnicoid/network238/okio/Segment;->pos:I

    iget v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v0, v2, :cond_2

    .line 88
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v2

    iput-object v2, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 89
    invoke-static {v1}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_2
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

    .line 116
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/CipherSource;->closed:Z

    .line 117
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    return-void
.end method

.method public final getCipher()Ljavax/crypto/Cipher;
    .registers 2

    .line 23
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->cipher:Ljavax/crypto/Cipher;

    return-object v0
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    .line 38
    iget-boolean v3, p0, Lnicoid/network238/okio/CipherSource;->closed:Z

    if-nez v3, :cond_1

    if-nez v2, :cond_0

    return-wide v0

    .line 41
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okio/CipherSource;->refill()V

    .line 43
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    return-wide p1

    .line 38
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 37
    :cond_2
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

    .line 112
    iget-object v0, p0, Lnicoid/network238/okio/CipherSource;->source:Lnicoid/network238/okio/BufferedSource;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

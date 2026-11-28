.class public final Lnicoid/network238/okio/GzipSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0018\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J\u0008\u0010\u0019\u001a\u00020\u0014H\u0016J\u0008\u0010\u001a\u001a\u00020\u001bH\u0016J\u0008\u0010\u001c\u001a\u00020\u0014H\u0016J\u0008\u0010\u001d\u001a\u00020\u0014H\u0002J\u0018\u0010\u001e\u001a\u00020\u00142\u0006\u0010\u001f\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0002J\u0013\u0010\u0006\u001a\u00060\u0007j\u0002`\u0008H\u0007\u00a2\u0006\u0004\u0008 \u0010\tR\u000e\u0010\u0002\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0019\u0010\u0006\u001a\u00060\u0007j\u0002`\u00088\u0007\u00a2\u0006\n\n\u0002\u0010\n\u001a\u0004\u0008\u0006\u0010\tR\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u00060\u0010j\u0002`\u0011X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0012\u00a8\u0006!"
    }
    d2 = {
        "Lnicoid/network238/okio/GzipSink;",
        "Lnicoid/network238/okio/Sink;",
        "sink",
        "<init>",
        "(Lnicoid/network238/okio/Sink;)V",
        "Lnicoid/network238/okio/RealBufferedSink;",
        "deflater",
        "Ljava/util/zip/Deflater;",
        "Lnicoid/network238/okio/Deflater;",
        "()Ljava/util/zip/Deflater;",
        "Ljava/util/zip/Deflater;",
        "deflaterSink",
        "Lnicoid/network238/okio/DeflaterSink;",
        "closed",
        "",
        "crc",
        "Ljava/util/zip/CRC32;",
        "Lnicoid/network238/okio/internal/CRC32;",
        "Ljava/util/zip/CRC32;",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "flush",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
        "writeFooter",
        "updateCrc",
        "buffer",
        "-deprecated_deflater",
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

.field private final crc:Ljava/util/zip/CRC32;

.field private final deflater:Ljava/util/zip/Deflater;

.field private final deflaterSink:Lnicoid/network238/okio/DeflaterSink;

.field private final sink:Lnicoid/network238/okio/RealBufferedSink;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Sink;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Lnicoid/network238/okio/RealBufferedSink;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/RealBufferedSink;-><init>(Lnicoid/network238/okio/Sink;)V

    iput-object v0, p0, Lnicoid/network238/okio/GzipSink;->sink:Lnicoid/network238/okio/RealBufferedSink;

    .line 47
    new-instance p1, Ljava/util/zip/Deflater;

    invoke-static {}, Lnicoid/network238/okio/internal/_ZlibJvmKt;->getDEFAULT_COMPRESSION()I

    move-result v1

    const/4 v2, 0x1

    invoke-direct {p1, v1, v2}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object p1, p0, Lnicoid/network238/okio/GzipSink;->deflater:Ljava/util/zip/Deflater;

    .line 53
    new-instance v1, Lnicoid/network238/okio/DeflaterSink;

    invoke-direct {v1, v0, p1}, Lnicoid/network238/okio/DeflaterSink;-><init>(Lnicoid/network238/okio/BufferedSink;Ljava/util/zip/Deflater;)V

    iput-object v1, p0, Lnicoid/network238/okio/GzipSink;->deflaterSink:Lnicoid/network238/okio/DeflaterSink;

    .line 58
    new-instance p1, Ljava/util/zip/CRC32;

    invoke-direct {p1}, Ljava/util/zip/CRC32;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/GzipSink;->crc:Ljava/util/zip/CRC32;

    .line 153
    iget-object p1, v0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 63
    const/16 v0, 0x1f8b

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 64
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 65
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 66
    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 67
    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 68
    invoke-virtual {p1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method private final updateCrc(Lnicoid/network238/okio/Buffer;J)V
    .registers 8

    .line 127
    iget-object p1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 130
    iget v0, p1, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, p1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    .line 155
    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    .line 131
    iget-object v1, p0, Lnicoid/network238/okio/GzipSink;->crc:Ljava/util/zip/CRC32;

    iget-object v2, p1, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, p1, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/zip/CRC32;->update([BII)V

    int-to-long v0, v0

    sub-long/2addr p2, v0

    .line 133
    iget-object p1, p1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    :cond_0
    return-void
.end method

.method private final writeFooter()V
    .registers 4

    .line 121
    iget-object v0, p0, Lnicoid/network238/okio/GzipSink;->sink:Lnicoid/network238/okio/RealBufferedSink;

    iget-object v1, p0, Lnicoid/network238/okio/GzipSink;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/RealBufferedSink;->writeIntLe(I)Lnicoid/network238/okio/BufferedSink;

    .line 122
    iget-object v0, p0, Lnicoid/network238/okio/GzipSink;->sink:Lnicoid/network238/okio/RealBufferedSink;

    iget-object v1, p0, Lnicoid/network238/okio/GzipSink;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->getBytesRead()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/RealBufferedSink;->writeIntLe(I)Lnicoid/network238/okio/BufferedSink;

    return-void
.end method


# virtual methods
.method public final -deprecated_deflater()Ljava/util/zip/Deflater;
    .registers 2

    .line 143
    iget-object v0, p0, Lnicoid/network238/okio/GzipSink;->deflater:Ljava/util/zip/Deflater;

    return-object v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    iget-boolean v0, p0, Lnicoid/network238/okio/GzipSink;->closed:Z

    if-nez v0, :cond_2

    .line 97
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okio/GzipSink;->deflaterSink:Lnicoid/network238/okio/DeflaterSink;

    invoke-virtual {v0}, Lnicoid/network238/okio/DeflaterSink;->finishDeflate$okio()V

    .line 98
    invoke-direct {p0}, Lnicoid/network238/okio/GzipSink;->writeFooter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 104
    :goto_0
    :try_start_1
    iget-object v1, p0, Lnicoid/network238/okio/GzipSink;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v1}, Ljava/util/zip/Deflater;->end()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v1

    if-nez v0, :cond_0

    move-object v0, v1

    .line 110
    :cond_0
    :goto_1
    :try_start_2
    iget-object v1, p0, Lnicoid/network238/okio/GzipSink;->sink:Lnicoid/network238/okio/RealBufferedSink;

    invoke-virtual {v1}, Lnicoid/network238/okio/RealBufferedSink;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v1

    if-nez v0, :cond_1

    move-object v0, v1

    .line 115
    :cond_1
    :goto_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/okio/GzipSink;->closed:Z

    if-nez v0, :cond_3

    :cond_2
    return-void

    .line 117
    :cond_3
    throw v0
.end method

.method public final deflater()Ljava/util/zip/Deflater;
    .registers 2

    .line 47
    iget-object v0, p0, Lnicoid/network238/okio/GzipSink;->deflater:Ljava/util/zip/Deflater;

    return-object v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lnicoid/network238/okio/GzipSink;->deflaterSink:Lnicoid/network238/okio/DeflaterSink;

    invoke-virtual {v0}, Lnicoid/network238/okio/DeflaterSink;->flush()V

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 84
    iget-object v0, p0, Lnicoid/network238/okio/GzipSink;->sink:Lnicoid/network238/okio/RealBufferedSink;

    invoke-virtual {v0}, Lnicoid/network238/okio/RealBufferedSink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_1

    if-nez v0, :cond_0

    return-void

    .line 77
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okio/GzipSink;->updateCrc(Lnicoid/network238/okio/Buffer;J)V

    .line 78
    iget-object v0, p0, Lnicoid/network238/okio/GzipSink;->deflaterSink:Lnicoid/network238/okio/DeflaterSink;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/DeflaterSink;->write(Lnicoid/network238/okio/Buffer;J)V

    return-void

    .line 74
    :cond_1
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

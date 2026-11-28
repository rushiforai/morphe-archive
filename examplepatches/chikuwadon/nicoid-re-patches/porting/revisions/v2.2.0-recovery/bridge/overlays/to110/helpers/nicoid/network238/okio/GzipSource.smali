.class public final Lnicoid/network238/okio/GzipSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000`\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0018\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0013H\u0016J\u0008\u0010\u0017\u001a\u00020\u0018H\u0002J\u0008\u0010\u0019\u001a\u00020\u0018H\u0002J\u0008\u0010\u001a\u001a\u00020\u001bH\u0016J\u0008\u0010\u001c\u001a\u00020\u0018H\u0016J \u0010\u001d\u001a\u00020\u00182\u0006\u0010\u001e\u001a\u00020\u00152\u0006\u0010\u001f\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u0013H\u0002J \u0010 \u001a\u00020\u00182\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020$H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0008\u001a\u00060\tj\u0002`\nX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000bR\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u00060\u000fj\u0002`\u0010X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0011\u00a8\u0006&"
    }
    d2 = {
        "Lnicoid/network238/okio/GzipSource;",
        "Lnicoid/network238/okio/Source;",
        "source",
        "<init>",
        "(Lnicoid/network238/okio/Source;)V",
        "section",
        "",
        "Lnicoid/network238/okio/RealBufferedSource;",
        "inflater",
        "Ljava/util/zip/Inflater;",
        "Lnicoid/network238/okio/Inflater;",
        "Ljava/util/zip/Inflater;",
        "inflaterSource",
        "Lnicoid/network238/okio/InflaterSource;",
        "crc",
        "Ljava/util/zip/CRC32;",
        "Lnicoid/network238/okio/internal/CRC32;",
        "Ljava/util/zip/CRC32;",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "consumeHeader",
        "",
        "consumeTrailer",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
        "updateCrc",
        "buffer",
        "offset",
        "checkEqual",
        "name",
        "",
        "expected",
        "",
        "actual",
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
.field private final crc:Ljava/util/zip/CRC32;

.field private final inflater:Ljava/util/zip/Inflater;

.field private final inflaterSource:Lnicoid/network238/okio/InflaterSource;

.field private section:B

.field private final source:Lnicoid/network238/okio/RealBufferedSource;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Source;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Lnicoid/network238/okio/RealBufferedSource;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/RealBufferedSource;-><init>(Lnicoid/network238/okio/Source;)V

    iput-object v0, p0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    .line 42
    new-instance p1, Ljava/util/zip/Inflater;

    const/4 v1, 0x1

    invoke-direct {p1, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    iput-object p1, p0, Lnicoid/network238/okio/GzipSource;->inflater:Ljava/util/zip/Inflater;

    .line 48
    new-instance v1, Lnicoid/network238/okio/InflaterSource;

    invoke-direct {v1, v0, p1}, Lnicoid/network238/okio/InflaterSource;-><init>(Lnicoid/network238/okio/BufferedSource;Ljava/util/zip/Inflater;)V

    iput-object v1, p0, Lnicoid/network238/okio/GzipSource;->inflaterSource:Lnicoid/network238/okio/InflaterSource;

    .line 51
    new-instance p1, Ljava/util/zip/CRC32;

    invoke-direct {p1}, Ljava/util/zip/CRC32;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/GzipSource;->crc:Ljava/util/zip/CRC32;

    return-void
.end method

.method private final checkEqual(Ljava/lang/String;II)V
    .registers 7

    if-ne p3, p2, :cond_0

    return-void

    .line 195
    :cond_0
    new-instance v0, Ljava/io/IOException;

    .line 196
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ": actual 0x"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 197
    invoke-static {p3}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(I)Ljava/lang/String;

    move-result-object p3

    const/16 v1, 0x8

    const/16 v2, 0x30

    invoke-static {p3, v1, v2}, Lnicoid/network238/kotlin/text/StringsKt;->padStart(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p3

    .line 196
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " != expected 0x"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 198
    invoke-static {p2}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v1, v2}, Lnicoid/network238/kotlin/text/StringsKt;->padStart(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p2

    .line 196
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 195
    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final consumeHeader()V
    .registers 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    move-object/from16 v0, p0

    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    const-wide/16 v2, 0xa

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 103
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    .line 224
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 103
    const-wide/16 v2, 0x3

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v6

    shr-int/lit8 v1, v6, 0x1

    const/4 v7, 0x1

    and-int/2addr v1, v7

    const/4 v8, 0x0

    if-ne v1, v7, :cond_0

    move v9, v7

    goto :goto_0

    :cond_0
    move v9, v8

    :goto_0
    if-eqz v9, :cond_1

    .line 105
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    .line 226
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 105
    const-wide/16 v2, 0x0

    const-wide/16 v4, 0xa

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okio/GzipSource;->updateCrc(Lnicoid/network238/okio/Buffer;JJ)V

    .line 107
    :cond_1
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v1}, Lnicoid/network238/okio/RealBufferedSource;->readShort()S

    move-result v1

    .line 108
    const-string v2, "ID1ID2"

    const/16 v3, 0x1f8b

    invoke-direct {v0, v2, v3, v1}, Lnicoid/network238/okio/GzipSource;->checkEqual(Ljava/lang/String;II)V

    .line 109
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    const-wide/16 v2, 0x8

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okio/RealBufferedSource;->skip(J)V

    shr-int/lit8 v1, v6, 0x2

    and-int/2addr v1, v7

    if-ne v1, v7, :cond_4

    .line 116
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    const-wide/16 v2, 0x2

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    if-eqz v9, :cond_2

    .line 117
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    .line 228
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 117
    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x2

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okio/GzipSource;->updateCrc(Lnicoid/network238/okio/Buffer;JJ)V

    .line 118
    :cond_2
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    .line 229
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 118
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readShortLe()S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    int-to-long v4, v1

    .line 119
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v1, v4, v5}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    if-eqz v9, :cond_3

    .line 120
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    .line 230
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 120
    const-wide/16 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okio/GzipSource;->updateCrc(Lnicoid/network238/okio/Buffer;JJ)V

    .line 121
    :cond_3
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v1, v4, v5}, Lnicoid/network238/okio/RealBufferedSource;->skip(J)V

    :cond_4
    shr-int/lit8 v1, v6, 0x3

    and-int/2addr v1, v7

    const-wide/16 v10, -0x1

    const-wide/16 v12, 0x1

    if-ne v1, v7, :cond_7

    .line 129
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v1, v8}, Lnicoid/network238/okio/RealBufferedSource;->indexOf(B)J

    move-result-wide v14

    cmp-long v1, v14, v10

    if-eqz v1, :cond_6

    if-eqz v9, :cond_5

    .line 131
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    .line 232
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    add-long v4, v14, v12

    .line 131
    const-wide/16 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okio/GzipSource;->updateCrc(Lnicoid/network238/okio/Buffer;JJ)V

    .line 132
    :cond_5
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    add-long/2addr v14, v12

    invoke-virtual {v1, v14, v15}, Lnicoid/network238/okio/RealBufferedSource;->skip(J)V

    goto :goto_1

    .line 130
    :cond_6
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    :cond_7
    :goto_1
    shr-int/lit8 v6, v6, 0x4

    and-int/2addr v6, v7

    if-ne v6, v7, :cond_a

    .line 140
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v1, v8}, Lnicoid/network238/okio/RealBufferedSource;->indexOf(B)J

    move-result-wide v6

    cmp-long v1, v6, v10

    if-eqz v1, :cond_9

    if-eqz v9, :cond_8

    .line 142
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    .line 234
    iget-object v1, v1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    add-long v4, v6, v12

    .line 142
    const-wide/16 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okio/GzipSource;->updateCrc(Lnicoid/network238/okio/Buffer;JJ)V

    .line 143
    :cond_8
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    add-long/2addr v6, v12

    invoke-virtual {v1, v6, v7}, Lnicoid/network238/okio/RealBufferedSource;->skip(J)V

    goto :goto_2

    .line 141
    :cond_9
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    :cond_a
    :goto_2
    if-eqz v9, :cond_b

    .line 151
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v1}, Lnicoid/network238/okio/RealBufferedSource;->readShortLe()S

    move-result v1

    iget-object v2, v0, Lnicoid/network238/okio/GzipSource;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v2

    long-to-int v2, v2

    int-to-short v2, v2

    const-string v3, "FHCRC"

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/okio/GzipSource;->checkEqual(Ljava/lang/String;II)V

    .line 152
    iget-object v1, v0, Lnicoid/network238/okio/GzipSource;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->reset()V

    :cond_b
    return-void
.end method

.method private final consumeTrailer()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    iget-object v0, p0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v0}, Lnicoid/network238/okio/RealBufferedSource;->readIntLe()I

    move-result v0

    iget-object v1, p0, Lnicoid/network238/okio/GzipSource;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v1, v1

    const-string v2, "CRC"

    invoke-direct {p0, v2, v0, v1}, Lnicoid/network238/okio/GzipSource;->checkEqual(Ljava/lang/String;II)V

    .line 163
    iget-object v0, p0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v0}, Lnicoid/network238/okio/RealBufferedSource;->readIntLe()I

    move-result v0

    iget-object v1, p0, Lnicoid/network238/okio/GzipSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v1}, Ljava/util/zip/Inflater;->getBytesWritten()J

    move-result-wide v1

    long-to-int v1, v1

    const-string v2, "ISIZE"

    invoke-direct {p0, v2, v0, v1}, Lnicoid/network238/okio/GzipSource;->checkEqual(Ljava/lang/String;II)V

    return-void
.end method

.method private final updateCrc(Lnicoid/network238/okio/Buffer;JJ)V
    .registers 10

    .line 176
    iget-object p1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    :goto_0
    iget v0, p1, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, p1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_0

    sub-long/2addr p2, v0

    .line 179
    iget-object p1, p1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    :cond_0
    :goto_1
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-lez v2, :cond_1

    .line 184
    iget v2, p1, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v2, v2

    add-long/2addr v2, p2

    long-to-int p2, v2

    .line 185
    iget p3, p1, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr p3, p2

    int-to-long v2, p3

    .line 235
    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p3, v2

    .line 186
    iget-object v2, p0, Lnicoid/network238/okio/GzipSource;->crc:Ljava/util/zip/CRC32;

    iget-object v3, p1, Lnicoid/network238/okio/Segment;->data:[B

    invoke-virtual {v2, v3, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    int-to-long p2, p3

    sub-long/2addr p4, p2

    .line 189
    iget-object p1, p1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide p2, v0

    goto :goto_1

    :cond_1
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

    .line 169
    iget-object v0, p0, Lnicoid/network238/okio/GzipSource;->inflaterSource:Lnicoid/network238/okio/InflaterSource;

    invoke-virtual {v0}, Lnicoid/network238/okio/InflaterSource;->close()V

    return-void
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_6

    if-nez v2, :cond_0

    return-wide v0

    .line 59
    :cond_0
    iget-byte v0, p0, Lnicoid/network238/okio/GzipSource;->section:B

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 60
    invoke-direct {p0}, Lnicoid/network238/okio/GzipSource;->consumeHeader()V

    .line 61
    iput-byte v1, p0, Lnicoid/network238/okio/GzipSource;->section:B

    move v0, v1

    :cond_1
    const-wide/16 v2, -0x1

    const/4 v4, 0x2

    if-ne v0, v1, :cond_3

    .line 66
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    .line 67
    iget-object v0, p0, Lnicoid/network238/okio/GzipSource;->inflaterSource:Lnicoid/network238/okio/InflaterSource;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/InflaterSource;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v9

    cmp-long p2, v9, v2

    if-eqz p2, :cond_2

    .line 69
    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v5 .. v10}, Lnicoid/network238/okio/GzipSource;->updateCrc(Lnicoid/network238/okio/Buffer;JJ)V

    return-wide v9

    :cond_2
    nop

    .line 72
    iput-byte v4, p0, Lnicoid/network238/okio/GzipSource;->section:B

    move v0, v4

    :cond_3
    if-ne v0, v4, :cond_5

    .line 79
    invoke-direct {p0}, Lnicoid/network238/okio/GzipSource;->consumeTrailer()V

    .line 80
    const/4 p1, 0x3

    iput-byte p1, p0, Lnicoid/network238/okio/GzipSource;->section:B

    .line 86
    iget-object p1, p0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {p1}, Lnicoid/network238/okio/RealBufferedSource;->exhausted()Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    .line 87
    :cond_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "gzip finished without exhausting source"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    :goto_0
    return-wide v2

    .line 55
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

    .line 166
    iget-object v0, p0, Lnicoid/network238/okio/GzipSource;->source:Lnicoid/network238/okio/RealBufferedSource;

    invoke-virtual {v0}, Lnicoid/network238/okio/RealBufferedSource;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

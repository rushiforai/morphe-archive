.class public final Lnicoid/network238/okio/RealBufferedSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/BufferedSink;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0010\u0012\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\n\u001a\u00020\u0007H\u0016J\u0018\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0010\u0010\u000f\u001a\u00020\u00012\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J \u0010\u000f\u001a\u00020\u00012\u0006\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0012\u001a\u00020\u0017H\u0016J\u0010\u0010\u0018\u001a\u00020\u00012\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J \u0010\u0018\u001a\u00020\u00012\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u00172\u0006\u0010\u001c\u001a\u00020\u0017H\u0016J\u0010\u0010\u001d\u001a\u00020\u00012\u0006\u0010\u001e\u001a\u00020\u0017H\u0016J\u0018\u0010\u001f\u001a\u00020\u00012\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010 \u001a\u00020!H\u0016J(\u0010\u001f\u001a\u00020\u00012\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u00172\u0006\u0010\u001c\u001a\u00020\u00172\u0006\u0010 \u001a\u00020!H\u0016J\u0010\u0010\u000f\u001a\u00020\u00012\u0006\u0010\u0011\u001a\u00020\"H\u0016J \u0010\u000f\u001a\u00020\u00012\u0006\u0010\u0011\u001a\u00020\"2\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0012\u001a\u00020\u0017H\u0016J\u0010\u0010\u000f\u001a\u00020\u00172\u0006\u0010\u0011\u001a\u00020#H\u0016J\u0010\u0010$\u001a\u00020\u00132\u0006\u0010\u0011\u001a\u00020%H\u0016J\u0018\u0010\u000f\u001a\u00020\u00012\u0006\u0010\u0011\u001a\u00020%2\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0010\u0010&\u001a\u00020\u00012\u0006\u0010\'\u001a\u00020\u0017H\u0016J\u0010\u0010(\u001a\u00020\u00012\u0006\u0010)\u001a\u00020\u0017H\u0016J\u0010\u0010*\u001a\u00020\u00012\u0006\u0010)\u001a\u00020\u0017H\u0016J\u0010\u0010+\u001a\u00020\u00012\u0006\u0010,\u001a\u00020\u0017H\u0016J\u0010\u0010-\u001a\u00020\u00012\u0006\u0010,\u001a\u00020\u0017H\u0016J\u0010\u0010.\u001a\u00020\u00012\u0006\u0010/\u001a\u00020\u0013H\u0016J\u0010\u00100\u001a\u00020\u00012\u0006\u0010/\u001a\u00020\u0013H\u0016J\u0010\u00101\u001a\u00020\u00012\u0006\u0010/\u001a\u00020\u0013H\u0016J\u0010\u00102\u001a\u00020\u00012\u0006\u0010/\u001a\u00020\u0013H\u0016J\u0008\u00103\u001a\u00020\u0001H\u0016J\u0008\u00104\u001a\u00020\u0001H\u0016J\u0008\u00105\u001a\u000206H\u0016J\u000c\u00107\u001a\u000608j\u0002`9H\u0016J\u0008\u0010:\u001a\u00020\u0010H\u0016J\u0008\u0010;\u001a\u00020\tH\u0016J\u0008\u0010<\u001a\u00020\u0010H\u0016J\u0008\u0010=\u001a\u00020>H\u0016J\u0008\u0010?\u001a\u00020\u001aH\u0016R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0008\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u001b\u0010\n\u001a\u00020\u00078\u00d6\u0002X\u0096\u0004\u00a2\u0006\u000c\u0012\u0004\u0008\u000b\u0010\u000c\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006@"
    }
    d2 = {
        "Lnicoid/network238/okio/RealBufferedSink;",
        "Lnicoid/network238/okio/BufferedSink;",
        "sink",
        "Lnicoid/network238/okio/Sink;",
        "<init>",
        "(Lnicoid/network238/okio/Sink;)V",
        "bufferField",
        "Lnicoid/network238/okio/Buffer;",
        "closed",
        "",
        "buffer",
        "getBuffer$annotations",
        "()V",
        "getBuffer",
        "()Lnicoid/network238/okio/Buffer;",
        "write",
        "",
        "source",
        "byteCount",
        "",
        "byteString",
        "Lnicoid/network238/okio/ByteString;",
        "offset",
        "",
        "writeUtf8",
        "string",
        "",
        "beginIndex",
        "endIndex",
        "writeUtf8CodePoint",
        "codePoint",
        "writeString",
        "charset",
        "Ljava/nio/charset/Charset;",
        "",
        "Ljava/nio/ByteBuffer;",
        "writeAll",
        "Lnicoid/network238/okio/Source;",
        "writeByte",
        "b",
        "writeShort",
        "s",
        "writeShortLe",
        "writeInt",
        "i",
        "writeIntLe",
        "writeLong",
        "v",
        "writeLongLe",
        "writeDecimalLong",
        "writeHexadecimalUnsignedLong",
        "emitCompleteSegments",
        "emit",
        "outputStream",
        "Ljava/io/OutputStream;",
        "utf8Appendable",
        "Ljava/lang/Appendable;",
        "Lnicoid/network238/kotlin/text/Appendable;",
        "flush",
        "isOpen",
        "close",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "toString",
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
.field public final bufferField:Lnicoid/network238/okio/Buffer;

.field public closed:Z

.field public final sink:Lnicoid/network238/okio/Sink;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Sink;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    .line 45
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method public static synthetic getBuffer$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public buffer()Lnicoid/network238/okio/Buffer;
    .registers 2

    .line 53
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    return-object v0
.end method

.method public close()V
    .registers 5

    .line 297
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_3

    .line 304
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 303
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 305
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    .line 304
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 305
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 305
    :catchall_0
    move-exception v0

    .line 312
    :goto_0
    :try_start_1
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    invoke-interface {v1}, Lnicoid/network238/okio/Sink;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v1

    if-nez v0, :cond_1

    move-object v0, v1

    .line 317
    :cond_1
    :goto_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_2

    goto :goto_2

    .line 319
    :cond_2
    throw v0

    :cond_3
    :goto_2
    return-void
.end method

.method public emit()Lnicoid/network238/okio/BufferedSink;
    .registers 5

    .line 283
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_1

    .line 286
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 285
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 287
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    .line 286
    iget-object v3, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 287
    invoke-interface {v2, v3, v0, v1}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    :cond_0
    return-object p0

    .line 283
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;
    .registers 5

    .line 277
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_1

    .line 280
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 279
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->completeSegmentByteCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 281
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    .line 280
    iget-object v3, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 281
    invoke-interface {v2, v3, v0, v1}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    :cond_0
    return-object p0

    .line 277
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .registers 5

    .line 289
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_1

    .line 292
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 291
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 293
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    .line 292
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 293
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 295
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->flush()V

    return-void

    .line 289
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBuffer()Lnicoid/network238/okio/Buffer;
    .registers 3

    const/4 v0, 0x0

    .line 51
    .local v0, "$i$f$getBuffer":I
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    return-object v1
.end method

.method public isOpen()Z
    .registers 2

    .line 161
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public outputStream()Ljava/io/OutputStream;
    .registers 2

    .line 108
    new-instance v0, Lnicoid/network238/okio/RealBufferedSink$outputStream$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/RealBufferedSink$outputStream$1;-><init>(Lnicoid/network238/okio/RealBufferedSink;)V

    return-object v0
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 321
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    invoke-interface {v0}, Lnicoid/network238/okio/Sink;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "buffer("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public utf8Appendable()Ljava/lang/Appendable;
    .registers 2

    .line 135
    new-instance v0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;-><init>(Lnicoid/network238/okio/RealBufferedSink;)V

    return-object v0
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 213
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 88
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write(Ljava/nio/ByteBuffer;)I

    move-result p1

    .line 89
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    return p1

    .line 87
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 174
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 177
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 176
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    .line 178
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 174
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write(Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/BufferedSink;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 182
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 181
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/Buffer;

    .line 183
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 179
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/BufferedSink;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    .line 226
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 225
    invoke-interface {p1, v0, p2, p3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    sub-long/2addr p2, v0

    .line 229
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    goto :goto_0

    .line 227
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_1
    return-object p0
.end method

.method public write([B)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 202
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 205
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 204
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    .line 206
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 202
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write([BII)Lnicoid/network238/okio/BufferedSink;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 207
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 210
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 209
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write([BII)Lnicoid/network238/okio/Buffer;

    .line 211
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 207
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 168
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 171
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 170
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 172
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    return-void

    .line 168
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeAll(Lnicoid/network238/okio/Source;)J
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    .line 217
    :goto_0
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 216
    const-wide/16 v3, 0x2000

    invoke-interface {p1, v2, v3, v4}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    add-long/2addr v0, v2

    .line 220
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    goto :goto_0

    :cond_0
    return-wide v0
.end method

.method public writeByte(I)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 232
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 235
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 234
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 236
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 232
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    .line 267
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 270
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 269
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    .line 271
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 267
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    .line 272
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 275
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 274
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/Buffer;

    .line 276
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 272
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeInt(I)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 247
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 250
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 249
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    .line 251
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 247
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeIntLe(I)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 252
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 255
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 254
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeIntLe(I)Lnicoid/network238/okio/Buffer;

    .line 256
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 252
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeLong(J)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    .line 257
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 260
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 259
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeLong(J)Lnicoid/network238/okio/Buffer;

    .line 261
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 257
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeLongLe(J)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    .line 262
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 265
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 264
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeLongLe(J)Lnicoid/network238/okio/Buffer;

    .line 266
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 262
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeShort(I)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 237
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 240
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 239
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    .line 241
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 237
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeShortLe(I)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 242
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 245
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 244
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeShortLe(I)Lnicoid/network238/okio/Buffer;

    .line 246
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 242
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lnicoid/network238/okio/BufferedSink;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 201
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 78
    invoke-virtual {v0, p1, p2, p3, p4}, Lnicoid/network238/okio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;

    .line 79
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 77
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 200
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 67
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;

    .line 68
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 66
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 187
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 186
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    .line 188
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 184
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/BufferedSink;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 189
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 192
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 191
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;

    .line 193
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 189
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeUtf8CodePoint(I)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 194
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSink;->closed:Z

    if-nez v0, :cond_0

    .line 197
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 196
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;

    .line 198
    invoke-virtual {p0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    move-result-object p1

    return-object p1

    .line 194
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

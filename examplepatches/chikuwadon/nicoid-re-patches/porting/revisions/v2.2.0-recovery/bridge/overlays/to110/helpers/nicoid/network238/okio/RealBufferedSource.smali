.class public final Lnicoid/network238/okio/RealBufferedSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/BufferedSource;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0090\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\n\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\n\u001a\u00020\u0007H\u0016J\u0018\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0008\u0010\u0013\u001a\u00020\tH\u0016J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0010\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0008\u0010\u0017\u001a\u00020\u0018H\u0016J\u0008\u0010\u0019\u001a\u00020\u001aH\u0016J\u0010\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0016J\'\u0010\u001b\u001a\u0004\u0018\u0001H\u001f\"\u0008\u0008\u0000\u0010\u001f*\u00020 2\u000c\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u0002H\u001f0!H\u0016\u00a2\u0006\u0002\u0010\"J\u0008\u0010#\u001a\u00020$H\u0016J\u0010\u0010#\u001a\u00020$2\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0010\u0010\u000f\u001a\u00020\u001c2\u0006\u0010\u0011\u001a\u00020$H\u0016J\u0010\u0010%\u001a\u00020\u00152\u0006\u0010\u0011\u001a\u00020$H\u0016J \u0010\u000f\u001a\u00020\u001c2\u0006\u0010\u0011\u001a\u00020$2\u0006\u0010&\u001a\u00020\u001c2\u0006\u0010\u0012\u001a\u00020\u001cH\u0016J\u0010\u0010\u000f\u001a\u00020\u001c2\u0006\u0010\u0011\u001a\u00020\'H\u0016J\u0018\u0010%\u001a\u00020\u00152\u0006\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0010\u0010(\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020)H\u0016J\u0008\u0010*\u001a\u00020+H\u0016J\u0010\u0010*\u001a\u00020+2\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0010\u0010,\u001a\u00020+2\u0006\u0010-\u001a\u00020.H\u0016J\u0018\u0010,\u001a\u00020+2\u0006\u0010\u0012\u001a\u00020\u00102\u0006\u0010-\u001a\u00020.H\u0016J\n\u0010/\u001a\u0004\u0018\u00010+H\u0016J\u0008\u00100\u001a\u00020+H\u0016J\u0010\u00100\u001a\u00020+2\u0006\u00101\u001a\u00020\u0010H\u0016J\u0008\u00102\u001a\u00020\u001cH\u0016J\u0008\u00103\u001a\u000204H\u0016J\u0008\u00105\u001a\u000204H\u0016J\u0008\u00106\u001a\u00020\u001cH\u0016J\u0008\u00107\u001a\u00020\u001cH\u0016J\u0008\u00108\u001a\u00020\u0010H\u0016J\u0008\u00109\u001a\u00020\u0010H\u0016J\u0008\u0010:\u001a\u00020\u0010H\u0016J\u0008\u0010;\u001a\u00020\u0010H\u0016J\u0010\u0010<\u001a\u00020\u00152\u0006\u0010\u0012\u001a\u00020\u0010H\u0016J\u0010\u0010=\u001a\u00020\u00102\u0006\u0010>\u001a\u00020\u0018H\u0016J\u0018\u0010=\u001a\u00020\u00102\u0006\u0010>\u001a\u00020\u00182\u0006\u0010?\u001a\u00020\u0010H\u0016J \u0010=\u001a\u00020\u00102\u0006\u0010>\u001a\u00020\u00182\u0006\u0010?\u001a\u00020\u00102\u0006\u0010@\u001a\u00020\u0010H\u0016J\u0010\u0010=\u001a\u00020\u00102\u0006\u0010A\u001a\u00020\u001aH\u0016J\u0018\u0010=\u001a\u00020\u00102\u0006\u0010A\u001a\u00020\u001a2\u0006\u0010?\u001a\u00020\u0010H\u0016J \u0010=\u001a\u00020\u00102\u0006\u0010A\u001a\u00020\u001a2\u0006\u0010?\u001a\u00020\u00102\u0006\u0010@\u001a\u00020\u0010H\u0016J\u0010\u0010B\u001a\u00020\u00102\u0006\u0010C\u001a\u00020\u001aH\u0016J\u0018\u0010B\u001a\u00020\u00102\u0006\u0010C\u001a\u00020\u001a2\u0006\u0010?\u001a\u00020\u0010H\u0016J\u0018\u0010D\u001a\u00020\t2\u0006\u0010&\u001a\u00020\u00102\u0006\u0010A\u001a\u00020\u001aH\u0016J(\u0010D\u001a\u00020\t2\u0006\u0010&\u001a\u00020\u00102\u0006\u0010A\u001a\u00020\u001a2\u0006\u0010E\u001a\u00020\u001c2\u0006\u0010\u0012\u001a\u00020\u001cH\u0016J\u0008\u0010F\u001a\u00020\u0001H\u0016J\u0008\u0010G\u001a\u00020HH\u0016J\u0008\u0010I\u001a\u00020\tH\u0016J\u0008\u0010J\u001a\u00020\u0015H\u0016J\u0008\u0010K\u001a\u00020LH\u0016J\u0008\u0010M\u001a\u00020+H\u0016R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0008\u001a\u00020\t8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000R\u001b\u0010\n\u001a\u00020\u00078\u00d6\u0002X\u0096\u0004\u00a2\u0006\u000c\u0012\u0004\u0008\u000b\u0010\u000c\u001a\u0004\u0008\r\u0010\u000e\u00a8\u0006N"
    }
    d2 = {
        "Lnicoid/network238/okio/RealBufferedSource;",
        "Lnicoid/network238/okio/BufferedSource;",
        "source",
        "Lnicoid/network238/okio/Source;",
        "<init>",
        "(Lnicoid/network238/okio/Source;)V",
        "bufferField",
        "Lnicoid/network238/okio/Buffer;",
        "closed",
        "",
        "buffer",
        "getBuffer$annotations",
        "()V",
        "getBuffer",
        "()Lnicoid/network238/okio/Buffer;",
        "read",
        "",
        "sink",
        "byteCount",
        "exhausted",
        "require",
        "",
        "request",
        "readByte",
        "",
        "readByteString",
        "Lnicoid/network238/okio/ByteString;",
        "select",
        "",
        "options",
        "Lnicoid/network238/okio/Options;",
        "T",
        "",
        "Lnicoid/network238/okio/TypedOptions;",
        "(Lnicoid/network238/okio/TypedOptions;)Ljava/lang/Object;",
        "readByteArray",
        "",
        "readFully",
        "offset",
        "Ljava/nio/ByteBuffer;",
        "readAll",
        "Lnicoid/network238/okio/Sink;",
        "readUtf8",
        "",
        "readString",
        "charset",
        "Ljava/nio/charset/Charset;",
        "readUtf8Line",
        "readUtf8LineStrict",
        "limit",
        "readUtf8CodePoint",
        "readShort",
        "",
        "readShortLe",
        "readInt",
        "readIntLe",
        "readLong",
        "readLongLe",
        "readDecimalLong",
        "readHexadecimalUnsignedLong",
        "skip",
        "indexOf",
        "b",
        "fromIndex",
        "toIndex",
        "bytes",
        "indexOfElement",
        "targetBytes",
        "rangeEquals",
        "bytesOffset",
        "peek",
        "inputStream",
        "Ljava/io/InputStream;",
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

.field public final source:Lnicoid/network238/okio/Source;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Source;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 57
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method public static synthetic getBuffer$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public buffer()Lnicoid/network238/okio/Buffer;
    .registers 2

    .line 65
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    return-object v0
.end method

.method public close()V
    .registers 2

    .line 491
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_0

    .line 492
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    .line 493
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->close()V

    .line 495
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 494
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->clear()V

    :cond_0
    return-void
.end method

.method public exhausted()Z
    .registers 5

    .line 221
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_1

    .line 224
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 223
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 224
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 223
    const-wide/16 v2, 0x2000

    invoke-interface {v0, v1, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0

    .line 221
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBuffer()Lnicoid/network238/okio/Buffer;
    .registers 3

    const/4 v0, 0x0

    .line 63
    .local v0, "$i$f$getBuffer":I
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    return-object v1
.end method

.method public indexOf(B)J
    .registers 8

    .line 121
    const-wide/16 v2, 0x0

    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/RealBufferedSource;->indexOf(BJJ)J

    move-result-wide v1

    return-wide v1
.end method

.method public indexOf(BJ)J
    .registers 10

    .line 123
    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/RealBufferedSource;->indexOf(BJJ)J

    move-result-wide p1

    return-wide p1
.end method

.method public indexOf(BJJ)J
    .registers 15

    .line 445
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_4

    const-wide/16 v0, 0x0

    cmp-long v0, v0, p2

    if-gtz v0, :cond_3

    cmp-long v0, p2, p4

    if-gtz v0, :cond_3

    move-wide v3, p2

    :goto_0
    cmp-long p2, v3, p4

    const-wide/16 v7, -0x1

    if-gez p2, :cond_2

    .line 451
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 450
    move v2, p1

    move-wide v5, p4

    invoke-virtual/range {v1 .. v6}, Lnicoid/network238/okio/Buffer;->indexOf(BJJ)J

    move-result-wide p1

    cmp-long p3, p1, v7

    if-eqz p3, :cond_0

    return-wide p1

    .line 451
    :cond_0
    iget-object p1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 456
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    cmp-long p3, p1, v5

    if-gez p3, :cond_2

    .line 457
    iget-object p3, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 451
    iget-object p4, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 457
    const-wide/16 v0, 0x2000

    invoke-interface {p3, p4, v0, v1}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p3

    cmp-long p3, p3, v7

    if-nez p3, :cond_1

    goto :goto_1

    .line 460
    :cond_1
    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    move p1, v2

    move-wide p4, v5

    goto :goto_0

    :cond_2
    :goto_1
    return-wide v7

    .line 445
    :cond_3
    move-wide v5, p4

    .line 447
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p4, "fromIndex="

    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " toIndex="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 445
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public indexOf(Lnicoid/network238/okio/ByteString;)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->indexOf(Lnicoid/network238/okio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(Lnicoid/network238/okio/ByteString;J)J
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/RealBufferedSource;->indexOf(Lnicoid/network238/okio/ByteString;JJ)J

    move-result-wide p1

    return-wide p1
.end method

.method public indexOf(Lnicoid/network238/okio/ByteString;JJ)J
    .registers 16

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 131
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v8, 0x6

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v4, p2

    move-wide v6, p4

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okio/internal/-RealBufferedSource;->commonIndexOf$default(Lnicoid/network238/okio/RealBufferedSource;Lnicoid/network238/okio/ByteString;IIJJILjava/lang/Object;)J

    move-result-wide p1

    return-wide p1
.end method

.method public indexOfElement(Lnicoid/network238/okio/ByteString;)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->indexOfElement(Lnicoid/network238/okio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOfElement(Lnicoid/network238/okio/ByteString;J)J
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 464
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_2

    .line 468
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 467
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->indexOfElement(Lnicoid/network238/okio/ByteString;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    return-wide v0

    .line 468
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 471
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 472
    iget-object v4, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 468
    iget-object v5, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 472
    const-wide/16 v6, 0x2000

    invoke-interface {v4, v5, v6, v7}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v4

    cmp-long v4, v4, v2

    if-nez v4, :cond_1

    return-wide v2

    .line 475
    :cond_1
    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p2

    goto :goto_0

    .line 464
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public inputStream()Ljava/io/InputStream;
    .registers 2

    .line 154
    new-instance v0, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/RealBufferedSource$inputStream$1;-><init>(Lnicoid/network238/okio/RealBufferedSource;)V

    return-object v0
.end method

.method public isOpen()Z
    .registers 2

    .line 201
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public peek()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 490
    new-instance v0, Lnicoid/network238/okio/PeekSource;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/PeekSource;-><init>(Lnicoid/network238/okio/BufferedSource;)V

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    return-object v0
.end method

.method public rangeEquals(JLnicoid/network238/okio/ByteString;)Z
    .registers 10

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 141
    invoke-virtual {p3}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v5

    .line 137
    const/4 v4, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/RealBufferedSource;->rangeEquals(JLnicoid/network238/okio/ByteString;II)Z

    move-result p1

    return p1
.end method

.method public rangeEquals(JLnicoid/network238/okio/ByteString;II)Z
    .registers 16

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 476
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_2

    if-ltz p5, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    if-ltz p4, :cond_1

    add-int v0, p4, p5

    .line 480
    invoke-virtual {p3}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    if-gt v0, v1, :cond_1

    if-eqz p5, :cond_0

    const-wide/16 v0, 0x1

    add-long v8, p1, v0

    .line 483
    move-object v2, p0

    move-wide v6, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v2 .. v9}, Lnicoid/network238/okio/internal/-RealBufferedSource;->commonIndexOf(Lnicoid/network238/okio/RealBufferedSource;Lnicoid/network238/okio/ByteString;IIJJ)J

    move-result-wide p1

    const-wide/16 p3, -0x1

    cmp-long p1, p1, p3

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1

    .line 476
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 299
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 84
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 85
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 300
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 85
    const-wide/16 v2, 0x2000

    invoke-interface {v0, v1, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 301
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 89
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->read(Ljava/nio/ByteBuffer;)I

    move-result p1

    return p1
.end method

.method public read([B)I
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lnicoid/network238/okio/RealBufferedSource;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 287
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 290
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 289
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    if-nez p3, :cond_0

    const/4 p1, 0x0

    return p1

    .line 292
    :cond_0
    iget-object p3, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 290
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 292
    const-wide/16 v1, 0x2000

    invoke-interface {p3, v0, v1, v2}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p3, v0, v2

    if-nez p3, :cond_1

    const/4 p1, -0x1

    return p1

    .line 290
    :cond_1
    iget-object p3, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 296
    invoke-virtual {p3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 297
    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p3, v0

    .line 290
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 298
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->read([BII)I

    move-result p1

    return p1
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_3

    .line 210
    iget-boolean v3, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v3, :cond_2

    .line 213
    iget-object v3, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 212
    invoke-virtual {v3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    cmp-long v3, v3, v0

    if-nez v3, :cond_1

    if-nez v2, :cond_0

    return-wide v0

    .line 215
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 213
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 215
    const-wide/16 v2, 0x2000

    invoke-interface {v0, v1, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    return-wide v2

    .line 213
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 219
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p2

    .line 213
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 220
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    return-wide p1

    .line 210
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 208
    :cond_3
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

.method public readAll(Lnicoid/network238/okio/Sink;)J
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    move-wide v2, v0

    .line 314
    :cond_0
    :goto_0
    iget-object v4, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 315
    iget-object v5, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 314
    const-wide/16 v6, 0x2000

    invoke-interface {v4, v5, v6, v7}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    .line 315
    iget-object v5, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    if-eqz v4, :cond_1

    .line 316
    invoke-virtual {v5}, Lnicoid/network238/okio/Buffer;->completeSegmentByteCount()J

    move-result-wide v4

    cmp-long v6, v4, v0

    if-lez v6, :cond_0

    add-long/2addr v2, v4

    .line 315
    iget-object v6, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 319
    invoke-interface {p1, v6, v4, v5}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    goto :goto_0

    .line 322
    :cond_1
    invoke-virtual {v5}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    cmp-long v0, v4, v0

    if-lez v0, :cond_2

    .line 315
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 323
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    add-long/2addr v2, v0

    .line 315
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 324
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    invoke-interface {p1, v0, v4, v5}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    :cond_2
    return-wide v2
.end method

.method public readByte()B
    .registers 3

    .line 235
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 237
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 236
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v0

    return v0
.end method

.method public readByteArray()[B
    .registers 3

    .line 266
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 265
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    .line 266
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 267
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public readByteArray(J)[B
    .registers 4

    .line 268
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 270
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 269
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->readByteArray(J)[B

    move-result-object p1

    return-object p1
.end method

.method public readByteString()Lnicoid/network238/okio/ByteString;
    .registers 3

    .line 239
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 238
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    .line 239
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 240
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public readByteString(J)Lnicoid/network238/okio/ByteString;
    .registers 4

    .line 241
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 243
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 242
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public readDecimalLong()J
    .registers 11

    .line 394
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    const-wide/16 v2, 0x0

    move-wide v4, v2

    :goto_0
    add-long v6, v4, v0

    .line 397
    invoke-virtual {p0, v6, v7}, Lnicoid/network238/okio/RealBufferedSource;->request(J)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 399
    iget-object v8, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 398
    invoke-virtual {v8, v4, v5}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v8

    const/16 v9, 0x30

    if-lt v8, v9, :cond_0

    const/16 v9, 0x39

    if-le v8, v9, :cond_1

    :cond_0
    cmp-long v4, v4, v2

    if-nez v4, :cond_2

    const/16 v5, 0x2d

    if-ne v8, v5, :cond_2

    :cond_1
    move-wide v4, v6

    goto :goto_0

    :cond_2
    if-eqz v4, :cond_3

    goto :goto_1

    .line 403
    :cond_3
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected a digit or \'-\' but was 0x"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x10

    invoke-static {v2}, Lnicoid/network238/kotlin/text/CharsKt;->checkRadix(I)I

    move-result v2

    invoke-static {v8, v2}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 399
    :cond_4
    :goto_1
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 410
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readDecimalLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readFully(Lnicoid/network238/okio/Buffer;J)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 303
    :try_start_0
    invoke-virtual {p0, p2, p3}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 307
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 311
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->readFully(Lnicoid/network238/okio/Buffer;J)V

    return-void

    :catch_0
    move-exception p2

    .line 307
    iget-object p3, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 306
    invoke-virtual {p1, p3}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    .line 308
    throw p2
.end method

.method public readFully([B)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 272
    :try_start_0
    array-length v0, p1

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 285
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->readFully([B)V

    return-void

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    .line 277
    :goto_0
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 276
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 277
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 278
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {v2, p1, v1, v3}, Lnicoid/network238/okio/Buffer;->read([BII)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    add-int/2addr v1, v2

    goto :goto_0

    .line 279
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1

    .line 282
    :cond_1
    throw v0
.end method

.method public readHexadecimalUnsignedLong()J
    .registers 6

    .line 411
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v1, v0, 0x1

    int-to-long v2, v1

    .line 414
    invoke-virtual {p0, v2, v3}, Lnicoid/network238/okio/RealBufferedSource;->request(J)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 416
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    int-to-long v3, v0

    .line 415
    invoke-virtual {v2, v3, v4}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_0

    const/16 v3, 0x39

    if-le v2, v3, :cond_2

    :cond_0
    const/16 v3, 0x61

    if-lt v2, v3, :cond_1

    const/16 v3, 0x66

    if-le v2, v3, :cond_2

    :cond_1
    const/16 v3, 0x41

    if-lt v2, v3, :cond_3

    const/16 v3, 0x46

    if-gt v2, v3, :cond_3

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    if-eqz v0, :cond_4

    goto :goto_1

    .line 423
    :cond_4
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Expected leading [0-9a-fA-F] character but was 0x"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x10

    invoke-static {v3}, Lnicoid/network238/kotlin/text/CharsKt;->checkRadix(I)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 416
    :cond_5
    :goto_1
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 430
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readHexadecimalUnsignedLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readInt()I
    .registers 3

    .line 382
    const-wide/16 v0, 0x4

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 384
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 383
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readInt()I

    move-result v0

    return v0
.end method

.method public readIntLe()I
    .registers 3

    .line 385
    const-wide/16 v0, 0x4

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 387
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 386
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readIntLe()I

    move-result v0

    return v0
.end method

.method public readLong()J
    .registers 3

    .line 388
    const-wide/16 v0, 0x8

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 390
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 389
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readLongLe()J
    .registers 3

    .line 391
    const-wide/16 v0, 0x8

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 393
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 392
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readLongLe()J

    move-result-wide v0

    return-wide v0
.end method

.method public readShort()S
    .registers 3

    .line 376
    const-wide/16 v0, 0x2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 378
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 377
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readShort()S

    move-result v0

    return v0
.end method

.method public readShortLe()S
    .registers 3

    .line 379
    const-wide/16 v0, 0x2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 381
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 380
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readShortLe()S

    move-result v0

    return v0
.end method

.method public readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 335
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 105
    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 333
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 99
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    .line 334
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 100
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->readString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readUtf8()Ljava/lang/String;
    .registers 3

    .line 328
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 327
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeAll(Lnicoid/network238/okio/Source;)J

    .line 328
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 329
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8(J)Ljava/lang/String;
    .registers 4

    .line 330
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 332
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 331
    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readUtf8CodePoint()I
    .registers 4

    .line 365
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 368
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 367
    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v0

    and-int/lit16 v1, v0, 0xe0

    const/16 v2, 0xc0

    if-ne v1, v2, :cond_0

    .line 370
    const-wide/16 v0, 0x2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    goto :goto_0

    :cond_0
    and-int/lit16 v1, v0, 0xf0

    const/16 v2, 0xe0

    if-ne v1, v2, :cond_1

    .line 371
    const-wide/16 v0, 0x3

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    goto :goto_0

    :cond_1
    and-int/lit16 v0, v0, 0xf8

    const/16 v1, 0xf0

    if-ne v0, v1, :cond_2

    .line 372
    const-wide/16 v0, 0x4

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->require(J)V

    .line 368
    :cond_2
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 375
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readUtf8CodePoint()I

    move-result v0

    return v0
.end method

.method public readUtf8Line()Ljava/lang/String;
    .registers 5

    .line 336
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/RealBufferedSource;->indexOf(B)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    .line 340
    iget-object v3, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    if-nez v2, :cond_1

    .line 339
    invoke-virtual {v3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 340
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 341
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0

    .line 346
    :cond_1
    invoke-static {v3, v0, v1}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8LineStrict()Ljava/lang/String;
    .registers 3

    .line 109
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->readUtf8LineStrict(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8LineStrict(J)Ljava/lang/String;
    .registers 16

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_3

    const-wide v0, 0x7fffffffffffffffL

    cmp-long v2, p1, v0

    const-wide/16 v3, 0x1

    if-nez v2, :cond_0

    move-wide v11, v0

    goto :goto_0

    :cond_0
    add-long v5, p1, v3

    move-wide v11, v5

    .line 350
    :goto_0
    const/16 v8, 0xa

    const-wide/16 v9, 0x0

    move-object v7, p0

    invoke-virtual/range {v7 .. v12}, Lnicoid/network238/okio/RealBufferedSource;->indexOf(BJJ)J

    move-result-wide v5

    const-wide/16 v7, -0x1

    cmp-long v2, v5, v7

    if-eqz v2, :cond_1

    .line 352
    iget-object p1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 351
    invoke-static {p1, v5, v6}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    cmp-long v0, v11, v0

    if-gez v0, :cond_2

    .line 354
    invoke-virtual {p0, v11, v12}, Lnicoid/network238/okio/RealBufferedSource;->request(J)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 352
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    sub-long v1, v11, v3

    .line 354
    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v0

    const/16 v1, 0xd

    if-ne v0, v1, :cond_2

    add-long v0, v11, v3

    .line 355
    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/RealBufferedSource;->request(J)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 352
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 355
    invoke-virtual {v0, v11, v12}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    .line 352
    iget-object p1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 357
    invoke-static {p1, v11, v12}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 359
    :cond_2
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 352
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 360
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    .line 361
    const-wide/16 v4, 0x20

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 360
    const-wide/16 v2, 0x0

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->copyTo(Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;

    .line 362
    new-instance v0, Ljava/io/EOFException;

    .line 363
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\\n not found: limit="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 352
    iget-object v3, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 363
    invoke-virtual {v3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " content="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 364
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object p2

    .line 363
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x2026

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 362
    invoke-direct {v0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 347
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "limit < 0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public request(J)Z
    .registers 7

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_3

    .line 229
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_2

    .line 231
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 230
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-gez v0, :cond_1

    .line 232
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 231
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 232
    const-wide/16 v2, 0x2000

    invoke-interface {v0, v1, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1

    .line 229
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 227
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "byteCount < 0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public require(J)V
    .registers 3

    .line 225
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/RealBufferedSource;->request(J)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method

.method public select(Lnicoid/network238/okio/Options;)I
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 244
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_3

    .line 248
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 247
    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lnicoid/network238/okio/internal/-Buffer;->selectPrefix(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Options;Z)I

    move-result v0

    const/4 v1, -0x2

    const/4 v2, -0x1

    if-eq v0, v1, :cond_1

    if-eq v0, v2, :cond_2

    .line 259
    invoke-virtual {p1}, Lnicoid/network238/okio/Options;->getByteStrings$okio()[Lnicoid/network238/okio/ByteString;

    move-result-object p1

    aget-object p1, p1, v0

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p1

    .line 248
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    int-to-long v2, p1

    .line 260
    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return v0

    .line 255
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 248
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 255
    const-wide/16 v3, 0x2000

    invoke-interface {v0, v1, v3, v4}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v3, -0x1

    cmp-long v0, v0, v3

    if-nez v0, :cond_0

    :cond_2
    return v2

    .line 244
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public select(Lnicoid/network238/okio/TypedOptions;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/okio/TypedOptions<",
            "TT;>;)TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 262
    invoke-virtual {p1}, Lnicoid/network238/okio/TypedOptions;->getOptions$okio()Lnicoid/network238/okio/Options;

    move-result-object v0

    invoke-interface {p0, v0}, Lnicoid/network238/okio/BufferedSource;->select(Lnicoid/network238/okio/Options;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 264
    :cond_0
    invoke-virtual {p1, v0}, Lnicoid/network238/okio/TypedOptions;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public skip(J)V
    .registers 7

    .line 432
    iget-boolean v0, p0, Lnicoid/network238/okio/RealBufferedSource;->closed:Z

    if-nez v0, :cond_2

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_1

    .line 436
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 435
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 436
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 435
    const-wide/16 v2, 0x2000

    invoke-interface {v0, v1, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 437
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    .line 436
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 439
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 436
    iget-object v2, p0, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 440
    invoke-virtual {v2, v0, v1}, Lnicoid/network238/okio/Buffer;->skip(J)V

    sub-long/2addr p1, v0

    goto :goto_0

    :cond_1
    return-void

    .line 432
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 497
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    invoke-interface {v0}, Lnicoid/network238/okio/Source;->timeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 498
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "buffer("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

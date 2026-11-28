.class public final Lnicoid/network238/okio/internal/-Buffer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0086\u0001\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0016\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\n\u001a0\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u00012\u0006\u0010\u000c\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0005H\u0000\u001a\u0014\u0010\u000e\u001a\u00020\u000f*\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0000\u001a?\u0010\u0013\u001a\u0002H\u0014\"\u0004\u0008\u0000\u0010\u0014*\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u00122\u001a\u0010\u0016\u001a\u0016\u0012\u0006\u0012\u0004\u0018\u00010\t\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u0002H\u00140\u0017H\u0080\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0018\u001a\u001e\u0010\u0019\u001a\u00020\u0005*\u00020\u00102\u0006\u0010\u001a\u001a\u00020\u001b2\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u0007H\u0000\u001a%\u0010\u001d\u001a\u00020\u0010*\u00020\u00102\u0006\u0010\u001e\u001a\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u00122\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a\r\u0010!\u001a\u00020\u0012*\u00020\u0010H\u0080\u0008\u001a\r\u0010\"\u001a\u00020#*\u00020\u0010H\u0080\u0008\u001a\r\u0010$\u001a\u00020%*\u00020\u0010H\u0080\u0008\u001a\r\u0010&\u001a\u00020\u0005*\u00020\u0010H\u0080\u0008\u001a\r\u0010\'\u001a\u00020\u0012*\u00020\u0010H\u0080\u0008\u001a\u0015\u0010(\u001a\u00020#*\u00020\u00102\u0006\u0010)\u001a\u00020\u0012H\u0080\u0008\u001a\r\u0010*\u001a\u00020+*\u00020\u0010H\u0080\u0008\u001a\u0015\u0010,\u001a\u00020+*\u00020\u00102\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a)\u0010-\u001a\u00020\u0010*\u00020\u00102\u0006\u0010.\u001a\u00020/2\u0008\u0008\u0002\u0010\u001f\u001a\u00020\u00052\u0008\u0008\u0002\u0010 \u001a\u00020\u0005H\u0080\u0008\u001a\u0015\u00100\u001a\u00020\u0010*\u00020\u00102\u0006\u00101\u001a\u00020\u0012H\u0080\u0008\u001a\u0010\u00102\u001a\u00020\u00052\u0006\u00101\u001a\u00020\u0012H\u0002\u001a\u0015\u00105\u001a\u00020\u0010*\u00020\u00102\u0006\u00101\u001a\u00020\u0012H\u0080\u0008\u001a\u0015\u00106\u001a\u00020\t*\u00020\u00102\u0006\u00107\u001a\u00020\u0005H\u0080\u0008\u001a\u0015\u0010-\u001a\u00020\u0010*\u00020\u00102\u0006\u00108\u001a\u00020\u0001H\u0080\u0008\u001a%\u0010-\u001a\u00020\u0010*\u00020\u00102\u0006\u00108\u001a\u00020\u00012\u0006\u0010\u001f\u001a\u00020\u00052\u0006\u0010 \u001a\u00020\u0005H\u0080\u0008\u001a\r\u00109\u001a\u00020\u0001*\u00020\u0010H\u0080\u0008\u001a\u0015\u00109\u001a\u00020\u0001*\u00020\u00102\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a\u0015\u0010:\u001a\u00020\u0005*\u00020\u00102\u0006\u0010;\u001a\u00020\u0001H\u0080\u0008\u001a\u0015\u0010<\u001a\u00020+*\u00020\u00102\u0006\u0010;\u001a\u00020\u0001H\u0080\u0008\u001a%\u0010:\u001a\u00020\u0005*\u00020\u00102\u0006\u0010;\u001a\u00020\u00012\u0006\u0010\u001f\u001a\u00020\u00052\u0006\u0010 \u001a\u00020\u0005H\u0080\u0008\u001a\r\u0010?\u001a\u00020\u0012*\u00020\u0010H\u0080\u0008\u001a\r\u0010@\u001a\u00020\u0012*\u00020\u0010H\u0080\u0008\u001a\r\u0010A\u001a\u00020/*\u00020\u0010H\u0080\u0008\u001a\u0015\u0010A\u001a\u00020/*\u00020\u00102\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a\u0015\u0010B\u001a\u00020\u0005*\u00020\u00102\u0006\u0010\u001a\u001a\u00020\u001bH\u0080\u0008\u001a\u001d\u0010<\u001a\u00020+*\u00020\u00102\u0006\u0010;\u001a\u00020\u00102\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a\u0015\u0010C\u001a\u00020\u0012*\u00020\u00102\u0006\u0010;\u001a\u00020DH\u0080\u0008\u001a\u0015\u0010E\u001a\u00020\u000f*\u00020\u00102\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a\u000f\u0010F\u001a\u0004\u0018\u00010\u000f*\u00020\u0010H\u0080\u0008\u001a\u0015\u0010G\u001a\u00020\u000f*\u00020\u00102\u0006\u0010H\u001a\u00020\u0012H\u0080\u0008\u001a\r\u0010I\u001a\u00020\u0005*\u00020\u0010H\u0080\u0008\u001a%\u0010J\u001a\u00020\u0010*\u00020\u00102\u0006\u0010K\u001a\u00020\u000f2\u0006\u0010L\u001a\u00020\u00052\u0006\u0010M\u001a\u00020\u0005H\u0080\u0008\u001a\u0015\u0010N\u001a\u00020\u0010*\u00020\u00102\u0006\u0010O\u001a\u00020\u0005H\u0080\u0008\u001a\u0015\u0010P\u001a\u00020\u0012*\u00020\u00102\u0006\u00108\u001a\u00020QH\u0080\u0008\u001a\u001d\u0010-\u001a\u00020\u0010*\u00020\u00102\u0006\u00108\u001a\u00020Q2\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a\u0015\u0010R\u001a\u00020\u0010*\u00020\u00102\u0006\u0010S\u001a\u00020\u0005H\u0080\u0008\u001a\u0015\u0010T\u001a\u00020\u0010*\u00020\u00102\u0006\u0010U\u001a\u00020\u0005H\u0080\u0008\u001a\u0015\u0010V\u001a\u00020\u0010*\u00020\u00102\u0006\u0010W\u001a\u00020\u0005H\u0080\u0008\u001a\u0015\u0010X\u001a\u00020\u0010*\u00020\u00102\u0006\u00101\u001a\u00020\u0012H\u0080\u0008\u001a\u001d\u0010-\u001a\u00020+*\u00020\u00102\u0006\u00108\u001a\u00020\u00102\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a\u001d\u0010:\u001a\u00020\u0012*\u00020\u00102\u0006\u0010;\u001a\u00020\u00102\u0006\u0010 \u001a\u00020\u0012H\u0080\u0008\u001a%\u0010Y\u001a\u00020\u0012*\u00020\u00102\u0006\u0010S\u001a\u00020#2\u0006\u0010\u0015\u001a\u00020\u00122\u0006\u0010Z\u001a\u00020\u0012H\u0080\u0008\u001a:\u0010Y\u001a\u00020\u0012*\u00020\u00102\u0006\u0010\u000b\u001a\u00020/2\u0006\u0010\u0015\u001a\u00020\u00122\u0008\u0008\u0002\u0010Z\u001a\u00020\u00122\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u00052\u0008\u0008\u0002\u0010 \u001a\u00020\u0005H\u0000\u001a\u001d\u0010[\u001a\u00020\u0012*\u00020\u00102\u0006\u0010\\\u001a\u00020/2\u0006\u0010\u0015\u001a\u00020\u0012H\u0080\u0008\u001a-\u0010]\u001a\u00020\u0007*\u00020\u00102\u0006\u0010\u001f\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020/2\u0006\u0010\u000c\u001a\u00020\u00052\u0006\u0010 \u001a\u00020\u0005H\u0080\u0008\u001a\u0017\u0010^\u001a\u00020\u0007*\u00020\u00102\u0008\u0010_\u001a\u0004\u0018\u00010`H\u0080\u0008\u001a\r\u0010a\u001a\u00020\u0005*\u00020\u0010H\u0080\u0008\u001a\r\u0010b\u001a\u00020\u0010*\u00020\u0010H\u0080\u0008\u001a\r\u0010c\u001a\u00020/*\u00020\u0010H\u0080\u0008\u001a\u0015\u0010c\u001a\u00020/*\u00020\u00102\u0006\u0010 \u001a\u00020\u0005H\u0080\u0008\u001a\u0014\u0010d\u001a\u00020e*\u00020\u00102\u0006\u0010f\u001a\u00020eH\u0000\u001a\u0014\u0010g\u001a\u00020e*\u00020\u00102\u0006\u0010f\u001a\u00020eH\u0000\u001a\r\u0010h\u001a\u00020\u0005*\u00020eH\u0080\u0008\u001a\u0015\u0010i\u001a\u00020\u0005*\u00020e2\u0006\u0010\u001f\u001a\u00020\u0012H\u0080\u0008\u001a\u0015\u0010j\u001a\u00020\u0012*\u00020e2\u0006\u0010k\u001a\u00020\u0012H\u0080\u0008\u001a\u0015\u0010l\u001a\u00020\u0012*\u00020e2\u0006\u0010m\u001a\u00020\u0005H\u0080\u0008\u001a\r\u0010n\u001a\u00020+*\u00020eH\u0080\u0008\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0003\"\u000e\u0010\u0004\u001a\u00020\u0005X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u00103\u001a\u000204X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010=\u001a\u00020\u0012X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010>\u001a\u00020\u0012X\u0080T\u00a2\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006o"
    }
    d2 = {
        "HEX_DIGIT_BYTES",
        "",
        "getHEX_DIGIT_BYTES",
        "()[B",
        "SEGMENTING_THRESHOLD",
        "",
        "rangeEquals",
        "",
        "segment",
        "Lnicoid/network238/okio/Segment;",
        "segmentPos",
        "bytes",
        "bytesOffset",
        "bytesLimit",
        "readUtf8Line",
        "",
        "Lnicoid/network238/okio/Buffer;",
        "newline",
        "",
        "seek",
        "T",
        "fromIndex",
        "lambda",
        "Lnicoid/network238/kotlin/Function2;",
        "(Lnicoid/network238/okio/Buffer;JLnicoid/network238/kotlin/jvm/functions/Function2;)Ljava/lang/Object;",
        "selectPrefix",
        "options",
        "Lnicoid/network238/okio/Options;",
        "selectTruncated",
        "commonCopyTo",
        "out",
        "offset",
        "byteCount",
        "commonCompleteSegmentByteCount",
        "commonReadByte",
        "",
        "commonReadShort",
        "",
        "commonReadInt",
        "commonReadLong",
        "commonGet",
        "pos",
        "commonClear",
        "",
        "commonSkip",
        "commonWrite",
        "byteString",
        "Lnicoid/network238/okio/ByteString;",
        "commonWriteDecimalLong",
        "v",
        "countDigitsIn",
        "DigitCountToLargestValue",
        "",
        "commonWriteHexadecimalUnsignedLong",
        "commonWritableSegment",
        "minimumCapacity",
        "source",
        "commonReadByteArray",
        "commonRead",
        "sink",
        "commonReadFully",
        "OVERFLOW_ZONE",
        "OVERFLOW_DIGIT_START",
        "commonReadDecimalLong",
        "commonReadHexadecimalUnsignedLong",
        "commonReadByteString",
        "commonSelect",
        "commonReadAll",
        "Lnicoid/network238/okio/Sink;",
        "commonReadUtf8",
        "commonReadUtf8Line",
        "commonReadUtf8LineStrict",
        "limit",
        "commonReadUtf8CodePoint",
        "commonWriteUtf8",
        "string",
        "beginIndex",
        "endIndex",
        "commonWriteUtf8CodePoint",
        "codePoint",
        "commonWriteAll",
        "Lnicoid/network238/okio/Source;",
        "commonWriteByte",
        "b",
        "commonWriteShort",
        "s",
        "commonWriteInt",
        "i",
        "commonWriteLong",
        "commonIndexOf",
        "toIndex",
        "commonIndexOfElement",
        "targetBytes",
        "commonRangeEquals",
        "commonEquals",
        "other",
        "",
        "commonHashCode",
        "commonCopy",
        "commonSnapshot",
        "commonReadUnsafe",
        "Lnicoid/network238/okio/Buffer$UnsafeCursor;",
        "unsafeCursor",
        "commonReadAndWriteUnsafe",
        "commonNext",
        "commonSeek",
        "commonResizeBuffer",
        "newSize",
        "commonExpandBuffer",
        "minByteCount",
        "commonClose",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final DigitCountToLargestValue:[J

.field private static final HEX_DIGIT_BYTES:[B

.field public static final OVERFLOW_DIGIT_START:J = -0x7L

.field public static final OVERFLOW_ZONE:J = -0xcccccccccccccccL

.field public static final SEGMENTING_THRESHOLD:I = 0x1000


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 42
    const-string v0, "0123456789abcdef"

    invoke-static {v0}, Lnicoid/network238/okio/_JvmPlatformKt;->asUtf8ToByteArray(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lnicoid/network238/okio/internal/-Buffer;->HEX_DIGIT_BYTES:[B

    .line 508
    const/16 v0, 0x14

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    .line 488
    sput-object v0, Lnicoid/network238/okio/internal/-Buffer;->DigitCountToLargestValue:[J

    return-void

    :array_0
    .array-data 8
        -0x1
        0x9
        0x63
        0x3e7
        0x270f
        0x1869f
        0xf423f
        0x98967f
        0x5f5e0ff
        0x3b9ac9ff
        0x2540be3ffL
        0x174876e7ffL
        0xe8d4a50fffL
        0x9184e729fffL
        0x5af3107a3fffL
        0x38d7ea4c67fffL
        0x2386f26fc0ffffL
        0x16345785d89ffffL
        0xde0b6b3a763ffffL
        0x7fffffffffffffffL
    .end array-data
.end method

.method public static final synthetic access$countDigitsIn(J)I
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-Buffer;->countDigitsIn(J)I

    move-result p0

    return p0
.end method

.method public static final commonClear(Lnicoid/network238/okio/Buffer;)V
    .registers 4
    .param p0, "$this$commonClear"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 417
    .local v0, "$i$f$commonClear":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return-void
.end method

.method public static final commonClose(Lnicoid/network238/okio/Buffer$UnsafeCursor;)V
    .registers 5
    .param p0, "$this$commonClose"    # Lnicoid/network238/okio/Buffer$UnsafeCursor;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1702
    .local v0, "$i$f$commonClose":I
    iget-object v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 1704
    const/4 v1, 0x0

    iput-object v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    .line 1705
    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 1706
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 1707
    iput-object v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 1708
    const/4 v1, -0x1

    iput v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 1709
    iput v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    .line 1710
    return-void

    .line 1755
    :cond_1
    const/4 v1, 0x0

    .line 1702
    .local v1, "$i$a$-check--Buffer$commonClose$1":I
    nop

    .end local v1    # "$i$a$-check--Buffer$commonClose$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "not attached to a buffer"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonCompleteSegmentByteCount(Lnicoid/network238/okio/Buffer;)J
    .registers 7
    .param p0, "$this$commonCompleteSegmentByteCount"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 276
    .local v0, "$i$f$commonCompleteSegmentByteCount":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    .line 277
    .local v1, "result":J
    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    return-wide v3

    .line 280
    :cond_0
    iget-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v3, v3, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 281
    .local v3, "tail":Lnicoid/network238/okio/Segment;
    iget v4, v3, Lnicoid/network238/okio/Segment;->limit:I

    const/16 v5, 0x2000

    if-ge v4, v5, :cond_1

    iget-boolean v4, v3, Lnicoid/network238/okio/Segment;->owner:Z

    if-eqz v4, :cond_1

    .line 282
    iget v4, v3, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v3, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v4, v5

    int-to-long v4, v4

    sub-long/2addr v1, v4

    .line 285
    :cond_1
    return-wide v1
.end method

.method public static final commonCopy(Lnicoid/network238/okio/Buffer;)Lnicoid/network238/okio/Buffer;
    .registers 8
    .param p0, "$this$commonCopy"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1467
    .local v0, "$i$f$commonCopy":I
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 1468
    .local v1, "result":Lnicoid/network238/okio/Buffer;
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    return-object v1

    .line 1470
    :cond_0
    iget-object v2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 1471
    .local v2, "head":Lnicoid/network238/okio/Segment;
    invoke-virtual {v2}, Lnicoid/network238/okio/Segment;->sharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v3

    .line 1473
    .local v3, "headCopy":Lnicoid/network238/okio/Segment;
    iput-object v3, v1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1474
    iget-object v4, v1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    iput-object v4, v3, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1475
    iget-object v4, v3, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    iput-object v4, v3, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 1477
    iget-object v4, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 1478
    .local v4, "s":Lnicoid/network238/okio/Segment;
    :goto_0
    if-eq v4, v2, :cond_1

    .line 1479
    iget-object v5, v3, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v4}, Lnicoid/network238/okio/Segment;->sharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v6

    invoke-virtual {v5, v6}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    .line 1480
    iget-object v4, v4, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_0

    .line 1483
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    invoke-virtual {v1, v5, v6}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1484
    return-object v1
.end method

.method public static final commonCopyTo(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;
    .registers 17
    .param p0, "$this$commonCopyTo"    # Lnicoid/network238/okio/Buffer;
    .param p1, "out"    # Lnicoid/network238/okio/Buffer;
    .param p2, "offset"    # J
    .param p4, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "out"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 241
    .local v0, "$i$f$commonCopyTo":I
    move-wide v3, p2

    .line 242
    .local v3, "offset":J
    move-wide v5, p4

    .line 243
    .local v5, "byteCount":J
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 244
    const-wide/16 v1, 0x0

    cmp-long v7, v5, v1

    if-nez v7, :cond_0

    return-object p0

    .line 246
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    add-long/2addr v7, v5

    invoke-virtual {p1, v7, v8}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 249
    iget-object v7, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 250
    .local v7, "s":Lnicoid/network238/okio/Segment;
    :goto_0
    invoke-static {v7}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v8, v7, Lnicoid/network238/okio/Segment;->limit:I

    iget v9, v7, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v8, v9

    int-to-long v8, v8

    cmp-long v8, v3, v8

    if-ltz v8, :cond_1

    .line 251
    iget v8, v7, Lnicoid/network238/okio/Segment;->limit:I

    iget v9, v7, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v8, v9

    int-to-long v8, v8

    sub-long/2addr v3, v8

    .line 252
    iget-object v7, v7, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_0

    .line 256
    :cond_1
    :goto_1
    cmp-long v8, v5, v1

    if-lez v8, :cond_3

    .line 257
    invoke-static {v7}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v7}, Lnicoid/network238/okio/Segment;->sharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v8

    .line 258
    .local v8, "copy":Lnicoid/network238/okio/Segment;
    iget v9, v8, Lnicoid/network238/okio/Segment;->pos:I

    long-to-int v10, v3

    add-int/2addr v9, v10

    iput v9, v8, Lnicoid/network238/okio/Segment;->pos:I

    .line 259
    iget v9, v8, Lnicoid/network238/okio/Segment;->pos:I

    long-to-int v10, v5

    add-int/2addr v9, v10

    iget v10, v8, Lnicoid/network238/okio/Segment;->limit:I

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    iput v9, v8, Lnicoid/network238/okio/Segment;->limit:I

    .line 260
    iget-object v9, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v9, :cond_2

    .line 261
    iput-object v8, v8, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 262
    iget-object v9, v8, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    iput-object v9, v8, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 263
    iget-object v9, v8, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    iput-object v9, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    goto :goto_2

    .line 265
    :cond_2
    iget-object v9, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v9}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v9, v9, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v9}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v9, v8}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    .line 267
    :goto_2
    iget v9, v8, Lnicoid/network238/okio/Segment;->limit:I

    iget v10, v8, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v9, v10

    int-to-long v9, v9

    sub-long/2addr v5, v9

    .line 268
    const-wide/16 v3, 0x0

    .line 269
    iget-object v7, v7, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .end local v8    # "copy":Lnicoid/network238/okio/Segment;
    goto :goto_1

    .line 272
    :cond_3
    return-object p0
.end method

.method public static final commonEquals(Lnicoid/network238/okio/Buffer;Ljava/lang/Object;)Z
    .registers 20
    .param p0, "$this$commonEquals"    # Lnicoid/network238/okio/Buffer;
    .param p1, "other"    # Ljava/lang/Object;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "<this>"

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 1417
    .local v2, "$i$f$commonEquals":I
    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    return v3

    .line 1418
    :cond_0
    instance-of v4, v1, Lnicoid/network238/okio/Buffer;

    const/4 v5, 0x0

    if-nez v4, :cond_1

    return v5

    .line 1419
    :cond_1
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v6

    move-object v4, v1

    check-cast v4, Lnicoid/network238/okio/Buffer;

    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    cmp-long v4, v6, v8

    if-eqz v4, :cond_2

    return v5

    .line 1420
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v4, v6, v8

    if-nez v4, :cond_3

    return v3

    .line 1422
    :cond_3
    iget-object v4, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 1423
    .local v4, "sa":Lnicoid/network238/okio/Segment;
    move-object v6, v1

    check-cast v6, Lnicoid/network238/okio/Buffer;

    iget-object v6, v6, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 1424
    .local v6, "sb":Lnicoid/network238/okio/Segment;
    iget v7, v4, Lnicoid/network238/okio/Segment;->pos:I

    .line 1425
    .local v7, "posA":I
    iget v8, v6, Lnicoid/network238/okio/Segment;->pos:I

    .line 1427
    .local v8, "posB":I
    const-wide/16 v9, 0x0

    .line 1428
    .local v9, "pos":J
    const-wide/16 v11, 0x0

    .line 1429
    .local v11, "count":J
    :goto_0
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v13

    cmp-long v13, v9, v13

    if-gez v13, :cond_8

    .line 1430
    iget v13, v4, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v13, v7

    iget v14, v6, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v14, v8

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v13

    int-to-long v11, v13

    .line 1432
    const-wide/16 v13, 0x0

    .local v13, "i":J
    :goto_1
    cmp-long v15, v13, v11

    if-gez v15, :cond_5

    .line 1433
    iget-object v15, v4, Lnicoid/network238/okio/Segment;->data:[B

    add-int/lit8 v16, v7, 0x1

    .end local v7    # "posA":I
    .local v16, "posA":I
    aget-byte v7, v15, v7

    iget-object v15, v6, Lnicoid/network238/okio/Segment;->data:[B

    add-int/lit8 v17, v8, 0x1

    .end local v8    # "posB":I
    .local v17, "posB":I
    aget-byte v8, v15, v8

    if-eq v7, v8, :cond_4

    return v5

    .line 1432
    :cond_4
    const-wide/16 v7, 0x1

    add-long/2addr v13, v7

    move/from16 v7, v16

    move/from16 v8, v17

    goto :goto_1

    .line 1436
    .end local v13    # "i":J
    .end local v16    # "posA":I
    .end local v17    # "posB":I
    .restart local v7    # "posA":I
    .restart local v8    # "posB":I
    :cond_5
    iget v13, v4, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v7, v13, :cond_6

    .line 1437
    iget-object v13, v4, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v13}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 1438
    .end local v4    # "sa":Lnicoid/network238/okio/Segment;
    .local v13, "sa":Lnicoid/network238/okio/Segment;
    iget v4, v13, Lnicoid/network238/okio/Segment;->pos:I

    move v7, v4

    move-object v4, v13

    .line 1441
    .end local v13    # "sa":Lnicoid/network238/okio/Segment;
    .restart local v4    # "sa":Lnicoid/network238/okio/Segment;
    :cond_6
    iget v13, v6, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v8, v13, :cond_7

    .line 1442
    iget-object v13, v6, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v13}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 1443
    .end local v6    # "sb":Lnicoid/network238/okio/Segment;
    .local v13, "sb":Lnicoid/network238/okio/Segment;
    iget v6, v13, Lnicoid/network238/okio/Segment;->pos:I

    move v8, v6

    move-object v6, v13

    .line 1445
    .end local v13    # "sb":Lnicoid/network238/okio/Segment;
    .restart local v6    # "sb":Lnicoid/network238/okio/Segment;
    :cond_7
    add-long/2addr v9, v11

    goto :goto_0

    .line 1448
    :cond_8
    return v3
.end method

.method public static final commonExpandBuffer(Lnicoid/network238/okio/Buffer$UnsafeCursor;I)J
    .registers 11
    .param p0, "$this$commonExpandBuffer"    # Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .param p1, "minByteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1679
    .local v0, "$i$f$commonExpandBuffer":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez p1, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    if-eqz v3, :cond_5

    .line 1680
    const/16 v3, 0x2000

    if-le p1, v3, :cond_1

    move v1, v2

    :cond_1
    if-eqz v1, :cond_4

    .line 1681
    iget-object v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-eqz v1, :cond_3

    .line 1682
    .local v1, "buffer":Lnicoid/network238/okio/Buffer;
    iget-boolean v2, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v2, :cond_2

    .line 1684
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    .line 1685
    .local v4, "oldSize":J
    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 1686
    .local v2, "tail":Lnicoid/network238/okio/Segment;
    iget v6, v2, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v6, v6, 0x2000

    .line 1687
    .local v6, "result":I
    iput v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 1688
    int-to-long v7, v6

    add-long/2addr v7, v4

    invoke-virtual {v1, v7, v8}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1691
    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 1692
    iput-wide v4, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 1693
    iget-object v7, v2, Lnicoid/network238/okio/Segment;->data:[B

    iput-object v7, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 1694
    rsub-int v7, v6, 0x2000

    iput v7, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 1695
    iput v3, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    .line 1697
    int-to-long v7, v6

    return-wide v7

    .line 1755
    .end local v2    # "tail":Lnicoid/network238/okio/Segment;
    .end local v4    # "oldSize":J
    .end local v6    # "result":I
    :cond_2
    const/4 v2, 0x0

    .line 1682
    .local v2, "$i$a$-check--Buffer$commonExpandBuffer$3":I
    nop

    .end local v2    # "$i$a$-check--Buffer$commonExpandBuffer$3":I
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "expandBuffer() only permitted for read/write buffers"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1755
    .end local v1    # "buffer":Lnicoid/network238/okio/Buffer;
    :cond_3
    const/4 v1, 0x0

    .line 1681
    .local v1, "$i$a$-checkNotNull--Buffer$commonExpandBuffer$buffer$1":I
    nop

    .end local v1    # "$i$a$-checkNotNull--Buffer$commonExpandBuffer$buffer$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "not attached to a buffer"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1755
    :cond_4
    const/4 v1, 0x0

    .line 1680
    .local v1, "$i$a$-require--Buffer$commonExpandBuffer$2":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "minByteCount > Segment.SIZE: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--Buffer$commonExpandBuffer$2":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1755
    :cond_5
    const/4 v1, 0x0

    .line 1679
    .local v1, "$i$a$-require--Buffer$commonExpandBuffer$1":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "minByteCount <= 0: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--Buffer$commonExpandBuffer$1":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static final commonGet(Lnicoid/network238/okio/Buffer;J)B
    .registers 19
    .param p0, "$this$commonGet"    # Lnicoid/network238/okio/Buffer;
    .param p1, "pos"    # J

    const-string v0, "<this>"

    move-object/from16 v1, p0

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 411
    .local v0, "$i$f$commonGet":I
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v6, 0x1

    move-wide/from16 v4, p1

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 412
    move-wide/from16 v2, p1

    .local v2, "fromIndex$iv":J
    move-object/from16 v4, p0

    .local v4, "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    const/4 v5, 0x0

    .line 1734
    .local v5, "$i$f$seek":I
    iget-object v6, v4, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v6, :cond_0

    const/4 v6, 0x0

    .local v6, "s":Lnicoid/network238/okio/Segment;
    const-wide/16 v7, -0x1

    .local v7, "offset":J
    const/4 v9, 0x0

    .line 413
    .local v9, "$i$a$-seek--Buffer$commonGet$1":I
    invoke-static {v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v10, v6, Lnicoid/network238/okio/Segment;->data:[B

    iget v11, v6, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v11, v11

    add-long v11, v11, p1

    sub-long/2addr v11, v7

    long-to-int v11, v11

    aget-byte v10, v10, v11

    return v10

    .end local v6    # "s":Lnicoid/network238/okio/Segment;
    .end local v7    # "offset":J
    .end local v9    # "$i$a$-seek--Buffer$commonGet$1":I
    :cond_0
    nop

    .line 1736
    .local v6, "s$iv":Lnicoid/network238/okio/Segment;
    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    sub-long/2addr v7, v2

    cmp-long v7, v7, v2

    if-gez v7, :cond_2

    .line 1738
    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    .line 1739
    .local v7, "offset$iv":J
    :goto_0
    cmp-long v9, v7, v2

    if-lez v9, :cond_1

    .line 1740
    iget-object v9, v6, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v9}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v6, v9

    .line 1741
    iget v9, v6, Lnicoid/network238/okio/Segment;->limit:I

    iget v10, v6, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v9, v10

    int-to-long v9, v9

    sub-long/2addr v7, v9

    goto :goto_0

    .line 1743
    :cond_1
    move-object v9, v6

    .local v9, "s":Lnicoid/network238/okio/Segment;
    move-wide v10, v7

    .local v10, "offset":J
    const/4 v12, 0x0

    .line 413
    .local v12, "$i$a$-seek--Buffer$commonGet$1":I
    invoke-static {v9}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v13, v9, Lnicoid/network238/okio/Segment;->data:[B

    iget v14, v9, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v14, v14

    add-long v14, v14, p1

    sub-long/2addr v14, v10

    long-to-int v14, v14

    aget-byte v13, v13, v14

    return v13

    .line 1746
    .end local v7    # "offset$iv":J
    .end local v9    # "s":Lnicoid/network238/okio/Segment;
    .end local v10    # "offset":J
    .end local v12    # "$i$a$-seek--Buffer$commonGet$1":I
    :cond_2
    const-wide/16 v7, 0x0

    .line 1747
    .restart local v7    # "offset$iv":J
    :goto_1
    nop

    .line 1748
    iget v9, v6, Lnicoid/network238/okio/Segment;->limit:I

    iget v10, v6, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v9, v10

    int-to-long v9, v9

    add-long/2addr v9, v7

    .line 1749
    .local v9, "nextOffset$iv":J
    cmp-long v11, v9, v2

    if-gtz v11, :cond_3

    .line 1750
    iget-object v11, v6, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v6, v11

    .line 1751
    move-wide v7, v9

    .end local v9    # "nextOffset$iv":J
    goto :goto_1

    .line 1753
    :cond_3
    move-object v9, v6

    .local v9, "s":Lnicoid/network238/okio/Segment;
    move-wide v10, v7

    .restart local v10    # "offset":J
    const/4 v12, 0x0

    .line 413
    .restart local v12    # "$i$a$-seek--Buffer$commonGet$1":I
    invoke-static {v9}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v13, v9, Lnicoid/network238/okio/Segment;->data:[B

    iget v14, v9, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v14, v14

    add-long v14, v14, p1

    sub-long/2addr v14, v10

    long-to-int v14, v14

    aget-byte v13, v13, v14

    return v13
.end method

.method public static final commonHashCode(Lnicoid/network238/okio/Buffer;)I
    .registers 8
    .param p0, "$this$commonHashCode"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1452
    .local v0, "$i$f$commonHashCode":I
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    return v1

    .line 1453
    .local v1, "s":Lnicoid/network238/okio/Segment;
    :cond_0
    const/4 v2, 0x1

    .line 1455
    .local v2, "result":I
    :cond_1
    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 1456
    .local v3, "pos":I
    iget v4, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 1457
    .local v4, "limit":I
    :goto_0
    if-ge v3, v4, :cond_2

    .line 1458
    mul-int/lit8 v5, v2, 0x1f

    iget-object v6, v1, Lnicoid/network238/okio/Segment;->data:[B

    aget-byte v6, v6, v3

    add-int v2, v5, v6

    .line 1459
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1461
    :cond_2
    iget-object v5, v1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, v5

    .line 1462
    .end local v3    # "pos":I
    .end local v4    # "limit":I
    iget-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-ne v1, v3, :cond_1

    .line 1463
    return v2
.end method

.method public static final commonIndexOf(Lnicoid/network238/okio/Buffer;BJJ)J
    .registers 39
    .param p0, "$this$commonIndexOf"    # Lnicoid/network238/okio/Buffer;
    .param p1, "b"    # B
    .param p2, "fromIndex"    # J
    .param p4, "toIndex"    # J

    move/from16 v0, p1

    move-wide/from16 v1, p2

    move-wide/from16 v3, p4

    const-string v5, "<this>"

    move-object/from16 v6, p0

    invoke-static {v6, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x0

    .line 1256
    .local v5, "$i$f$commonIndexOf":I
    nop

    .line 1257
    nop

    .line 1258
    const-wide/16 v7, 0x0

    cmp-long v7, v7, v1

    const/4 v8, 0x0

    if-gtz v7, :cond_0

    cmp-long v7, v1, v3

    if-gtz v7, :cond_0

    const/4 v8, 0x1

    :cond_0
    if-eqz v8, :cond_f

    .line 1260
    invoke-virtual {v6}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    cmp-long v7, v3, v7

    if-lez v7, :cond_1

    invoke-virtual {v6}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    .end local p4    # "toIndex":J
    .local v7, "toIndex":J
    goto :goto_0

    .end local v7    # "toIndex":J
    .restart local p4    # "toIndex":J
    :cond_1
    move-wide v7, v3

    .line 1261
    .restart local v7    # "toIndex":J
    :goto_0
    cmp-long v9, v1, v7

    const-wide/16 v10, -0x1

    if-nez v9, :cond_2

    return-wide v10

    .line 1263
    :cond_2
    move-wide/from16 v12, p2

    .local v12, "fromIndex$iv":J
    move-object/from16 v9, p0

    .local v9, "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    const/4 v14, 0x0

    .line 1772
    .local v14, "$i$f$seek":I
    iget-object v15, v9, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v15, :cond_3

    const/4 v15, 0x0

    .local v15, "s":Lnicoid/network238/okio/Segment;
    const-wide/16 v16, -0x1

    .local v16, "offset":J
    const/16 v18, 0x0

    .line 1264
    .local v18, "$i$a$-seek--Buffer$commonIndexOf$2":I
    return-wide v10

    .end local v15    # "s":Lnicoid/network238/okio/Segment;
    .end local v16    # "offset":J
    .end local v18    # "$i$a$-seek--Buffer$commonIndexOf$2":I
    :cond_3
    nop

    .line 1774
    .local v15, "s$iv":Lnicoid/network238/okio/Segment;
    invoke-virtual {v9}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v16

    sub-long v16, v16, v12

    cmp-long v16, v16, v12

    if-gez v16, :cond_9

    .line 1776
    invoke-virtual {v9}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v16

    .line 1777
    .local v16, "offset$iv":J
    :goto_1
    cmp-long v18, v16, v12

    if-lez v18, :cond_4

    .line 1778
    move-wide/from16 v18, v10

    iget-object v10, v15, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v10}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v15, v10

    .line 1779
    iget v10, v15, Lnicoid/network238/okio/Segment;->limit:I

    iget v11, v15, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v10, v11

    int-to-long v10, v10

    sub-long v16, v16, v10

    move-wide/from16 v10, v18

    goto :goto_1

    .line 1781
    :cond_4
    move-wide/from16 v18, v10

    move-object v10, v15

    .local v10, "s":Lnicoid/network238/okio/Segment;
    move-wide/from16 v20, v16

    .local v20, "offset":J
    const/4 v11, 0x0

    .line 1264
    .local v11, "$i$a$-seek--Buffer$commonIndexOf$2":I
    if-nez v10, :cond_5

    return-wide v18

    :cond_5
    move-object/from16 v22, v10

    .line 1265
    .local v22, "s":Lnicoid/network238/okio/Segment;
    move-wide/from16 v23, v20

    move-wide/from16 v26, v1

    move/from16 v25, v5

    move-object/from16 v5, v22

    .line 1268
    .end local v22    # "s":Lnicoid/network238/okio/Segment;
    .local v5, "s":Lnicoid/network238/okio/Segment;
    .local v23, "offset":J
    .local v25, "$i$f$commonIndexOf":I
    .local v26, "fromIndex":J
    :goto_2
    cmp-long v22, v23, v7

    if-gez v22, :cond_8

    .line 1269
    iget-object v6, v5, Lnicoid/network238/okio/Segment;->data:[B

    .line 1270
    .local v6, "data":[B
    move-object/from16 v22, v6

    .end local v6    # "data":[B
    .local v22, "data":[B
    iget v6, v5, Lnicoid/network238/okio/Segment;->limit:I

    move-wide/from16 v28, v7

    .end local v7    # "toIndex":J
    .local v28, "toIndex":J
    int-to-long v6, v6

    iget v8, v5, Lnicoid/network238/okio/Segment;->pos:I

    move-object/from16 v30, v9

    .end local v9    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .local v30, "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    int-to-long v8, v8

    add-long v8, v8, v28

    sub-long v8, v8, v23

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v6, v6

    .line 1271
    .local v6, "limit":I
    iget v7, v5, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v7, v7

    add-long v7, v7, v26

    sub-long v7, v7, v23

    long-to-int v7, v7

    .line 1272
    .local v7, "pos":I
    :goto_3
    if-ge v7, v6, :cond_7

    .line 1273
    aget-byte v8, v22, v7

    if-ne v8, v0, :cond_6

    .line 1274
    iget v8, v5, Lnicoid/network238/okio/Segment;->pos:I

    sub-int v8, v7, v8

    int-to-long v8, v8

    add-long v8, v8, v23

    return-wide v8

    .line 1276
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 1280
    :cond_7
    iget v8, v5, Lnicoid/network238/okio/Segment;->limit:I

    iget v9, v5, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v8, v9

    int-to-long v8, v8

    add-long v23, v23, v8

    .line 1281
    move-wide/from16 v26, v23

    .line 1282
    iget-object v8, v5, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v8}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v5, v8

    move-object/from16 v6, p0

    move-wide/from16 v7, v28

    move-object/from16 v9, v30

    .end local v6    # "limit":I
    .end local v7    # "pos":I
    .end local v22    # "data":[B
    goto :goto_2

    .line 1285
    .end local v28    # "toIndex":J
    .end local v30    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .local v7, "toIndex":J
    .restart local v9    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    :cond_8
    return-wide v18

    .line 1784
    .end local v10    # "s":Lnicoid/network238/okio/Segment;
    .end local v11    # "$i$a$-seek--Buffer$commonIndexOf$2":I
    .end local v16    # "offset$iv":J
    .end local v20    # "offset":J
    .end local v23    # "offset":J
    .end local v25    # "$i$f$commonIndexOf":I
    .end local v26    # "fromIndex":J
    .local v5, "$i$f$commonIndexOf":I
    :cond_9
    move/from16 v25, v5

    move-wide/from16 v28, v7

    move-object/from16 v30, v9

    move-wide/from16 v18, v10

    .end local v5    # "$i$f$commonIndexOf":I
    .end local v7    # "toIndex":J
    .end local v9    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .restart local v25    # "$i$f$commonIndexOf":I
    .restart local v28    # "toIndex":J
    .restart local v30    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    const-wide/16 v5, 0x0

    .line 1785
    .local v5, "offset$iv":J
    :goto_4
    nop

    .line 1786
    iget v7, v15, Lnicoid/network238/okio/Segment;->limit:I

    iget v8, v15, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v7, v8

    int-to-long v7, v7

    add-long/2addr v7, v5

    .line 1787
    .local v7, "nextOffset$iv":J
    cmp-long v9, v7, v12

    if-gtz v9, :cond_a

    .line 1788
    iget-object v9, v15, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v9}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v15, v9

    .line 1789
    move-wide v5, v7

    .end local v7    # "nextOffset$iv":J
    goto :goto_4

    .line 1791
    :cond_a
    move-object v7, v15

    .local v7, "s":Lnicoid/network238/okio/Segment;
    move-wide v8, v5

    .local v8, "offset":J
    const/4 v10, 0x0

    .line 1264
    .local v10, "$i$a$-seek--Buffer$commonIndexOf$2":I
    if-nez v7, :cond_b

    return-wide v18

    :cond_b
    move-object v11, v7

    .line 1265
    .local v11, "s":Lnicoid/network238/okio/Segment;
    move-wide/from16 v16, v8

    move-wide/from16 v20, v1

    .line 1268
    .local v16, "offset":J
    .local v20, "fromIndex":J
    :goto_5
    cmp-long v22, v16, v28

    if-gez v22, :cond_e

    .line 1269
    move-wide/from16 v22, v5

    .end local v5    # "offset$iv":J
    .local v22, "offset$iv":J
    iget-object v5, v11, Lnicoid/network238/okio/Segment;->data:[B

    .line 1270
    .local v5, "data":[B
    iget v6, v11, Lnicoid/network238/okio/Segment;->limit:I

    move-object/from16 v24, v5

    .end local v5    # "data":[B
    .local v24, "data":[B
    int-to-long v5, v6

    move-object/from16 v26, v7

    .end local v7    # "s":Lnicoid/network238/okio/Segment;
    .local v26, "s":Lnicoid/network238/okio/Segment;
    iget v7, v11, Lnicoid/network238/okio/Segment;->pos:I

    move-wide/from16 v31, v8

    .end local v8    # "offset":J
    .local v31, "offset":J
    int-to-long v7, v7

    add-long v7, v7, v28

    sub-long v7, v7, v16

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    .line 1271
    .local v5, "limit":I
    iget v6, v11, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v6, v6

    add-long v6, v6, v20

    sub-long v6, v6, v16

    long-to-int v6, v6

    .line 1272
    .local v6, "pos":I
    :goto_6
    if-ge v6, v5, :cond_d

    .line 1273
    aget-byte v7, v24, v6

    if-ne v7, v0, :cond_c

    .line 1274
    iget v7, v11, Lnicoid/network238/okio/Segment;->pos:I

    sub-int v7, v6, v7

    int-to-long v7, v7

    add-long v7, v7, v16

    return-wide v7

    .line 1276
    :cond_c
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 1280
    :cond_d
    iget v7, v11, Lnicoid/network238/okio/Segment;->limit:I

    iget v8, v11, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v7, v8

    int-to-long v7, v7

    add-long v16, v16, v7

    .line 1281
    move-wide/from16 v20, v16

    .line 1282
    iget-object v7, v11, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v7}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v11, v7

    move-wide/from16 v5, v22

    move-object/from16 v7, v26

    move-wide/from16 v8, v31

    .end local v5    # "limit":I
    .end local v6    # "pos":I
    .end local v24    # "data":[B
    goto :goto_5

    .line 1285
    .end local v22    # "offset$iv":J
    .end local v26    # "s":Lnicoid/network238/okio/Segment;
    .end local v31    # "offset":J
    .local v5, "offset$iv":J
    .restart local v7    # "s":Lnicoid/network238/okio/Segment;
    .restart local v8    # "offset":J
    :cond_e
    return-wide v18

    .line 1755
    .end local v7    # "s":Lnicoid/network238/okio/Segment;
    .end local v8    # "offset":J
    .end local v10    # "$i$a$-seek--Buffer$commonIndexOf$2":I
    .end local v11    # "s":Lnicoid/network238/okio/Segment;
    .end local v12    # "fromIndex$iv":J
    .end local v14    # "$i$f$seek":I
    .end local v15    # "s$iv":Lnicoid/network238/okio/Segment;
    .end local v16    # "offset":J
    .end local v20    # "fromIndex":J
    .end local v25    # "$i$f$commonIndexOf":I
    .end local v28    # "toIndex":J
    .end local v30    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .local v5, "$i$f$commonIndexOf":I
    :cond_f
    move/from16 v25, v5

    .end local v5    # "$i$f$commonIndexOf":I
    .restart local v25    # "$i$f$commonIndexOf":I
    const/4 v5, 0x0

    .line 1258
    .local v5, "$i$a$-require--Buffer$commonIndexOf$1":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "size="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " fromIndex="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " toIndex="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .end local v5    # "$i$a$-require--Buffer$commonIndexOf$1":I
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public static final commonIndexOf(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JJII)J
    .registers 24

    move-wide/from16 v0, p2

    move-wide/from16 v2, p4

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1296
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v6

    int-to-long v7, v6

    int-to-long v9, v4

    int-to-long v11, v5

    invoke-static/range {v7 .. v12}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    if-lez v5, :cond_e

    const-wide/16 v6, 0x0

    cmp-long v8, v0, v6

    if-ltz v8, :cond_d

    cmp-long v8, v0, v2

    if-gtz v8, :cond_c

    .line 1303
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    cmp-long v8, v2, v8

    if-lez v8, :cond_0

    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    :cond_0
    cmp-long v8, v0, v2

    if-nez v8, :cond_1

    goto/16 :goto_6

    .line 1792
    :cond_1
    move-object/from16 v8, p0

    iget-object v9, v8, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v9, :cond_2

    goto/16 :goto_6

    .line 1794
    :cond_2
    invoke-virtual {v8}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v13

    sub-long/2addr v13, v0

    cmp-long v10, v13, v0

    if-gez v10, :cond_6

    .line 1796
    invoke-virtual {v8}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v6

    :goto_0
    cmp-long v10, v6, v0

    if-lez v10, :cond_3

    .line 1798
    iget-object v9, v9, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1799
    iget v10, v9, Lnicoid/network238/okio/Segment;->limit:I

    iget v15, v9, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v10, v15

    const-wide/16 p4, 0x1

    int-to-long v13, v10

    sub-long/2addr v6, v13

    goto :goto_0

    .line 1312
    :cond_3
    const-wide/16 p4, 0x1

    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object v10

    .line 1313
    aget-byte v13, v10, v4

    .line 1314
    invoke-virtual {v8}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v14

    sub-long/2addr v14, v11

    add-long v14, v14, p4

    invoke-static {v2, v3, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    :goto_1
    cmp-long v8, v6, v2

    if-gez v8, :cond_b

    .line 1317
    iget-object v8, v9, Lnicoid/network238/okio/Segment;->data:[B

    .line 1318
    iget v11, v9, Lnicoid/network238/okio/Segment;->limit:I

    iget v12, v9, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v14, v12

    add-long/2addr v14, v2

    sub-long/2addr v14, v6

    int-to-long v11, v11

    .line 1793
    invoke-static {v11, v12, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v11

    long-to-int v11, v11

    .line 1319
    iget v12, v9, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v14, v12

    add-long/2addr v14, v0

    sub-long/2addr v14, v6

    long-to-int v0, v14

    :goto_2
    if-ge v0, v11, :cond_5

    .line 1321
    aget-byte v1, v8, v0

    if-ne v1, v13, :cond_4

    add-int/lit8 v1, v0, 0x1

    add-int/lit8 v12, v4, 0x1

    .line 1322
    invoke-static {v9, v1, v10, v12, v5}, Lnicoid/network238/okio/internal/-Buffer;->rangeEquals(Lnicoid/network238/okio/Segment;I[BII)Z

    move-result v1

    if-nez v1, :cond_8

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1329
    :cond_5
    iget v0, v9, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, v9, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long/2addr v6, v0

    .line 1331
    iget-object v9, v9, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v0, v6

    goto :goto_1

    :cond_6
    const-wide/16 p4, 0x1

    .line 1806
    :goto_3
    iget v10, v9, Lnicoid/network238/okio/Segment;->limit:I

    iget v13, v9, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v10, v13

    int-to-long v13, v10

    add-long/2addr v13, v6

    cmp-long v10, v13, v0

    if-gtz v10, :cond_7

    .line 1808
    iget-object v9, v9, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v6, v13

    goto :goto_3

    .line 1312
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object v10

    .line 1313
    aget-byte v13, v10, v4

    .line 1314
    invoke-virtual {v8}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v14

    sub-long/2addr v14, v11

    add-long v14, v14, p4

    invoke-static {v2, v3, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    :goto_4
    cmp-long v8, v6, v2

    if-gez v8, :cond_b

    .line 1317
    iget-object v8, v9, Lnicoid/network238/okio/Segment;->data:[B

    .line 1318
    iget v11, v9, Lnicoid/network238/okio/Segment;->limit:I

    iget v12, v9, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v14, v12

    add-long/2addr v14, v2

    sub-long/2addr v14, v6

    int-to-long v11, v11

    .line 1793
    invoke-static {v11, v12, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v11

    long-to-int v11, v11

    .line 1319
    iget v12, v9, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v14, v12

    add-long/2addr v14, v0

    sub-long/2addr v14, v6

    long-to-int v0, v14

    :goto_5
    if-ge v0, v11, :cond_a

    .line 1321
    aget-byte v1, v8, v0

    if-ne v1, v13, :cond_9

    add-int/lit8 v1, v0, 0x1

    add-int/lit8 v12, v4, 0x1

    .line 1322
    invoke-static {v9, v1, v10, v12, v5}, Lnicoid/network238/okio/internal/-Buffer;->rangeEquals(Lnicoid/network238/okio/Segment;I[BII)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1324
    :cond_8
    iget v1, v9, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long/2addr v0, v6

    return-wide v0

    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 1329
    :cond_a
    iget v0, v9, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, v9, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long/2addr v6, v0

    .line 1331
    iget-object v9, v9, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v0, v6

    goto :goto_4

    :cond_b
    :goto_6
    const-wide/16 v0, -0x1

    return-wide v0

    .line 1299
    :cond_c
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "fromIndex > toIndex: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " > "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1298
    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "fromIndex < 0: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1297
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "byteCount == 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic commonIndexOf$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JJIIILjava/lang/Object;)J
    .registers 18

    and-int/lit8 v0, p8, 0x4

    if-eqz v0, :cond_0

    const-wide p4, 0x7fffffffffffffffL

    :cond_0
    move-wide v4, p4

    and-int/lit8 p4, p8, 0x8

    if-eqz p4, :cond_1

    const/4 p4, 0x0

    move v6, p4

    goto :goto_0

    :cond_1
    move v6, p6

    :goto_0
    and-int/lit8 p4, p8, 0x10

    if-eqz p4, :cond_2

    .line 1294
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p4

    move v7, p4

    goto :goto_1

    .line 0
    :cond_2
    move v7, p7

    .line 1289
    :goto_1
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okio/internal/-Buffer;->commonIndexOf(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JJII)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final commonIndexOfElement(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;J)J
    .registers 36
    .param p0, "$this$commonIndexOfElement"    # Lnicoid/network238/okio/Buffer;
    .param p1, "targetBytes"    # Lnicoid/network238/okio/ByteString;
    .param p2, "fromIndex"    # J

    move-object/from16 v0, p1

    move-wide/from16 v1, p2

    const-string v3, "<this>"

    move-object/from16 v4, p0

    invoke-static {v4, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "targetBytes"

    invoke-static {v0, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x0

    .line 1339
    .local v3, "$i$f$commonIndexOfElement":I
    nop

    .line 1340
    const-wide/16 v5, 0x0

    cmp-long v5, v1, v5

    const/4 v6, 0x0

    if-ltz v5, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    move v5, v6

    :goto_0
    if-eqz v5, :cond_17

    .line 1342
    move-wide/from16 v8, p2

    .local v8, "fromIndex$iv":J
    move-object/from16 v5, p0

    .local v5, "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    const/4 v10, 0x0

    .line 1812
    .local v10, "$i$f$seek":I
    iget-object v11, v5, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    const-wide/16 v12, -0x1

    if-nez v11, :cond_1

    const/4 v6, 0x0

    .local v6, "s":Lnicoid/network238/okio/Segment;
    const-wide/16 v14, -0x1

    .local v14, "offset":J
    const/4 v7, 0x0

    .line 1343
    .local v7, "$i$a$-seek--Buffer$commonIndexOfElement$2":I
    return-wide v12

    .end local v6    # "s":Lnicoid/network238/okio/Segment;
    .end local v7    # "$i$a$-seek--Buffer$commonIndexOfElement$2":I
    .end local v14    # "offset":J
    :cond_1
    nop

    .line 1814
    .local v11, "s$iv":Lnicoid/network238/okio/Segment;
    invoke-virtual {v5}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v14

    sub-long/2addr v14, v8

    cmp-long v14, v14, v8

    const/4 v15, 0x2

    if-gez v14, :cond_c

    .line 1816
    invoke-virtual {v5}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v16

    .line 1817
    .local v16, "offset$iv":J
    :goto_1
    cmp-long v14, v16, v8

    if-lez v14, :cond_2

    .line 1818
    iget-object v14, v11, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v14}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v11, v14

    .line 1819
    iget v14, v11, Lnicoid/network238/okio/Segment;->limit:I

    move-wide/from16 v18, v12

    iget v12, v11, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v14, v12

    int-to-long v12, v14

    sub-long v16, v16, v12

    move-wide/from16 v12, v18

    goto :goto_1

    .line 1821
    :cond_2
    move-wide/from16 v18, v12

    move-object v12, v11

    .local v12, "s":Lnicoid/network238/okio/Segment;
    move-wide/from16 v13, v16

    .local v13, "offset":J
    const/16 v20, 0x0

    .line 1343
    .local v20, "$i$a$-seek--Buffer$commonIndexOfElement$2":I
    if-nez v12, :cond_3

    return-wide v18

    :cond_3
    move-object/from16 v21, v12

    .line 1344
    .local v21, "s":Lnicoid/network238/okio/Segment;
    move-wide/from16 v22, v13

    .line 1349
    .local v22, "offset":J
    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v7

    if-ne v7, v15, :cond_7

    .line 1351
    invoke-virtual {v0, v6}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v6

    .line 1352
    .local v6, "b0":B
    const/4 v7, 0x1

    invoke-virtual {v0, v7}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v7

    move-wide/from16 v24, v1

    move-object/from16 v15, v21

    .line 1353
    .end local v21    # "s":Lnicoid/network238/okio/Segment;
    .local v7, "b1":B
    .local v15, "s":Lnicoid/network238/okio/Segment;
    .local v24, "fromIndex":J
    :goto_2
    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v26

    cmp-long v21, v22, v26

    if-gez v21, :cond_6

    .line 1354
    move/from16 v26, v3

    .end local v3    # "$i$f$commonIndexOfElement":I
    .local v26, "$i$f$commonIndexOfElement":I
    iget-object v3, v15, Lnicoid/network238/okio/Segment;->data:[B

    .line 1355
    .local v3, "data":[B
    move-object/from16 v21, v3

    .end local v3    # "data":[B
    .local v21, "data":[B
    iget v3, v15, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v3, v3

    add-long v3, v3, v24

    sub-long v3, v3, v22

    long-to-int v3, v3

    .line 1356
    .local v3, "pos":I
    iget v4, v15, Lnicoid/network238/okio/Segment;->limit:I

    .line 1357
    .local v4, "limit":I
    :goto_3
    if-ge v3, v4, :cond_5

    .line 1358
    move/from16 v27, v3

    .end local v3    # "pos":I
    .local v27, "pos":I
    aget-byte v3, v21, v27

    .line 1359
    .local v3, "b":I
    if-eq v3, v6, :cond_4

    if-eq v3, v7, :cond_4

    .line 1362
    nop

    .end local v3    # "b":I
    add-int/lit8 v3, v27, 0x1

    .end local v27    # "pos":I
    .local v3, "pos":I
    goto :goto_3

    .line 1360
    .local v3, "b":I
    .restart local v27    # "pos":I
    :cond_4
    move/from16 v28, v3

    .end local v3    # "b":I
    .local v28, "b":I
    iget v3, v15, Lnicoid/network238/okio/Segment;->pos:I

    sub-int v3, v27, v3

    move/from16 v29, v4

    .end local v4    # "limit":I
    .local v29, "limit":I
    int-to-long v3, v3

    add-long v3, v3, v22

    return-wide v3

    .line 1366
    .end local v27    # "pos":I
    .end local v28    # "b":I
    .end local v29    # "limit":I
    .local v3, "pos":I
    .restart local v4    # "limit":I
    :cond_5
    move/from16 v27, v3

    move/from16 v29, v4

    .end local v3    # "pos":I
    .end local v4    # "limit":I
    .restart local v27    # "pos":I
    .restart local v29    # "limit":I
    iget v3, v15, Lnicoid/network238/okio/Segment;->limit:I

    iget v4, v15, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long v22, v22, v3

    .line 1367
    move-wide/from16 v24, v22

    .line 1368
    iget-object v3, v15, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v15, v3

    move-object/from16 v4, p0

    move/from16 v3, v26

    .end local v21    # "data":[B
    .end local v27    # "pos":I
    .end local v29    # "limit":I
    goto :goto_2

    .line 1353
    .end local v26    # "$i$f$commonIndexOfElement":I
    .local v3, "$i$f$commonIndexOfElement":I
    :cond_6
    move/from16 v26, v3

    .end local v3    # "$i$f$commonIndexOfElement":I
    .restart local v26    # "$i$f$commonIndexOfElement":I
    move-object/from16 v28, v5

    goto/16 :goto_7

    .line 1372
    .end local v6    # "b0":B
    .end local v7    # "b1":B
    .end local v15    # "s":Lnicoid/network238/okio/Segment;
    .end local v24    # "fromIndex":J
    .end local v26    # "$i$f$commonIndexOfElement":I
    .restart local v3    # "$i$f$commonIndexOfElement":I
    .local v21, "s":Lnicoid/network238/okio/Segment;
    :cond_7
    move/from16 v26, v3

    .end local v3    # "$i$f$commonIndexOfElement":I
    .restart local v26    # "$i$f$commonIndexOfElement":I
    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object v3

    move-wide/from16 v24, v1

    move-object/from16 v4, v21

    .line 1373
    .end local v21    # "s":Lnicoid/network238/okio/Segment;
    .local v3, "targetByteArray":[B
    .local v4, "s":Lnicoid/network238/okio/Segment;
    .restart local v24    # "fromIndex":J
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v27

    cmp-long v7, v22, v27

    if-gez v7, :cond_b

    .line 1374
    iget-object v7, v4, Lnicoid/network238/okio/Segment;->data:[B

    .line 1375
    .local v7, "data":[B
    iget v15, v4, Lnicoid/network238/okio/Segment;->pos:I

    move-object/from16 v27, v7

    .end local v7    # "data":[B
    .local v27, "data":[B
    int-to-long v6, v15

    add-long v6, v6, v24

    sub-long v6, v6, v22

    long-to-int v6, v6

    .line 1376
    .local v6, "pos":I
    iget v7, v4, Lnicoid/network238/okio/Segment;->limit:I

    .line 1377
    .local v7, "limit":I
    :goto_5
    if-ge v6, v7, :cond_a

    .line 1378
    aget-byte v15, v27, v6

    .line 1379
    .local v15, "b":I
    move-object/from16 v28, v5

    .end local v5    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .local v28, "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    array-length v5, v3

    move-object/from16 v29, v3

    const/4 v3, 0x0

    .end local v3    # "targetByteArray":[B
    .local v29, "targetByteArray":[B
    :goto_6
    if-ge v3, v5, :cond_9

    move/from16 v30, v3

    aget-byte v3, v29, v30

    .line 1380
    .local v3, "t":B
    if-ne v15, v3, :cond_8

    iget v5, v4, Lnicoid/network238/okio/Segment;->pos:I

    sub-int v5, v6, v5

    move/from16 v31, v6

    .end local v6    # "pos":I
    .local v31, "pos":I
    int-to-long v5, v5

    add-long v5, v5, v22

    return-wide v5

    .end local v31    # "pos":I
    .restart local v6    # "pos":I
    :cond_8
    move/from16 v31, v6

    .line 1379
    .end local v3    # "t":B
    .end local v6    # "pos":I
    .restart local v31    # "pos":I
    add-int/lit8 v3, v30, 0x1

    goto :goto_6

    .line 1382
    .end local v31    # "pos":I
    .restart local v6    # "pos":I
    :cond_9
    move/from16 v31, v6

    .end local v6    # "pos":I
    .end local v15    # "b":I
    .restart local v31    # "pos":I
    add-int/lit8 v6, v31, 0x1

    move-object/from16 v5, v28

    move-object/from16 v3, v29

    .end local v31    # "pos":I
    .restart local v6    # "pos":I
    goto :goto_5

    .line 1386
    .end local v28    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .end local v29    # "targetByteArray":[B
    .local v3, "targetByteArray":[B
    .restart local v5    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    :cond_a
    move-object/from16 v29, v3

    move-object/from16 v28, v5

    move/from16 v31, v6

    .end local v3    # "targetByteArray":[B
    .end local v5    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .end local v6    # "pos":I
    .restart local v28    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .restart local v29    # "targetByteArray":[B
    .restart local v31    # "pos":I
    iget v3, v4, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v4, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v3, v5

    int-to-long v5, v3

    add-long v22, v22, v5

    .line 1387
    move-wide/from16 v24, v22

    .line 1388
    iget-object v3, v4, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v4, v3

    move-object/from16 v5, v28

    move-object/from16 v3, v29

    const/4 v6, 0x0

    .end local v7    # "limit":I
    .end local v27    # "data":[B
    .end local v31    # "pos":I
    goto :goto_4

    .line 1373
    .end local v28    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .end local v29    # "targetByteArray":[B
    .restart local v3    # "targetByteArray":[B
    .restart local v5    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    :cond_b
    move-object/from16 v29, v3

    move-object/from16 v28, v5

    .end local v3    # "targetByteArray":[B
    .end local v5    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .restart local v28    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .restart local v29    # "targetByteArray":[B
    move-object v15, v4

    .line 1392
    .end local v4    # "s":Lnicoid/network238/okio/Segment;
    .end local v29    # "targetByteArray":[B
    .local v15, "s":Lnicoid/network238/okio/Segment;
    :goto_7
    return-wide v18

    .line 1824
    .end local v12    # "s":Lnicoid/network238/okio/Segment;
    .end local v13    # "offset":J
    .end local v15    # "s":Lnicoid/network238/okio/Segment;
    .end local v16    # "offset$iv":J
    .end local v20    # "$i$a$-seek--Buffer$commonIndexOfElement$2":I
    .end local v22    # "offset":J
    .end local v24    # "fromIndex":J
    .end local v26    # "$i$f$commonIndexOfElement":I
    .end local v28    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .local v3, "$i$f$commonIndexOfElement":I
    .restart local v5    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    :cond_c
    move/from16 v26, v3

    move-object/from16 v28, v5

    move-wide/from16 v18, v12

    .end local v3    # "$i$f$commonIndexOfElement":I
    .end local v5    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .restart local v26    # "$i$f$commonIndexOfElement":I
    .restart local v28    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    const-wide/16 v3, 0x0

    .line 1825
    .local v3, "offset$iv":J
    :goto_8
    nop

    .line 1826
    iget v5, v11, Lnicoid/network238/okio/Segment;->limit:I

    iget v6, v11, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    add-long/2addr v5, v3

    .line 1827
    .local v5, "nextOffset$iv":J
    cmp-long v7, v5, v8

    if-gtz v7, :cond_d

    .line 1828
    iget-object v7, v11, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v7}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v11, v7

    .line 1829
    move-wide v3, v5

    .end local v5    # "nextOffset$iv":J
    goto :goto_8

    .line 1831
    :cond_d
    move-object v5, v11

    .local v5, "s":Lnicoid/network238/okio/Segment;
    move-wide v6, v3

    .local v6, "offset":J
    const/4 v12, 0x0

    .line 1343
    .local v12, "$i$a$-seek--Buffer$commonIndexOfElement$2":I
    if-nez v5, :cond_e

    return-wide v18

    :cond_e
    move-object v13, v5

    .line 1344
    .local v13, "s":Lnicoid/network238/okio/Segment;
    move-wide/from16 v16, v6

    .line 1349
    .local v16, "offset":J
    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v14

    if-ne v14, v15, :cond_12

    .line 1351
    const/4 v14, 0x0

    invoke-virtual {v0, v14}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v14

    .line 1352
    .local v14, "b0":B
    const/4 v15, 0x1

    invoke-virtual {v0, v15}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v15

    move-wide/from16 v20, v1

    .line 1353
    .local v15, "b1":B
    .local v20, "fromIndex":J
    :goto_9
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v22

    cmp-long v22, v16, v22

    if-gez v22, :cond_11

    .line 1354
    iget-object v0, v13, Lnicoid/network238/okio/Segment;->data:[B

    .line 1355
    .local v0, "data":[B
    move-object/from16 v22, v0

    .end local v0    # "data":[B
    .local v22, "data":[B
    iget v0, v13, Lnicoid/network238/okio/Segment;->pos:I

    move-wide/from16 v23, v3

    .end local v3    # "offset$iv":J
    .local v23, "offset$iv":J
    int-to-long v3, v0

    add-long v3, v3, v20

    sub-long v3, v3, v16

    long-to-int v0, v3

    .line 1356
    .local v0, "pos":I
    iget v3, v13, Lnicoid/network238/okio/Segment;->limit:I

    .line 1357
    .local v3, "limit":I
    :goto_a
    if-ge v0, v3, :cond_10

    .line 1358
    aget-byte v4, v22, v0

    .line 1359
    .local v4, "b":I
    if-eq v4, v14, :cond_f

    if-eq v4, v15, :cond_f

    .line 1362
    nop

    .end local v4    # "b":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1360
    .restart local v4    # "b":I
    :cond_f
    move/from16 v25, v0

    .end local v0    # "pos":I
    .local v25, "pos":I
    iget v0, v13, Lnicoid/network238/okio/Segment;->pos:I

    sub-int v0, v25, v0

    move/from16 v27, v3

    move/from16 v29, v4

    .end local v3    # "limit":I
    .end local v4    # "b":I
    .local v27, "limit":I
    .local v29, "b":I
    int-to-long v3, v0

    add-long v3, v3, v16

    return-wide v3

    .line 1366
    .end local v25    # "pos":I
    .end local v27    # "limit":I
    .end local v29    # "b":I
    .restart local v0    # "pos":I
    .restart local v3    # "limit":I
    :cond_10
    move/from16 v25, v0

    move/from16 v27, v3

    .end local v0    # "pos":I
    .end local v3    # "limit":I
    .restart local v25    # "pos":I
    .restart local v27    # "limit":I
    iget v0, v13, Lnicoid/network238/okio/Segment;->limit:I

    iget v3, v13, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v3

    int-to-long v3, v0

    add-long v16, v16, v3

    .line 1367
    move-wide/from16 v20, v16

    .line 1368
    iget-object v0, v13, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v13, v0

    move-object/from16 v0, p1

    move-wide/from16 v3, v23

    .end local v22    # "data":[B
    .end local v25    # "pos":I
    .end local v27    # "limit":I
    goto :goto_9

    .line 1353
    .end local v23    # "offset$iv":J
    .local v3, "offset$iv":J
    :cond_11
    move-wide/from16 v23, v3

    .end local v3    # "offset$iv":J
    .restart local v23    # "offset$iv":J
    goto/16 :goto_e

    .line 1372
    .end local v14    # "b0":B
    .end local v15    # "b1":B
    .end local v20    # "fromIndex":J
    .end local v23    # "offset$iv":J
    .restart local v3    # "offset$iv":J
    :cond_12
    move-wide/from16 v23, v3

    const/4 v14, 0x0

    .end local v3    # "offset$iv":J
    .restart local v23    # "offset$iv":J
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object v0

    move-wide/from16 v20, v1

    .line 1373
    .local v0, "targetByteArray":[B
    .restart local v20    # "fromIndex":J
    :goto_b
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    cmp-long v3, v16, v3

    if-gez v3, :cond_16

    .line 1374
    iget-object v3, v13, Lnicoid/network238/okio/Segment;->data:[B

    .line 1375
    .local v3, "data":[B
    iget v4, v13, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v14, v4

    add-long v14, v14, v20

    sub-long v14, v14, v16

    long-to-int v4, v14

    .line 1376
    .local v4, "pos":I
    iget v14, v13, Lnicoid/network238/okio/Segment;->limit:I

    .line 1377
    .local v14, "limit":I
    :goto_c
    if-ge v4, v14, :cond_15

    .line 1378
    aget-byte v15, v3, v4

    .line 1379
    .local v15, "b":I
    move-object/from16 v25, v3

    .end local v3    # "data":[B
    .local v25, "data":[B
    array-length v3, v0

    move-object/from16 v27, v0

    const/4 v0, 0x0

    .end local v0    # "targetByteArray":[B
    .local v27, "targetByteArray":[B
    :goto_d
    if-ge v0, v3, :cond_14

    move/from16 v29, v0

    aget-byte v0, v27, v29

    .line 1380
    .local v0, "t":B
    if-ne v15, v0, :cond_13

    iget v3, v13, Lnicoid/network238/okio/Segment;->pos:I

    sub-int v3, v4, v3

    move/from16 v30, v4

    .end local v4    # "pos":I
    .local v30, "pos":I
    int-to-long v3, v3

    add-long v3, v3, v16

    return-wide v3

    .end local v30    # "pos":I
    .restart local v4    # "pos":I
    :cond_13
    move/from16 v30, v4

    .line 1379
    .end local v0    # "t":B
    .end local v4    # "pos":I
    .restart local v30    # "pos":I
    add-int/lit8 v0, v29, 0x1

    goto :goto_d

    .line 1382
    .end local v30    # "pos":I
    .restart local v4    # "pos":I
    :cond_14
    move/from16 v30, v4

    .end local v4    # "pos":I
    .end local v15    # "b":I
    .restart local v30    # "pos":I
    add-int/lit8 v4, v30, 0x1

    move-object/from16 v3, v25

    move-object/from16 v0, v27

    .end local v30    # "pos":I
    .restart local v4    # "pos":I
    goto :goto_c

    .line 1386
    .end local v25    # "data":[B
    .end local v27    # "targetByteArray":[B
    .local v0, "targetByteArray":[B
    .restart local v3    # "data":[B
    :cond_15
    move-object/from16 v27, v0

    move-object/from16 v25, v3

    move/from16 v30, v4

    .end local v0    # "targetByteArray":[B
    .end local v3    # "data":[B
    .end local v4    # "pos":I
    .restart local v25    # "data":[B
    .restart local v27    # "targetByteArray":[B
    .restart local v30    # "pos":I
    iget v0, v13, Lnicoid/network238/okio/Segment;->limit:I

    iget v3, v13, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v3

    int-to-long v3, v0

    add-long v16, v16, v3

    .line 1387
    move-wide/from16 v20, v16

    .line 1388
    iget-object v0, v13, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v13, v0

    move-object/from16 v0, v27

    const/4 v14, 0x0

    .end local v14    # "limit":I
    .end local v25    # "data":[B
    .end local v30    # "pos":I
    goto :goto_b

    .line 1373
    .end local v27    # "targetByteArray":[B
    .restart local v0    # "targetByteArray":[B
    :cond_16
    move-object/from16 v27, v0

    .line 1392
    .end local v0    # "targetByteArray":[B
    :goto_e
    return-wide v18

    .line 1755
    .end local v5    # "s":Lnicoid/network238/okio/Segment;
    .end local v6    # "offset":J
    .end local v8    # "fromIndex$iv":J
    .end local v10    # "$i$f$seek":I
    .end local v11    # "s$iv":Lnicoid/network238/okio/Segment;
    .end local v12    # "$i$a$-seek--Buffer$commonIndexOfElement$2":I
    .end local v13    # "s":Lnicoid/network238/okio/Segment;
    .end local v16    # "offset":J
    .end local v20    # "fromIndex":J
    .end local v23    # "offset$iv":J
    .end local v26    # "$i$f$commonIndexOfElement":I
    .end local v28    # "$this$seek$iv":Lnicoid/network238/okio/Buffer;
    .local v3, "$i$f$commonIndexOfElement":I
    :cond_17
    move/from16 v26, v3

    .end local v3    # "$i$f$commonIndexOfElement":I
    .restart local v26    # "$i$f$commonIndexOfElement":I
    const/4 v0, 0x0

    .line 1340
    .local v0, "$i$a$-require--Buffer$commonIndexOfElement$1":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fromIndex < 0: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v0    # "$i$a$-require--Buffer$commonIndexOfElement$1":I
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static final commonNext(Lnicoid/network238/okio/Buffer$UnsafeCursor;)I
    .registers 6
    .param p0, "$this$commonNext"    # Lnicoid/network238/okio/Buffer$UnsafeCursor;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1548
    .local v0, "$i$f$commonNext":I
    iget-wide v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    iget-object v3, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    .line 1549
    iget-wide v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const-wide/16 v1, 0x0

    goto :goto_1

    :cond_1
    iget-wide v1, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    iget v3, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    iget v4, p0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v1, v3

    :goto_1
    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->seek(J)I

    move-result v1

    return v1

    .line 1755
    :cond_2
    const/4 v1, 0x0

    .line 1548
    .local v1, "$i$a$-check--Buffer$commonNext$1":I
    nop

    .end local v1    # "$i$a$-check--Buffer$commonNext$1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "no more bytes"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonRangeEquals(Lnicoid/network238/okio/Buffer;JLnicoid/network238/okio/ByteString;II)Z
    .registers 17
    .param p0, "$this$commonRangeEquals"    # Lnicoid/network238/okio/Buffer;
    .param p1, "offset"    # J
    .param p3, "bytes"    # Lnicoid/network238/okio/ByteString;
    .param p4, "bytesOffset"    # I
    .param p5, "byteCount"    # I

    move/from16 v7, p5

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "bytes"

    invoke-static {p3, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v8, 0x0

    .line 1402
    .local v8, "$i$f$commonRangeEquals":I
    const/4 v9, 0x0

    if-gez v7, :cond_0

    return v9

    .line 1403
    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_4

    int-to-long v0, v7

    add-long/2addr v0, p1

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_4

    .line 1404
    if-ltz p4, :cond_3

    add-int v0, p4, v7

    invoke-virtual {p3}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    if-gt v0, v1, :cond_3

    .line 1405
    const/4 v10, 0x1

    if-nez v7, :cond_1

    return v10

    .line 1407
    :cond_1
    nop

    .line 1412
    const-wide/16 v0, 0x1

    add-long v4, p1, v0

    .line 1407
    nop

    .line 1408
    nop

    .line 1411
    nop

    .line 1412
    nop

    .line 1409
    nop

    .line 1410
    nop

    .line 1407
    move-object v0, p0

    move-wide v2, p1

    move-object v1, p3

    move v6, p4

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okio/internal/-Buffer;->commonIndexOf(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JJII)J

    move-result-wide v4

    .line 1413
    nop

    .line 1407
    const-wide/16 v0, -0x1

    cmp-long v0, v4, v0

    if-eqz v0, :cond_2

    move v9, v10

    :cond_2
    return v9

    .line 1404
    :cond_3
    return v9

    .line 1403
    :cond_4
    return v9
.end method

.method public static final commonRead(Lnicoid/network238/okio/Buffer;[B)I
    .registers 5
    .param p0, "$this$commonRead"    # Lnicoid/network238/okio/Buffer;
    .param p1, "sink"    # [B

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sink"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 613
    .local v0, "$i$f$commonRead":I
    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {p0, p1, v1, v2}, Lnicoid/network238/okio/Buffer;->read([BII)I

    move-result v1

    return v1
.end method

.method public static final commonRead(Lnicoid/network238/okio/Buffer;[BII)I
    .registers 12
    .param p0, "$this$commonRead"    # Lnicoid/network238/okio/Buffer;
    .param p1, "sink"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sink"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 625
    .local v0, "$i$f$commonRead":I
    array-length v1, p1

    int-to-long v2, v1

    int-to-long v4, p2

    int-to-long v6, p3

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 627
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v1, :cond_0

    const/4 v1, -0x1

    return v1

    .line 628
    .local v1, "s":Lnicoid/network238/okio/Segment;
    :cond_0
    iget v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 629
    .local v2, "toCopy":I
    iget-object v3, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 630
    nop

    .line 631
    nop

    .line 632
    iget v4, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 633
    iget v5, v1, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v5, v2

    .line 629
    invoke-static {v3, p1, p2, v4, v5}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 636
    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v3, v2

    iput v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 637
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v5, v2

    sub-long/2addr v3, v5

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 639
    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    iget v4, v1, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v3, v4, :cond_1

    .line 640
    invoke-virtual {v1}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v3

    iput-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 641
    invoke-static {v1}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    .line 644
    :cond_1
    return v2
.end method

.method public static final commonRead(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer;J)J
    .registers 9
    .param p0, "$this$commonRead"    # Lnicoid/network238/okio/Buffer;
    .param p1, "sink"    # Lnicoid/network238/okio/Buffer;
    .param p2, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sink"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1247
    .local v0, "$i$f$commonRead":I
    nop

    .line 1248
    const-wide/16 v1, 0x0

    cmp-long v3, p2, v1

    if-ltz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_3

    .line 1249
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    cmp-long v1, v3, v1

    if-nez v1, :cond_1

    const-wide/16 v1, -0x1

    return-wide v1

    .line 1250
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    cmp-long v1, p2, v1

    if-lez v1, :cond_2

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    .end local p2    # "byteCount":J
    .local v1, "byteCount":J
    goto :goto_1

    .end local v1    # "byteCount":J
    .restart local p2    # "byteCount":J
    :cond_2
    move-wide v1, p2

    .line 1251
    .restart local v1    # "byteCount":J
    :goto_1
    invoke-virtual {p1, p0, v1, v2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 1252
    return-wide v1

    .line 1755
    .end local v1    # "byteCount":J
    :cond_3
    const/4 v1, 0x0

    .line 1248
    .local v1, "$i$a$-require--Buffer$commonRead$1":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "byteCount < 0: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--Buffer$commonRead$1":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static final commonReadAll(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Sink;)J
    .registers 7
    .param p0, "$this$commonReadAll"    # Lnicoid/network238/okio/Buffer;
    .param p1, "sink"    # Lnicoid/network238/okio/Sink;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sink"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 804
    .local v0, "$i$f$commonReadAll":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    .line 805
    .local v1, "byteCount":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_0

    .line 806
    invoke-interface {p1, p0, v1, v2}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 808
    :cond_0
    return-wide v1
.end method

.method public static final commonReadAndWriteUnsafe(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1540
    iget-object v0, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-nez v0, :cond_0

    .line 1542
    iput-object p0, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    .line 1543
    const/4 p0, 0x1

    iput-boolean p0, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->readWrite:Z

    return-object p1

    .line 1540
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "already attached to a buffer"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final commonReadByte(Lnicoid/network238/okio/Buffer;)B
    .registers 11
    .param p0, "$this$commonReadByte"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 289
    .local v0, "$i$f$commonReadByte":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    .line 291
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 292
    .local v1, "segment":Lnicoid/network238/okio/Segment;
    iget v2, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 293
    .local v2, "pos":I
    iget v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 295
    .local v3, "limit":I
    iget-object v4, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 296
    .local v4, "data":[B
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "pos":I
    .local v5, "pos":I
    aget-byte v2, v4, v2

    .line 297
    .local v2, "b":B
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v6

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    invoke-virtual {p0, v6, v7}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 299
    if-ne v5, v3, :cond_0

    .line 300
    invoke-virtual {v1}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v6

    iput-object v6, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 301
    invoke-static {v1}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_0

    .line 303
    :cond_0
    iput v5, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 306
    :goto_0
    return v2

    .line 289
    .end local v1    # "segment":Lnicoid/network238/okio/Segment;
    .end local v2    # "b":B
    .end local v3    # "limit":I
    .end local v4    # "data":[B
    .end local v5    # "pos":I
    :cond_1
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public static final commonReadByteArray(Lnicoid/network238/okio/Buffer;)[B
    .registers 4
    .param p0, "$this$commonReadByteArray"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 602
    .local v0, "$i$f$commonReadByteArray":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->readByteArray(J)[B

    move-result-object v1

    return-object v1
.end method

.method public static final commonReadByteArray(Lnicoid/network238/okio/Buffer;J)[B
    .registers 7
    .param p0, "$this$commonReadByteArray"    # Lnicoid/network238/okio/Buffer;
    .param p1, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 605
    .local v0, "$i$f$commonReadByteArray":I
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-ltz v1, :cond_0

    const-wide/32 v1, 0x7fffffff

    cmp-long v1, p1, v1

    if-gtz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    .line 606
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    cmp-long v1, v1, p1

    if-ltz v1, :cond_1

    .line 608
    long-to-int v1, p1

    new-array v1, v1, [B

    .line 609
    .local v1, "result":[B
    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->readFully([B)V

    .line 610
    return-object v1

    .line 606
    .end local v1    # "result":[B
    :cond_1
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 1755
    :cond_2
    const/4 v1, 0x0

    .line 605
    .local v1, "$i$a$-require--Buffer$commonReadByteArray$1":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "byteCount: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--Buffer$commonReadByteArray$1":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static final commonReadByteString(Lnicoid/network238/okio/Buffer;)Lnicoid/network238/okio/ByteString;
    .registers 4
    .param p0, "$this$commonReadByteString"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 772
    .local v0, "$i$f$commonReadByteString":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    return-object v1
.end method

.method public static final commonReadByteString(Lnicoid/network238/okio/Buffer;J)Lnicoid/network238/okio/ByteString;
    .registers 7
    .param p0, "$this$commonReadByteString"    # Lnicoid/network238/okio/Buffer;
    .param p1, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 775
    .local v0, "$i$f$commonReadByteString":I
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-ltz v1, :cond_0

    const-wide/32 v1, 0x7fffffff

    cmp-long v1, p1, v1

    if-gtz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_3

    .line 776
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    cmp-long v1, v1, p1

    if-ltz v1, :cond_2

    .line 778
    const-wide/16 v1, 0x1000

    cmp-long v1, p1, v1

    if-ltz v1, :cond_1

    .line 779
    long-to-int v1, p1

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->snapshot(I)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    move-object v2, v1

    .line 1755
    .local v2, "it":Lnicoid/network238/okio/ByteString;
    const/4 v3, 0x0

    .line 779
    .local v3, "$i$a$-also--Buffer$commonReadByteString$2":I
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->skip(J)V

    .end local v2    # "it":Lnicoid/network238/okio/ByteString;
    .end local v3    # "$i$a$-also--Buffer$commonReadByteString$2":I
    return-object v1

    .line 781
    :cond_1
    new-instance v1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->readByteArray(J)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1

    .line 776
    :cond_2
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 1755
    :cond_3
    const/4 v1, 0x0

    .line 775
    .local v1, "$i$a$-require--Buffer$commonReadByteString$1":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "byteCount: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--Buffer$commonReadByteString$1":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static final commonReadDecimalLong(Lnicoid/network238/okio/Buffer;)J
    .registers 23
    .param p0, "$this$commonReadDecimalLong"    # Lnicoid/network238/okio/Buffer;

    move-object/from16 v0, p0

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 651
    .local v1, "$i$f$commonReadDecimalLong":I
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_e

    .line 654
    const-wide/16 v2, 0x0

    .line 655
    .local v2, "value":J
    const/4 v6, 0x0

    .line 656
    .local v6, "seen":I
    const/4 v7, 0x0

    .line 657
    .local v7, "negative":Z
    const/4 v8, 0x0

    .line 659
    .local v8, "done":Z
    const-wide/16 v9, -0x7

    .line 662
    .local v9, "overflowDigit":J
    :goto_0
    iget-object v11, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 664
    .local v11, "segment":Lnicoid/network238/okio/Segment;
    iget-object v12, v11, Lnicoid/network238/okio/Segment;->data:[B

    .line 665
    .local v12, "data":[B
    iget v13, v11, Lnicoid/network238/okio/Segment;->pos:I

    .line 666
    .local v13, "pos":I
    iget v14, v11, Lnicoid/network238/okio/Segment;->limit:I

    .line 668
    .local v14, "limit":I
    :goto_1
    if-ge v13, v14, :cond_6

    .line 669
    aget-byte v15, v12, v13

    .line 670
    .local v15, "b":B
    move-wide/from16 v16, v4

    const/16 v4, 0x30

    if-lt v15, v4, :cond_4

    const/16 v4, 0x39

    if-gt v15, v4, :cond_4

    .line 671
    rsub-int/lit8 v4, v15, 0x30

    .line 674
    .local v4, "digit":I
    const-wide v18, -0xcccccccccccccccL

    cmp-long v5, v2, v18

    if-ltz v5, :cond_2

    cmp-long v5, v2, v18

    if-nez v5, :cond_0

    move/from16 v18, v7

    move v5, v8

    .end local v7    # "negative":Z
    .end local v8    # "done":Z
    .local v5, "done":Z
    .local v18, "negative":Z
    int-to-long v7, v4

    cmp-long v7, v7, v9

    if-gez v7, :cond_1

    goto :goto_2

    .end local v5    # "done":Z
    .end local v18    # "negative":Z
    .restart local v7    # "negative":Z
    .restart local v8    # "done":Z
    :cond_0
    move/from16 v18, v7

    move v5, v8

    .line 679
    .end local v7    # "negative":Z
    .end local v8    # "done":Z
    .restart local v5    # "done":Z
    .restart local v18    # "negative":Z
    :cond_1
    const-wide/16 v7, 0xa

    mul-long/2addr v2, v7

    .line 680
    int-to-long v7, v4

    add-long/2addr v2, v7

    move/from16 v19, v1

    move/from16 v7, v18

    .end local v4    # "digit":I
    goto :goto_3

    .line 674
    .end local v5    # "done":Z
    .end local v18    # "negative":Z
    .restart local v4    # "digit":I
    .restart local v7    # "negative":Z
    .restart local v8    # "done":Z
    :cond_2
    move/from16 v18, v7

    move v5, v8

    .line 675
    .end local v7    # "negative":Z
    .end local v8    # "done":Z
    .restart local v5    # "done":Z
    .restart local v18    # "negative":Z
    :goto_2
    new-instance v7, Lnicoid/network238/okio/Buffer;

    invoke-direct {v7}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v7, v2, v3}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object v7

    invoke-virtual {v7, v15}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v7

    .line 676
    .local v7, "buffer":Lnicoid/network238/okio/Buffer;
    if-nez v18, :cond_3

    invoke-virtual {v7}, Lnicoid/network238/okio/Buffer;->readByte()B

    .line 677
    :cond_3
    new-instance v8, Ljava/lang/NumberFormatException;

    move/from16 v19, v1

    .end local v1    # "$i$f$commonReadDecimalLong":I
    .local v19, "$i$f$commonReadDecimalLong":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v20, v4

    .end local v4    # "digit":I
    .local v20, "digit":I
    const-string v4, "Number too large: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 670
    .end local v5    # "done":Z
    .end local v18    # "negative":Z
    .end local v19    # "$i$f$commonReadDecimalLong":I
    .end local v20    # "digit":I
    .restart local v1    # "$i$f$commonReadDecimalLong":I
    .local v7, "negative":Z
    .restart local v8    # "done":Z
    :cond_4
    move/from16 v19, v1

    move/from16 v18, v7

    move v5, v8

    .line 681
    .end local v1    # "$i$f$commonReadDecimalLong":I
    .end local v7    # "negative":Z
    .end local v8    # "done":Z
    .restart local v5    # "done":Z
    .restart local v18    # "negative":Z
    .restart local v19    # "$i$f$commonReadDecimalLong":I
    const/16 v1, 0x2d

    if-ne v15, v1, :cond_5

    if-nez v6, :cond_5

    .line 682
    const/4 v7, 0x1

    .line 683
    .end local v18    # "negative":Z
    .restart local v7    # "negative":Z
    const-wide/16 v20, 0x1

    sub-long v9, v9, v20

    .line 689
    :goto_3
    add-int/lit8 v13, v13, 0x1

    .line 690
    nop

    .end local v15    # "b":B
    add-int/lit8 v6, v6, 0x1

    move v8, v5

    move-wide/from16 v4, v16

    move/from16 v1, v19

    goto/16 :goto_1

    .line 686
    .end local v7    # "negative":Z
    .restart local v15    # "b":B
    .restart local v18    # "negative":Z
    :cond_5
    const/4 v1, 0x1

    .line 687
    .end local v5    # "done":Z
    .local v1, "done":Z
    move v8, v1

    goto :goto_4

    .line 668
    .end local v15    # "b":B
    .end local v18    # "negative":Z
    .end local v19    # "$i$f$commonReadDecimalLong":I
    .local v1, "$i$f$commonReadDecimalLong":I
    .restart local v7    # "negative":Z
    .restart local v8    # "done":Z
    :cond_6
    move/from16 v19, v1

    move-wide/from16 v16, v4

    move/from16 v18, v7

    move v5, v8

    .line 693
    .end local v1    # "$i$f$commonReadDecimalLong":I
    .end local v7    # "negative":Z
    .restart local v18    # "negative":Z
    .restart local v19    # "$i$f$commonReadDecimalLong":I
    :goto_4
    if-ne v13, v14, :cond_7

    .line 694
    invoke-virtual {v11}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 695
    invoke-static {v11}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_5

    .line 697
    :cond_7
    iput v13, v11, Lnicoid/network238/okio/Segment;->pos:I

    .line 699
    .end local v11    # "segment":Lnicoid/network238/okio/Segment;
    .end local v12    # "data":[B
    .end local v13    # "pos":I
    .end local v14    # "limit":I
    :goto_5
    if-nez v8, :cond_8

    iget-object v1, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v1, :cond_8

    move-wide/from16 v4, v16

    move/from16 v7, v18

    move/from16 v1, v19

    goto/16 :goto_0

    .line 701
    :cond_8
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    int-to-long v11, v6

    sub-long/2addr v4, v11

    invoke-virtual {v0, v4, v5}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 703
    if-eqz v18, :cond_9

    const/4 v1, 0x2

    goto :goto_6

    :cond_9
    const/4 v1, 0x1

    .line 704
    .local v1, "minimumSeen":I
    :goto_6
    if-ge v6, v1, :cond_c

    .line 705
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    cmp-long v4, v4, v16

    if-eqz v4, :cond_b

    .line 706
    if-eqz v18, :cond_a

    const-string v4, "Expected a digit"

    goto :goto_7

    :cond_a
    const-string v4, "Expected a digit or \'-\'"

    .line 707
    .local v4, "expected":Ljava/lang/String;
    :goto_7
    new-instance v5, Ljava/lang/NumberFormatException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v11, " but was 0x"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v11, v16

    invoke-virtual {v0, v11, v12}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v11

    invoke-static {v11}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 705
    .end local v4    # "expected":Ljava/lang/String;
    :cond_b
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4

    .line 710
    :cond_c
    if-eqz v18, :cond_d

    move-wide v4, v2

    goto :goto_8

    :cond_d
    neg-long v4, v2

    :goto_8
    return-wide v4

    .line 651
    .end local v2    # "value":J
    .end local v6    # "seen":I
    .end local v8    # "done":Z
    .end local v9    # "overflowDigit":J
    .end local v18    # "negative":Z
    .end local v19    # "$i$f$commonReadDecimalLong":I
    .local v1, "$i$f$commonReadDecimalLong":I
    :cond_e
    move/from16 v19, v1

    .end local v1    # "$i$f$commonReadDecimalLong":I
    .restart local v19    # "$i$f$commonReadDecimalLong":I
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public static final commonReadFully(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer;J)V
    .registers 7
    .param p0, "$this$commonReadFully"    # Lnicoid/network238/okio/Buffer;
    .param p1, "sink"    # Lnicoid/network238/okio/Buffer;
    .param p2, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sink"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 796
    .local v0, "$i$f$commonReadFully":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    cmp-long v1, v1, p2

    if-ltz v1, :cond_0

    .line 800
    invoke-virtual {p1, p0, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 801
    return-void

    .line 797
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-virtual {p1, p0, v1, v2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 798
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public static final commonReadFully(Lnicoid/network238/okio/Buffer;[B)V
    .registers 6
    .param p0, "$this$commonReadFully"    # Lnicoid/network238/okio/Buffer;
    .param p1, "sink"    # [B

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "sink"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 616
    .local v0, "$i$f$commonReadFully":I
    const/4 v1, 0x0

    .line 617
    .local v1, "offset":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 618
    array-length v2, p1

    sub-int/2addr v2, v1

    invoke-virtual {p0, p1, v1, v2}, Lnicoid/network238/okio/Buffer;->read([BII)I

    move-result v2

    .line 619
    .local v2, "read":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 620
    add-int/2addr v1, v2

    .end local v2    # "read":I
    goto :goto_0

    .line 619
    .restart local v2    # "read":I
    :cond_0
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 622
    .end local v2    # "read":I
    :cond_1
    return-void
.end method

.method public static final commonReadHexadecimalUnsignedLong(Lnicoid/network238/okio/Buffer;)J
    .registers 16
    .param p0, "$this$commonReadHexadecimalUnsignedLong"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 714
    .local v0, "$i$f$commonReadHexadecimalUnsignedLong":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_8

    .line 716
    const-wide/16 v1, 0x0

    .line 717
    .local v1, "value":J
    const/4 v5, 0x0

    .line 718
    .local v5, "seen":I
    const/4 v6, 0x0

    .line 721
    .local v6, "done":Z
    :goto_0
    iget-object v7, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v7}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 723
    .local v7, "segment":Lnicoid/network238/okio/Segment;
    iget-object v8, v7, Lnicoid/network238/okio/Segment;->data:[B

    .line 724
    .local v8, "data":[B
    iget v9, v7, Lnicoid/network238/okio/Segment;->pos:I

    .line 725
    .local v9, "pos":I
    iget v10, v7, Lnicoid/network238/okio/Segment;->limit:I

    .line 727
    .local v10, "limit":I
    :goto_1
    if-ge v9, v10, :cond_5

    .line 728
    const/4 v11, 0x0

    .line 730
    .local v11, "digit":I
    aget-byte v12, v8, v9

    .line 731
    .local v12, "b":B
    const/16 v13, 0x30

    if-lt v12, v13, :cond_0

    const/16 v13, 0x39

    if-gt v12, v13, :cond_0

    .line 732
    add-int/lit8 v11, v12, -0x30

    goto :goto_2

    .line 733
    :cond_0
    const/16 v13, 0x61

    if-lt v12, v13, :cond_1

    const/16 v13, 0x66

    if-gt v12, v13, :cond_1

    .line 734
    add-int/lit8 v13, v12, -0x61

    add-int/lit8 v11, v13, 0xa

    goto :goto_2

    .line 735
    :cond_1
    const/16 v13, 0x41

    if-lt v12, v13, :cond_3

    const/16 v13, 0x46

    if-gt v12, v13, :cond_3

    .line 736
    add-int/lit8 v13, v12, -0x41

    add-int/lit8 v11, v13, 0xa

    .line 749
    :goto_2
    const-wide/high16 v13, -0x1000000000000000L    # -3.105036184601418E231

    and-long/2addr v13, v1

    cmp-long v13, v13, v3

    if-nez v13, :cond_2

    .line 754
    const/4 v13, 0x4

    shl-long/2addr v1, v13

    .line 755
    int-to-long v13, v11

    or-long/2addr v1, v13

    .line 756
    add-int/lit8 v9, v9, 0x1

    .line 757
    nop

    .end local v11    # "digit":I
    .end local v12    # "b":B
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 750
    .restart local v11    # "digit":I
    .restart local v12    # "b":B
    :cond_2
    new-instance v3, Lnicoid/network238/okio/Buffer;

    invoke-direct {v3}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v3, v1, v2}, Lnicoid/network238/okio/Buffer;->writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object v3

    invoke-virtual {v3, v12}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v3

    .line 751
    .local v3, "buffer":Lnicoid/network238/okio/Buffer;
    new-instance v4, Ljava/lang/NumberFormatException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Number too large: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v3}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v4, v13}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 738
    .end local v3    # "buffer":Lnicoid/network238/okio/Buffer;
    :cond_3
    if-eqz v5, :cond_4

    .line 744
    const/4 v6, 0x1

    .line 745
    goto :goto_3

    .line 739
    :cond_4
    new-instance v3, Ljava/lang/NumberFormatException;

    .line 740
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Expected leading [0-9a-fA-F] character but was 0x"

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v12}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(B)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 739
    invoke-direct {v3, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 760
    .end local v11    # "digit":I
    .end local v12    # "b":B
    :cond_5
    :goto_3
    if-ne v9, v10, :cond_6

    .line 761
    invoke-virtual {v7}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v11

    iput-object v11, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 762
    invoke-static {v7}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_4

    .line 764
    :cond_6
    iput v9, v7, Lnicoid/network238/okio/Segment;->pos:I

    .line 766
    .end local v7    # "segment":Lnicoid/network238/okio/Segment;
    .end local v8    # "data":[B
    .end local v9    # "pos":I
    .end local v10    # "limit":I
    :goto_4
    if-nez v6, :cond_7

    iget-object v7, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v7, :cond_7

    goto/16 :goto_0

    .line 768
    :cond_7
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v7, v5

    sub-long/2addr v3, v7

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 769
    return-wide v1

    .line 714
    .end local v1    # "value":J
    .end local v5    # "seen":I
    .end local v6    # "done":Z
    :cond_8
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public static final commonReadInt(Lnicoid/network238/okio/Buffer;)I
    .registers 12
    .param p0, "$this$commonReadInt"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 337
    .local v0, "$i$f$commonReadInt":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x4

    cmp-long v1, v1, v3

    if-ltz v1, :cond_2

    .line 339
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 340
    .local v1, "segment":Lnicoid/network238/okio/Segment;
    iget v2, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 341
    .local v2, "pos":I
    iget v5, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 344
    .local v5, "limit":I
    sub-int v6, v5, v2

    int-to-long v6, v6

    cmp-long v6, v6, v3

    if-gez v6, :cond_0

    .line 346
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v3

    .local v3, "$this$and$iv":B
    const/16 v4, 0xff

    .local v4, "other$iv":I
    const/4 v6, 0x0

    .line 1716
    .local v6, "$i$f$and":I
    and-int/2addr v3, v4

    .line 346
    .end local v3    # "$this$and$iv":B
    .end local v4    # "other$iv":I
    .end local v6    # "$i$f$and":I
    shl-int/lit8 v3, v3, 0x18

    .line 347
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v4

    .local v4, "$this$and$iv":B
    const/16 v6, 0xff

    .local v6, "other$iv":I
    const/4 v7, 0x0

    .line 1717
    .local v7, "$i$f$and":I
    and-int/2addr v4, v6

    .line 347
    .end local v4    # "$this$and$iv":B
    .end local v6    # "other$iv":I
    .end local v7    # "$i$f$and":I
    shl-int/lit8 v4, v4, 0x10

    .line 346
    or-int/2addr v3, v4

    .line 348
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v4

    .restart local v4    # "$this$and$iv":B
    const/16 v6, 0xff

    .restart local v6    # "other$iv":I
    const/4 v7, 0x0

    .line 1718
    .restart local v7    # "$i$f$and":I
    and-int/2addr v4, v6

    .line 348
    .end local v4    # "$this$and$iv":B
    .end local v6    # "other$iv":I
    .end local v7    # "$i$f$and":I
    shl-int/lit8 v4, v4, 0x8

    .line 346
    or-int/2addr v3, v4

    .line 349
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v4

    .restart local v4    # "$this$and$iv":B
    const/16 v6, 0xff

    .restart local v6    # "other$iv":I
    const/4 v7, 0x0

    .line 1719
    .restart local v7    # "$i$f$and":I
    and-int/2addr v4, v6

    .line 346
    .end local v4    # "$this$and$iv":B
    .end local v6    # "other$iv":I
    .end local v7    # "$i$f$and":I
    or-int/2addr v3, v4

    .line 345
    return v3

    .line 353
    :cond_0
    iget-object v6, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 355
    .local v6, "data":[B
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "pos":I
    .local v7, "pos":I
    aget-byte v2, v6, v2

    .local v2, "$this$and$iv":B
    const/16 v8, 0xff

    .local v8, "other$iv":I
    const/4 v9, 0x0

    .line 1720
    .local v9, "$i$f$and":I
    and-int/2addr v2, v8

    .line 355
    .end local v2    # "$this$and$iv":B
    .end local v8    # "other$iv":I
    .end local v9    # "$i$f$and":I
    shl-int/lit8 v2, v2, 0x18

    .line 356
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "pos":I
    .local v8, "pos":I
    aget-byte v7, v6, v7

    .local v7, "$this$and$iv":B
    const/16 v9, 0xff

    .local v9, "other$iv":I
    const/4 v10, 0x0

    .line 1721
    .local v10, "$i$f$and":I
    and-int/2addr v7, v9

    .line 356
    .end local v7    # "$this$and$iv":B
    .end local v9    # "other$iv":I
    .end local v10    # "$i$f$and":I
    shl-int/lit8 v7, v7, 0x10

    .line 355
    or-int/2addr v2, v7

    .line 357
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "pos":I
    .local v7, "pos":I
    aget-byte v8, v6, v8

    .local v8, "$this$and$iv":B
    const/16 v9, 0xff

    .restart local v9    # "other$iv":I
    const/4 v10, 0x0

    .line 1722
    .restart local v10    # "$i$f$and":I
    and-int/2addr v8, v9

    .line 357
    .end local v8    # "$this$and$iv":B
    .end local v9    # "other$iv":I
    .end local v10    # "$i$f$and":I
    shl-int/lit8 v8, v8, 0x8

    .line 355
    or-int/2addr v2, v8

    .line 358
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "pos":I
    .local v8, "pos":I
    aget-byte v7, v6, v7

    .local v7, "$this$and$iv":B
    const/16 v9, 0xff

    .restart local v9    # "other$iv":I
    const/4 v10, 0x0

    .line 1723
    .restart local v10    # "$i$f$and":I
    and-int/2addr v7, v9

    .line 355
    .end local v7    # "$this$and$iv":B
    .end local v9    # "other$iv":I
    .end local v10    # "$i$f$and":I
    or-int/2addr v2, v7

    .line 354
    nop

    .line 360
    .local v2, "i":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v9

    sub-long/2addr v9, v3

    invoke-virtual {p0, v9, v10}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 362
    if-ne v8, v5, :cond_1

    .line 363
    invoke-virtual {v1}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v3

    iput-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 364
    invoke-static {v1}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_0

    .line 366
    :cond_1
    iput v8, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 369
    :goto_0
    return v2

    .line 337
    .end local v1    # "segment":Lnicoid/network238/okio/Segment;
    .end local v2    # "i":I
    .end local v5    # "limit":I
    .end local v6    # "data":[B
    .end local v8    # "pos":I
    :cond_2
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public static final commonReadLong(Lnicoid/network238/okio/Buffer;)J
    .registers 18
    .param p0, "$this$commonReadLong"    # Lnicoid/network238/okio/Buffer;

    move-object/from16 v0, p0

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 373
    .local v1, "$i$f$commonReadLong":I
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x8

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2

    .line 375
    iget-object v2, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 376
    .local v2, "segment":Lnicoid/network238/okio/Segment;
    iget v3, v2, Lnicoid/network238/okio/Segment;->pos:I

    .line 377
    .local v3, "pos":I
    iget v6, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 380
    .local v6, "limit":I
    sub-int v7, v6, v3

    int-to-long v7, v7

    cmp-long v7, v7, v4

    const/16 v8, 0x20

    if-gez v7, :cond_0

    .line 382
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readInt()I

    move-result v4

    .local v4, "$this$and$iv":I
    const-wide v9, 0xffffffffL

    .local v9, "other$iv":J
    const/4 v5, 0x0

    .line 1724
    .local v5, "$i$f$and":I
    int-to-long v11, v4

    and-long/2addr v11, v9

    .line 382
    .end local v4    # "$this$and$iv":I
    .end local v5    # "$i$f$and":I
    .end local v9    # "other$iv":J
    shl-long/2addr v11, v8

    .line 383
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readInt()I

    move-result v4

    .restart local v4    # "$this$and$iv":I
    const-wide v7, 0xffffffffL

    .local v7, "other$iv":J
    const/4 v5, 0x0

    .line 1725
    .restart local v5    # "$i$f$and":I
    int-to-long v9, v4

    and-long/2addr v9, v7

    .line 382
    .end local v4    # "$this$and$iv":I
    .end local v5    # "$i$f$and":I
    .end local v7    # "other$iv":J
    or-long/2addr v11, v9

    .line 381
    return-wide v11

    .line 387
    :cond_0
    iget-object v7, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 389
    .local v7, "data":[B
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "pos":I
    .local v9, "pos":I
    aget-byte v3, v7, v3

    .local v3, "$this$and$iv":B
    const-wide/16 v10, 0xff

    .local v10, "other$iv":J
    const/4 v12, 0x0

    .line 1726
    .local v12, "$i$f$and":I
    int-to-long v13, v3

    and-long/2addr v13, v10

    .line 389
    .end local v3    # "$this$and$iv":B
    .end local v10    # "other$iv":J
    .end local v12    # "$i$f$and":I
    const/16 v3, 0x38

    shl-long/2addr v13, v3

    .line 390
    add-int/lit8 v3, v9, 0x1

    .end local v9    # "pos":I
    .local v3, "pos":I
    aget-byte v9, v7, v9

    .local v9, "$this$and$iv":B
    const-wide/16 v10, 0xff

    .restart local v10    # "other$iv":J
    const/4 v12, 0x0

    .line 1727
    .restart local v12    # "$i$f$and":I
    move-wide v15, v4

    int-to-long v4, v9

    and-long/2addr v4, v10

    .line 390
    .end local v9    # "$this$and$iv":B
    .end local v10    # "other$iv":J
    .end local v12    # "$i$f$and":I
    const/16 v9, 0x30

    shl-long/2addr v4, v9

    .line 389
    or-long/2addr v13, v4

    .line 391
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    aget-byte v3, v7, v3

    .local v3, "$this$and$iv":B
    const-wide/16 v9, 0xff

    .local v9, "other$iv":J
    const/4 v5, 0x0

    .line 1728
    .restart local v5    # "$i$f$and":I
    int-to-long v11, v3

    and-long/2addr v11, v9

    .line 391
    .end local v3    # "$this$and$iv":B
    .end local v5    # "$i$f$and":I
    .end local v9    # "other$iv":J
    const/16 v3, 0x28

    shl-long/2addr v11, v3

    .line 389
    or-long/2addr v13, v11

    .line 392
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .local v3, "pos":I
    aget-byte v4, v7, v4

    .local v4, "$this$and$iv":B
    const-wide/16 v9, 0xff

    .restart local v9    # "other$iv":J
    const/4 v5, 0x0

    .line 1729
    .restart local v5    # "$i$f$and":I
    int-to-long v11, v4

    and-long/2addr v11, v9

    .line 392
    .end local v4    # "$this$and$iv":B
    .end local v5    # "$i$f$and":I
    .end local v9    # "other$iv":J
    shl-long/2addr v11, v8

    .line 389
    or-long/2addr v13, v11

    .line 393
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    aget-byte v3, v7, v3

    .local v3, "$this$and$iv":B
    const-wide/16 v8, 0xff

    .local v8, "other$iv":J
    const/4 v5, 0x0

    .line 1730
    .restart local v5    # "$i$f$and":I
    int-to-long v10, v3

    and-long/2addr v10, v8

    .line 393
    .end local v3    # "$this$and$iv":B
    .end local v5    # "$i$f$and":I
    .end local v8    # "other$iv":J
    const/16 v3, 0x18

    shl-long/2addr v10, v3

    .line 389
    or-long/2addr v13, v10

    .line 394
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .local v3, "pos":I
    aget-byte v4, v7, v4

    .local v4, "$this$and$iv":B
    const-wide/16 v8, 0xff

    .restart local v8    # "other$iv":J
    const/4 v5, 0x0

    .line 1731
    .restart local v5    # "$i$f$and":I
    int-to-long v10, v4

    and-long/2addr v10, v8

    .line 394
    .end local v4    # "$this$and$iv":B
    .end local v5    # "$i$f$and":I
    .end local v8    # "other$iv":J
    const/16 v4, 0x10

    shl-long/2addr v10, v4

    .line 389
    or-long/2addr v13, v10

    .line 395
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    aget-byte v3, v7, v3

    .local v3, "$this$and$iv":B
    const-wide/16 v8, 0xff

    .restart local v8    # "other$iv":J
    const/4 v5, 0x0

    .line 1732
    .restart local v5    # "$i$f$and":I
    int-to-long v10, v3

    and-long/2addr v10, v8

    .line 395
    .end local v3    # "$this$and$iv":B
    .end local v5    # "$i$f$and":I
    .end local v8    # "other$iv":J
    const/16 v3, 0x8

    shl-long/2addr v10, v3

    .line 389
    or-long/2addr v13, v10

    .line 396
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .local v3, "pos":I
    aget-byte v4, v7, v4

    .local v4, "$this$and$iv":B
    const-wide/16 v8, 0xff

    .restart local v8    # "other$iv":J
    const/4 v5, 0x0

    .line 1733
    .restart local v5    # "$i$f$and":I
    int-to-long v10, v4

    and-long/2addr v10, v8

    .line 389
    .end local v4    # "$this$and$iv":B
    .end local v5    # "$i$f$and":I
    .end local v8    # "other$iv":J
    or-long/2addr v13, v10

    .line 388
    nop

    .line 398
    .local v13, "v":J
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    sub-long/2addr v4, v15

    invoke-virtual {v0, v4, v5}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 400
    if-ne v3, v6, :cond_1

    .line 401
    invoke-virtual {v2}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v4

    iput-object v4, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 402
    invoke-static {v2}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_0

    .line 404
    :cond_1
    iput v3, v2, Lnicoid/network238/okio/Segment;->pos:I

    .line 407
    :goto_0
    return-wide v13

    .line 373
    .end local v2    # "segment":Lnicoid/network238/okio/Segment;
    .end local v3    # "pos":I
    .end local v6    # "limit":I
    .end local v7    # "data":[B
    .end local v13    # "v":J
    :cond_2
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public static final commonReadShort(Lnicoid/network238/okio/Buffer;)S
    .registers 12
    .param p0, "$this$commonReadShort"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 310
    .local v0, "$i$f$commonReadShort":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x2

    cmp-long v1, v1, v3

    if-ltz v1, :cond_2

    .line 312
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 313
    .local v1, "segment":Lnicoid/network238/okio/Segment;
    iget v2, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 314
    .local v2, "pos":I
    iget v5, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 317
    .local v5, "limit":I
    sub-int v6, v5, v2

    const/4 v7, 0x2

    if-ge v6, v7, :cond_0

    .line 318
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v3

    .local v3, "$this$and$iv":B
    const/16 v4, 0xff

    .local v4, "other$iv":I
    const/4 v6, 0x0

    .line 1714
    .local v6, "$i$f$and":I
    and-int/2addr v3, v4

    .line 318
    .end local v3    # "$this$and$iv":B
    .end local v4    # "other$iv":I
    .end local v6    # "$i$f$and":I
    shl-int/lit8 v3, v3, 0x8

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v4

    .local v4, "$this$and$iv":B
    const/16 v6, 0xff

    .local v6, "other$iv":I
    const/4 v7, 0x0

    .line 1714
    .local v7, "$i$f$and":I
    and-int/2addr v4, v6

    .line 318
    .end local v4    # "$this$and$iv":B
    .end local v6    # "other$iv":I
    .end local v7    # "$i$f$and":I
    or-int/2addr v3, v4

    .line 319
    .local v3, "s":I
    int-to-short v4, v3

    return v4

    .line 322
    .end local v3    # "s":I
    :cond_0
    iget-object v6, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 323
    .local v6, "data":[B
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "pos":I
    .local v7, "pos":I
    aget-byte v2, v6, v2

    .local v2, "$this$and$iv":B
    const/16 v8, 0xff

    .local v8, "other$iv":I
    const/4 v9, 0x0

    .line 1715
    .local v9, "$i$f$and":I
    and-int/2addr v2, v8

    .line 323
    .end local v2    # "$this$and$iv":B
    .end local v8    # "other$iv":I
    .end local v9    # "$i$f$and":I
    shl-int/lit8 v2, v2, 0x8

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "pos":I
    .local v8, "pos":I
    aget-byte v7, v6, v7

    .local v7, "$this$and$iv":B
    const/16 v9, 0xff

    .local v9, "other$iv":I
    const/4 v10, 0x0

    .line 1715
    .local v10, "$i$f$and":I
    and-int/2addr v7, v9

    .line 323
    .end local v7    # "$this$and$iv":B
    .end local v9    # "other$iv":I
    .end local v10    # "$i$f$and":I
    or-int/2addr v2, v7

    .line 324
    .local v2, "s":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v9

    sub-long/2addr v9, v3

    invoke-virtual {p0, v9, v10}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 326
    if-ne v8, v5, :cond_1

    .line 327
    invoke-virtual {v1}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v3

    iput-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 328
    invoke-static {v1}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_0

    .line 330
    :cond_1
    iput v8, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 333
    :goto_0
    int-to-short v3, v2

    return v3

    .line 310
    .end local v1    # "segment":Lnicoid/network238/okio/Segment;
    .end local v2    # "s":I
    .end local v5    # "limit":I
    .end local v6    # "data":[B
    .end local v8    # "pos":I
    :cond_2
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public static final commonReadUnsafe(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1532
    iget-object v0, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-nez v0, :cond_0

    .line 1534
    iput-object p0, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    .line 1535
    const/4 p0, 0x0

    iput-boolean p0, p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;->readWrite:Z

    return-object p1

    .line 1532
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "already attached to a buffer"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final commonReadUtf8(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;
    .registers 10
    .param p0, "$this$commonReadUtf8"    # Lnicoid/network238/okio/Buffer;
    .param p1, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 812
    .local v0, "$i$f$commonReadUtf8":I
    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    const/4 v4, 0x0

    if-ltz v3, :cond_0

    const-wide/32 v5, 0x7fffffff

    cmp-long v3, p1, v5

    if-gtz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    if-eqz v3, :cond_5

    .line 813
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    cmp-long v3, v5, p1

    if-ltz v3, :cond_4

    .line 814
    cmp-long v1, p1, v1

    if-nez v1, :cond_1

    const-string v1, ""

    return-object v1

    .line 816
    :cond_1
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 817
    .local v1, "s":Lnicoid/network238/okio/Segment;
    iget v2, v1, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v2, v2

    add-long/2addr v2, p1

    iget v5, v1, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v5, v5

    cmp-long v2, v2, v5

    if-lez v2, :cond_2

    .line 820
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->readByteArray(J)[B

    move-result-object v2

    const/4 v3, 0x3

    const/4 v5, 0x0

    invoke-static {v2, v4, v4, v3, v5}, Lnicoid/network238/okio/internal/_Utf8Kt;->commonToUtf8String$default([BIIILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 823
    :cond_2
    iget-object v2, v1, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    iget v4, v1, Lnicoid/network238/okio/Segment;->pos:I

    long-to-int v5, p1

    add-int/2addr v4, v5

    invoke-static {v2, v3, v4}, Lnicoid/network238/okio/internal/_Utf8Kt;->commonToUtf8String([BII)Ljava/lang/String;

    move-result-object v2

    .line 824
    .local v2, "result":Ljava/lang/String;
    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    long-to-int v4, p1

    add-int/2addr v3, v4

    iput v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    .line 825
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    sub-long/2addr v3, p1

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 827
    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    iget v4, v1, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v3, v4, :cond_3

    .line 828
    invoke-virtual {v1}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v3

    iput-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 829
    invoke-static {v1}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    .line 832
    :cond_3
    return-object v2

    .line 813
    .end local v1    # "s":Lnicoid/network238/okio/Segment;
    .end local v2    # "result":Ljava/lang/String;
    :cond_4
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 1755
    :cond_5
    const/4 v1, 0x0

    .line 812
    .local v1, "$i$a$-require--Buffer$commonReadUtf8$1":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "byteCount: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--Buffer$commonReadUtf8$1":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static final commonReadUtf8CodePoint(Lnicoid/network238/okio/Buffer;)I
    .registers 13
    .param p0, "$this$commonReadUtf8CodePoint"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 867
    .local v0, "$i$f$commonReadUtf8CodePoint":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_b

    .line 869
    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v1

    .line 870
    .local v1, "b0":B
    const/4 v2, 0x0

    .line 871
    .local v2, "codePoint":I
    const/4 v3, 0x0

    .line 872
    .local v3, "byteCount":I
    const/4 v4, 0x0

    .line 874
    .local v4, "min":I
    nop

    .line 875
    const/16 v5, 0x80

    .local v5, "other$iv":I
    move v6, v1

    .local v6, "$this$and$iv":B
    const/4 v7, 0x0

    .line 1757
    .local v7, "$i$f$and":I
    and-int/2addr v6, v5

    .line 875
    .end local v5    # "other$iv":I
    .end local v6    # "$this$and$iv":B
    .end local v7    # "$i$f$and":I
    const v5, 0xfffd

    if-nez v6, :cond_0

    .line 877
    const/16 v6, 0x7f

    .local v6, "other$iv":I
    move v7, v1

    .local v7, "$this$and$iv":B
    const/4 v8, 0x0

    .line 1758
    .local v8, "$i$f$and":I
    and-int/2addr v7, v6

    .line 877
    .end local v6    # "other$iv":I
    .end local v7    # "$this$and$iv":B
    .end local v8    # "$i$f$and":I
    nop

    .line 878
    .end local v2    # "codePoint":I
    .local v7, "codePoint":I
    const/4 v2, 0x1

    .line 879
    .end local v3    # "byteCount":I
    .local v2, "byteCount":I
    const/4 v3, 0x0

    .end local v4    # "min":I
    .local v3, "min":I
    goto :goto_0

    .line 881
    .end local v7    # "codePoint":I
    .local v2, "codePoint":I
    .local v3, "byteCount":I
    .restart local v4    # "min":I
    :cond_0
    const/16 v6, 0xe0

    .restart local v6    # "other$iv":I
    move v7, v1

    .local v7, "$this$and$iv":B
    const/4 v8, 0x0

    .line 1759
    .restart local v8    # "$i$f$and":I
    and-int/2addr v7, v6

    .line 881
    .end local v6    # "other$iv":I
    .end local v7    # "$this$and$iv":B
    .end local v8    # "$i$f$and":I
    const/16 v6, 0xc0

    if-ne v7, v6, :cond_1

    .line 883
    const/16 v6, 0x1f

    .restart local v6    # "other$iv":I
    move v7, v1

    .restart local v7    # "$this$and$iv":B
    const/4 v8, 0x0

    .line 1760
    .restart local v8    # "$i$f$and":I
    and-int/2addr v7, v6

    .line 883
    .end local v6    # "other$iv":I
    .end local v7    # "$this$and$iv":B
    .end local v8    # "$i$f$and":I
    nop

    .line 884
    .end local v2    # "codePoint":I
    .local v7, "codePoint":I
    const/4 v2, 0x2

    .line 885
    .end local v3    # "byteCount":I
    .local v2, "byteCount":I
    const/16 v3, 0x80

    .end local v4    # "min":I
    .local v3, "min":I
    goto :goto_0

    .line 887
    .end local v7    # "codePoint":I
    .local v2, "codePoint":I
    .local v3, "byteCount":I
    .restart local v4    # "min":I
    :cond_1
    const/16 v6, 0xf0

    .restart local v6    # "other$iv":I
    move v7, v1

    .local v7, "$this$and$iv":B
    const/4 v8, 0x0

    .line 1761
    .restart local v8    # "$i$f$and":I
    and-int/2addr v7, v6

    .line 887
    .end local v6    # "other$iv":I
    .end local v7    # "$this$and$iv":B
    .end local v8    # "$i$f$and":I
    const/16 v6, 0xe0

    if-ne v7, v6, :cond_2

    .line 889
    const/16 v6, 0xf

    .restart local v6    # "other$iv":I
    move v7, v1

    .restart local v7    # "$this$and$iv":B
    const/4 v8, 0x0

    .line 1762
    .restart local v8    # "$i$f$and":I
    and-int/2addr v7, v6

    .line 889
    .end local v6    # "other$iv":I
    .end local v7    # "$this$and$iv":B
    .end local v8    # "$i$f$and":I
    nop

    .line 890
    .end local v2    # "codePoint":I
    .local v7, "codePoint":I
    const/4 v2, 0x3

    .line 891
    .end local v3    # "byteCount":I
    .local v2, "byteCount":I
    const/16 v3, 0x800

    .end local v4    # "min":I
    .local v3, "min":I
    goto :goto_0

    .line 893
    .end local v7    # "codePoint":I
    .local v2, "codePoint":I
    .local v3, "byteCount":I
    .restart local v4    # "min":I
    :cond_2
    const/16 v6, 0xf8

    .restart local v6    # "other$iv":I
    move v7, v1

    .local v7, "$this$and$iv":B
    const/4 v8, 0x0

    .line 1763
    .restart local v8    # "$i$f$and":I
    and-int/2addr v7, v6

    .line 893
    .end local v6    # "other$iv":I
    .end local v7    # "$this$and$iv":B
    .end local v8    # "$i$f$and":I
    const/16 v6, 0xf0

    if-ne v7, v6, :cond_a

    .line 895
    const/4 v6, 0x7

    .restart local v6    # "other$iv":I
    move v7, v1

    .restart local v7    # "$this$and$iv":B
    const/4 v8, 0x0

    .line 1764
    .restart local v8    # "$i$f$and":I
    and-int/2addr v7, v6

    .line 895
    .end local v6    # "other$iv":I
    .end local v7    # "$this$and$iv":B
    .end local v8    # "$i$f$and":I
    nop

    .line 896
    .end local v2    # "codePoint":I
    .local v7, "codePoint":I
    const/4 v2, 0x4

    .line 897
    .end local v3    # "byteCount":I
    .local v2, "byteCount":I
    const/high16 v3, 0x10000

    .line 906
    .end local v4    # "min":I
    .local v3, "min":I
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    int-to-long v10, v2

    cmp-long v4, v8, v10

    if-ltz v4, :cond_9

    .line 913
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_1
    if-ge v4, v2, :cond_4

    .line 914
    int-to-long v8, v4

    invoke-virtual {p0, v8, v9}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v6

    .line 915
    .local v6, "b":B
    const/16 v8, 0xc0

    .local v8, "other$iv":I
    move v9, v6

    .local v9, "$this$and$iv":B
    const/4 v10, 0x0

    .line 1765
    .local v10, "$i$f$and":I
    and-int/2addr v9, v8

    .line 915
    .end local v8    # "other$iv":I
    .end local v9    # "$this$and$iv":B
    .end local v10    # "$i$f$and":I
    const/16 v8, 0x80

    if-ne v9, v8, :cond_3

    .line 917
    shl-int/lit8 v7, v7, 0x6

    .line 918
    const/16 v8, 0x3f

    .restart local v8    # "other$iv":I
    move v9, v6

    .restart local v9    # "$this$and$iv":B
    const/4 v10, 0x0

    .line 1766
    .restart local v10    # "$i$f$and":I
    and-int/2addr v9, v8

    .line 918
    .end local v8    # "other$iv":I
    .end local v9    # "$this$and$iv":B
    .end local v10    # "$i$f$and":I
    or-int/2addr v7, v9

    .line 913
    .end local v6    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 920
    .restart local v6    # "b":B
    :cond_3
    int-to-long v8, v4

    invoke-virtual {p0, v8, v9}, Lnicoid/network238/okio/Buffer;->skip(J)V

    .line 921
    return v5

    .line 925
    .end local v4    # "i":I
    .end local v6    # "b":B
    :cond_4
    int-to-long v8, v2

    invoke-virtual {p0, v8, v9}, Lnicoid/network238/okio/Buffer;->skip(J)V

    .line 927
    nop

    .line 928
    const v4, 0x10ffff

    if-le v7, v4, :cond_5

    .line 929
    goto :goto_2

    .line 931
    :cond_5
    move v4, v7

    .local v4, "$this$isSurrogate$iv":I
    const/4 v6, 0x0

    .line 1767
    .local v6, "$i$f$isSurrogate":I
    const v8, 0xd800

    const/4 v9, 0x0

    if-gt v8, v4, :cond_6

    const v8, 0xe000

    if-ge v4, v8, :cond_6

    const/4 v9, 0x1

    .line 931
    .end local v4    # "$this$isSurrogate$iv":I
    .end local v6    # "$i$f$isSurrogate":I
    :cond_6
    if-eqz v9, :cond_7

    .line 932
    goto :goto_2

    .line 934
    :cond_7
    if-ge v7, v3, :cond_8

    .line 935
    goto :goto_2

    .line 937
    :cond_8
    move v5, v7

    .line 927
    :goto_2
    return v5

    .line 907
    :cond_9
    new-instance v4, Ljava/io/EOFException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "size < "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " (to read code point prefixed 0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v1}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x29

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 901
    .end local v7    # "codePoint":I
    .local v2, "codePoint":I
    .local v3, "byteCount":I
    .local v4, "min":I
    :cond_a
    const-wide/16 v6, 0x1

    invoke-virtual {p0, v6, v7}, Lnicoid/network238/okio/Buffer;->skip(J)V

    .line 902
    return v5

    .line 867
    .end local v1    # "b0":B
    .end local v2    # "codePoint":I
    .end local v3    # "byteCount":I
    .end local v4    # "min":I
    :cond_b
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public static final commonReadUtf8Line(Lnicoid/network238/okio/Buffer;)Ljava/lang/String;
    .registers 8
    .param p0, "$this$commonReadUtf8Line"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 836
    .local v0, "$i$f$commonReadUtf8Line":I
    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->indexOf(B)J

    move-result-wide v1

    .line 838
    .local v1, "newline":J
    nop

    .line 839
    const-wide/16 v3, -0x1

    cmp-long v3, v1, v3

    if-eqz v3, :cond_0

    invoke-static {p0, v1, v2}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 840
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 841
    :cond_1
    const/4 v3, 0x0

    .line 838
    :goto_0
    return-object v3
.end method

.method public static final commonReadUtf8LineStrict(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;
    .registers 18
    .param p0, "$this$commonReadUtf8LineStrict"    # Lnicoid/network238/okio/Buffer;
    .param p1, "limit"    # J

    move-wide/from16 v6, p1

    const-string v1, "<this>"

    invoke-static {p0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v8, 0x0

    .line 846
    .local v8, "$i$f$commonReadUtf8LineStrict":I
    const-wide/16 v1, 0x0

    cmp-long v1, v6, v1

    if-ltz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_4

    .line 847
    const-wide v1, 0x7fffffffffffffffL

    cmp-long v3, v6, v1

    const-wide/16 v9, 0x1

    if-eqz v3, :cond_1

    add-long v1, v6, v9

    :cond_1
    move-wide v4, v1

    .line 848
    .local v4, "scanLength":J
    const/16 v1, 0xa

    const-wide/16 v2, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->indexOf(BJJ)J

    move-result-wide v11

    .line 849
    move-wide v13, v4

    .end local v4    # "scanLength":J
    .local v11, "newline":J
    .local v13, "scanLength":J
    const-wide/16 v1, -0x1

    cmp-long v1, v11, v1

    if-eqz v1, :cond_2

    invoke-static {p0, v11, v12}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 850
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    cmp-long v1, v13, v1

    if-gez v1, :cond_3

    .line 851
    sub-long v4, v13, v9

    invoke-virtual {p0, v4, v5}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v1

    const/16 v2, 0xd

    if-ne v1, v2, :cond_3

    .line 852
    invoke-virtual {p0, v13, v14}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_3

    .line 854
    invoke-static {p0, v13, v14}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 856
    :cond_3
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 857
    .local v1, "data":Lnicoid/network238/okio/Buffer;
    const/16 v2, 0x20

    .local v2, "a$iv":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    .local v3, "b$iv":J
    const/4 v5, 0x0

    .line 1756
    .local v5, "$i$f$minOf":I
    int-to-long v9, v2

    invoke-static {v9, v10, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    .line 857
    .end local v2    # "a$iv":I
    .end local v3    # "b$iv":J
    .end local v5    # "$i$f$minOf":I
    const-wide/16 v2, 0x0

    move-object v0, p0

    move-wide v4, v9

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->copyTo(Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;

    .line 858
    new-instance v0, Ljava/io/EOFException;

    .line 859
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\\n not found: limit="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 860
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 859
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 862
    nop

    .line 859
    const-string v3, " content="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 862
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v3

    .line 859
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2026

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 858
    invoke-direct {v0, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1755
    .end local v1    # "data":Lnicoid/network238/okio/Buffer;
    .end local v11    # "newline":J
    .end local v13    # "scanLength":J
    :cond_4
    const/4 v0, 0x0

    .line 846
    .local v0, "$i$a$-require--Buffer$commonReadUtf8LineStrict$1":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "limit < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v0    # "$i$a$-require--Buffer$commonReadUtf8LineStrict$1":I
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonResizeBuffer(Lnicoid/network238/okio/Buffer$UnsafeCursor;J)J
    .registers 23
    .param p0, "$this$commonResizeBuffer"    # Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .param p1, "newSize"    # J

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    const-string v3, "<this>"

    invoke-static {v0, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x0

    .line 1625
    .local v3, "$i$f$commonResizeBuffer":I
    iget-object v4, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-eqz v4, :cond_9

    .line 1626
    .local v4, "buffer":Lnicoid/network238/okio/Buffer;
    iget-boolean v5, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v5, :cond_8

    .line 1628
    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    .line 1629
    .local v5, "oldSize":J
    cmp-long v7, v1, v5

    const/4 v8, 0x1

    const-wide/16 v9, 0x0

    if-gtz v7, :cond_4

    .line 1630
    cmp-long v7, v1, v9

    if-gez v7, :cond_0

    const/4 v8, 0x0

    :cond_0
    if-eqz v8, :cond_3

    .line 1632
    sub-long v7, v5, v1

    .line 1633
    .local v7, "bytesToSubtract":J
    :goto_0
    cmp-long v11, v7, v9

    if-lez v11, :cond_2

    .line 1634
    iget-object v11, v4, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v11, v11, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1635
    .local v11, "tail":Lnicoid/network238/okio/Segment;
    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v12, v11, Lnicoid/network238/okio/Segment;->limit:I

    iget v13, v11, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v12, v13

    .line 1636
    .local v12, "tailSize":I
    int-to-long v13, v12

    cmp-long v13, v13, v7

    if-gtz v13, :cond_1

    .line 1637
    invoke-virtual {v11}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v13

    iput-object v13, v4, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1638
    invoke-static {v11}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    .line 1639
    int-to-long v13, v12

    sub-long/2addr v7, v13

    goto :goto_0

    .line 1641
    :cond_1
    iget v9, v11, Lnicoid/network238/okio/Segment;->limit:I

    long-to-int v10, v7

    sub-int/2addr v9, v10

    iput v9, v11, Lnicoid/network238/okio/Segment;->limit:I

    .line 1642
    nop

    .line 1646
    .end local v11    # "tail":Lnicoid/network238/okio/Segment;
    .end local v12    # "tailSize":I
    :cond_2
    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 1647
    iput-wide v1, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 1648
    iput-object v9, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 1649
    const/4 v9, -0x1

    iput v9, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 1650
    iput v9, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    .end local v7    # "bytesToSubtract":J
    goto :goto_2

    .line 1755
    :cond_3
    const/4 v7, 0x0

    .line 1630
    .local v7, "$i$a$-require--Buffer$commonResizeBuffer$2":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "newSize < 0: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .end local v7    # "$i$a$-require--Buffer$commonResizeBuffer$2":I
    new-instance v8, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1651
    :cond_4
    cmp-long v7, v1, v5

    if-lez v7, :cond_7

    .line 1653
    const/4 v7, 0x1

    .line 1654
    .local v7, "needsToSeek":Z
    sub-long v11, v1, v5

    .line 1655
    .local v11, "bytesToAdd":J
    :goto_1
    cmp-long v13, v11, v9

    if-lez v13, :cond_6

    .line 1656
    invoke-virtual {v4, v8}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v13

    .line 1657
    .local v13, "tail":Lnicoid/network238/okio/Segment;
    iget v14, v13, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v14, v14, 0x2000

    .local v14, "b$iv":I
    move-wide v15, v11

    .local v15, "a$iv":J
    const/16 v17, 0x0

    .line 1832
    .local v17, "$i$f$minOf":I
    int-to-long v8, v14

    move-wide/from16 v18, v11

    move-wide v10, v15

    .end local v11    # "bytesToAdd":J
    .end local v15    # "a$iv":J
    .local v10, "a$iv":J
    .local v18, "bytesToAdd":J
    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 1657
    .end local v10    # "a$iv":J
    .end local v14    # "b$iv":I
    .end local v17    # "$i$f$minOf":I
    long-to-int v8, v8

    .line 1658
    .local v8, "segmentBytesToAdd":I
    iget v9, v13, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v9, v8

    iput v9, v13, Lnicoid/network238/okio/Segment;->limit:I

    .line 1659
    int-to-long v9, v8

    sub-long v11, v18, v9

    .line 1662
    .end local v18    # "bytesToAdd":J
    .restart local v11    # "bytesToAdd":J
    if-eqz v7, :cond_5

    .line 1663
    invoke-virtual {v0, v13}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 1664
    iput-wide v5, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 1665
    iget-object v9, v13, Lnicoid/network238/okio/Segment;->data:[B

    iput-object v9, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 1666
    iget v9, v13, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v9, v8

    iput v9, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 1667
    iget v9, v13, Lnicoid/network238/okio/Segment;->limit:I

    iput v9, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    .line 1668
    const/4 v7, 0x0

    const/4 v8, 0x1

    const-wide/16 v9, 0x0

    .end local v8    # "segmentBytesToAdd":I
    .end local v13    # "tail":Lnicoid/network238/okio/Segment;
    goto :goto_1

    .line 1662
    .restart local v8    # "segmentBytesToAdd":I
    .restart local v13    # "tail":Lnicoid/network238/okio/Segment;
    :cond_5
    const/4 v8, 0x1

    const-wide/16 v9, 0x0

    goto :goto_1

    .line 1655
    .end local v8    # "segmentBytesToAdd":I
    .end local v13    # "tail":Lnicoid/network238/okio/Segment;
    :cond_6
    move-wide/from16 v18, v11

    .line 1673
    .end local v7    # "needsToSeek":Z
    .end local v11    # "bytesToAdd":J
    :cond_7
    :goto_2
    invoke-virtual {v4, v1, v2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1675
    return-wide v5

    .line 1755
    .end local v5    # "oldSize":J
    :cond_8
    const/4 v5, 0x0

    .line 1626
    .local v5, "$i$a$-check--Buffer$commonResizeBuffer$1":I
    nop

    .end local v5    # "$i$a$-check--Buffer$commonResizeBuffer$1":I
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "resizeBuffer() only permitted for read/write buffers"

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1755
    .end local v4    # "buffer":Lnicoid/network238/okio/Buffer;
    :cond_9
    const/4 v4, 0x0

    .line 1625
    .local v4, "$i$a$-checkNotNull--Buffer$commonResizeBuffer$buffer$1":I
    nop

    .end local v4    # "$i$a$-checkNotNull--Buffer$commonResizeBuffer$buffer$1":I
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "not attached to a buffer"

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static final commonSeek(Lnicoid/network238/okio/Buffer$UnsafeCursor;J)I
    .registers 21
    .param p0, "$this$commonSeek"    # Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .param p1, "offset"    # J

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    const-string v3, "<this>"

    invoke-static {v0, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x0

    .line 1553
    .local v3, "$i$f$commonSeek":I
    iget-object v4, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->buffer:Lnicoid/network238/okio/Buffer;

    if-eqz v4, :cond_9

    .line 1554
    .local v4, "buffer":Lnicoid/network238/okio/Buffer;
    const-wide/16 v5, -0x1

    cmp-long v7, v1, v5

    if-ltz v7, :cond_8

    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    cmp-long v7, v1, v7

    if-gtz v7, :cond_8

    .line 1558
    cmp-long v5, v1, v5

    if-eqz v5, :cond_7

    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    cmp-long v5, v1, v5

    if-nez v5, :cond_0

    move v15, v3

    move-object/from16 v16, v4

    goto/16 :goto_3

    .line 1568
    :cond_0
    const-wide/16 v5, 0x0

    .line 1569
    .local v5, "min":J
    invoke-virtual {v4}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    .line 1570
    .local v7, "max":J
    iget-object v9, v4, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1571
    .local v9, "head":Lnicoid/network238/okio/Segment;
    iget-object v10, v4, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1572
    .local v10, "tail":Lnicoid/network238/okio/Segment;
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->getSegment$okio()Lnicoid/network238/okio/Segment;

    move-result-object v11

    if-eqz v11, :cond_2

    .line 1573
    iget-wide v11, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    iget v13, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->getSegment$okio()Lnicoid/network238/okio/Segment;

    move-result-object v14

    invoke-static {v14}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v14, v14, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v13, v14

    int-to-long v13, v13

    sub-long/2addr v11, v13

    .line 1574
    .local v11, "segmentOffset":J
    cmp-long v13, v11, v1

    if-lez v13, :cond_1

    .line 1576
    move-wide v7, v11

    .line 1577
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->getSegment$okio()Lnicoid/network238/okio/Segment;

    move-result-object v10

    goto :goto_0

    .line 1580
    :cond_1
    move-wide v5, v11

    .line 1581
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->getSegment$okio()Lnicoid/network238/okio/Segment;

    move-result-object v9

    .line 1585
    .end local v11    # "segmentOffset":J
    :cond_2
    :goto_0
    const/4 v11, 0x0

    .line 1586
    .local v11, "next":Lnicoid/network238/okio/Segment;
    const-wide/16 v12, 0x0

    .line 1587
    .local v12, "nextOffset":J
    sub-long v14, v7, v1

    sub-long v16, v1, v5

    cmp-long v14, v14, v16

    if-lez v14, :cond_3

    .line 1589
    move-object v11, v9

    .line 1590
    move-wide v12, v5

    .line 1591
    :goto_1
    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v14, v11, Lnicoid/network238/okio/Segment;->limit:I

    iget v15, v11, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v14, v15

    int-to-long v14, v14

    add-long/2addr v14, v12

    cmp-long v14, v1, v14

    if-ltz v14, :cond_4

    .line 1592
    iget v14, v11, Lnicoid/network238/okio/Segment;->limit:I

    iget v15, v11, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v14, v15

    int-to-long v14, v14

    add-long/2addr v12, v14

    .line 1593
    iget-object v11, v11, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_1

    .line 1597
    :cond_3
    move-object v11, v10

    .line 1598
    move-wide v12, v7

    .line 1599
    :goto_2
    cmp-long v14, v12, v1

    if-lez v14, :cond_4

    .line 1600
    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v11, v11, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1601
    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v14, v11, Lnicoid/network238/okio/Segment;->limit:I

    iget v15, v11, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v14, v15

    int-to-long v14, v14

    sub-long/2addr v12, v14

    goto :goto_2

    .line 1606
    :cond_4
    iget-boolean v14, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->readWrite:Z

    if-eqz v14, :cond_6

    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-boolean v14, v11, Lnicoid/network238/okio/Segment;->shared:Z

    if-eqz v14, :cond_6

    .line 1607
    invoke-virtual {v11}, Lnicoid/network238/okio/Segment;->unsharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v14

    .line 1608
    .local v14, "unsharedNext":Lnicoid/network238/okio/Segment;
    iget-object v15, v4, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-ne v15, v11, :cond_5

    .line 1609
    iput-object v14, v4, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1611
    :cond_5
    invoke-virtual {v11, v14}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    move-result-object v11

    .line 1612
    iget-object v15, v11, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v15}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v15}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    .line 1616
    .end local v14    # "unsharedNext":Lnicoid/network238/okio/Segment;
    :cond_6
    invoke-virtual {v0, v11}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 1617
    iput-wide v1, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 1618
    invoke-static {v11}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v14, v11, Lnicoid/network238/okio/Segment;->data:[B

    iput-object v14, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 1619
    iget v14, v11, Lnicoid/network238/okio/Segment;->pos:I

    move v15, v3

    move-object/from16 v16, v4

    .end local v3    # "$i$f$commonSeek":I
    .end local v4    # "buffer":Lnicoid/network238/okio/Buffer;
    .local v15, "$i$f$commonSeek":I
    .local v16, "buffer":Lnicoid/network238/okio/Buffer;
    sub-long v3, v1, v12

    long-to-int v3, v3

    add-int/2addr v14, v3

    iput v14, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 1620
    iget v3, v11, Lnicoid/network238/okio/Segment;->limit:I

    iput v3, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    .line 1621
    iget v3, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    iget v4, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    sub-int/2addr v3, v4

    return v3

    .line 1558
    .end local v5    # "min":J
    .end local v7    # "max":J
    .end local v9    # "head":Lnicoid/network238/okio/Segment;
    .end local v10    # "tail":Lnicoid/network238/okio/Segment;
    .end local v11    # "next":Lnicoid/network238/okio/Segment;
    .end local v12    # "nextOffset":J
    .end local v15    # "$i$f$commonSeek":I
    .end local v16    # "buffer":Lnicoid/network238/okio/Buffer;
    .restart local v3    # "$i$f$commonSeek":I
    .restart local v4    # "buffer":Lnicoid/network238/okio/Buffer;
    :cond_7
    move v15, v3

    move-object/from16 v16, v4

    .line 1559
    .end local v3    # "$i$f$commonSeek":I
    .end local v4    # "buffer":Lnicoid/network238/okio/Buffer;
    .restart local v15    # "$i$f$commonSeek":I
    .restart local v16    # "buffer":Lnicoid/network238/okio/Buffer;
    :goto_3
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->setSegment$okio(Lnicoid/network238/okio/Segment;)V

    .line 1560
    iput-wide v1, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->offset:J

    .line 1561
    iput-object v3, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->data:[B

    .line 1562
    const/4 v3, -0x1

    iput v3, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->start:I

    .line 1563
    iput v3, v0, Lnicoid/network238/okio/Buffer$UnsafeCursor;->end:I

    .line 1564
    return v3

    .line 1554
    .end local v15    # "$i$f$commonSeek":I
    .end local v16    # "buffer":Lnicoid/network238/okio/Buffer;
    .restart local v3    # "$i$f$commonSeek":I
    .restart local v4    # "buffer":Lnicoid/network238/okio/Buffer;
    :cond_8
    move v15, v3

    move-object/from16 v16, v4

    .line 1555
    .end local v3    # "$i$f$commonSeek":I
    .end local v4    # "buffer":Lnicoid/network238/okio/Buffer;
    .restart local v15    # "$i$f$commonSeek":I
    .restart local v16    # "buffer":Lnicoid/network238/okio/Buffer;
    new-instance v3, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "offset="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " > size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1755
    .end local v15    # "$i$f$commonSeek":I
    .end local v16    # "buffer":Lnicoid/network238/okio/Buffer;
    .restart local v3    # "$i$f$commonSeek":I
    :cond_9
    move v15, v3

    .end local v3    # "$i$f$commonSeek":I
    .restart local v15    # "$i$f$commonSeek":I
    const/4 v3, 0x0

    .line 1553
    .local v3, "$i$a$-checkNotNull--Buffer$commonSeek$buffer$1":I
    nop

    .end local v3    # "$i$a$-checkNotNull--Buffer$commonSeek$buffer$1":I
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "not attached to a buffer"

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static final commonSelect(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Options;)I
    .registers 7
    .param p0, "$this$commonSelect"    # Lnicoid/network238/okio/Buffer;
    .param p1, "options"    # Lnicoid/network238/okio/Options;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 786
    .local v0, "$i$f$commonSelect":I
    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p0, p1, v3, v1, v2}, Lnicoid/network238/okio/internal/-Buffer;->selectPrefix$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Options;ZILjava/lang/Object;)I

    move-result v1

    .line 787
    .local v1, "index":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    return v2

    .line 790
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/Options;->getByteStrings$okio()[Lnicoid/network238/okio/ByteString;

    move-result-object v2

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    .line 791
    .local v2, "selectedSize":I
    int-to-long v3, v2

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->skip(J)V

    .line 792
    return v1
.end method

.method public static final commonSkip(Lnicoid/network238/okio/Buffer;J)V
    .registers 13
    .param p0, "$this$commonSkip"    # Lnicoid/network238/okio/Buffer;
    .param p1, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 420
    .local v0, "$i$f$commonSkip":I
    move-wide v1, p1

    .line 421
    .local v1, "byteCount":J
    :cond_0
    :goto_0
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_2

    .line 422
    iget-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v3, :cond_1

    .line 424
    .local v3, "head":Lnicoid/network238/okio/Segment;
    iget v4, v3, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v3, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v4, v5

    .local v4, "b$iv":I
    move-wide v5, v1

    .local v5, "a$iv":J
    const/4 v7, 0x0

    .line 1754
    .local v7, "$i$f$minOf":I
    int-to-long v8, v4

    invoke-static {v5, v6, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 424
    .end local v4    # "b$iv":I
    .end local v5    # "a$iv":J
    .end local v7    # "$i$f$minOf":I
    long-to-int v4, v8

    .line 425
    .local v4, "toSkip":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    int-to-long v7, v4

    sub-long/2addr v5, v7

    invoke-virtual {p0, v5, v6}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 426
    int-to-long v5, v4

    sub-long/2addr v1, v5

    .line 427
    iget v5, v3, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v5, v4

    iput v5, v3, Lnicoid/network238/okio/Segment;->pos:I

    .line 429
    iget v5, v3, Lnicoid/network238/okio/Segment;->pos:I

    iget v6, v3, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v5, v6, :cond_0

    .line 430
    invoke-virtual {v3}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v5

    iput-object v5, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 431
    invoke-static {v3}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    .end local v3    # "head":Lnicoid/network238/okio/Segment;
    .end local v4    # "toSkip":I
    goto :goto_0

    .line 422
    :cond_1
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 434
    :cond_2
    return-void
.end method

.method public static final commonSnapshot(Lnicoid/network238/okio/Buffer;)Lnicoid/network238/okio/ByteString;
    .registers 6
    .param p0, "$this$commonSnapshot"    # Lnicoid/network238/okio/Buffer;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1489
    .local v0, "$i$f$commonSnapshot":I
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/32 v3, 0x7fffffff

    cmp-long v1, v1, v3

    if-gtz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 1490
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->snapshot(I)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    return-object v1

    .line 1755
    :cond_1
    const/4 v1, 0x0

    .line 1489
    .local v1, "$i$a$-check--Buffer$commonSnapshot$1":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "size > Int.MAX_VALUE: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-check--Buffer$commonSnapshot$1":I
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static final commonSnapshot(Lnicoid/network238/okio/Buffer;I)Lnicoid/network238/okio/ByteString;
    .registers 10
    .param p0, "$this$commonSnapshot"    # Lnicoid/network238/okio/Buffer;
    .param p1, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1495
    .local v0, "$i$f$commonSnapshot":I
    if-nez p1, :cond_0

    sget-object v1, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    return-object v1

    .line 1496
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    int-to-long v6, p1

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 1499
    const/4 v1, 0x0

    .line 1500
    .local v1, "offset":I
    const/4 v2, 0x0

    .line 1501
    .local v2, "segmentCount":I
    iget-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1502
    .local v3, "s":Lnicoid/network238/okio/Segment;
    :goto_0
    if-ge v1, p1, :cond_2

    .line 1503
    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v4, v3, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v3, Lnicoid/network238/okio/Segment;->pos:I

    if-eq v4, v5, :cond_1

    .line 1506
    iget v4, v3, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v3, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v4, v5

    add-int/2addr v1, v4

    .line 1507
    add-int/lit8 v2, v2, 0x1

    .line 1508
    iget-object v3, v3, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_0

    .line 1504
    :cond_1
    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "s.limit == s.pos"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 1512
    :cond_2
    new-array v4, v2, [[B

    .line 1513
    .local v4, "segments":[[B
    mul-int/lit8 v5, v2, 0x2

    new-array v5, v5, [I

    .line 1514
    .local v5, "directory":[I
    const/4 v1, 0x0

    .line 1515
    const/4 v2, 0x0

    .line 1516
    iget-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1517
    :goto_1
    if-ge v1, p1, :cond_3

    .line 1518
    invoke-static {v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v6, v3, Lnicoid/network238/okio/Segment;->data:[B

    aput-object v6, v4, v2

    .line 1519
    iget v6, v3, Lnicoid/network238/okio/Segment;->limit:I

    iget v7, v3, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v6, v7

    add-int/2addr v1, v6

    .line 1521
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result v6

    aput v6, v5, v2

    .line 1522
    move-object v6, v4

    check-cast v6, [Ljava/lang/Object;

    array-length v6, v6

    add-int/2addr v6, v2

    iget v7, v3, Lnicoid/network238/okio/Segment;->pos:I

    aput v7, v5, v6

    .line 1523
    const/4 v6, 0x1

    iput-boolean v6, v3, Lnicoid/network238/okio/Segment;->shared:Z

    .line 1524
    add-int/lit8 v2, v2, 0x1

    .line 1525
    iget-object v3, v3, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_1

    .line 1528
    :cond_3
    new-instance v6, Lnicoid/network238/okio/SegmentedByteString;

    invoke-direct {v6, v4, v5}, Lnicoid/network238/okio/SegmentedByteString;-><init>([[B[I)V

    check-cast v6, Lnicoid/network238/okio/ByteString;

    return-object v6
.end method

.method public static final commonWritableSegment(Lnicoid/network238/okio/Buffer;I)Lnicoid/network238/okio/Segment;
    .registers 6
    .param p0, "$this$commonWritableSegment"    # Lnicoid/network238/okio/Buffer;
    .param p1, "minimumCapacity"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 555
    .local v0, "$i$f$commonWritableSegment":I
    const/16 v1, 0x2000

    const/4 v2, 0x1

    if-lt p1, v2, :cond_0

    if-gt p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_3

    .line 557
    iget-object v2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v2, :cond_1

    .line 558
    invoke-static {}, Lnicoid/network238/okio/SegmentPool;->take()Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 559
    .local v1, "result":Lnicoid/network238/okio/Segment;
    iput-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 560
    iput-object v1, v1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 561
    iput-object v1, v1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 562
    return-object v1

    .line 565
    .end local v1    # "result":Lnicoid/network238/okio/Segment;
    :cond_1
    iget-object v2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v2, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 566
    .local v2, "tail":Lnicoid/network238/okio/Segment;
    invoke-static {v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v3, p1

    if-gt v3, v1, :cond_2

    iget-boolean v1, v2, Lnicoid/network238/okio/Segment;->owner:Z

    if-eqz v1, :cond_2

    goto :goto_1

    .line 567
    :cond_2
    invoke-static {}, Lnicoid/network238/okio/SegmentPool;->take()Lnicoid/network238/okio/Segment;

    move-result-object v1

    invoke-virtual {v2, v1}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 569
    :goto_1
    return-object v2

    .line 1755
    .end local v2    # "tail":Lnicoid/network238/okio/Segment;
    :cond_3
    const/4 v1, 0x0

    .line 555
    .local v1, "$i$a$-require--Buffer$commonWritableSegment$1":I
    nop

    .end local v1    # "$i$a$-require--Buffer$commonWritableSegment$1":I
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "unexpected capacity"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/Buffer;
    .registers 5
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/Buffer;
    .param p1, "byteString"    # Lnicoid/network238/okio/ByteString;
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "byteString"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 441
    .local v0, "$i$f$commonWrite":I
    invoke-virtual {p1, p0, p2, p3}, Lnicoid/network238/okio/ByteString;->write$okio(Lnicoid/network238/okio/Buffer;II)V

    .line 442
    return-object p0
.end method

.method public static final commonWrite(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/Buffer;
    .registers 11
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/Buffer;
    .param p1, "source"    # Lnicoid/network238/okio/Source;
    .param p2, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1096
    .local v0, "$i$f$commonWrite":I
    move-wide v1, p2

    .line 1097
    .local v1, "byteCount":J
    :goto_0
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_1

    .line 1098
    invoke-interface {p1, p0, v1, v2}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v3

    .line 1099
    .local v3, "read":J
    const-wide/16 v5, -0x1

    cmp-long v5, v3, v5

    if-eqz v5, :cond_0

    .line 1100
    sub-long/2addr v1, v3

    .end local v3    # "read":J
    goto :goto_0

    .line 1099
    .restart local v3    # "read":J
    :cond_0
    new-instance v5, Ljava/io/EOFException;

    invoke-direct {v5}, Ljava/io/EOFException;-><init>()V

    throw v5

    .line 1102
    .end local v3    # "read":J
    :cond_1
    return-object p0
.end method

.method public static final commonWrite(Lnicoid/network238/okio/Buffer;[B)Lnicoid/network238/okio/Buffer;
    .registers 5
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/Buffer;
    .param p1, "source"    # [B

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 572
    .local v0, "$i$f$commonWrite":I
    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {p0, p1, v1, v2}, Lnicoid/network238/okio/Buffer;->write([BII)Lnicoid/network238/okio/Buffer;

    move-result-object v1

    return-object v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/Buffer;[BII)Lnicoid/network238/okio/Buffer;
    .registers 13
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/Buffer;
    .param p1, "source"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 579
    .local v0, "$i$f$commonWrite":I
    move v1, p2

    .line 580
    .local v1, "offset":I
    array-length v2, p1

    int-to-long v3, v2

    int-to-long v5, v1

    int-to-long v7, p3

    invoke-static/range {v3 .. v8}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 582
    add-int v2, v1, p3

    .line 583
    .local v2, "limit":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 584
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v3

    .line 586
    .local v3, "tail":Lnicoid/network238/okio/Segment;
    sub-int v4, v2, v1

    iget v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v5, v5, 0x2000

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 587
    .local v4, "toCopy":I
    nop

    .line 588
    iget-object v5, v3, Lnicoid/network238/okio/Segment;->data:[B

    .line 589
    iget v6, v3, Lnicoid/network238/okio/Segment;->limit:I

    .line 590
    nop

    .line 591
    add-int v7, v1, v4

    .line 587
    invoke-static {p1, v5, v6, v1, v7}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 594
    add-int/2addr v1, v4

    .line 595
    iget v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v5, v4

    iput v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    .end local v3    # "tail":Lnicoid/network238/okio/Segment;
    .end local v4    # "toCopy":I
    goto :goto_0

    .line 598
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v5, p3

    add-long/2addr v3, v5

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 599
    return-object p0
.end method

.method public static final commonWrite(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer;J)V
    .registers 14
    .param p0, "$this$commonWrite"    # Lnicoid/network238/okio/Buffer;
    .param p1, "source"    # Lnicoid/network238/okio/Buffer;
    .param p2, "byteCount"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1154
    .local v0, "$i$f$commonWrite":I
    move-wide v5, p2

    .line 1205
    .local v5, "byteCount":J
    const/4 v7, 0x0

    if-eq p1, p0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v7

    :goto_0
    if-eqz v1, :cond_7

    .line 1206
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 1208
    :goto_1
    const-wide/16 v1, 0x0

    cmp-long v1, v5, v1

    if-lez v1, :cond_6

    .line 1210
    iget-object v1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v1, v1, Lnicoid/network238/okio/Segment;->limit:I

    iget-object v2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v2, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    cmp-long v1, v5, v1

    if-gez v1, :cond_4

    .line 1211
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v1, v1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    goto :goto_2

    :cond_1
    const/4 v1, 0x0

    .line 1212
    .local v1, "tail":Lnicoid/network238/okio/Segment;
    :goto_2
    if-eqz v1, :cond_3

    iget-boolean v2, v1, Lnicoid/network238/okio/Segment;->owner:Z

    if-eqz v2, :cond_3

    .line 1213
    iget v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v2, v2

    add-long/2addr v2, v5

    iget-boolean v4, v1, Lnicoid/network238/okio/Segment;->shared:Z

    if-eqz v4, :cond_2

    move v4, v7

    goto :goto_3

    :cond_2
    iget v4, v1, Lnicoid/network238/okio/Segment;->pos:I

    :goto_3
    int-to-long v8, v4

    sub-long/2addr v2, v8

    const-wide/16 v8, 0x2000

    cmp-long v2, v2, v8

    if-gtz v2, :cond_3

    .line 1216
    iget-object v2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    long-to-int v3, v5

    invoke-virtual {v2, v1, v3}, Lnicoid/network238/okio/Segment;->writeTo(Lnicoid/network238/okio/Segment;I)V

    .line 1217
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    sub-long/2addr v2, v5

    invoke-virtual {p1, v2, v3}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1218
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    add-long/2addr v2, v5

    invoke-virtual {p0, v2, v3}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1219
    return-void

    .line 1223
    :cond_3
    iget-object v2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    long-to-int v3, v5

    invoke-virtual {v2, v3}, Lnicoid/network238/okio/Segment;->split(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    iput-object v2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1228
    .end local v1    # "tail":Lnicoid/network238/okio/Segment;
    :cond_4
    iget-object v1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1229
    .local v1, "segmentToMove":Lnicoid/network238/okio/Segment;
    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    .line 1230
    .local v2, "movedByteCount":J
    invoke-virtual {v1}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v4

    iput-object v4, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1231
    iget-object v4, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v4, :cond_5

    .line 1232
    iput-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1233
    iput-object v1, v1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1234
    iget-object v4, v1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    iput-object v4, v1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_4

    .line 1236
    :cond_5
    iget-object v4, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-static {v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v4, v4, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1237
    .local v4, "tail":Lnicoid/network238/okio/Segment;
    invoke-static {v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v4, v1}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    move-result-object v4

    .line 1238
    invoke-virtual {v4}, Lnicoid/network238/okio/Segment;->compact()V

    .line 1240
    .end local v4    # "tail":Lnicoid/network238/okio/Segment;
    :goto_4
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    sub-long/2addr v8, v2

    invoke-virtual {p1, v8, v9}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1241
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    add-long/2addr v8, v2

    invoke-virtual {p0, v8, v9}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1242
    sub-long/2addr v5, v2

    .end local v1    # "segmentToMove":Lnicoid/network238/okio/Segment;
    .end local v2    # "movedByteCount":J
    goto/16 :goto_1

    .line 1244
    :cond_6
    return-void

    .line 1755
    :cond_7
    const/4 v1, 0x0

    .line 1205
    .local v1, "$i$a$-require--Buffer$commonWrite$1":I
    nop

    .end local v1    # "$i$a$-require--Buffer$commonWrite$1":I
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "source == this"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static synthetic commonWrite$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/Buffer;
    .registers 6
    .param p0, "$this$commonWrite_u24default"    # Lnicoid/network238/okio/Buffer;
    .param p1, "byteString"    # Lnicoid/network238/okio/ByteString;
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    .line 436
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    .line 438
    const/4 p2, 0x0

    .line 436
    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 439
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p3

    .line 436
    :cond_1
    const-string p4, "<this>"

    invoke-static {p0, p4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p4, "byteString"

    invoke-static {p1, p4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p4, 0x0

    .line 441
    .local p4, "$i$f$commonWrite":I
    invoke-virtual {p1, p0, p2, p3}, Lnicoid/network238/okio/ByteString;->write$okio(Lnicoid/network238/okio/Buffer;II)V

    .line 442
    return-object p0
.end method

.method public static final commonWriteAll(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Source;)J
    .registers 9
    .param p0, "$this$commonWriteAll"    # Lnicoid/network238/okio/Buffer;
    .param p1, "source"    # Lnicoid/network238/okio/Source;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1086
    .local v0, "$i$f$commonWriteAll":I
    const-wide/16 v1, 0x0

    .line 1087
    .local v1, "totalBytesRead":J
    :goto_0
    nop

    .line 1088
    const-wide/16 v3, 0x2000

    invoke-interface {p1, p0, v3, v4}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v3

    .line 1089
    .local v3, "readCount":J
    const-wide/16 v5, -0x1

    cmp-long v5, v3, v5

    if-eqz v5, :cond_0

    .line 1090
    add-long/2addr v1, v3

    .end local v3    # "readCount":J
    goto :goto_0

    .line 1092
    :cond_0
    return-wide v1
.end method

.method public static final commonWriteByte(Lnicoid/network238/okio/Buffer;I)Lnicoid/network238/okio/Buffer;
    .registers 8
    .param p0, "$this$commonWriteByte"    # Lnicoid/network238/okio/Buffer;
    .param p1, "b"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1106
    .local v0, "$i$f$commonWriteByte":I
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 1107
    .local v1, "tail":Lnicoid/network238/okio/Segment;
    iget-object v2, v1, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v1, Lnicoid/network238/okio/Segment;->limit:I

    int-to-byte v4, p1

    aput-byte v4, v2, v3

    .line 1108
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-virtual {p0, v2, v3}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1109
    return-object p0
.end method

.method public static final commonWriteDecimalLong(Lnicoid/network238/okio/Buffer;J)Lnicoid/network238/okio/Buffer;
    .registers 17
    .param p0, "$this$commonWriteDecimalLong"    # Lnicoid/network238/okio/Buffer;
    .param p1, "v"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 446
    .local v0, "$i$f$commonWriteDecimalLong":I
    move-wide v1, p1

    .line 447
    .local v1, "v":J
    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    .line 449
    const/16 v3, 0x30

    invoke-virtual {p0, v3}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v3

    return-object v3

    .line 452
    :cond_0
    const/4 v5, 0x0

    .line 453
    .local v5, "negative":Z
    cmp-long v6, v1, v3

    if-gez v6, :cond_2

    .line 454
    neg-long v1, v1

    .line 455
    cmp-long v6, v1, v3

    if-gez v6, :cond_1

    .line 456
    const-string v3, "-9223372036854775808"

    invoke-virtual {p0, v3}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object v3

    return-object v3

    .line 458
    :cond_1
    const/4 v5, 0x1

    .line 461
    :cond_2
    # invokes: Lnicoid/network238/okio/internal/-Buffer;->countDigitsIn(J)I
    invoke-static {v1, v2}, Lnicoid/network238/okio/internal/-Buffer;->access$countDigitsIn(J)I

    move-result v6

    .line 462
    .local v6, "width":I
    if-eqz v5, :cond_3

    .line 463
    add-int/lit8 v6, v6, 0x1

    .line 466
    :cond_3
    invoke-virtual {p0, v6}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v7

    .line 467
    .local v7, "tail":Lnicoid/network238/okio/Segment;
    iget-object v8, v7, Lnicoid/network238/okio/Segment;->data:[B

    .line 468
    .local v8, "data":[B
    iget v9, v7, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v9, v6

    .line 469
    .local v9, "pos":I
    :goto_0
    cmp-long v10, v1, v3

    if-eqz v10, :cond_4

    .line 470
    const-wide/16 v10, 0xa

    rem-long v12, v1, v10

    long-to-int v12, v12

    .line 471
    .local v12, "digit":I
    add-int/lit8 v9, v9, -0x1

    invoke-static {}, Lnicoid/network238/okio/internal/-Buffer;->getHEX_DIGIT_BYTES()[B

    move-result-object v13

    aget-byte v13, v13, v12

    aput-byte v13, v8, v9

    .line 472
    div-long/2addr v1, v10

    .end local v12    # "digit":I
    goto :goto_0

    .line 474
    :cond_4
    if-eqz v5, :cond_5

    .line 475
    add-int/lit8 v9, v9, -0x1

    const/16 v3, 0x2d

    aput-byte v3, v8, v9

    .line 478
    :cond_5
    iget v3, v7, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v3, v6

    iput v3, v7, Lnicoid/network238/okio/Segment;->limit:I

    .line 479
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v10, v6

    add-long/2addr v3, v10

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 480
    return-object p0
.end method

.method public static final commonWriteHexadecimalUnsignedLong(Lnicoid/network238/okio/Buffer;J)Lnicoid/network238/okio/Buffer;
    .registers 19
    .param p0, "$this$commonWriteHexadecimalUnsignedLong"    # Lnicoid/network238/okio/Buffer;
    .param p1, "v"    # J

    move-object/from16 v0, p0

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 512
    .local v1, "$i$f$commonWriteHexadecimalUnsignedLong":I
    move-wide/from16 v2, p1

    .line 513
    .local v2, "v":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_0

    .line 515
    const/16 v4, 0x30

    invoke-virtual {v0, v4}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v4

    return-object v4

    .line 520
    :cond_0
    move-wide v4, v2

    .line 521
    .local v4, "x":J
    const/4 v6, 0x1

    ushr-long v7, v4, v6

    or-long/2addr v4, v7

    .line 522
    const/4 v7, 0x2

    ushr-long v8, v4, v7

    or-long/2addr v4, v8

    .line 523
    const/4 v8, 0x4

    ushr-long v9, v4, v8

    or-long/2addr v4, v9

    .line 524
    const/16 v9, 0x8

    ushr-long v10, v4, v9

    or-long/2addr v4, v10

    .line 525
    const/16 v10, 0x10

    ushr-long v11, v4, v10

    or-long/2addr v4, v11

    .line 526
    const/16 v11, 0x20

    ushr-long v12, v4, v11

    or-long/2addr v4, v12

    .line 530
    ushr-long v12, v4, v6

    const-wide v14, 0x5555555555555555L    # 1.1945305291614955E103

    and-long/2addr v12, v14

    sub-long/2addr v4, v12

    .line 531
    ushr-long v12, v4, v7

    const-wide v14, 0x3333333333333333L    # 4.667261458395856E-62

    and-long/2addr v12, v14

    and-long/2addr v14, v4

    add-long/2addr v12, v14

    .line 532
    .end local v4    # "x":J
    .local v12, "x":J
    ushr-long v4, v12, v8

    add-long/2addr v4, v12

    const-wide v14, 0xf0f0f0f0f0f0f0fL    # 3.815736827118017E-236

    and-long/2addr v4, v14

    .line 533
    .end local v12    # "x":J
    .restart local v4    # "x":J
    ushr-long v12, v4, v9

    add-long/2addr v4, v12

    .line 534
    ushr-long v9, v4, v10

    add-long/2addr v4, v9

    .line 535
    const-wide/16 v9, 0x3f

    and-long v12, v4, v9

    ushr-long v14, v4, v11

    and-long/2addr v14, v9

    add-long/2addr v12, v14

    .line 538
    .end local v4    # "x":J
    .restart local v12    # "x":J
    const-wide/16 v4, 0x3

    add-long/2addr v4, v12

    const-wide/16 v9, 0x4

    div-long/2addr v4, v9

    long-to-int v4, v4

    .line 540
    .local v4, "width":I
    invoke-virtual {v0, v4}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v5

    .line 541
    .local v5, "tail":Lnicoid/network238/okio/Segment;
    iget-object v7, v5, Lnicoid/network238/okio/Segment;->data:[B

    .line 542
    .local v7, "data":[B
    iget v9, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v9, v4

    sub-int/2addr v9, v6

    .line 543
    .local v9, "pos":I
    iget v6, v5, Lnicoid/network238/okio/Segment;->limit:I

    .line 544
    .local v6, "start":I
    :goto_0
    if-lt v9, v6, :cond_1

    .line 545
    invoke-static {}, Lnicoid/network238/okio/internal/-Buffer;->getHEX_DIGIT_BYTES()[B

    move-result-object v10

    const-wide/16 v14, 0xf

    and-long/2addr v14, v2

    long-to-int v11, v14

    aget-byte v10, v10, v11

    aput-byte v10, v7, v9

    .line 546
    ushr-long/2addr v2, v8

    .line 547
    add-int/lit8 v9, v9, -0x1

    goto :goto_0

    .line 549
    :cond_1
    iget v8, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v8, v4

    iput v8, v5, Lnicoid/network238/okio/Segment;->limit:I

    .line 550
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v10

    int-to-long v14, v4

    add-long/2addr v10, v14

    invoke-virtual {v0, v10, v11}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 551
    return-object v0
.end method

.method public static final commonWriteInt(Lnicoid/network238/okio/Buffer;I)Lnicoid/network238/okio/Buffer;
    .registers 10
    .param p0, "$this$commonWriteInt"    # Lnicoid/network238/okio/Buffer;
    .param p1, "i"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1124
    .local v0, "$i$f$commonWriteInt":I
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 1125
    .local v1, "tail":Lnicoid/network238/okio/Segment;
    iget-object v2, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 1126
    .local v2, "data":[B
    iget v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 1127
    .local v3, "limit":I
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "limit":I
    .local v4, "limit":I
    ushr-int/lit8 v5, p1, 0x18

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v2, v3

    .line 1128
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "limit":I
    .restart local v3    # "limit":I
    ushr-int/lit8 v5, p1, 0x10

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 1129
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "limit":I
    .restart local v4    # "limit":I
    ushr-int/lit8 v5, p1, 0x8

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v2, v3

    .line 1130
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "limit":I
    .restart local v3    # "limit":I
    and-int/lit16 v5, p1, 0xff

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 1131
    iput v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 1132
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x4

    add-long/2addr v4, v6

    invoke-virtual {p0, v4, v5}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1133
    return-object p0
.end method

.method public static final commonWriteLong(Lnicoid/network238/okio/Buffer;J)Lnicoid/network238/okio/Buffer;
    .registers 13
    .param p0, "$this$commonWriteLong"    # Lnicoid/network238/okio/Buffer;
    .param p1, "v"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1137
    .local v0, "$i$f$commonWriteLong":I
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 1138
    .local v2, "tail":Lnicoid/network238/okio/Segment;
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1139
    .local v3, "data":[B
    iget v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 1140
    .local v4, "limit":I
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "limit":I
    .local v5, "limit":I
    const/16 v6, 0x38

    ushr-long v6, p1, v6

    const-wide/16 v8, 0xff

    and-long/2addr v6, v8

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v3, v4

    .line 1141
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "limit":I
    .restart local v4    # "limit":I
    const/16 v6, 0x30

    ushr-long v6, p1, v6

    and-long/2addr v6, v8

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v3, v5

    .line 1142
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "limit":I
    .restart local v5    # "limit":I
    const/16 v6, 0x28

    ushr-long v6, p1, v6

    and-long/2addr v6, v8

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v3, v4

    .line 1143
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "limit":I
    .restart local v4    # "limit":I
    const/16 v6, 0x20

    ushr-long v6, p1, v6

    and-long/2addr v6, v8

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v3, v5

    .line 1144
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "limit":I
    .restart local v5    # "limit":I
    const/16 v6, 0x18

    ushr-long v6, p1, v6

    and-long/2addr v6, v8

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v3, v4

    .line 1145
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "limit":I
    .restart local v4    # "limit":I
    const/16 v6, 0x10

    ushr-long v6, p1, v6

    and-long/2addr v6, v8

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v3, v5

    .line 1146
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "limit":I
    .restart local v5    # "limit":I
    ushr-long v6, p1, v1

    and-long/2addr v6, v8

    long-to-int v1, v6

    int-to-byte v1, v1

    aput-byte v1, v3, v4

    .line 1147
    add-int/lit8 v1, v5, 0x1

    .end local v5    # "limit":I
    .local v1, "limit":I
    and-long/2addr v8, p1

    long-to-int v4, v8

    int-to-byte v4, v4

    aput-byte v4, v3, v5

    .line 1148
    iput v1, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 1149
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x8

    add-long/2addr v4, v6

    invoke-virtual {p0, v4, v5}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1150
    return-object p0
.end method

.method public static final commonWriteShort(Lnicoid/network238/okio/Buffer;I)Lnicoid/network238/okio/Buffer;
    .registers 10
    .param p0, "$this$commonWriteShort"    # Lnicoid/network238/okio/Buffer;
    .param p1, "s"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1113
    .local v0, "$i$f$commonWriteShort":I
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 1114
    .local v1, "tail":Lnicoid/network238/okio/Segment;
    iget-object v2, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 1115
    .local v2, "data":[B
    iget v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 1116
    .local v3, "limit":I
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "limit":I
    .local v4, "limit":I
    ushr-int/lit8 v5, p1, 0x8

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v2, v3

    .line 1117
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "limit":I
    .restart local v3    # "limit":I
    and-int/lit16 v5, p1, 0xff

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 1118
    iput v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 1119
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x2

    add-long/2addr v4, v6

    invoke-virtual {p0, v4, v5}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1120
    return-object p0
.end method

.method public static final commonWriteUtf8(Lnicoid/network238/okio/Buffer;Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;
    .registers 23
    .param p0, "$this$commonWriteUtf8"    # Lnicoid/network238/okio/Buffer;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    const-string v4, "<this>"

    invoke-static {v0, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v4, "string"

    invoke-static {v1, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v4, 0x0

    .line 942
    .local v4, "$i$f$commonWriteUtf8":I
    const/4 v6, 0x1

    if-ltz v2, :cond_0

    move v7, v6

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    :goto_0
    if-eqz v7, :cond_10

    .line 943
    if-lt v3, v2, :cond_1

    move v7, v6

    goto :goto_1

    :cond_1
    const/4 v7, 0x0

    :goto_1
    if-eqz v7, :cond_f

    .line 944
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-gt v3, v7, :cond_2

    move v7, v6

    goto :goto_2

    :cond_2
    const/4 v7, 0x0

    :goto_2
    if-eqz v7, :cond_e

    .line 947
    move/from16 v7, p2

    .line 948
    .local v7, "i":I
    :goto_3
    if-ge v7, v3, :cond_d

    .line 949
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 951
    .local v8, "c":I
    nop

    .line 952
    const/16 v9, 0x80

    if-ge v8, v9, :cond_4

    .line 953
    invoke-virtual {v0, v6}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v10

    .line 954
    .local v10, "tail":Lnicoid/network238/okio/Segment;
    iget-object v11, v10, Lnicoid/network238/okio/Segment;->data:[B

    .line 955
    .local v11, "data":[B
    iget v12, v10, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v12, v7

    .line 956
    .local v12, "segmentOffset":I
    rsub-int v13, v12, 0x2000

    invoke-static {v3, v13}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 959
    .local v13, "runLimit":I
    add-int/lit8 v14, v7, 0x1

    .end local v7    # "i":I
    .local v14, "i":I
    add-int/2addr v7, v12

    int-to-byte v15, v8

    aput-byte v15, v11, v7

    move v7, v14

    .line 963
    .end local v14    # "i":I
    .restart local v7    # "i":I
    :goto_4
    if-ge v7, v13, :cond_3

    .line 964
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 965
    if-ge v8, v9, :cond_3

    .line 966
    add-int/lit8 v14, v7, 0x1

    .end local v7    # "i":I
    .restart local v14    # "i":I
    add-int/2addr v7, v12

    int-to-byte v15, v8

    aput-byte v15, v11, v7

    move v7, v14

    goto :goto_4

    .line 969
    .end local v14    # "i":I
    .restart local v7    # "i":I
    :cond_3
    add-int v9, v7, v12

    iget v14, v10, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v9, v14

    .line 970
    .local v9, "runSize":I
    iget v14, v10, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v14, v9

    iput v14, v10, Lnicoid/network238/okio/Segment;->limit:I

    .line 971
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v14

    move/from16 v16, v6

    int-to-long v5, v9

    add-long/2addr v14, v5

    invoke-virtual {v0, v14, v15}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    move/from16 v6, v16

    .end local v9    # "runSize":I
    .end local v10    # "tail":Lnicoid/network238/okio/Segment;
    .end local v11    # "data":[B
    .end local v12    # "segmentOffset":I
    .end local v13    # "runLimit":I
    goto :goto_3

    .line 974
    :cond_4
    move/from16 v16, v6

    const/16 v5, 0x800

    const/4 v6, 0x2

    if-ge v8, v5, :cond_5

    .line 976
    invoke-virtual {v0, v6}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v5

    .line 978
    .local v5, "tail":Lnicoid/network238/okio/Segment;
    iget-object v10, v5, Lnicoid/network238/okio/Segment;->data:[B

    iget v11, v5, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v12, v8, 0x6

    or-int/lit16 v12, v12, 0xc0

    int-to-byte v12, v12

    aput-byte v12, v10, v11

    .line 979
    iget-object v10, v5, Lnicoid/network238/okio/Segment;->data:[B

    iget v11, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v11, v11, 0x1

    and-int/lit8 v12, v8, 0x3f

    or-int/2addr v12, v9

    int-to-byte v9, v12

    aput-byte v9, v10, v11

    .line 981
    iget v9, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v9, v6

    iput v9, v5, Lnicoid/network238/okio/Segment;->limit:I

    .line 982
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v9

    const-wide/16 v11, 0x2

    add-long/2addr v9, v11

    invoke-virtual {v0, v9, v10}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 983
    nop

    .end local v5    # "tail":Lnicoid/network238/okio/Segment;
    add-int/lit8 v7, v7, 0x1

    move/from16 v6, v16

    goto :goto_3

    .line 986
    :cond_5
    move v5, v8

    .local v5, "$this$isHighSurrogate$iv":I
    const/4 v10, 0x0

    .line 1768
    .local v10, "$i$f$isHighSurrogate":I
    const v11, 0xd800

    const v12, 0xdc00

    if-gt v11, v5, :cond_6

    if-ge v5, v12, :cond_6

    move/from16 v5, v16

    goto :goto_5

    :cond_6
    const/4 v5, 0x0

    .line 986
    .end local v5    # "$this$isHighSurrogate$iv":I
    .end local v10    # "$i$f$isHighSurrogate":I
    :goto_5
    const v10, 0xe000

    const/4 v11, 0x3

    const/16 v13, 0x3f

    if-eqz v5, :cond_a

    .line 989
    add-int/lit8 v5, v7, 0x1

    if-ge v5, v3, :cond_7

    add-int/lit8 v5, v7, 0x1

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    goto :goto_6

    :cond_7
    const/4 v5, 0x0

    .line 990
    .local v5, "low":I
    :goto_6
    move v14, v5

    .local v14, "$this$isLowSurrogate$iv":I
    const/4 v15, 0x0

    .line 1769
    .local v15, "$i$f$isLowSurrogate":I
    if-gt v12, v14, :cond_8

    if-ge v14, v10, :cond_8

    move/from16 v10, v16

    goto :goto_7

    :cond_8
    const/4 v10, 0x0

    .line 990
    .end local v14    # "$this$isLowSurrogate$iv":I
    .end local v15    # "$i$f$isLowSurrogate":I
    :goto_7
    if-nez v10, :cond_9

    .line 991
    invoke-virtual {v0, v13}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 992
    add-int/lit8 v7, v7, 0x1

    move/from16 v6, v16

    goto/16 :goto_3

    .line 994
    :cond_9
    invoke-static {v8, v5}, Lnicoid/network238/okio/internal/_Utf16Kt;->combineSurrogates(II)I

    move-result v10

    .line 997
    .local v10, "codePoint":I
    const/4 v12, 0x4

    invoke-virtual {v0, v12}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v14

    .line 999
    .local v14, "tail":Lnicoid/network238/okio/Segment;
    iget-object v15, v14, Lnicoid/network238/okio/Segment;->data:[B

    move/from16 v17, v6

    iget v6, v14, Lnicoid/network238/okio/Segment;->limit:I

    move/from16 v18, v12

    shr-int/lit8 v12, v10, 0x12

    or-int/lit16 v12, v12, 0xf0

    int-to-byte v12, v12

    aput-byte v12, v15, v6

    .line 1000
    iget-object v6, v14, Lnicoid/network238/okio/Segment;->data:[B

    iget v12, v14, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v12, v12, 0x1

    shr-int/lit8 v15, v10, 0xc

    and-int/2addr v15, v13

    or-int/2addr v15, v9

    int-to-byte v15, v15

    aput-byte v15, v6, v12

    .line 1001
    iget-object v6, v14, Lnicoid/network238/okio/Segment;->data:[B

    iget v12, v14, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v12, v12, 0x2

    shr-int/lit8 v15, v10, 0x6

    and-int/2addr v15, v13

    or-int/2addr v15, v9

    int-to-byte v13, v15

    aput-byte v13, v6, v12

    .line 1002
    iget-object v6, v14, Lnicoid/network238/okio/Segment;->data:[B

    iget v12, v14, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v12, v11

    and-int/lit8 v11, v10, 0x3f

    or-int/2addr v11, v9

    int-to-byte v9, v11

    aput-byte v9, v6, v12

    .line 1004
    iget v6, v14, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v6, v6, 0x4

    iput v6, v14, Lnicoid/network238/okio/Segment;->limit:I

    .line 1005
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v11

    const-wide/16 v17, 0x4

    add-long v11, v11, v17

    invoke-virtual {v0, v11, v12}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1006
    add-int/lit8 v7, v7, 0x2

    move/from16 v6, v16

    .end local v10    # "codePoint":I
    .end local v14    # "tail":Lnicoid/network238/okio/Segment;
    goto/16 :goto_3

    .line 1010
    .end local v5    # "low":I
    :cond_a
    move/from16 v17, v6

    move v5, v8

    .local v5, "$this$isLowSurrogate$iv":I
    const/4 v6, 0x0

    .line 1770
    .local v6, "$i$f$isLowSurrogate":I
    if-gt v12, v5, :cond_b

    if-ge v5, v10, :cond_b

    move/from16 v5, v16

    goto :goto_8

    :cond_b
    const/4 v5, 0x0

    .line 1010
    .end local v5    # "$this$isLowSurrogate$iv":I
    .end local v6    # "$i$f$isLowSurrogate":I
    :goto_8
    if-eqz v5, :cond_c

    .line 1012
    invoke-virtual {v0, v13}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 1013
    add-int/lit8 v7, v7, 0x1

    move/from16 v6, v16

    goto/16 :goto_3

    .line 1018
    :cond_c
    invoke-virtual {v0, v11}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v5

    .line 1020
    .local v5, "tail":Lnicoid/network238/okio/Segment;
    iget-object v6, v5, Lnicoid/network238/okio/Segment;->data:[B

    iget v10, v5, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v12, v8, 0xc

    or-int/lit16 v12, v12, 0xe0

    int-to-byte v12, v12

    aput-byte v12, v6, v10

    .line 1021
    iget-object v6, v5, Lnicoid/network238/okio/Segment;->data:[B

    iget v10, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v10, v10, 0x1

    shr-int/lit8 v12, v8, 0x6

    and-int/2addr v12, v13

    or-int/2addr v12, v9

    int-to-byte v12, v12

    aput-byte v12, v6, v10

    .line 1022
    iget-object v6, v5, Lnicoid/network238/okio/Segment;->data:[B

    iget v10, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v10, v10, 0x2

    and-int/lit8 v12, v8, 0x3f

    or-int/2addr v12, v9

    int-to-byte v9, v12

    aput-byte v9, v6, v10

    .line 1024
    iget v6, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v6, v11

    iput v6, v5, Lnicoid/network238/okio/Segment;->limit:I

    .line 1025
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v9

    const-wide/16 v11, 0x3

    add-long/2addr v9, v11

    invoke-virtual {v0, v9, v10}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1026
    nop

    .end local v5    # "tail":Lnicoid/network238/okio/Segment;
    add-int/lit8 v7, v7, 0x1

    move/from16 v6, v16

    goto/16 :goto_3

    .line 1031
    .end local v8    # "c":I
    :cond_d
    return-object v0

    .line 1755
    .end local v7    # "i":I
    :cond_e
    const/4 v5, 0x0

    .line 944
    .local v5, "$i$a$-require--Buffer$commonWriteUtf8$3":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "endIndex > string.length: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " > "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .end local v5    # "$i$a$-require--Buffer$commonWriteUtf8$3":I
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1755
    :cond_f
    const/4 v5, 0x0

    .line 943
    .local v5, "$i$a$-require--Buffer$commonWriteUtf8$2":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "endIndex < beginIndex: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " < "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .end local v5    # "$i$a$-require--Buffer$commonWriteUtf8$2":I
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1755
    :cond_10
    const/4 v5, 0x0

    .line 942
    .local v5, "$i$a$-require--Buffer$commonWriteUtf8$1":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "beginIndex < 0: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .end local v5    # "$i$a$-require--Buffer$commonWriteUtf8$1":I
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public static final commonWriteUtf8CodePoint(Lnicoid/network238/okio/Buffer;I)Lnicoid/network238/okio/Buffer;
    .registers 13
    .param p0, "$this$commonWriteUtf8CodePoint"    # Lnicoid/network238/okio/Buffer;
    .param p1, "codePoint"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1035
    .local v0, "$i$f$commonWriteUtf8CodePoint":I
    nop

    .line 1036
    const/16 v1, 0x80

    if-ge p1, v1, :cond_0

    .line 1038
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    goto/16 :goto_0

    .line 1040
    :cond_0
    const/16 v2, 0x800

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-ge p1, v2, :cond_1

    .line 1042
    invoke-virtual {p0, v4}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 1044
    .local v2, "tail":Lnicoid/network238/okio/Segment;
    iget-object v5, v2, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, v2, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v7, p1, 0x6

    or-int/lit16 v7, v7, 0xc0

    int-to-byte v7, v7

    aput-byte v7, v5, v6

    .line 1045
    iget-object v5, v2, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, v2, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v6, v3

    and-int/lit8 v3, p1, 0x3f

    or-int/2addr v3, v1

    int-to-byte v1, v3

    aput-byte v1, v5, v6

    .line 1047
    iget v1, v2, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v1, v4

    iput v1, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 1048
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    const-wide/16 v5, 0x2

    add-long/2addr v3, v5

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .end local v2    # "tail":Lnicoid/network238/okio/Segment;
    goto/16 :goto_0

    .line 1050
    :cond_1
    move v2, p1

    .local v2, "$this$isSurrogate$iv":I
    const/4 v5, 0x0

    .line 1771
    .local v5, "$i$f$isSurrogate":I
    const v6, 0xd800

    const/4 v7, 0x0

    if-gt v6, v2, :cond_2

    const v6, 0xe000

    if-ge v2, v6, :cond_2

    move v7, v3

    .line 1050
    .end local v2    # "$this$isSurrogate$iv":I
    .end local v5    # "$i$f$isSurrogate":I
    :cond_2
    const/16 v2, 0x3f

    if-eqz v7, :cond_3

    .line 1052
    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    goto/16 :goto_0

    .line 1054
    :cond_3
    const/high16 v5, 0x10000

    const/4 v6, 0x3

    if-ge p1, v5, :cond_4

    .line 1056
    invoke-virtual {p0, v6}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v5

    .line 1058
    .local v5, "tail":Lnicoid/network238/okio/Segment;
    iget-object v7, v5, Lnicoid/network238/okio/Segment;->data:[B

    iget v8, v5, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v9, p1, 0xc

    or-int/lit16 v9, v9, 0xe0

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 1059
    iget-object v7, v5, Lnicoid/network238/okio/Segment;->data:[B

    iget v8, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v8, v3

    shr-int/lit8 v3, p1, 0x6

    and-int/2addr v3, v2

    or-int/2addr v3, v1

    int-to-byte v2, v3

    aput-byte v2, v7, v8

    .line 1060
    iget-object v2, v5, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v3, v4

    and-int/lit8 v4, p1, 0x3f

    or-int/2addr v4, v1

    int-to-byte v1, v4

    aput-byte v1, v2, v3

    .line 1062
    iget v1, v5, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v1, v6

    iput v1, v5, Lnicoid/network238/okio/Segment;->limit:I

    .line 1063
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x3

    add-long/2addr v1, v3

    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .end local v5    # "tail":Lnicoid/network238/okio/Segment;
    goto :goto_0

    .line 1065
    :cond_4
    const v5, 0x10ffff

    if-gt p1, v5, :cond_5

    .line 1067
    const/4 v5, 0x4

    invoke-virtual {p0, v5}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v7

    .line 1069
    .local v7, "tail":Lnicoid/network238/okio/Segment;
    iget-object v8, v7, Lnicoid/network238/okio/Segment;->data:[B

    iget v9, v7, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v10, p1, 0x12

    or-int/lit16 v10, v10, 0xf0

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    .line 1070
    iget-object v8, v7, Lnicoid/network238/okio/Segment;->data:[B

    iget v9, v7, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v9, v3

    shr-int/lit8 v3, p1, 0xc

    and-int/2addr v3, v2

    or-int/2addr v3, v1

    int-to-byte v3, v3

    aput-byte v3, v8, v9

    .line 1071
    iget-object v3, v7, Lnicoid/network238/okio/Segment;->data:[B

    iget v8, v7, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v8, v4

    shr-int/lit8 v4, p1, 0x6

    and-int/2addr v4, v2

    or-int/2addr v4, v1

    int-to-byte v2, v4

    aput-byte v2, v3, v8

    .line 1072
    iget-object v2, v7, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v7, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v3, v6

    and-int/lit8 v4, p1, 0x3f

    or-int/2addr v4, v1

    int-to-byte v1, v4

    aput-byte v1, v2, v3

    .line 1074
    iget v1, v7, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v1, v5

    iput v1, v7, Lnicoid/network238/okio/Segment;->limit:I

    .line 1075
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x4

    add-long/2addr v1, v3

    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1082
    .end local v7    # "tail":Lnicoid/network238/okio/Segment;
    :goto_0
    return-object p0

    .line 1078
    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected code point: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static final countDigitsIn(J)I
    .registers 5

    .line 484
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    move-result v0

    rsub-int/lit8 v0, v0, 0x40

    mul-int/lit8 v0, v0, 0xa

    ushr-int/lit8 v0, v0, 0x5

    .line 485
    sget-object v1, Lnicoid/network238/okio/internal/-Buffer;->DigitCountToLargestValue:[J

    aget-wide v1, v1, v0

    cmp-long p0, p0, v1

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    add-int/2addr v0, p0

    return v0
.end method

.method public static final getHEX_DIGIT_BYTES()[B
    .registers 1

    .line 42
    sget-object v0, Lnicoid/network238/okio/internal/-Buffer;->HEX_DIGIT_BYTES:[B

    return-object v0
.end method

.method public static final rangeEquals(Lnicoid/network238/okio/Segment;I[BII)Z
    .registers 10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    iget v0, p0, Lnicoid/network238/okio/Segment;->limit:I

    .line 62
    iget-object v1, p0, Lnicoid/network238/okio/Segment;->data:[B

    :goto_0
    if-ge p3, p4, :cond_2

    if-ne p1, v0, :cond_0

    .line 67
    iget-object p0, p0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    iget-object p1, p0, Lnicoid/network238/okio/Segment;->data:[B

    .line 69
    iget v0, p0, Lnicoid/network238/okio/Segment;->pos:I

    .line 70
    iget v1, p0, Lnicoid/network238/okio/Segment;->limit:I

    move v4, v1

    move-object v1, p1

    move p1, v0

    move v0, v4

    .line 73
    :cond_0
    aget-byte v2, v1, p1

    aget-byte v3, p2, p3

    if-eq v2, v3, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public static final readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;
    .registers 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    const-wide/16 v1, 0x1

    if-lez v0, :cond_0

    sub-long v3, p1, v1

    .line 86
    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v0

    const/16 v5, 0xd

    if-ne v0, v5, :cond_0

    .line 88
    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object p1

    .line 89
    const-wide/16 v0, 0x2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return-object p1

    .line 94
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object p1

    .line 95
    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return-object p1
.end method

.method public static final seek(Lnicoid/network238/okio/Buffer;JLnicoid/network238/kotlin/jvm/functions/Function2;)Ljava/lang/Object;
    .registers 11
    .param p0, "$this$seek"    # Lnicoid/network238/okio/Buffer;
    .param p1, "fromIndex"    # J
    .param p3, "lambda"    # Lnicoid/network238/kotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/okio/Buffer;",
            "J",
            "Lnicoid/network238/kotlin/jvm/functions/Function2;",
            ")TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "lambda"

    invoke-static {p3, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 109
    .local v0, "$i$f$seek":I
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v1, :cond_0

    const-wide/16 v1, -0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p3, v2, v1}, Lnicoid/network238/kotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 111
    .local v1, "s":Lnicoid/network238/okio/Segment;
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    sub-long/2addr v2, p1

    cmp-long v2, v2, p1

    if-gez v2, :cond_2

    .line 113
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    .line 114
    .local v2, "offset":J
    :goto_0
    cmp-long v4, v2, p1

    if-lez v4, :cond_1

    .line 115
    iget-object v4, v1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-static {v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, v4

    .line 116
    iget v4, v1, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v4, v5

    int-to-long v4, v4

    sub-long/2addr v2, v4

    goto :goto_0

    .line 118
    :cond_1
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {p3, v1, v4}, Lnicoid/network238/kotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 121
    .end local v2    # "offset":J
    :cond_2
    const-wide/16 v2, 0x0

    .line 122
    .restart local v2    # "offset":J
    :goto_1
    nop

    .line 123
    iget v4, v1, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v4, v5

    int-to-long v4, v4

    add-long/2addr v4, v2

    .line 124
    .local v4, "nextOffset":J
    cmp-long v6, v4, p1

    if-gtz v6, :cond_3

    .line 125
    iget-object v6, v1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-static {v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v1, v6

    .line 126
    move-wide v2, v4

    .end local v4    # "nextOffset":J
    goto :goto_1

    .line 128
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {p3, v1, v4}, Lnicoid/network238/kotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    return-object v4
.end method

.method public static final selectPrefix(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Options;Z)I
    .registers 19

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 145
    move-object/from16 v0, p0

    iget-object v0, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    if-nez p2, :cond_4

    return v1

    .line 148
    :cond_0
    iget-object v2, v0, Lnicoid/network238/okio/Segment;->data:[B

    .line 149
    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 150
    iget v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    .line 152
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okio/Options;->getTrie$okio()[I

    move-result-object v5

    const/4 v6, 0x0

    move-object v8, v0

    move v9, v1

    move v7, v6

    :goto_0
    add-int/lit8 v10, v7, 0x1

    .line 159
    aget v11, v5, v7

    add-int/lit8 v7, v7, 0x2

    .line 161
    aget v10, v5, v10

    if-eq v10, v1, :cond_1

    move v9, v10

    :cond_1
    if-eqz v8, :cond_3

    const/4 v10, 0x0

    if-gez v11, :cond_8

    mul-int/lit8 v11, v11, -0x1

    add-int v12, v7, v11

    :goto_1
    add-int/lit8 v11, v3, 0x1

    .line 175
    aget-byte v3, v2, v3

    and-int/lit16 v3, v3, 0xff

    add-int/lit8 v13, v7, 0x1

    .line 176
    aget v7, v5, v7

    if-ne v3, v7, :cond_9

    if-ne v13, v12, :cond_2

    const/4 v3, 0x1

    goto :goto_2

    :cond_2
    move v3, v6

    :goto_2
    if-ne v11, v4, :cond_6

    .line 181
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v8, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 182
    iget v4, v2, Lnicoid/network238/okio/Segment;->pos:I

    .line 183
    iget-object v7, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 184
    iget v8, v2, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v2, v0, :cond_5

    if-eqz v3, :cond_3

    move-object v2, v7

    move-object v7, v10

    goto :goto_3

    :cond_3
    if-eqz p2, :cond_9

    :cond_4
    const/4 v0, -0x2

    return v0

    :cond_5
    move-object v15, v7

    move-object v7, v2

    move-object v2, v15

    goto :goto_3

    .line 176
    :cond_6
    move-object v7, v8

    move v8, v4

    move v4, v11

    .line 184
    :goto_3
    if-eqz v3, :cond_7

    .line 192
    aget v3, v5, v13

    move v15, v8

    move-object v8, v7

    move v7, v15

    goto :goto_5

    .line 184
    :cond_7
    move v3, v4

    move v4, v8

    move-object v8, v7

    move v7, v13

    goto :goto_1

    .line 192
    :cond_8
    add-int/lit8 v12, v3, 0x1

    .line 199
    aget-byte v3, v2, v3

    and-int/lit16 v3, v3, 0xff

    add-int v13, v7, v11

    :goto_4
    if-ne v7, v13, :cond_a

    :cond_9
    return v9

    .line 204
    :cond_a
    aget v14, v5, v7

    if-ne v3, v14, :cond_e

    add-int/2addr v7, v11

    .line 205
    aget v3, v5, v7

    if-ne v12, v4, :cond_c

    .line 214
    iget-object v8, v8, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 215
    iget v2, v8, Lnicoid/network238/okio/Segment;->pos:I

    .line 216
    iget-object v4, v8, Lnicoid/network238/okio/Segment;->data:[B

    .line 217
    iget v7, v8, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v8, v0, :cond_b

    move-object v8, v4

    move v4, v2

    move-object v2, v8

    move-object v8, v10

    goto :goto_5

    :cond_b
    move-object v15, v4

    move v4, v2

    move-object v2, v15

    goto :goto_5

    .line 205
    :cond_c
    move v7, v4

    move v4, v12

    .line 217
    :goto_5
    if-ltz v3, :cond_d

    return v3

    :cond_d
    neg-int v3, v3

    move v15, v7

    move v7, v3

    move v3, v4

    move v4, v15

    goto/16 :goto_0

    :cond_e
    add-int/lit8 v7, v7, 0x1

    goto :goto_4
.end method

.method public static synthetic selectPrefix$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Options;ZILjava/lang/Object;)I
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 144
    :cond_0
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/-Buffer;->selectPrefix(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Options;Z)I

    move-result p0

    return p0
.end method

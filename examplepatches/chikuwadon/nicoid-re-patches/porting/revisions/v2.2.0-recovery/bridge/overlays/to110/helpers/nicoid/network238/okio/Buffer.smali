.class public final Lnicoid/network238/okio/Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/BufferedSource;
.implements Lnicoid/network238/okio/BufferedSink;
.implements Ljava/lang/Cloneable;
.implements Ljava/nio/channels/ByteChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/Buffer$UnsafeCursor;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00ba\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u001a\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u0005\n\u0002\u0008\u0004\n\u0002\u0010\n\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u001c\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0002\u0097\u0001B\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0008\u0010\u000f\u001a\u00020\u0000H\u0016J\u0008\u0010\u0012\u001a\u00020\u0013H\u0016J\u000c\u0010\u0014\u001a\u00060\u0015j\u0002`\u0016H\u0016J\u0008\u0010\u0017\u001a\u00020\u0000H\u0016J\u0008\u0010\u0018\u001a\u00020\u0000H\u0016J\u0008\u0010\u0019\u001a\u00020\u001aH\u0016J\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0010\u0010\u001e\u001a\u00020\u001a2\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0008\u0010\u001f\u001a\u00020\u0001H\u0016J\u0008\u0010 \u001a\u00020!H\u0016J$\u0010\"\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u00132\u0008\u0008\u0002\u0010$\u001a\u00020\n2\u0008\u0008\u0002\u0010\u001d\u001a\u00020\nH\u0007J \u0010\"\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u00002\u0008\u0008\u0002\u0010$\u001a\u00020\n2\u0006\u0010\u001d\u001a\u00020\nJ\u0018\u0010\"\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u00002\u0008\u0008\u0002\u0010$\u001a\u00020\nJ\u001a\u0010%\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u00132\u0008\u0008\u0002\u0010\u001d\u001a\u00020\nH\u0007J\u000e\u0010&\u001a\u00020\u00002\u0006\u0010\'\u001a\u00020!J\u0016\u0010&\u001a\u00020\u00002\u0006\u0010\'\u001a\u00020!2\u0006\u0010\u001d\u001a\u00020\nJ \u0010&\u001a\u00020\u001c2\u0006\u0010\'\u001a\u00020!2\u0006\u0010\u001d\u001a\u00020\n2\u0006\u0010(\u001a\u00020\u001aH\u0002J\u0006\u0010)\u001a\u00020\nJ\u0008\u0010*\u001a\u00020+H\u0016J\u0016\u0010,\u001a\u00020+2\u0006\u0010-\u001a\u00020\nH\u0087\u0002\u00a2\u0006\u0002\u0008.J\u0008\u0010/\u001a\u000200H\u0016J\u0008\u00101\u001a\u000202H\u0016J\u0008\u00103\u001a\u00020\nH\u0016J\u0008\u00104\u001a\u000200H\u0016J\u0008\u00105\u001a\u000202H\u0016J\u0008\u00106\u001a\u00020\nH\u0016J\u0008\u00107\u001a\u00020\nH\u0016J\u0008\u00108\u001a\u00020\nH\u0016J\u0008\u00109\u001a\u00020:H\u0016J\u0010\u00109\u001a\u00020:2\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0010\u0010;\u001a\u0002022\u0006\u0010<\u001a\u00020=H\u0016J\'\u0010;\u001a\u0004\u0018\u0001H>\"\u0008\u0008\u0000\u0010>*\u00020?2\u000c\u0010<\u001a\u0008\u0012\u0004\u0012\u0002H>0@H\u0016\u00a2\u0006\u0002\u0010AJ\u0018\u0010B\u001a\u00020\u001c2\u0006\u0010C\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0010\u0010D\u001a\u00020\n2\u0006\u0010C\u001a\u00020EH\u0016J\u0008\u0010F\u001a\u00020GH\u0016J\u0010\u0010F\u001a\u00020G2\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0010\u0010H\u001a\u00020G2\u0006\u0010I\u001a\u00020JH\u0016J\u0018\u0010H\u001a\u00020G2\u0006\u0010\u001d\u001a\u00020\n2\u0006\u0010I\u001a\u00020JH\u0016J\n\u0010K\u001a\u0004\u0018\u00010GH\u0016J\u0008\u0010L\u001a\u00020GH\u0016J\u0010\u0010L\u001a\u00020G2\u0006\u0010M\u001a\u00020\nH\u0016J\u0008\u0010N\u001a\u000202H\u0016J\u0008\u0010O\u001a\u00020PH\u0016J\u0010\u0010O\u001a\u00020P2\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0010\u0010Q\u001a\u0002022\u0006\u0010C\u001a\u00020PH\u0016J\u0010\u0010B\u001a\u00020\u001c2\u0006\u0010C\u001a\u00020PH\u0016J \u0010Q\u001a\u0002022\u0006\u0010C\u001a\u00020P2\u0006\u0010$\u001a\u0002022\u0006\u0010\u001d\u001a\u000202H\u0016J\u0010\u0010Q\u001a\u0002022\u0006\u0010C\u001a\u00020RH\u0016J\u0006\u0010S\u001a\u00020\u001cJ\u0010\u0010T\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0010\u0010U\u001a\u00020\u00002\u0006\u0010V\u001a\u00020:H\u0016J \u0010U\u001a\u00020\u00002\u0006\u0010V\u001a\u00020:2\u0006\u0010$\u001a\u0002022\u0006\u0010\u001d\u001a\u000202H\u0016J\u0010\u0010W\u001a\u00020\u00002\u0006\u0010X\u001a\u00020GH\u0016J \u0010W\u001a\u00020\u00002\u0006\u0010X\u001a\u00020G2\u0006\u0010Y\u001a\u0002022\u0006\u0010Z\u001a\u000202H\u0016J\u0010\u0010[\u001a\u00020\u00002\u0006\u0010\\\u001a\u000202H\u0016J\u0018\u0010]\u001a\u00020\u00002\u0006\u0010X\u001a\u00020G2\u0006\u0010I\u001a\u00020JH\u0016J(\u0010]\u001a\u00020\u00002\u0006\u0010X\u001a\u00020G2\u0006\u0010Y\u001a\u0002022\u0006\u0010Z\u001a\u0002022\u0006\u0010I\u001a\u00020JH\u0016J\u0010\u0010U\u001a\u00020\u00002\u0006\u0010^\u001a\u00020PH\u0016J \u0010U\u001a\u00020\u00002\u0006\u0010^\u001a\u00020P2\u0006\u0010$\u001a\u0002022\u0006\u0010\u001d\u001a\u000202H\u0016J\u0010\u0010U\u001a\u0002022\u0006\u0010^\u001a\u00020RH\u0016J\u0010\u0010_\u001a\u00020\n2\u0006\u0010^\u001a\u00020`H\u0016J\u0018\u0010U\u001a\u00020\u00002\u0006\u0010^\u001a\u00020`2\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0010\u0010a\u001a\u00020\u00002\u0006\u0010b\u001a\u000202H\u0016J\u0010\u0010c\u001a\u00020\u00002\u0006\u0010d\u001a\u000202H\u0016J\u0010\u0010e\u001a\u00020\u00002\u0006\u0010d\u001a\u000202H\u0016J\u0010\u0010f\u001a\u00020\u00002\u0006\u0010g\u001a\u000202H\u0016J\u0010\u0010h\u001a\u00020\u00002\u0006\u0010g\u001a\u000202H\u0016J\u0010\u0010i\u001a\u00020\u00002\u0006\u0010j\u001a\u00020\nH\u0016J\u0010\u0010k\u001a\u00020\u00002\u0006\u0010j\u001a\u00020\nH\u0016J\u0010\u0010l\u001a\u00020\u00002\u0006\u0010j\u001a\u00020\nH\u0016J\u0010\u0010m\u001a\u00020\u00002\u0006\u0010j\u001a\u00020\nH\u0016J\u0015\u0010n\u001a\u00020\u00082\u0006\u0010o\u001a\u000202H\u0000\u00a2\u0006\u0002\u0008pJ\u0018\u0010U\u001a\u00020\u001c2\u0006\u0010^\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0018\u0010Q\u001a\u00020\n2\u0006\u0010C\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\nH\u0016J\u0010\u0010q\u001a\u00020\n2\u0006\u0010b\u001a\u00020+H\u0016J\u0018\u0010q\u001a\u00020\n2\u0006\u0010b\u001a\u00020+2\u0006\u0010r\u001a\u00020\nH\u0016J \u0010q\u001a\u00020\n2\u0006\u0010b\u001a\u00020+2\u0006\u0010r\u001a\u00020\n2\u0006\u0010s\u001a\u00020\nH\u0016J\u0010\u0010q\u001a\u00020\n2\u0006\u0010t\u001a\u00020:H\u0016J\u0018\u0010q\u001a\u00020\n2\u0006\u0010t\u001a\u00020:2\u0006\u0010r\u001a\u00020\nH\u0016J \u0010q\u001a\u00020\n2\u0006\u0010t\u001a\u00020:2\u0006\u0010r\u001a\u00020\n2\u0006\u0010s\u001a\u00020\nH\u0016J\u0010\u0010u\u001a\u00020\n2\u0006\u0010v\u001a\u00020:H\u0016J\u0018\u0010u\u001a\u00020\n2\u0006\u0010v\u001a\u00020:2\u0006\u0010r\u001a\u00020\nH\u0016J\u0018\u0010w\u001a\u00020\u001a2\u0006\u0010$\u001a\u00020\n2\u0006\u0010t\u001a\u00020:H\u0016J(\u0010w\u001a\u00020\u001a2\u0006\u0010$\u001a\u00020\n2\u0006\u0010t\u001a\u00020:2\u0006\u0010x\u001a\u0002022\u0006\u0010\u001d\u001a\u000202H\u0016J\u0008\u0010y\u001a\u00020\u001cH\u0016J\u0008\u0010z\u001a\u00020\u001aH\u0016J\u0008\u0010{\u001a\u00020\u001cH\u0016J\u0008\u0010|\u001a\u00020}H\u0016J\u0006\u0010~\u001a\u00020:J\u0006\u0010\u007f\u001a\u00020:J\u0007\u0010\u0080\u0001\u001a\u00020:J\u0007\u0010\u0081\u0001\u001a\u00020:J\u0012\u0010\u0082\u0001\u001a\u00020:2\u0007\u0010\u0083\u0001\u001a\u00020GH\u0002J\u0010\u0010\u0084\u0001\u001a\u00020:2\u0007\u0010\u0085\u0001\u001a\u00020:J\u0010\u0010\u0086\u0001\u001a\u00020:2\u0007\u0010\u0085\u0001\u001a\u00020:J\u0010\u0010\u0087\u0001\u001a\u00020:2\u0007\u0010\u0085\u0001\u001a\u00020:J\u001b\u0010\u0088\u0001\u001a\u00020:2\u0007\u0010\u0083\u0001\u001a\u00020G2\u0007\u0010\u0085\u0001\u001a\u00020:H\u0002J\u0015\u0010\u0089\u0001\u001a\u00020\u001a2\t\u0010\u008a\u0001\u001a\u0004\u0018\u00010?H\u0096\u0002J\t\u0010\u008b\u0001\u001a\u000202H\u0016J\t\u0010\u008c\u0001\u001a\u00020GH\u0016J\u0007\u0010\u008d\u0001\u001a\u00020\u0000J\t\u0010\u008e\u0001\u001a\u00020\u0000H\u0016J\u0007\u0010\u008f\u0001\u001a\u00020:J\u000f\u0010\u008f\u0001\u001a\u00020:2\u0006\u0010\u001d\u001a\u000202J\u0016\u0010\u0090\u0001\u001a\u00030\u0091\u00012\n\u0008\u0002\u0010\u0092\u0001\u001a\u00030\u0091\u0001H\u0007J\u0016\u0010\u0093\u0001\u001a\u00030\u0091\u00012\n\u0008\u0002\u0010\u0092\u0001\u001a\u00030\u0091\u0001H\u0007J\u0017\u0010.\u001a\u00020+2\u0007\u0010\u0094\u0001\u001a\u00020\nH\u0007\u00a2\u0006\u0003\u0008\u0095\u0001J\u000e\u0010\u000b\u001a\u00020\nH\u0007\u00a2\u0006\u0003\u0008\u0096\u0001R\u0014\u0010\u0007\u001a\u0004\u0018\u00010\u00088\u0000@\u0000X\u0081\u000e\u00a2\u0006\u0002\n\u0000R&\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\n8\u0007@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR\u0014\u0010\u000f\u001a\u00020\u00008VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0098\u0001"
    }
    d2 = {
        "Lnicoid/network238/okio/Buffer;",
        "Lnicoid/network238/okio/BufferedSource;",
        "Lnicoid/network238/okio/BufferedSink;",
        "",
        "Ljava/nio/channels/ByteChannel;",
        "<init>",
        "()V",
        "head",
        "Lnicoid/network238/okio/Segment;",
        "value",
        "",
        "size",
        "()J",
        "setSize$okio",
        "(J)V",
        "buffer",
        "getBuffer",
        "()Lnicoid/network238/okio/Buffer;",
        "outputStream",
        "Ljava/io/OutputStream;",
        "utf8Appendable",
        "Ljava/lang/Appendable;",
        "Lnicoid/network238/kotlin/text/Appendable;",
        "emitCompleteSegments",
        "emit",
        "exhausted",
        "",
        "require",
        "",
        "byteCount",
        "request",
        "peek",
        "inputStream",
        "Ljava/io/InputStream;",
        "copyTo",
        "out",
        "offset",
        "writeTo",
        "readFrom",
        "input",
        "forever",
        "completeSegmentByteCount",
        "readByte",
        "",
        "get",
        "pos",
        "getByte",
        "readShort",
        "",
        "readInt",
        "",
        "readLong",
        "readShortLe",
        "readIntLe",
        "readLongLe",
        "readDecimalLong",
        "readHexadecimalUnsignedLong",
        "readByteString",
        "Lnicoid/network238/okio/ByteString;",
        "select",
        "options",
        "Lnicoid/network238/okio/Options;",
        "T",
        "",
        "Lnicoid/network238/okio/TypedOptions;",
        "(Lnicoid/network238/okio/TypedOptions;)Ljava/lang/Object;",
        "readFully",
        "sink",
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
        "readByteArray",
        "",
        "read",
        "Ljava/nio/ByteBuffer;",
        "clear",
        "skip",
        "write",
        "byteString",
        "writeUtf8",
        "string",
        "beginIndex",
        "endIndex",
        "writeUtf8CodePoint",
        "codePoint",
        "writeString",
        "source",
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
        "writableSegment",
        "minimumCapacity",
        "writableSegment$okio",
        "indexOf",
        "fromIndex",
        "toIndex",
        "bytes",
        "indexOfElement",
        "targetBytes",
        "rangeEquals",
        "bytesOffset",
        "flush",
        "isOpen",
        "close",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "md5",
        "sha1",
        "sha256",
        "sha512",
        "digest",
        "algorithm",
        "hmacSha1",
        "key",
        "hmacSha256",
        "hmacSha512",
        "hmac",
        "equals",
        "other",
        "hashCode",
        "toString",
        "copy",
        "clone",
        "snapshot",
        "readUnsafe",
        "Lnicoid/network238/okio/Buffer$UnsafeCursor;",
        "unsafeCursor",
        "readAndWriteUnsafe",
        "index",
        "-deprecated_getByte",
        "-deprecated_size",
        "UnsafeCursor",
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
.field public head:Lnicoid/network238/okio/Segment;

.field private size:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic copyTo$default(Lnicoid/network238/okio/Buffer;Ljava/io/OutputStream;JJILjava/lang/Object;)Lnicoid/network238/okio/Buffer;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_0

    const-wide/16 p2, 0x0

    :cond_0
    move-wide v2, p2

    and-int/lit8 p6, p6, 0x4

    if-eqz p6, :cond_1

    .line 217
    iget-wide p2, p0, Lnicoid/network238/okio/Buffer;->size:J

    sub-long p4, p2, v2

    move-wide v4, p4

    goto :goto_0

    .line 0
    :cond_1
    move-wide v4, p4

    .line 214
    :goto_0
    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->copyTo(Ljava/io/OutputStream;JJ)Lnicoid/network238/okio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic copyTo$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer;JILjava/lang/Object;)Lnicoid/network238/okio/Buffer;
    .registers 6

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const-wide/16 p2, 0x0

    .line 250
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->copyTo(Lnicoid/network238/okio/Buffer;J)Lnicoid/network238/okio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic copyTo$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer;JJILjava/lang/Object;)Lnicoid/network238/okio/Buffer;
    .registers 14

    and-int/lit8 p6, p6, 0x2

    if-eqz p6, :cond_0

    const-wide/16 p2, 0x0

    :cond_0
    move-wide v2, p2

    .line 244
    move-object v0, p0

    move-object v1, p1

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->copyTo(Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method private final digest(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 7

    .line 604
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    .line 605
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v0, :cond_0

    .line 606
    iget-object v1, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget v3, v0, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v3, v2

    invoke-virtual {p1, v1, v2, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 607
    iget-object v1, v0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    if-eq v1, v0, :cond_0

    .line 609
    iget-object v2, v1, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v1, Lnicoid/network238/okio/Segment;->pos:I

    iget v4, v1, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v4, v3

    invoke-virtual {p1, v2, v3, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 610
    iget-object v1, v1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    .line 613
    :cond_0
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0
.end method

.method private final hmac(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 7

    .line 627
    :try_start_0
    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    .line 628
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object p2

    invoke-direct {v1, p2, p1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 629
    iget-object p1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz p1, :cond_0

    .line 630
    iget-object p2, p1, Lnicoid/network238/okio/Segment;->data:[B

    iget v1, p1, Lnicoid/network238/okio/Segment;->pos:I

    iget v2, p1, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v2, v1

    invoke-virtual {v0, p2, v1, v2}, Ljavax/crypto/Mac;->update([BII)V

    .line 631
    iget-object p2, p1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 634
    :goto_0
    nop

    .line 631
    if-eq p2, p1, :cond_0

    .line 633
    iget-object v1, p2, Lnicoid/network238/okio/Segment;->data:[B

    iget v2, p2, Lnicoid/network238/okio/Segment;->pos:I

    iget v3, p2, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v3, v2

    invoke-virtual {v0, v1, v2, v3}, Ljavax/crypto/Mac;->update([BII)V

    .line 634
    iget-object p2, p2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    .line 637
    :cond_0
    new-instance p1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Ljavax/crypto/Mac;->doFinal()[B

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, p2}, Lnicoid/network238/okio/ByteString;-><init>([B)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 639
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public static synthetic readAndWriteUnsafe$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 104
    new-instance p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;-><init>()V

    .line 669
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->readAndWriteUnsafe(Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    move-result-object p0

    return-object p0
.end method

.method private final readFrom(Ljava/io/InputStream;JZ)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gtz v0, :cond_0

    if-eqz p4, :cond_2

    .line 301
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v0

    .line 302
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v1, v1, 0x2000

    int-to-long v1, v1

    .line 752
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    .line 303
    iget-object v2, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v0, Lnicoid/network238/okio/Segment;->limit:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_4

    .line 305
    iget p1, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget p2, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p1, p2, :cond_1

    .line 307
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 308
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_1
    if-eqz p4, :cond_3

    :cond_2
    return-void

    .line 311
    :cond_3
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    .line 313
    :cond_4
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v2, v1

    iput v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    .line 314
    iget-wide v2, p0, Lnicoid/network238/okio/Buffer;->size:J

    int-to-long v0, v1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lnicoid/network238/okio/Buffer;->size:J

    sub-long/2addr p2, v0

    goto :goto_0
.end method

.method public static synthetic readUnsafe$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 100
    new-instance p1, Lnicoid/network238/okio/Buffer$UnsafeCursor;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;-><init>()V

    .line 666
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->readUnsafe(Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic writeTo$default(Lnicoid/network238/okio/Buffer;Ljava/io/OutputStream;JILjava/lang/Object;)Lnicoid/network238/okio/Buffer;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    .line 258
    iget-wide p2, p0, Lnicoid/network238/okio/Buffer;->size:J

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->writeTo(Ljava/io/OutputStream;J)Lnicoid/network238/okio/Buffer;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_getByte(J)B
    .registers 3

    .line 678
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result p1

    return p1
.end method

.method public final -deprecated_size()J
    .registers 3

    .line 686
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    return-wide v0
.end method

.method public buffer()Lnicoid/network238/okio/Buffer;
    .registers 1

    return-object p0
.end method

.method public final clear()V
    .registers 3

    .line 1195
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2

    .line 79
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->clone()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lnicoid/network238/okio/Buffer;
    .registers 2

    .line 659
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->copy()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .registers 1

    return-void
.end method

.method public final completeSegmentByteCount()J
    .registers 6

    .line 753
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return-wide v2

    .line 757
    :cond_0
    iget-object v2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 758
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    const/16 v4, 0x2000

    if-ge v3, v4, :cond_1

    iget-boolean v4, v2, Lnicoid/network238/okio/Segment;->owner:Z

    if-eqz v4, :cond_1

    .line 759
    iget v2, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v3, v2

    int-to-long v2, v3

    sub-long/2addr v0, v2

    :cond_1
    return-wide v0
.end method

.method public final copy()Lnicoid/network238/okio/Buffer;
    .registers 7

    .line 1749
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 1750
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    return-object v0

    .line 1752
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1753
    invoke-virtual {v1}, Lnicoid/network238/okio/Segment;->sharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 1755
    iput-object v2, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1756
    iput-object v2, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1757
    iput-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    move-object v3, v1

    .line 1759
    :goto_0
    iget-object v3, v3, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    if-eq v3, v1, :cond_1

    .line 1761
    iget-object v4, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Lnicoid/network238/okio/Segment;->sharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v5

    invoke-virtual {v4, v5}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    goto :goto_0

    .line 1765
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object v0
.end method

.method public final copyTo(Ljava/io/OutputStream;)Lnicoid/network238/okio/Buffer;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v6, 0x6

    const/4 v7, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okio/Buffer;->copyTo$default(Lnicoid/network238/okio/Buffer;Ljava/io/OutputStream;JJILjava/lang/Object;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public final copyTo(Ljava/io/OutputStream;J)Lnicoid/network238/okio/Buffer;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v6, 0x4

    const/4 v7, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-static/range {v0 .. v7}, Lnicoid/network238/okio/Buffer;->copyTo$default(Lnicoid/network238/okio/Buffer;Ljava/io/OutputStream;JJILjava/lang/Object;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public final copyTo(Ljava/io/OutputStream;JJ)Lnicoid/network238/okio/Buffer;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 221
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    const-wide/16 p2, 0x0

    cmp-long p4, v4, p2

    if-nez p4, :cond_0

    goto :goto_2

    .line 225
    :cond_0
    iget-object p4, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 226
    :goto_0
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p5, p4, Lnicoid/network238/okio/Segment;->limit:I

    iget v0, p4, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p5, v0

    int-to-long v0, p5

    cmp-long p5, v2, v0

    if-ltz p5, :cond_1

    sub-long/2addr v2, v0

    .line 228
    iget-object p4, p4, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_0

    .line 226
    :cond_1
    move-object v0, p4

    move-wide p4, v4

    .line 228
    :goto_1
    cmp-long v1, p4, p2

    if-lez v1, :cond_2

    .line 233
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v4, v1

    add-long/2addr v4, v2

    long-to-int v1, v4

    .line 234
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v2, v1

    int-to-long v2, v2

    .line 717
    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 235
    iget-object v3, v0, Lnicoid/network238/okio/Segment;->data:[B

    invoke-virtual {p1, v3, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v1, v2

    sub-long/2addr p4, v1

    .line 238
    iget-object v0, v0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    move-wide v2, p2

    goto :goto_1

    :cond_2
    :goto_2
    return-object p0
.end method

.method public final copyTo(Lnicoid/network238/okio/Buffer;J)Lnicoid/network238/okio/Buffer;
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 253
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    sub-long v6, v0, p2

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    invoke-virtual/range {v2 .. v7}, Lnicoid/network238/okio/Buffer;->copyTo(Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public final copyTo(Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 720
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    const-wide/16 p2, 0x0

    cmp-long p4, v4, p2

    if-nez p4, :cond_0

    goto :goto_3

    .line 723
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p4

    add-long/2addr p4, v4

    invoke-virtual {p1, p4, p5}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 726
    iget-object p4, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 727
    :goto_0
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p5, p4, Lnicoid/network238/okio/Segment;->limit:I

    iget v0, p4, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p5, v0

    int-to-long v0, p5

    cmp-long p5, v2, v0

    if-ltz p5, :cond_1

    sub-long/2addr v2, v0

    .line 729
    iget-object p4, p4, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_0

    .line 727
    :cond_1
    move-object v0, p4

    move-wide p4, v4

    .line 729
    :goto_1
    cmp-long v1, p4, p2

    if-lez v1, :cond_3

    .line 734
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->sharedCopy()Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 735
    iget v4, v1, Lnicoid/network238/okio/Segment;->pos:I

    long-to-int v2, v2

    add-int/2addr v4, v2

    iput v4, v1, Lnicoid/network238/okio/Segment;->pos:I

    long-to-int v2, p4

    add-int/2addr v4, v2

    .line 736
    iget v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    iput v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 737
    iget-object v2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v2, :cond_2

    .line 738
    iput-object v1, v1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 739
    iput-object v1, v1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 740
    iput-object v1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    goto :goto_2

    .line 742
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v1}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    .line 744
    :goto_2
    iget v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    iget v1, v1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v2, v1

    int-to-long v1, v2

    sub-long/2addr p4, v1

    .line 746
    iget-object v0, v0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    move-wide v2, p2

    goto :goto_1

    :cond_3
    :goto_3
    return-object p0
.end method

.method public emit()Lnicoid/network238/okio/Buffer;
    .registers 1

    return-object p0
.end method

.method public bridge synthetic emit()Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->emit()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public emitCompleteSegments()Lnicoid/network238/okio/Buffer;
    .registers 1

    return-object p0
.end method

.method public bridge synthetic emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->emitCompleteSegments()Lnicoid/network238/okio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eq v0, v1, :cond_7

    .line 1706
    instance-of v2, v1, Lnicoid/network238/okio/Buffer;

    if-nez v2, :cond_0

    goto :goto_2

    .line 1707
    :cond_0
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    check-cast v1, Lnicoid/network238/okio/Buffer;

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    goto :goto_2

    .line 1708
    :cond_1
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    goto :goto_3

    .line 1710
    :cond_2
    iget-object v2, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1711
    iget-object v1, v1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1712
    iget v3, v2, Lnicoid/network238/okio/Segment;->pos:I

    .line 1713
    iget v6, v1, Lnicoid/network238/okio/Segment;->pos:I

    move-wide v7, v4

    .line 1717
    :goto_0
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v9

    cmp-long v9, v7, v9

    if-gez v9, :cond_7

    .line 1718
    iget v9, v2, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v9, v3

    iget v10, v1, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v10, v6

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    int-to-long v9, v9

    move-wide v11, v4

    :goto_1
    cmp-long v13, v11, v9

    if-gez v13, :cond_4

    .line 1721
    iget-object v13, v2, Lnicoid/network238/okio/Segment;->data:[B

    add-int/lit8 v14, v3, 0x1

    aget-byte v3, v13, v3

    iget-object v13, v1, Lnicoid/network238/okio/Segment;->data:[B

    add-int/lit8 v15, v6, 0x1

    aget-byte v6, v13, v6

    if-eq v3, v6, :cond_3

    :goto_2
    const/4 v1, 0x0

    return v1

    :cond_3
    const-wide/16 v16, 0x1

    add-long v11, v11, v16

    move v3, v14

    move v6, v15

    goto :goto_1

    .line 1724
    :cond_4
    iget v11, v2, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v3, v11, :cond_5

    .line 1725
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1726
    iget v3, v2, Lnicoid/network238/okio/Segment;->pos:I

    .line 1729
    :cond_5
    iget v11, v1, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v6, v11, :cond_6

    .line 1730
    iget-object v1, v1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1731
    iget v6, v1, Lnicoid/network238/okio/Segment;->pos:I

    :cond_6
    add-long/2addr v7, v9

    goto :goto_0

    :cond_7
    :goto_3
    const/4 v1, 0x1

    return v1
.end method

.method public exhausted()Z
    .registers 5

    .line 176
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public flush()V
    .registers 1

    return-void
.end method

.method public getBuffer()Lnicoid/network238/okio/Buffer;
    .registers 1

    return-object p0
.end method

.method public final getByte(J)B
    .registers 10

    .line 781
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v4, 0x1

    move-wide v2, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 783
    iget-object p1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 784
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 785
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    sub-long/2addr v0, v2

    cmp-long p2, v0, v2

    if-gez p2, :cond_1

    .line 787
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    :goto_0
    cmp-long p2, v0, v2

    if-lez p2, :cond_0

    .line 789
    iget-object p1, p1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 790
    iget p2, p1, Lnicoid/network238/okio/Segment;->limit:I

    iget v4, p1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, v4

    int-to-long v4, p2

    sub-long/2addr v0, v4

    goto :goto_0

    .line 784
    :cond_0
    iget-object p2, p1, Lnicoid/network238/okio/Segment;->data:[B

    iget p1, p1, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v4, p1

    add-long/2addr v4, v2

    sub-long/2addr v4, v0

    long-to-int p1, v4

    aget-byte p1, p2, p1

    return p1

    :cond_1
    const-wide/16 v0, 0x0

    .line 797
    :goto_1
    iget p2, p1, Lnicoid/network238/okio/Segment;->limit:I

    iget v4, p1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, v4

    int-to-long v5, p2

    add-long/2addr v5, v0

    cmp-long p2, v5, v2

    if-gtz p2, :cond_2

    .line 799
    iget-object p1, p1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v0, v5

    goto :goto_1

    .line 784
    :cond_2
    iget-object p1, p1, Lnicoid/network238/okio/Segment;->data:[B

    int-to-long v4, v4

    add-long/2addr v4, v2

    sub-long/2addr v4, v0

    long-to-int p2, v4

    aget-byte p1, p1, p2

    return p1
.end method

.method public hashCode()I
    .registers 6

    .line 1737
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v1, 0x1

    .line 1740
    :cond_1
    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 1741
    iget v3, v0, Lnicoid/network238/okio/Segment;->limit:I

    :goto_0
    if-ge v2, v3, :cond_2

    mul-int/lit8 v1, v1, 0x1f

    .line 1743
    iget-object v4, v0, Lnicoid/network238/okio/Segment;->data:[B

    aget-byte v4, v4, v2

    add-int/2addr v1, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1746
    :cond_2
    iget-object v0, v0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1747
    iget-object v2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-ne v0, v2, :cond_1

    return v1
.end method

.method public final hmacSha1(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 617
    const-string v0, "HmacSHA1"

    invoke-direct {p0, v0, p1}, Lnicoid/network238/okio/Buffer;->hmac(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final hmacSha256(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 620
    const-string v0, "HmacSHA256"

    invoke-direct {p0, v0, p1}, Lnicoid/network238/okio/Buffer;->hmac(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final hmacSha512(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 623
    const-string v0, "HmacSHA512"

    invoke-direct {p0, v0, p1}, Lnicoid/network238/okio/Buffer;->hmac(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public indexOf(B)J
    .registers 8

    .line 538
    const-wide/16 v2, 0x0

    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->indexOf(BJJ)J

    move-result-wide v1

    return-wide v1
.end method

.method public indexOf(BJ)J
    .registers 10

    .line 544
    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->indexOf(BJJ)J

    move-result-wide p1

    return-wide p1
.end method

.method public indexOf(BJJ)J
    .registers 14

    const-wide/16 v0, 0x0

    cmp-long v2, v0, p2

    if-gtz v2, :cond_b

    cmp-long v2, p2, p4

    if-gtz v2, :cond_b

    .line 1575
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    cmp-long v2, p4, v2

    if-lez v2, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p4

    :cond_0
    cmp-long v2, p2, p4

    if-nez v2, :cond_1

    goto/16 :goto_6

    .line 1579
    :cond_1
    iget-object v2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v2, :cond_2

    goto/16 :goto_6

    .line 1602
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    sub-long/2addr v3, p2

    cmp-long v3, v3, p2

    if-gez v3, :cond_5

    .line 1604
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    :goto_0
    cmp-long v3, v0, p2

    if-lez v3, :cond_3

    .line 1606
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1607
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget v4, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    sub-long/2addr v0, v3

    goto :goto_0

    :cond_3
    :goto_1
    cmp-long v3, v0, p4

    if-gez v3, :cond_a

    .line 1585
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1586
    iget v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v4, v4

    iget v6, v2, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v6, v6

    add-long/2addr v6, p4

    sub-long/2addr v6, v0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v4, v4

    .line 1587
    iget v5, v2, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v5, v5

    add-long/2addr v5, p2

    sub-long/2addr v5, v0

    long-to-int p2, v5

    :goto_2
    if-ge p2, v4, :cond_4

    .line 1589
    aget-byte p3, v3, p2

    if-eq p3, p1, :cond_7

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 1596
    :cond_4
    iget p2, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget p3, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p3

    int-to-long p2, p2

    add-long/2addr v0, p2

    .line 1598
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide p2, v0

    goto :goto_1

    :cond_5
    nop

    .line 1614
    :goto_3
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget v4, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v3, v0

    cmp-long v5, v3, p2

    if-gtz v5, :cond_6

    .line 1616
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v0, v3

    goto :goto_3

    :cond_6
    :goto_4
    cmp-long v3, v0, p4

    if-gez v3, :cond_a

    .line 1585
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1586
    iget v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v4, v4

    iget v6, v2, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v6, v6

    add-long/2addr v6, p4

    sub-long/2addr v6, v0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v4, v4

    .line 1587
    iget v5, v2, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v5, v5

    add-long/2addr v5, p2

    sub-long/2addr v5, v0

    long-to-int p2, v5

    :goto_5
    if-ge p2, v4, :cond_9

    .line 1589
    aget-byte p3, v3, p2

    if-ne p3, p1, :cond_8

    .line 1590
    :cond_7
    iget p1, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p1

    int-to-long p1, p2

    add-long/2addr p1, v0

    return-wide p1

    :cond_8
    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    .line 1596
    :cond_9
    iget p2, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget p3, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p3

    int-to-long p2, p2

    add-long/2addr v0, p2

    .line 1598
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide p2, v0

    goto :goto_4

    :cond_a
    :goto_6
    const-wide/16 p1, -0x1

    return-wide p1

    .line 1573
    :cond_b
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "size="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " fromIndex="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " toIndex="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public indexOf(Lnicoid/network238/okio/ByteString;)J
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 550
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lnicoid/network238/okio/Buffer;->indexOf(Lnicoid/network238/okio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(Lnicoid/network238/okio/ByteString;J)J
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 554
    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->indexOf(Lnicoid/network238/okio/ByteString;JJ)J

    move-result-wide p1

    return-wide p1
.end method

.method public indexOf(Lnicoid/network238/okio/ByteString;JJ)J
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 558
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v8, 0x18

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okio/internal/-Buffer;->commonIndexOf$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JJIIILjava/lang/Object;)J

    move-result-wide p1

    return-wide p1
.end method

.method public indexOfElement(Lnicoid/network238/okio/ByteString;)J
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 560
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lnicoid/network238/okio/Buffer;->indexOfElement(Lnicoid/network238/okio/ByteString;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOfElement(Lnicoid/network238/okio/ByteString;J)J
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_10

    .line 1624
    iget-object v2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v2, :cond_0

    goto/16 :goto_c

    .line 1675
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    sub-long/2addr v3, p2

    cmp-long v3, v3, p2

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-gez v3, :cond_6

    .line 1677
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    :goto_0
    cmp-long v3, v0, p2

    if-lez v3, :cond_1

    .line 1679
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1680
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget v7, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v3, v7

    int-to-long v7, v3

    sub-long/2addr v0, v7

    goto :goto_0

    .line 1631
    :cond_1
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v3

    if-ne v3, v4, :cond_3

    .line 1633
    invoke-virtual {p1, v5}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v3

    .line 1634
    invoke-virtual {p1, v6}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result p1

    .line 1635
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    cmp-long v4, v0, v4

    if-gez v4, :cond_f

    .line 1636
    iget-object v4, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1637
    iget v5, v2, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v5, v5

    add-long/2addr v5, p2

    sub-long/2addr v5, v0

    long-to-int p2, v5

    .line 1638
    iget p3, v2, Lnicoid/network238/okio/Segment;->limit:I

    :goto_2
    if-ge p2, p3, :cond_2

    .line 1640
    aget-byte v5, v4, p2

    if-eq v5, v3, :cond_8

    if-eq v5, p1, :cond_8

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 1648
    :cond_2
    iget p2, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget p3, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p3

    int-to-long p2, p2

    add-long/2addr v0, p2

    .line 1650
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide p2, v0

    goto :goto_1

    .line 1654
    :cond_3
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object p1

    .line 1655
    :goto_3
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    cmp-long v3, v0, v3

    if-gez v3, :cond_f

    .line 1656
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1657
    iget v4, v2, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v6, v4

    add-long/2addr v6, p2

    sub-long/2addr v6, v0

    long-to-int p2, v6

    .line 1658
    iget p3, v2, Lnicoid/network238/okio/Segment;->limit:I

    :goto_4
    if-ge p2, p3, :cond_5

    .line 1660
    aget-byte v4, v3, p2

    .line 1661
    array-length v6, p1

    move v7, v5

    :goto_5
    if-ge v7, v6, :cond_4

    aget-byte v8, p1, v7

    if-eq v4, v8, :cond_b

    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_4

    .line 1668
    :cond_5
    iget p2, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget p3, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p3

    int-to-long p2, p2

    add-long/2addr v0, p2

    .line 1670
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide p2, v0

    goto :goto_3

    :cond_6
    nop

    .line 1687
    :goto_6
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget v7, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v3, v7

    int-to-long v7, v3

    add-long/2addr v7, v0

    cmp-long v3, v7, p2

    if-gtz v3, :cond_7

    .line 1689
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v0, v7

    goto :goto_6

    .line 1631
    :cond_7
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v3

    if-ne v3, v4, :cond_a

    .line 1633
    invoke-virtual {p1, v5}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v3

    .line 1634
    invoke-virtual {p1, v6}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result p1

    .line 1635
    :goto_7
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    cmp-long v4, v0, v4

    if-gez v4, :cond_f

    .line 1636
    iget-object v4, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1637
    iget v5, v2, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v5, v5

    add-long/2addr v5, p2

    sub-long/2addr v5, v0

    long-to-int p2, v5

    .line 1638
    iget p3, v2, Lnicoid/network238/okio/Segment;->limit:I

    :goto_8
    if-ge p2, p3, :cond_9

    .line 1640
    aget-byte v5, v4, p2

    if-eq v5, v3, :cond_8

    if-eq v5, p1, :cond_8

    add-int/lit8 p2, p2, 0x1

    goto :goto_8

    .line 1642
    :cond_8
    iget p1, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p1

    int-to-long p1, p2

    add-long/2addr p1, v0

    return-wide p1

    .line 1648
    :cond_9
    iget p2, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget p3, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p3

    int-to-long p2, p2

    add-long/2addr v0, p2

    .line 1650
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide p2, v0

    goto :goto_7

    .line 1654
    :cond_a
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object p1

    .line 1655
    :goto_9
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    cmp-long v3, v0, v3

    if-gez v3, :cond_f

    .line 1656
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1657
    iget v4, v2, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v6, v4

    add-long/2addr v6, p2

    sub-long/2addr v6, v0

    long-to-int p2, v6

    .line 1658
    iget p3, v2, Lnicoid/network238/okio/Segment;->limit:I

    :goto_a
    if-ge p2, p3, :cond_e

    .line 1660
    aget-byte v4, v3, p2

    .line 1661
    array-length v6, p1

    move v7, v5

    :goto_b
    if-ge v7, v6, :cond_d

    aget-byte v8, p1, v7

    if-ne v4, v8, :cond_c

    .line 1662
    :cond_b
    iget p1, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p1

    int-to-long p1, p2

    add-long/2addr p1, v0

    return-wide p1

    :cond_c
    add-int/lit8 v7, v7, 0x1

    goto :goto_b

    :cond_d
    add-int/lit8 p2, p2, 0x1

    goto :goto_a

    .line 1668
    :cond_e
    iget p2, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget p3, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, p3

    int-to-long p2, p2

    add-long/2addr v0, p2

    .line 1670
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide p2, v0

    goto :goto_9

    :cond_f
    :goto_c
    const-wide/16 p1, -0x1

    return-wide p1

    .line 1621
    :cond_10
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "fromIndex < 0: "

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

.method public inputStream()Ljava/io/InputStream;
    .registers 2

    .line 190
    new-instance v0, Lnicoid/network238/okio/Buffer$inputStream$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/Buffer$inputStream$1;-><init>(Lnicoid/network238/okio/Buffer;)V

    return-object v0
.end method

.method public isOpen()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public final md5()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 588
    const-string v0, "MD5"

    invoke-direct {p0, v0}, Lnicoid/network238/okio/Buffer;->digest(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public outputStream()Ljava/io/OutputStream;
    .registers 2

    .line 91
    new-instance v0, Lnicoid/network238/okio/Buffer$outputStream$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/Buffer$outputStream$1;-><init>(Lnicoid/network238/okio/Buffer;)V

    return-object v0
.end method

.method public peek()Lnicoid/network238/okio/BufferedSource;
    .registers 2

    .line 186
    new-instance v0, Lnicoid/network238/okio/PeekSource;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/PeekSource;-><init>(Lnicoid/network238/okio/BufferedSource;)V

    invoke-static {v0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v0

    return-object v0
.end method

.method public rangeEquals(JLnicoid/network238/okio/ByteString;)Z
    .registers 10

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 566
    invoke-virtual {p3}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v5

    const/4 v4, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->rangeEquals(JLnicoid/network238/okio/ByteString;II)Z

    move-result p1

    return p1
.end method

.method public rangeEquals(JLnicoid/network238/okio/ByteString;II)Z
    .registers 16

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p5, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    int-to-long v0, p5

    add-long/2addr v0, p1

    .line 1694
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    if-ltz p4, :cond_1

    add-int v0, p4, p5

    .line 1695
    invoke-virtual {p3}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    if-gt v0, v1, :cond_1

    if-eqz p5, :cond_0

    const-wide/16 v0, 0x1

    add-long v6, p1, v0

    .line 1698
    move-object v2, p0

    move-wide v4, p1

    move-object v3, p3

    move v8, p4

    move v9, p5

    invoke-static/range {v2 .. v9}, Lnicoid/network238/okio/internal/-Buffer;->commonIndexOf(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;JJII)J

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
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 424
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 426
    :cond_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v1

    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 427
    iget-object v2, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 429
    iget p1, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr p1, v1

    iput p1, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 430
    iget-wide v2, p0, Lnicoid/network238/okio/Buffer;->size:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lnicoid/network238/okio/Buffer;->size:J

    .line 432
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p1, v2, :cond_1

    .line 433
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 434
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_1
    return v1
.end method

.method public read([B)I
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1167
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lnicoid/network238/okio/Buffer;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1175
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 1177
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v0, :cond_0

    const/4 p1, -0x1

    return p1

    .line 1178
    :cond_0
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 1179
    iget-object v1, v0, Lnicoid/network238/okio/Segment;->data:[B

    .line 1182
    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int v3, v2, p3

    .line 1179
    invoke-static {v1, p1, p2, v2, v3}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 1186
    iget p1, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr p1, p3

    iput p1, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 1187
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    int-to-long v1, p3

    sub-long/2addr p1, v1

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1189
    iget p1, v0, Lnicoid/network238/okio/Segment;->pos:I

    iget p2, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p1, p2, :cond_1

    .line 1190
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1191
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_1
    return p3
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    .line 1567
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    const-wide/16 p1, -0x1

    return-wide p1

    .line 1568
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p2

    .line 1569
    :cond_1
    invoke-virtual {p1, p0, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    return-wide p2

    .line 1565
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

.method public readAll(Lnicoid/network238/okio/Sink;)J
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1057
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 1059
    invoke-interface {p1, p0, v0, v1}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    :cond_0
    return-wide v0
.end method

.method public final readAndWriteUnsafe()Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lnicoid/network238/okio/Buffer;->readAndWriteUnsafe$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    move-result-object v0

    return-object v0
.end method

.method public final readAndWriteUnsafe(Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 670
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-Buffer;->commonReadAndWriteUnsafe(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    move-result-object p1

    return-object p1
.end method

.method public readByte()B
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 763
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 765
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 766
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 767
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    .line 769
    iget-object v3, v0, Lnicoid/network238/okio/Segment;->data:[B

    add-int/lit8 v4, v1, 0x1

    .line 770
    aget-byte v1, v3, v1

    .line 771
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    const-wide/16 v7, 0x1

    sub-long/2addr v5, v7

    invoke-virtual {p0, v5, v6}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    if-ne v4, v2, :cond_0

    .line 774
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v2

    iput-object v2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 775
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    return v1

    .line 777
    :cond_0
    iput v4, v0, Lnicoid/network238/okio/Segment;->pos:I

    return v1

    .line 763
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readByteArray()[B
    .registers 3

    .line 1159
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->readByteArray(J)[B

    move-result-object v0

    return-object v0
.end method

.method public readByteArray(J)[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_1

    .line 1162
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-ltz v0, :cond_0

    long-to-int p1, p1

    .line 1164
    new-array p1, p1, [B

    .line 1165
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->readFully([B)V

    return-object p1

    .line 1162
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    .line 1160
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "byteCount: "

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

.method public readByteString()Lnicoid/network238/okio/ByteString;
    .registers 3

    .line 1032
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->readByteString(J)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public readByteString(J)Lnicoid/network238/okio/ByteString;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_2

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-gtz v0, :cond_2

    .line 1035
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-ltz v0, :cond_1

    const-wide/16 v0, 0x1000

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    long-to-int v0, p1

    .line 1038
    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->snapshot(I)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return-object v0

    .line 1040
    :cond_0
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->readByteArray(J)[B

    move-result-object p1

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0

    .line 1035
    :cond_1
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    .line 1033
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "byteCount: "

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

.method public readDecimalLong()J
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 916
    move-object/from16 v0, p0

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_e

    const/4 v1, 0x0

    const-wide/16 v5, -0x7

    move v2, v1

    move-wide v8, v3

    move-wide v6, v5

    move v5, v2

    .line 927
    :goto_0
    iget-object v10, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 929
    iget-object v11, v10, Lnicoid/network238/okio/Segment;->data:[B

    .line 930
    iget v12, v10, Lnicoid/network238/okio/Segment;->pos:I

    .line 931
    iget v13, v10, Lnicoid/network238/okio/Segment;->limit:I

    :goto_1
    if-ge v12, v13, :cond_6

    .line 934
    aget-byte v15, v11, v12

    const/16 v14, 0x30

    if-lt v15, v14, :cond_4

    const/16 v14, 0x39

    if-gt v15, v14, :cond_4

    rsub-int/lit8 v14, v15, 0x30

    const-wide v16, -0xcccccccccccccccL

    cmp-long v16, v8, v16

    if-ltz v16, :cond_2

    if-nez v16, :cond_0

    move-wide/from16 v17, v3

    int-to-long v3, v14

    cmp-long v3, v3, v6

    if-gez v3, :cond_1

    goto :goto_2

    :cond_0
    move-wide/from16 v17, v3

    :cond_1
    const-wide/16 v3, 0xa

    mul-long/2addr v8, v3

    int-to-long v3, v14

    add-long/2addr v8, v3

    goto :goto_3

    .line 940
    :cond_2
    :goto_2
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v1, v8, v9}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object v1

    invoke-virtual {v1, v15}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v1

    if-nez v2, :cond_3

    .line 941
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readByte()B

    .line 942
    :cond_3
    new-instance v2, Ljava/lang/NumberFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Number too large: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 934
    :cond_4
    move-wide/from16 v17, v3

    .line 942
    const/16 v3, 0x2d

    if-ne v15, v3, :cond_5

    if-nez v1, :cond_5

    const-wide/16 v2, 0x1

    sub-long/2addr v6, v2

    const/4 v2, 0x1

    :goto_3
    add-int/lit8 v12, v12, 0x1

    add-int/lit8 v1, v1, 0x1

    move-wide/from16 v3, v17

    goto :goto_1

    :cond_5
    const/4 v5, 0x1

    goto :goto_4

    .line 931
    :cond_6
    move-wide/from16 v17, v3

    .line 942
    :goto_4
    if-ne v12, v13, :cond_7

    .line 959
    invoke-virtual {v10}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v3

    iput-object v3, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 960
    invoke-static {v10}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_5

    .line 962
    :cond_7
    iput v12, v10, Lnicoid/network238/okio/Segment;->pos:I

    :goto_5
    if-nez v5, :cond_8

    .line 964
    iget-object v3, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v3, :cond_8

    move-wide/from16 v3, v17

    goto/16 :goto_0

    .line 966
    :cond_8
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    int-to-long v5, v1

    sub-long/2addr v3, v5

    invoke-virtual {v0, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    if-eqz v2, :cond_9

    const/4 v14, 0x2

    goto :goto_6

    :cond_9
    const/4 v14, 0x1

    :goto_6
    if-ge v1, v14, :cond_c

    .line 970
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    cmp-long v1, v3, v17

    if-eqz v1, :cond_b

    if-eqz v2, :cond_a

    .line 971
    const-string v1, "Expected a digit"

    goto :goto_7

    :cond_a
    const-string v1, "Expected a digit or \'-\'"

    .line 972
    :goto_7
    new-instance v2, Ljava/lang/NumberFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " but was 0x"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-wide/from16 v3, v17

    invoke-virtual {v0, v3, v4}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v3

    invoke-static {v3}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 970
    :cond_b
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    :cond_c
    if-eqz v2, :cond_d

    return-wide v8

    :cond_d
    neg-long v1, v8

    return-wide v1

    .line 916
    :cond_e
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public final readFrom(Ljava/io/InputStream;)Lnicoid/network238/okio/Buffer;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 285
    const-wide v0, 0x7fffffffffffffffL

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Lnicoid/network238/okio/Buffer;->readFrom(Ljava/io/InputStream;JZ)V

    return-object p0
.end method

.method public final readFrom(Ljava/io/InputStream;J)Lnicoid/network238/okio/Buffer;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    .line 293
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lnicoid/network238/okio/Buffer;->readFrom(Ljava/io/InputStream;JZ)V

    return-object p0

    .line 292
    :cond_0
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

.method public readFully(Lnicoid/network238/okio/Buffer;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1051
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    cmp-long v0, v0, p2

    if-ltz v0, :cond_0

    .line 1055
    invoke-virtual {p1, p0, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    return-void

    .line 1052
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p2

    invoke-virtual {p1, p0, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 1053
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method

.method public readFully([B)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 1169
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 1170
    array-length v1, p1

    sub-int/2addr v1, v0

    invoke-virtual {p0, p1, v0, v1}, Lnicoid/network238/okio/Buffer;->read([BII)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    add-int/2addr v0, v1

    goto :goto_0

    .line 1171
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_1
    return-void
.end method

.method public readHexadecimalUnsignedLong()J
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 976
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    move v1, v0

    move-wide v4, v2

    .line 983
    :cond_0
    iget-object v6, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 985
    iget-object v7, v6, Lnicoid/network238/okio/Segment;->data:[B

    .line 986
    iget v8, v6, Lnicoid/network238/okio/Segment;->pos:I

    .line 987
    iget v9, v6, Lnicoid/network238/okio/Segment;->limit:I

    :goto_0
    if-ge v8, v9, :cond_6

    .line 992
    aget-byte v10, v7, v8

    const/16 v11, 0x30

    if-lt v10, v11, :cond_1

    const/16 v11, 0x39

    if-gt v10, v11, :cond_1

    add-int/lit8 v11, v10, -0x30

    goto :goto_1

    :cond_1
    const/16 v11, 0x61

    if-lt v10, v11, :cond_2

    const/16 v11, 0x66

    if-gt v10, v11, :cond_2

    add-int/lit8 v11, v10, -0x57

    goto :goto_1

    :cond_2
    const/16 v11, 0x41

    if-lt v10, v11, :cond_4

    const/16 v11, 0x46

    if-gt v10, v11, :cond_4

    add-int/lit8 v11, v10, -0x37

    :goto_1
    const-wide/high16 v12, -0x1000000000000000L    # -3.105036184601418E231

    and-long/2addr v12, v4

    cmp-long v12, v12, v2

    if-nez v12, :cond_3

    const/4 v10, 0x4

    shl-long/2addr v4, v10

    int-to-long v10, v11

    or-long/2addr v4, v10

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1012
    :cond_3
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v0, v4, v5}, Lnicoid/network238/okio/Buffer;->writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    invoke-virtual {v0, v10}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 1013
    new-instance v1, Ljava/lang/NumberFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Number too large: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4
    if-eqz v0, :cond_5

    const/4 v1, 0x1

    goto :goto_2

    .line 1001
    :cond_5
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 1002
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected leading [0-9a-fA-F] character but was 0x"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v10}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1001
    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    :goto_2
    if-ne v8, v9, :cond_7

    .line 1023
    invoke-virtual {v6}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v7

    iput-object v7, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1024
    invoke-static {v6}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_3

    .line 1026
    :cond_7
    iput v8, v6, Lnicoid/network238/okio/Segment;->pos:I

    :goto_3
    if-nez v1, :cond_8

    .line 1028
    iget-object v6, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v6, :cond_0

    .line 1030
    :cond_8
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    int-to-long v6, v0

    sub-long/2addr v1, v6

    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-wide v4

    .line 976
    :cond_9
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readInt()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 828
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    .line 830
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 831
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 832
    iget v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    sub-int v5, v4, v1

    int-to-long v5, v5

    cmp-long v5, v5, v2

    if-gez v5, :cond_0

    .line 837
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    .line 839
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 840
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 841
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0

    .line 850
    :cond_0
    iget-object v5, v0, Lnicoid/network238/okio/Segment;->data:[B

    add-int/lit8 v6, v1, 0x1

    .line 852
    aget-byte v7, v5, v1

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x18

    add-int/lit8 v8, v1, 0x2

    .line 853
    aget-byte v6, v5, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v7, v6

    add-int/lit8 v6, v1, 0x3

    .line 854
    aget-byte v8, v5, v8

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x8

    or-int/2addr v7, v8

    add-int/lit8 v1, v1, 0x4

    .line 855
    aget-byte v5, v5, v6

    and-int/lit16 v5, v5, 0xff

    or-int/2addr v7, v5

    .line 857
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    sub-long/2addr v5, v2

    invoke-virtual {p0, v5, v6}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    if-ne v1, v4, :cond_1

    .line 860
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 861
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    return v7

    .line 863
    :cond_1
    iput v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    return v7

    .line 828
    :cond_2
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readIntLe()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 340
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readInt()I

    move-result v0

    invoke-static {v0}, Lnicoid/network238/okio/-SegmentedByteString;->reverseBytes(I)I

    move-result v0

    return v0
.end method

.method public readLong()J
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 867
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x8

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    .line 869
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 870
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 871
    iget v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    sub-int v5, v4, v1

    int-to-long v5, v5

    cmp-long v5, v5, v2

    const/16 v6, 0x20

    if-gez v5, :cond_0

    .line 876
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    shl-long/2addr v0, v6

    .line 878
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readInt()I

    move-result v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    or-long/2addr v0, v4

    return-wide v0

    .line 885
    :cond_0
    iget-object v5, v0, Lnicoid/network238/okio/Segment;->data:[B

    add-int/lit8 v7, v1, 0x1

    .line 887
    aget-byte v8, v5, v1

    int-to-long v8, v8

    const-wide/16 v10, 0xff

    and-long/2addr v8, v10

    const/16 v12, 0x38

    shl-long/2addr v8, v12

    add-int/lit8 v12, v1, 0x2

    .line 889
    aget-byte v7, v5, v7

    int-to-long v13, v7

    and-long/2addr v13, v10

    const/16 v7, 0x30

    shl-long/2addr v13, v7

    or-long/2addr v8, v13

    add-int/lit8 v7, v1, 0x3

    .line 890
    aget-byte v12, v5, v12

    int-to-long v12, v12

    and-long/2addr v12, v10

    const/16 v14, 0x28

    shl-long/2addr v12, v14

    or-long/2addr v8, v12

    add-int/lit8 v12, v1, 0x4

    .line 891
    aget-byte v7, v5, v7

    int-to-long v13, v7

    and-long/2addr v13, v10

    shl-long/2addr v13, v6

    or-long/2addr v8, v13

    add-int/lit8 v6, v1, 0x5

    .line 892
    aget-byte v7, v5, v12

    int-to-long v12, v7

    and-long/2addr v12, v10

    const/16 v7, 0x18

    shl-long/2addr v12, v7

    or-long/2addr v8, v12

    add-int/lit8 v7, v1, 0x6

    .line 893
    aget-byte v6, v5, v6

    int-to-long v12, v6

    and-long/2addr v12, v10

    const/16 v6, 0x10

    shl-long/2addr v12, v6

    or-long/2addr v8, v12

    add-int/lit8 v6, v1, 0x7

    .line 894
    aget-byte v7, v5, v7

    int-to-long v12, v7

    and-long/2addr v12, v10

    const/16 v7, 0x8

    shl-long/2addr v12, v7

    or-long/2addr v8, v12

    add-int/2addr v1, v7

    .line 895
    aget-byte v5, v5, v6

    int-to-long v5, v5

    and-long/2addr v5, v10

    or-long/2addr v8, v5

    .line 906
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    sub-long/2addr v5, v2

    invoke-virtual {p0, v5, v6}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    if-ne v1, v4, :cond_1

    .line 909
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 910
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    return-wide v8

    .line 912
    :cond_1
    iput v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    return-wide v8

    .line 867
    :cond_2
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readLongLe()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 343
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Lnicoid/network238/okio/-SegmentedByteString;->reverseBytes(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public readShort()S
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 803
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_2

    .line 805
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 806
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 807
    iget v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    sub-int v5, v4, v1

    const/4 v6, 0x2

    if-ge v5, v6, :cond_0

    .line 811
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    int-to-short v0, v0

    return v0

    .line 816
    :cond_0
    iget-object v5, v0, Lnicoid/network238/okio/Segment;->data:[B

    add-int/lit8 v7, v1, 0x1

    .line 817
    aget-byte v8, v5, v1

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x8

    add-int/2addr v1, v6

    aget-byte v5, v5, v7

    and-int/lit16 v5, v5, 0xff

    or-int/2addr v8, v5

    .line 818
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    sub-long/2addr v5, v2

    invoke-virtual {p0, v5, v6}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    if-ne v1, v4, :cond_1

    .line 821
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 822
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    goto :goto_0

    .line 824
    :cond_1
    iput v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    :goto_0
    int-to-short v0, v8

    return v0

    .line 803
    :cond_2
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readShortLe()S
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 337
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readShort()S

    move-result v0

    invoke-static {v0}, Lnicoid/network238/okio/-SegmentedByteString;->reverseBytes(S)S

    move-result v0

    return v0
.end method

.method public readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_4

    const-wide/32 v1, 0x7fffffff

    cmp-long v1, p1, v1

    if-gtz v1, :cond_4

    .line 376
    iget-wide v1, p0, Lnicoid/network238/okio/Buffer;->size:J

    cmp-long v1, v1, p1

    if-ltz v1, :cond_3

    if-nez v0, :cond_0

    .line 377
    const-string p1, ""

    return-object p1

    .line 379
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 380
    iget v1, v0, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v2, v1

    add-long/2addr v2, p1

    iget v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    new-instance v0, Ljava/lang/String;

    .line 382
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->readByteArray(J)[B

    move-result-object p1

    invoke-direct {v0, p1, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0

    :cond_1
    new-instance v2, Ljava/lang/String;

    .line 385
    iget-object v3, v0, Lnicoid/network238/okio/Segment;->data:[B

    long-to-int v4, p1

    invoke-direct {v2, v3, v1, v4, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 386
    iget p3, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr p3, v4

    iput p3, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 387
    iget-wide v3, p0, Lnicoid/network238/okio/Buffer;->size:J

    sub-long/2addr v3, p1

    iput-wide v3, p0, Lnicoid/network238/okio/Buffer;->size:J

    .line 389
    iget p1, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p3, p1, :cond_2

    .line 390
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 391
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_2
    return-object v2

    .line 376
    :cond_3
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    .line 375
    :cond_4
    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "byteCount: "

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public readString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 371
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    invoke-virtual {p0, v0, v1, p1}, Lnicoid/network238/okio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final readUnsafe()Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lnicoid/network238/okio/Buffer;->readUnsafe$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    move-result-object v0

    return-object v0
.end method

.method public final readUnsafe(Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 666
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-Buffer;->commonReadUnsafe(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    move-result-object p1

    return-object p1
.end method

.method public readUtf8()Ljava/lang/String;
    .registers 4

    .line 366
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    sget-object v2, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0, v1, v2}, Lnicoid/network238/okio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8(J)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 369
    sget-object v0, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, p2, v0}, Lnicoid/network238/okio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readUtf8CodePoint()I
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1087
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_a

    .line 1089
    invoke-virtual {p0, v2, v3}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v0

    and-int/lit16 v1, v0, 0x80

    const v2, 0xfffd

    const/4 v3, 0x1

    const/16 v4, 0x80

    if-nez v1, :cond_0

    and-int/lit8 v1, v0, 0x7f

    const/4 v5, 0x0

    move v6, v5

    move v5, v3

    goto :goto_0

    :cond_0
    and-int/lit16 v1, v0, 0xe0

    const/16 v5, 0xc0

    if-ne v1, v5, :cond_1

    and-int/lit8 v1, v0, 0x1f

    const/4 v5, 0x2

    move v6, v4

    goto :goto_0

    :cond_1
    and-int/lit16 v1, v0, 0xf0

    const/16 v5, 0xe0

    if-ne v1, v5, :cond_2

    and-int/lit8 v1, v0, 0xf

    const/4 v5, 0x3

    const/16 v6, 0x800

    goto :goto_0

    :cond_2
    and-int/lit16 v1, v0, 0xf8

    const/16 v5, 0xf0

    if-ne v1, v5, :cond_9

    and-int/lit8 v1, v0, 0x7

    const/4 v5, 0x4

    const/high16 v6, 0x10000

    .line 1126
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v7

    int-to-long v9, v5

    cmp-long v7, v7, v9

    if-ltz v7, :cond_8

    :goto_1
    if-ge v3, v5, :cond_4

    int-to-long v7, v3

    .line 1134
    invoke-virtual {p0, v7, v8}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v0

    and-int/lit16 v11, v0, 0xc0

    if-ne v11, v4, :cond_3

    shl-int/lit8 v1, v1, 0x6

    and-int/lit8 v0, v0, 0x3f

    or-int/2addr v1, v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1140
    :cond_3
    invoke-virtual {p0, v7, v8}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return v2

    .line 1145
    :cond_4
    invoke-virtual {p0, v9, v10}, Lnicoid/network238/okio/Buffer;->skip(J)V

    const v0, 0x10ffff

    if-gt v1, v0, :cond_6

    const v0, 0xd800

    if-gt v0, v1, :cond_5

    const v0, 0xe000

    if-lt v1, v0, :cond_6

    :cond_5
    if-ge v1, v6, :cond_7

    :cond_6
    return v2

    :cond_7
    return v1

    .line 1127
    :cond_8
    new-instance v1, Ljava/io/EOFException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "size < "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (to read code point prefixed 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x29

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_9
    nop

    .line 1121
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return v2

    .line 1087
    :cond_a
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readUtf8Line()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1062
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->indexOf(B)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 1065
    invoke-static {p0, v0, v1}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1066
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public readUtf8LineStrict()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 401
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->readUtf8LineStrict(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUtf8LineStrict(J)Ljava/lang/String;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_3

    const-wide v0, 0x7fffffffffffffffL

    cmp-long v2, p1, v0

    const-wide/16 v6, 0x1

    if-eqz v2, :cond_0

    add-long v0, p1, v6

    :cond_0
    move-wide v4, v0

    .line 1071
    const/16 v1, 0xa

    const-wide/16 v2, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->indexOf(BJJ)J

    move-result-wide v1

    const-wide/16 v8, -0x1

    cmp-long v3, v1, v8

    if-eqz v3, :cond_1

    .line 1072
    invoke-static {p0, v1, v2}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1073
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    cmp-long v1, v4, v1

    if-gez v1, :cond_2

    sub-long v1, v4, v6

    .line 1074
    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v1

    const/16 v2, 0xd

    if-ne v1, v2, :cond_2

    .line 1075
    invoke-virtual {p0, v4, v5}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_2

    .line 1077
    invoke-static {p0, v4, v5}, Lnicoid/network238/okio/internal/-Buffer;->readUtf8Line(Lnicoid/network238/okio/Buffer;J)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1079
    :cond_2
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 1080
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    .line 1081
    const-wide/16 v4, 0x20

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 1080
    const-wide/16 v2, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->copyTo(Lnicoid/network238/okio/Buffer;JJ)Lnicoid/network238/okio/Buffer;

    .line 1082
    new-instance v0, Ljava/io/EOFException;

    .line 1083
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\\n not found: limit="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1084
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 1083
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " content="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1086
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v1

    .line 1083
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2026

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1082
    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1068
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "limit < 0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public request(J)Z
    .registers 5

    .line 183
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    cmp-long p1, v0, p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public require(J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 180
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    cmp-long p1, v0, p1

    if-ltz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method

.method public select(Lnicoid/network238/okio/Options;)I
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1041
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, p1, v0, v1, v2}, Lnicoid/network238/okio/internal/-Buffer;->selectPrefix$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Options;ZILjava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return v1

    .line 1045
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/Options;->getByteStrings$okio()[Lnicoid/network238/okio/ByteString;

    move-result-object p1

    aget-object p1, p1, v0

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p1

    int-to-long v1, p1

    .line 1046
    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->skip(J)V

    return v0
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

    .line 1048
    invoke-virtual {p1}, Lnicoid/network238/okio/TypedOptions;->getOptions$okio()Lnicoid/network238/okio/Options;

    move-result-object v0

    invoke-interface {p0, v0}, Lnicoid/network238/okio/BufferedSource;->select(Lnicoid/network238/okio/Options;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 1050
    :cond_0
    invoke-virtual {p1, v0}, Lnicoid/network238/okio/TypedOptions;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final setSize$okio(J)V
    .registers 3

    .line 84
    iput-wide p1, p0, Lnicoid/network238/okio/Buffer;->size:J

    return-void
.end method

.method public final sha1()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 595
    const-string v0, "SHA-1"

    invoke-direct {p0, v0}, Lnicoid/network238/okio/Buffer;->digest(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final sha256()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 598
    const-string v0, "SHA-256"

    invoke-direct {p0, v0}, Lnicoid/network238/okio/Buffer;->digest(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final sha512()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 601
    const-string v0, "SHA-512"

    invoke-direct {p0, v0}, Lnicoid/network238/okio/Buffer;->digest(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final size()J
    .registers 3

    .line 83
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    return-wide v0
.end method

.method public skip(J)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_2

    .line 1198
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v0, :cond_1

    .line 1200
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    .line 1201
    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    .line 1202
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v2

    int-to-long v4, v1

    sub-long/2addr v2, v4

    invoke-virtual {p0, v2, v3}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    sub-long/2addr p1, v4

    .line 1204
    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v2, v1

    iput v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 1206
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v2, v1, :cond_0

    .line 1207
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1208
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_0
    goto :goto_0

    .line 1198
    :cond_1
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_2
    return-void
.end method

.method public final snapshot()Lnicoid/network238/okio/ByteString;
    .registers 5

    .line 1767
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 1769
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->snapshot(I)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0

    .line 1767
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "size > Int.MAX_VALUE: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final snapshot(I)Lnicoid/network238/okio/ByteString;
    .registers 10

    if-nez p1, :cond_0

    .line 1770
    sget-object p1, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    return-object p1

    .line 1771
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    int-to-long v4, p1

    const-wide/16 v2, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 1776
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, p1, :cond_2

    .line 1778
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v4, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v5, v0, Lnicoid/network238/okio/Segment;->pos:I

    if-eq v4, v5, :cond_1

    sub-int/2addr v4, v5

    add-int/2addr v2, v4

    add-int/lit8 v3, v3, 0x1

    .line 1783
    iget-object v0, v0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_0

    .line 1779
    :cond_1
    new-instance p1, Ljava/lang/AssertionError;

    const-string v0, "s.limit == s.pos"

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 1787
    :cond_2
    new-array v0, v3, [[B

    shl-int/lit8 v2, v3, 0x1

    .line 1788
    new-array v2, v2, [I

    .line 1791
    iget-object v4, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    move-object v5, v4

    move v4, v1

    :goto_1
    if-ge v1, p1, :cond_3

    .line 1793
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v5, Lnicoid/network238/okio/Segment;->data:[B

    aput-object v6, v0, v4

    .line 1794
    iget v6, v5, Lnicoid/network238/okio/Segment;->limit:I

    iget v7, v5, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v6, v7

    add-int/2addr v1, v6

    .line 1796
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result v6

    aput v6, v2, v4

    add-int v6, v4, v3

    .line 1797
    iget v7, v5, Lnicoid/network238/okio/Segment;->pos:I

    aput v7, v2, v6

    .line 1798
    const/4 v6, 0x1

    iput-boolean v6, v5, Lnicoid/network238/okio/Segment;->shared:Z

    add-int/2addr v4, v6

    .line 1800
    iget-object v5, v5, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_1

    .line 1803
    :cond_3
    new-instance p1, Lnicoid/network238/okio/SegmentedByteString;

    invoke-direct {p1, v0, v2}, Lnicoid/network238/okio/SegmentedByteString;-><init>([[B[I)V

    return-object p1
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 581
    sget-object v0, Lnicoid/network238/okio/Timeout;->NONE:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 651
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->snapshot()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public utf8Appendable()Ljava/lang/Appendable;
    .registers 2

    .line 109
    new-instance v0, Lnicoid/network238/okio/Buffer$utf8Appendable$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okio/Buffer$utf8Appendable$1;-><init>(Lnicoid/network238/okio/Buffer;)V

    return-object v0
.end method

.method public final writableSegment$okio(I)Lnicoid/network238/okio/Segment;
    .registers 5

    const/4 v0, 0x1

    if-lt p1, v0, :cond_2

    const/16 v0, 0x2000

    if-gt p1, v0, :cond_2

    .line 1509
    iget-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v1, :cond_0

    .line 1510
    invoke-static {}, Lnicoid/network238/okio/SegmentPool;->take()Lnicoid/network238/okio/Segment;

    move-result-object p1

    .line 1511
    iput-object p1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1512
    iput-object p1, p1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1513
    iput-object p1, p1, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    return-object p1

    .line 1517
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v1, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1518
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, v1, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v2, p1

    if-gt v2, v0, :cond_1

    iget-boolean p1, v1, Lnicoid/network238/okio/Segment;->owner:Z

    if-eqz p1, :cond_1

    return-object v1

    .line 1519
    :cond_1
    invoke-static {}, Lnicoid/network238/okio/SegmentPool;->take()Lnicoid/network238/okio/Segment;

    move-result-object p1

    invoke-virtual {v1, p1}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    move-result-object p1

    return-object p1

    .line 1507
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "unexpected capacity"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 489
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v0

    move v1, v0

    :goto_0
    if-lez v1, :cond_0

    .line 492
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 494
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v3, v3, 0x2000

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 495
    iget-object v4, v2, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v2, Lnicoid/network238/okio/Segment;->limit:I

    invoke-virtual {p1, v4, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    sub-int/2addr v1, v3

    .line 498
    iget v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v4, v3

    iput v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    goto :goto_0

    .line 501
    :cond_0
    iget-wide v1, p0, Lnicoid/network238/okio/Buffer;->size:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lnicoid/network238/okio/Buffer;->size:J

    return v0
.end method

.method public write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1215
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    .line 1217
    const/4 v1, 0x0

    invoke-virtual {p1, p0, v1, v0}, Lnicoid/network238/okio/ByteString;->write$okio(Lnicoid/network238/okio/Buffer;II)V

    return-object p0
.end method

.method public write(Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/Buffer;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1219
    invoke-virtual {p1, p0, p2, p3}, Lnicoid/network238/okio/ByteString;->write$okio(Lnicoid/network238/okio/Buffer;II)V

    return-object p0
.end method

.method public write(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/Buffer;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    .line 1391
    invoke-interface {p1, p0, p2, p3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    sub-long/2addr p2, v0

    goto :goto_0

    .line 1392
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    :cond_1
    return-object p0
.end method

.method public write([B)Lnicoid/network238/okio/Buffer;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1360
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lnicoid/network238/okio/Buffer;->write([BII)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public write([BII)Lnicoid/network238/okio/Buffer;
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1362
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    add-int/2addr p3, p2

    :goto_0
    if-ge p2, p3, :cond_0

    .line 1366
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v0

    sub-int v1, p3, p2

    .line 1368
    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    rsub-int v2, v2, 0x2000

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1370
    iget-object v2, v0, Lnicoid/network238/okio/Segment;->data:[B

    .line 1371
    iget v3, v0, Lnicoid/network238/okio/Segment;->limit:I

    add-int v4, p2, v1

    .line 1369
    invoke-static {p1, v2, v3, p2, v4}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 1377
    iget p2, v0, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr p2, v1

    iput p2, v0, Lnicoid/network238/okio/Segment;->limit:I

    move p2, v4

    goto :goto_0

    .line 1380
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    add-long/2addr p1, v5

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0
.end method

.method public bridge synthetic write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic write(Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    .line 79
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic write(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    .line 79
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Source;J)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic write([B)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic write([BII)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    .line 79
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->write([BII)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eq p1, p0, :cond_6

    .line 1525
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_5

    .line 1529
    iget-object v0, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget-object v1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-gez v0, :cond_3

    .line 1530
    iget-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_2

    .line 1531
    iget-boolean v1, v0, Lnicoid/network238/okio/Segment;->owner:Z

    if-eqz v1, :cond_2

    .line 1532
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v1, v1

    add-long/2addr v1, p2

    iget-boolean v3, v0, Lnicoid/network238/okio/Segment;->shared:Z

    if-eqz v3, :cond_1

    const/4 v3, 0x0

    goto :goto_2

    :cond_1
    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    :goto_2
    int-to-long v3, v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x2000

    cmp-long v1, v1, v3

    if-gtz v1, :cond_2

    .line 1535
    iget-object v1, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    long-to-int v2, p2

    invoke-virtual {v1, v0, v2}, Lnicoid/network238/okio/Segment;->writeTo(Lnicoid/network238/okio/Segment;I)V

    .line 1536
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    sub-long/2addr v0, p2

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1537
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    add-long/2addr v0, p2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-void

    .line 1542
    :cond_2
    iget-object v0, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    long-to-int v1, p2

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Segment;->split(I)Lnicoid/network238/okio/Segment;

    move-result-object v0

    iput-object v0, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1547
    :cond_3
    iget-object v0, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1548
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    .line 1549
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v3

    iput-object v3, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1550
    iget-object v3, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v3, :cond_4

    .line 1551
    iput-object v0, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 1552
    iput-object v0, v0, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1553
    iput-object v0, v0, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    goto :goto_3

    .line 1555
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v3, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 1556
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v0}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    move-result-object v0

    .line 1557
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->compact()V

    .line 1559
    :goto_3
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {p1, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 1560
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v3

    add-long/2addr v3, v1

    invoke-virtual {p0, v3, v4}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    sub-long/2addr p2, v1

    goto/16 :goto_0

    :cond_5
    return-void

    .line 1523
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "source == this"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeAll(Lnicoid/network238/okio/Source;)J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    .line 1384
    :goto_0
    const-wide/16 v2, 0x2000

    invoke-interface {p1, p0, v2, v3}, Lnicoid/network238/okio/Source;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    add-long/2addr v0, v2

    goto :goto_0

    :cond_0
    return-wide v0
.end method

.method public writeByte(I)Lnicoid/network238/okio/Buffer;
    .registers 6

    .line 1396
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v0

    .line 1397
    iget-object v1, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v2, v0, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lnicoid/network238/okio/Segment;->limit:I

    int-to-byte p1, p1

    aput-byte p1, v1, v2

    .line 1398
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0
.end method

.method public bridge synthetic writeByte(I)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeDecimalLong(J)Lnicoid/network238/okio/Buffer;
    .registers 14

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 1435
    const/16 p1, 0x30

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1

    :cond_0
    if-gez v2, :cond_2

    neg-long p1, p1

    cmp-long v2, p1, v0

    if-gez v2, :cond_1

    .line 1442
    const-string p1, "-9223372036854775808"

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    .line 1435
    :cond_2
    const/4 v2, 0x0

    .line 1447
    :goto_0
    # invokes: Lnicoid/network238/okio/internal/-Buffer;->countDigitsIn(J)I
    invoke-static {p1, p2}, Lnicoid/network238/okio/internal/-Buffer;->access$countDigitsIn(J)I

    move-result v3

    if-eqz v2, :cond_3

    add-int/lit8 v3, v3, 0x1

    .line 1452
    :cond_3
    invoke-virtual {p0, v3}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v4

    .line 1453
    iget-object v5, v4, Lnicoid/network238/okio/Segment;->data:[B

    .line 1454
    iget v6, v4, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v6, v3

    :goto_1
    cmp-long v7, p1, v0

    if-eqz v7, :cond_4

    .line 1456
    const-wide/16 v7, 0xa

    rem-long v9, p1, v7

    long-to-int v9, v9

    add-int/lit8 v6, v6, -0x1

    .line 1457
    invoke-static {}, Lnicoid/network238/okio/internal/-Buffer;->getHEX_DIGIT_BYTES()[B

    move-result-object v10

    aget-byte v9, v10, v9

    aput-byte v9, v5, v6

    .line 1458
    div-long/2addr p1, v7

    goto :goto_1

    :cond_4
    if-eqz v2, :cond_5

    add-int/lit8 v6, v6, -0x1

    .line 1461
    const/16 p1, 0x2d

    aput-byte p1, v5, v6

    .line 1464
    :cond_5
    iget p1, v4, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr p1, v3

    iput p1, v4, Lnicoid/network238/okio/Segment;->limit:I

    .line 1465
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    int-to-long v0, v3

    add-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0
.end method

.method public bridge synthetic writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 79
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/Buffer;
    .registers 15

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 1470
    const/16 p1, 0x30

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v0, 0x1

    ushr-long v1, p1, v0

    or-long/2addr v1, p1

    const/4 v3, 0x2

    ushr-long v4, v1, v3

    or-long/2addr v1, v4

    const/4 v4, 0x4

    ushr-long v5, v1, v4

    or-long/2addr v1, v5

    const/16 v5, 0x8

    ushr-long v6, v1, v5

    or-long/2addr v1, v6

    const/16 v6, 0x10

    ushr-long v7, v1, v6

    or-long/2addr v1, v7

    const/16 v7, 0x20

    ushr-long v8, v1, v7

    or-long/2addr v1, v8

    ushr-long v8, v1, v0

    const-wide v10, 0x5555555555555555L    # 1.1945305291614955E103

    and-long/2addr v8, v10

    sub-long/2addr v1, v8

    ushr-long v8, v1, v3

    const-wide v10, 0x3333333333333333L    # 4.667261458395856E-62

    and-long/2addr v8, v10

    and-long/2addr v1, v10

    add-long/2addr v8, v1

    ushr-long v1, v8, v4

    add-long/2addr v1, v8

    const-wide v8, 0xf0f0f0f0f0f0f0fL    # 3.815736827118017E-236

    and-long/2addr v1, v8

    ushr-long v8, v1, v5

    add-long/2addr v1, v8

    ushr-long v5, v1, v6

    add-long/2addr v1, v5

    const-wide/16 v5, 0x3f

    and-long v8, v1, v5

    ushr-long/2addr v1, v7

    and-long/2addr v1, v5

    add-long/2addr v8, v1

    const-wide/16 v1, 0x3

    add-long/2addr v8, v1

    .line 1493
    const-wide/16 v1, 0x4

    div-long/2addr v8, v1

    long-to-int v1, v8

    .line 1495
    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 1496
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1497
    iget v5, v2, Lnicoid/network238/okio/Segment;->limit:I

    add-int v6, v5, v1

    sub-int/2addr v6, v0

    :goto_0
    if-lt v6, v5, :cond_1

    .line 1500
    invoke-static {}, Lnicoid/network238/okio/internal/-Buffer;->getHEX_DIGIT_BYTES()[B

    move-result-object v0

    const-wide/16 v7, 0xf

    and-long/2addr v7, p1

    long-to-int v7, v7

    aget-byte v0, v0, v7

    aput-byte v0, v3, v6

    ushr-long/2addr p1, v4

    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 1504
    :cond_1
    iget p1, v2, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr p1, v1

    iput p1, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 1505
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    int-to-long v0, v1

    add-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0
.end method

.method public bridge synthetic writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 79
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeInt(I)Lnicoid/network238/okio/Buffer;
    .registers 9

    .line 1408
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 1409
    iget-object v2, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 1410
    iget v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v4, v3, 0x1

    ushr-int/lit8 v5, p1, 0x18

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    .line 1411
    aput-byte v5, v2, v3

    add-int/lit8 v5, v3, 0x2

    ushr-int/lit8 v6, p1, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    .line 1412
    aput-byte v6, v2, v4

    add-int/lit8 v4, v3, 0x3

    ushr-int/lit8 v6, p1, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    .line 1413
    aput-byte v6, v2, v5

    add-int/2addr v3, v0

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    .line 1414
    aput-byte p1, v2, v4

    .line 1415
    iput v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 1416
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0
.end method

.method public bridge synthetic writeInt(I)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeIntLe(I)Lnicoid/network238/okio/Buffer;
    .registers 2

    .line 520
    invoke-static {p1}, Lnicoid/network238/okio/-SegmentedByteString;->reverseBytes(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeInt(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic writeIntLe(I)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeIntLe(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeLong(J)Lnicoid/network238/okio/Buffer;
    .registers 14

    .line 1418
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 1419
    iget-object v2, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 1420
    iget v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v4, v3, 0x1

    const/16 v5, 0x38

    ushr-long v5, p1, v5

    const-wide/16 v7, 0xff

    and-long/2addr v5, v7

    long-to-int v5, v5

    int-to-byte v5, v5

    .line 1421
    aput-byte v5, v2, v3

    add-int/lit8 v5, v3, 0x2

    const/16 v6, 0x30

    ushr-long v9, p1, v6

    and-long/2addr v9, v7

    long-to-int v6, v9

    int-to-byte v6, v6

    .line 1422
    aput-byte v6, v2, v4

    add-int/lit8 v4, v3, 0x3

    const/16 v6, 0x28

    ushr-long v9, p1, v6

    and-long/2addr v9, v7

    long-to-int v6, v9

    int-to-byte v6, v6

    .line 1423
    aput-byte v6, v2, v5

    add-int/lit8 v5, v3, 0x4

    const/16 v6, 0x20

    ushr-long v9, p1, v6

    and-long/2addr v9, v7

    long-to-int v6, v9

    int-to-byte v6, v6

    .line 1424
    aput-byte v6, v2, v4

    add-int/lit8 v4, v3, 0x5

    const/16 v6, 0x18

    ushr-long v9, p1, v6

    and-long/2addr v9, v7

    long-to-int v6, v9

    int-to-byte v6, v6

    .line 1425
    aput-byte v6, v2, v5

    add-int/lit8 v5, v3, 0x6

    const/16 v6, 0x10

    ushr-long v9, p1, v6

    and-long/2addr v9, v7

    long-to-int v6, v9

    int-to-byte v6, v6

    .line 1426
    aput-byte v6, v2, v4

    add-int/lit8 v4, v3, 0x7

    ushr-long v9, p1, v0

    and-long/2addr v9, v7

    long-to-int v6, v9

    int-to-byte v6, v6

    .line 1427
    aput-byte v6, v2, v5

    add-int/2addr v3, v0

    and-long/2addr p1, v7

    long-to-int p1, p1

    int-to-byte p1, p1

    .line 1428
    aput-byte p1, v2, v4

    .line 1429
    iput v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 1430
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide p1

    const-wide/16 v0, 0x8

    add-long/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0
.end method

.method public bridge synthetic writeLong(J)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 79
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeLongLe(J)Lnicoid/network238/okio/Buffer;
    .registers 3

    .line 524
    invoke-static {p1, p2}, Lnicoid/network238/okio/-SegmentedByteString;->reverseBytes(J)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic writeLongLe(J)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 79
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeLongLe(J)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeShort(I)Lnicoid/network238/okio/Buffer;
    .registers 8

    .line 1400
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 1401
    iget-object v2, v1, Lnicoid/network238/okio/Segment;->data:[B

    .line 1402
    iget v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    add-int/lit8 v4, v3, 0x1

    ushr-int/lit8 v5, p1, 0x8

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    .line 1403
    aput-byte v5, v2, v3

    add-int/2addr v3, v0

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    .line 1404
    aput-byte p1, v2, v4

    .line 1405
    iput v3, v1, Lnicoid/network238/okio/Segment;->limit:I

    .line 1406
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x2

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0
.end method

.method public bridge synthetic writeShort(I)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeShortLe(I)Lnicoid/network238/okio/Buffer;
    .registers 2

    int-to-short p1, p1

    .line 516
    invoke-static {p1}, Lnicoid/network238/okio/-SegmentedByteString;->reverseBytes(S)S

    move-result p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeShort(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic writeShortLe(I)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeShortLe(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p2, :cond_3

    if-lt p3, p2, :cond_2

    .line 473
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt p3, v0, :cond_1

    .line 474
    sget-object v0, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p4, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1

    .line 475
    :cond_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 476
    array-length p2, p1

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p3, p2}, Lnicoid/network238/okio/Buffer;->write([BII)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1

    .line 473
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p4, "endIndex > string.length: "

    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " > "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 472
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p4, "endIndex < beginIndex: "

    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " < "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 471
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "beginIndex < 0: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 461
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 458
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0, p2}, Lnicoid/network238/okio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lnicoid/network238/okio/BufferedSink;
    .registers 5

    .line 79
    invoke-virtual {p0, p1, p2, p3, p4}, Lnicoid/network238/okio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/BufferedSink;
    .registers 3

    .line 79
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public final writeTo(Ljava/io/OutputStream;)Lnicoid/network238/okio/Buffer;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/Buffer;->writeTo$default(Lnicoid/network238/okio/Buffer;Ljava/io/OutputStream;JILjava/lang/Object;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public final writeTo(Ljava/io/OutputStream;J)Lnicoid/network238/okio/Buffer;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 260
    iget-wide v0, p0, Lnicoid/network238/okio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 262
    iget-object p2, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    move-object v0, p2

    move-wide p2, v4

    :cond_0
    :goto_0
    const-wide/16 v1, 0x0

    cmp-long v1, p2, v1

    if-lez v1, :cond_1

    .line 264
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    .line 750
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int v1, v1

    .line 265
    iget-object v2, v0, Lnicoid/network238/okio/Segment;->data:[B

    iget v3, v0, Lnicoid/network238/okio/Segment;->pos:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 267
    iget v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr v2, v1

    iput v2, v0, Lnicoid/network238/okio/Segment;->pos:I

    .line 268
    iget-wide v3, p0, Lnicoid/network238/okio/Buffer;->size:J

    int-to-long v5, v1

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lnicoid/network238/okio/Buffer;->size:J

    sub-long/2addr p2, v5

    .line 271
    iget v1, v0, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v2, v1, :cond_0

    .line 273
    invoke-virtual {v0}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    .line 274
    iput-object v1, p0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 275
    invoke-static {v0}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    move-object v0, v1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 450
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p2, :cond_a

    if-lt p3, p2, :cond_9

    .line 1224
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt p3, v0, :cond_8

    :goto_0
    if-ge p2, p3, :cond_7

    .line 1229
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x80

    if-ge v0, v1, :cond_1

    .line 1233
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v2

    .line 1234
    iget-object v3, v2, Lnicoid/network238/okio/Segment;->data:[B

    .line 1235
    iget v4, v2, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v4, p2

    rsub-int v5, v4, 0x2000

    .line 1236
    invoke-static {p3, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    add-int/lit8 v6, p2, 0x1

    add-int/2addr p2, v4

    int-to-byte v0, v0

    .line 1239
    aput-byte v0, v3, p2

    move p2, v6

    :goto_1
    if-ge p2, v5, :cond_0

    .line 1244
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ge v0, v1, :cond_0

    add-int/lit8 v6, p2, 0x1

    add-int/2addr p2, v4

    int-to-byte v0, v0

    .line 1246
    aput-byte v0, v3, p2

    move p2, v6

    goto :goto_1

    :cond_0
    add-int/2addr v4, p2

    .line 1249
    iget v0, v2, Lnicoid/network238/okio/Segment;->limit:I

    sub-int/2addr v4, v0

    add-int/2addr v0, v4

    .line 1250
    iput v0, v2, Lnicoid/network238/okio/Segment;->limit:I

    .line 1251
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    int-to-long v2, v4

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    goto :goto_0

    :cond_1
    const/16 v2, 0x800

    if-ge v0, v2, :cond_2

    .line 1256
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v3

    .line 1258
    iget-object v4, v3, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v6, v0, 0x6

    or-int/lit16 v6, v6, 0xc0

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    add-int/lit8 v6, v5, 0x1

    and-int/lit8 v0, v0, 0x3f

    or-int/2addr v0, v1

    int-to-byte v0, v0

    .line 1259
    aput-byte v0, v4, v6

    add-int/2addr v5, v2

    .line 1261
    iput v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    .line 1262
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x2

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    const v2, 0xd800

    const v3, 0xe000

    const v4, 0xdc00

    const/16 v5, 0x3f

    if-gt v2, v0, :cond_5

    if-ge v0, v4, :cond_5

    add-int/lit8 v2, p2, 0x1

    if-ge v2, p3, :cond_3

    .line 1268
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    goto :goto_2

    :cond_3
    const/4 v6, 0x0

    :goto_2
    if-gt v4, v6, :cond_4

    if-ge v6, v3, :cond_4

    .line 1274
    invoke-static {v0, v6}, Lnicoid/network238/okio/internal/_Utf16Kt;->combineSurrogates(II)I

    move-result v0

    .line 1277
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v3

    .line 1279
    iget-object v4, v3, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, v3, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v7, v0, 0x12

    or-int/lit16 v7, v7, 0xf0

    int-to-byte v7, v7

    aput-byte v7, v4, v6

    add-int/lit8 v7, v6, 0x1

    shr-int/lit8 v8, v0, 0xc

    and-int/2addr v8, v5

    or-int/2addr v8, v1

    int-to-byte v8, v8

    .line 1280
    aput-byte v8, v4, v7

    add-int/lit8 v7, v6, 0x2

    shr-int/lit8 v8, v0, 0x6

    and-int/2addr v8, v5

    or-int/2addr v8, v1

    int-to-byte v8, v8

    .line 1281
    aput-byte v8, v4, v7

    add-int/lit8 v7, v6, 0x3

    and-int/2addr v0, v5

    or-int/2addr v0, v1

    int-to-byte v0, v0

    .line 1282
    aput-byte v0, v4, v7

    add-int/2addr v6, v2

    .line 1284
    iput v6, v3, Lnicoid/network238/okio/Segment;->limit:I

    .line 1285
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    add-int/lit8 p2, p2, 0x2

    goto/16 :goto_0

    :cond_4
    nop

    .line 1271
    invoke-virtual {p0, v5}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move p2, v2

    goto/16 :goto_0

    :cond_5
    if-gt v4, v0, :cond_6

    if-ge v0, v3, :cond_6

    .line 1292
    invoke-virtual {p0, v5}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    add-int/lit8 p2, p2, 0x1

    goto/16 :goto_0

    :cond_6
    nop

    .line 1298
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v3

    .line 1300
    iget-object v4, v3, Lnicoid/network238/okio/Segment;->data:[B

    iget v6, v3, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v7, v0, 0xc

    or-int/lit16 v7, v7, 0xe0

    int-to-byte v7, v7

    aput-byte v7, v4, v6

    add-int/lit8 v7, v6, 0x1

    shr-int/lit8 v8, v0, 0x6

    and-int/2addr v8, v5

    or-int/2addr v8, v1

    int-to-byte v5, v8

    .line 1301
    aput-byte v5, v4, v7

    add-int/lit8 v5, v6, 0x2

    and-int/lit8 v0, v0, 0x3f

    or-int/2addr v0, v1

    int-to-byte v0, v0

    .line 1302
    aput-byte v0, v4, v5

    add-int/2addr v6, v2

    .line 1304
    iput v6, v3, Lnicoid/network238/okio/Segment;->limit:I

    .line 1305
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x3

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    add-int/lit8 p2, p2, 0x1

    goto/16 :goto_0

    :cond_7
    return-object p0

    .line 1224
    :cond_8
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "endIndex > string.length: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " > "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1223
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "endIndex < beginIndex: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, " < "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1221
    :cond_a
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "beginIndex < 0: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/BufferedSink;
    .registers 4

    .line 79
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;II)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

.method public writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;
    .registers 10

    const/16 v0, 0x80

    if-ge p1, v0, :cond_0

    .line 1315
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    return-object p0

    :cond_0
    const/16 v1, 0x800

    const/16 v2, 0x3f

    if-ge p1, v1, :cond_1

    .line 1319
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v3

    .line 1321
    iget-object v4, v3, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v6, p1, 0x6

    or-int/lit16 v6, v6, 0xc0

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    add-int/lit8 v6, v5, 0x1

    and-int/2addr p1, v2

    or-int/2addr p1, v0

    int-to-byte p1, p1

    .line 1322
    aput-byte p1, v4, v6

    add-int/2addr v5, v1

    .line 1324
    iput v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    .line 1325
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x2

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0

    :cond_1
    const v1, 0xd800

    if-gt v1, p1, :cond_2

    const v1, 0xe000

    if-ge p1, v1, :cond_2

    .line 1329
    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    return-object p0

    :cond_2
    const/high16 v1, 0x10000

    if-ge p1, v1, :cond_3

    .line 1333
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v3

    .line 1335
    iget-object v4, v3, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v6, p1, 0xc

    or-int/lit16 v6, v6, 0xe0

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    add-int/lit8 v6, v5, 0x1

    shr-int/lit8 v7, p1, 0x6

    and-int/2addr v7, v2

    or-int/2addr v7, v0

    int-to-byte v7, v7

    .line 1336
    aput-byte v7, v4, v6

    add-int/lit8 v6, v5, 0x2

    and-int/2addr p1, v2

    or-int/2addr p1, v0

    int-to-byte p1, p1

    .line 1337
    aput-byte p1, v4, v6

    add-int/2addr v5, v1

    .line 1339
    iput v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    .line 1340
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x3

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0

    :cond_3
    const v1, 0x10ffff

    if-gt p1, v1, :cond_4

    .line 1344
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v3

    .line 1346
    iget-object v4, v3, Lnicoid/network238/okio/Segment;->data:[B

    iget v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    shr-int/lit8 v6, p1, 0x12

    or-int/lit16 v6, v6, 0xf0

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    add-int/lit8 v6, v5, 0x1

    shr-int/lit8 v7, p1, 0xc

    and-int/2addr v7, v2

    or-int/2addr v7, v0

    int-to-byte v7, v7

    .line 1347
    aput-byte v7, v4, v6

    add-int/lit8 v6, v5, 0x2

    shr-int/lit8 v7, p1, 0x6

    and-int/2addr v7, v2

    or-int/2addr v7, v0

    int-to-byte v7, v7

    .line 1348
    aput-byte v7, v4, v6

    add-int/lit8 v6, v5, 0x3

    and-int/2addr p1, v2

    or-int/2addr p1, v0

    int-to-byte p1, p1

    .line 1349
    aput-byte p1, v4, v6

    add-int/2addr v5, v1

    .line 1351
    iput v5, v3, Lnicoid/network238/okio/Segment;->limit:I

    .line 1352
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-object p0

    .line 1355
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected code point: 0x"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lnicoid/network238/okio/-SegmentedByteString;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic writeUtf8CodePoint(I)Lnicoid/network238/okio/BufferedSink;
    .registers 2

    .line 79
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/Buffer;->writeUtf8CodePoint(I)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    return-object p1
.end method

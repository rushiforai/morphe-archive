.class public final Lokio/Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lokio/BufferedSource;
.implements Lokio/BufferedSink;
.implements Ljava/lang/Cloneable;
.implements Ljava/nio/channels/ByteChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokio/Buffer$UnsafeCursor;,
        Lokio/Buffer$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u00b6\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u001a\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0005\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0012\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0010\n\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0018\u0018\u0000 \u009c\u00012\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0004\u009c\u0001\u009d\u0001B\u0005\u00a2\u0006\u0002\u0010\u0005J\u0008\u0010\u0006\u001a\u00020\u0000H\u0016J\u0006\u0010\u0011\u001a\u00020\u0012J\u0008\u0010\u0013\u001a\u00020\u0000H\u0016J\u0008\u0010\u0014\u001a\u00020\u0012H\u0016J\u0006\u0010\u0015\u001a\u00020\u000cJ$\u0010\u0016\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u00182\u0008\u0008\u0002\u0010\u0019\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u000cH\u0007J\"\u0010\u0016\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0019\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u000cJ\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J\u0008\u0010\u001f\u001a\u00020\u0000H\u0016J\u0008\u0010 \u001a\u00020\u0000H\u0016J\u0013\u0010!\u001a\u00020\"2\u0008\u0010#\u001a\u0004\u0018\u00010$H\u0096\u0002J\u0008\u0010%\u001a\u00020\"H\u0016J\u0008\u0010&\u001a\u00020\u0012H\u0016J\u0016\u0010\'\u001a\u00020(2\u0006\u0010)\u001a\u00020\u000cH\u0087\u0002\u00a2\u0006\u0002\u0008*J\u0015\u0010*\u001a\u00020(2\u0006\u0010+\u001a\u00020\u000cH\u0007\u00a2\u0006\u0002\u0008,J\u0008\u0010-\u001a\u00020.H\u0016J\u0018\u0010/\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u00100\u001a\u00020\u001cH\u0002J\u000e\u00101\u001a\u00020\u001c2\u0006\u00100\u001a\u00020\u001cJ\u000e\u00102\u001a\u00020\u001c2\u0006\u00100\u001a\u00020\u001cJ\u000e\u00103\u001a\u00020\u001c2\u0006\u00100\u001a\u00020\u001cJ\u0010\u00104\u001a\u00020\u000c2\u0006\u00105\u001a\u00020(H\u0016J\u0018\u00104\u001a\u00020\u000c2\u0006\u00105\u001a\u00020(2\u0006\u00106\u001a\u00020\u000cH\u0016J \u00104\u001a\u00020\u000c2\u0006\u00105\u001a\u00020(2\u0006\u00106\u001a\u00020\u000c2\u0006\u00107\u001a\u00020\u000cH\u0016J\u0010\u00104\u001a\u00020\u000c2\u0006\u00108\u001a\u00020\u001cH\u0016J\u0018\u00104\u001a\u00020\u000c2\u0006\u00108\u001a\u00020\u001c2\u0006\u00106\u001a\u00020\u000cH\u0016J\u0010\u00109\u001a\u00020\u000c2\u0006\u0010:\u001a\u00020\u001cH\u0016J\u0018\u00109\u001a\u00020\u000c2\u0006\u0010:\u001a\u00020\u001c2\u0006\u00106\u001a\u00020\u000cH\u0016J\u0008\u0010;\u001a\u00020<H\u0016J\u0008\u0010=\u001a\u00020\"H\u0016J\u0006\u0010>\u001a\u00020\u001cJ\u0008\u0010?\u001a\u00020\u0018H\u0016J\u0008\u0010@\u001a\u00020\u0001H\u0016J\u0018\u0010A\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00020\u000c2\u0006\u00108\u001a\u00020\u001cH\u0016J(\u0010A\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00020\u000c2\u0006\u00108\u001a\u00020\u001c2\u0006\u0010B\u001a\u00020.2\u0006\u0010\u001a\u001a\u00020.H\u0016J0\u0010A\u001a\u00020\"2\u0006\u0010C\u001a\u00020\n2\u0006\u0010D\u001a\u00020.2\u0006\u00108\u001a\u00020E2\u0006\u0010B\u001a\u00020.2\u0006\u0010F\u001a\u00020.H\u0002J\u0010\u0010G\u001a\u00020.2\u0006\u0010H\u001a\u00020IH\u0016J\u0010\u0010G\u001a\u00020.2\u0006\u0010H\u001a\u00020EH\u0016J \u0010G\u001a\u00020.2\u0006\u0010H\u001a\u00020E2\u0006\u0010\u0019\u001a\u00020.2\u0006\u0010\u001a\u001a\u00020.H\u0016J\u0018\u0010G\u001a\u00020\u000c2\u0006\u0010H\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0010\u0010J\u001a\u00020\u000c2\u0006\u0010H\u001a\u00020KH\u0016J\u0012\u0010L\u001a\u00020M2\u0008\u0008\u0002\u0010N\u001a\u00020MH\u0007J\u0008\u0010O\u001a\u00020(H\u0016J\u0008\u0010P\u001a\u00020EH\u0016J\u0010\u0010P\u001a\u00020E2\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0008\u0010Q\u001a\u00020\u001cH\u0016J\u0010\u0010Q\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0008\u0010R\u001a\u00020\u000cH\u0016J\u000e\u0010S\u001a\u00020\u00002\u0006\u0010T\u001a\u00020<J\u0016\u0010S\u001a\u00020\u00002\u0006\u0010T\u001a\u00020<2\u0006\u0010\u001a\u001a\u00020\u000cJ \u0010S\u001a\u00020\u00122\u0006\u0010T\u001a\u00020<2\u0006\u0010\u001a\u001a\u00020\u000c2\u0006\u0010U\u001a\u00020\"H\u0002J\u0010\u0010V\u001a\u00020\u00122\u0006\u0010H\u001a\u00020EH\u0016J\u0018\u0010V\u001a\u00020\u00122\u0006\u0010H\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0008\u0010W\u001a\u00020\u000cH\u0016J\u0008\u0010X\u001a\u00020.H\u0016J\u0008\u0010Y\u001a\u00020.H\u0016J\u0008\u0010Z\u001a\u00020\u000cH\u0016J\u0008\u0010[\u001a\u00020\u000cH\u0016J\u0008\u0010\\\u001a\u00020]H\u0016J\u0008\u0010^\u001a\u00020]H\u0016J\u0010\u0010_\u001a\u00020\u001e2\u0006\u0010`\u001a\u00020aH\u0016J\u0018\u0010_\u001a\u00020\u001e2\u0006\u0010\u001a\u001a\u00020\u000c2\u0006\u0010`\u001a\u00020aH\u0016J\u0012\u0010b\u001a\u00020M2\u0008\u0008\u0002\u0010N\u001a\u00020MH\u0007J\u0008\u0010c\u001a\u00020\u001eH\u0016J\u0010\u0010c\u001a\u00020\u001e2\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0008\u0010d\u001a\u00020.H\u0016J\n\u0010e\u001a\u0004\u0018\u00010\u001eH\u0016J\u0015\u0010e\u001a\u00020\u001e2\u0006\u0010f\u001a\u00020\u000cH\u0000\u00a2\u0006\u0002\u0008gJ\u0008\u0010h\u001a\u00020\u001eH\u0016J\u0010\u0010h\u001a\u00020\u001e2\u0006\u0010i\u001a\u00020\u000cH\u0016J\u0010\u0010j\u001a\u00020\"2\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0010\u0010k\u001a\u00020\u00122\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J8\u0010l\u001a\u0002Hm\"\u0004\u0008\u0000\u0010m2\u0006\u00106\u001a\u00020\u000c2\u001a\u0010n\u001a\u0016\u0012\u0006\u0012\u0004\u0018\u00010\n\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u0002Hm0oH\u0082\u0008\u00a2\u0006\u0002\u0010pJ\u0010\u0010q\u001a\u00020.2\u0006\u0010r\u001a\u00020sH\u0016J\u001f\u0010t\u001a\u00020.2\u0006\u0010r\u001a\u00020s2\u0008\u0008\u0002\u0010u\u001a\u00020\"H\u0000\u00a2\u0006\u0002\u0008vJ\u0006\u0010w\u001a\u00020\u001cJ\u0006\u0010x\u001a\u00020\u001cJ\u0006\u0010y\u001a\u00020\u001cJ\r\u0010\r\u001a\u00020\u000cH\u0007\u00a2\u0006\u0002\u0008zJ\u0010\u0010{\u001a\u00020\u00122\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0006\u0010|\u001a\u00020\u001cJ\u000e\u0010|\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020.J\u0008\u0010}\u001a\u00020~H\u0016J\u0008\u0010\u007f\u001a\u00020\u001eH\u0016J\u0018\u0010\u0080\u0001\u001a\u00020\n2\u0007\u0010\u0081\u0001\u001a\u00020.H\u0000\u00a2\u0006\u0003\u0008\u0082\u0001J\u0012\u0010\u0083\u0001\u001a\u00020.2\u0007\u0010\u0084\u0001\u001a\u00020IH\u0016J\u0012\u0010\u0083\u0001\u001a\u00020\u00002\u0007\u0010\u0084\u0001\u001a\u00020EH\u0016J\"\u0010\u0083\u0001\u001a\u00020\u00002\u0007\u0010\u0084\u0001\u001a\u00020E2\u0006\u0010\u0019\u001a\u00020.2\u0006\u0010\u001a\u001a\u00020.H\u0016J\u001a\u0010\u0083\u0001\u001a\u00020\u00122\u0007\u0010\u0084\u0001\u001a\u00020\u00002\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0012\u0010\u0083\u0001\u001a\u00020\u00002\u0007\u0010\u0085\u0001\u001a\u00020\u001cH\u0016J\u001b\u0010\u0083\u0001\u001a\u00020\u00022\u0008\u0010\u0084\u0001\u001a\u00030\u0086\u00012\u0006\u0010\u001a\u001a\u00020\u000cH\u0016J\u0013\u0010\u0087\u0001\u001a\u00020\u000c2\u0008\u0010\u0084\u0001\u001a\u00030\u0086\u0001H\u0016J\u0011\u0010\u0088\u0001\u001a\u00020\u00002\u0006\u00105\u001a\u00020.H\u0016J\u0012\u0010\u0089\u0001\u001a\u00020\u00002\u0007\u0010\u008a\u0001\u001a\u00020\u000cH\u0016J\u0012\u0010\u008b\u0001\u001a\u00020\u00002\u0007\u0010\u008a\u0001\u001a\u00020\u000cH\u0016J\u0012\u0010\u008c\u0001\u001a\u00020\u00002\u0007\u0010\u008d\u0001\u001a\u00020.H\u0016J\u0012\u0010\u008e\u0001\u001a\u00020\u00002\u0007\u0010\u008d\u0001\u001a\u00020.H\u0016J\u0012\u0010\u008f\u0001\u001a\u00020\u00002\u0007\u0010\u008a\u0001\u001a\u00020\u000cH\u0016J\u0012\u0010\u0090\u0001\u001a\u00020\u00002\u0007\u0010\u008a\u0001\u001a\u00020\u000cH\u0016J\u0012\u0010\u0091\u0001\u001a\u00020\u00002\u0007\u0010\u0092\u0001\u001a\u00020.H\u0016J\u0012\u0010\u0093\u0001\u001a\u00020\u00002\u0007\u0010\u0092\u0001\u001a\u00020.H\u0016J\u001a\u0010\u0094\u0001\u001a\u00020\u00002\u0007\u0010\u0095\u0001\u001a\u00020\u001e2\u0006\u0010`\u001a\u00020aH\u0016J,\u0010\u0094\u0001\u001a\u00020\u00002\u0007\u0010\u0095\u0001\u001a\u00020\u001e2\u0007\u0010\u0096\u0001\u001a\u00020.2\u0007\u0010\u0097\u0001\u001a\u00020.2\u0006\u0010`\u001a\u00020aH\u0016J\u001b\u0010\u0098\u0001\u001a\u00020\u00002\u0006\u0010\u0017\u001a\u00020\u00182\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u000cH\u0007J\u0012\u0010\u0099\u0001\u001a\u00020\u00002\u0007\u0010\u0095\u0001\u001a\u00020\u001eH\u0016J$\u0010\u0099\u0001\u001a\u00020\u00002\u0007\u0010\u0095\u0001\u001a\u00020\u001e2\u0007\u0010\u0096\u0001\u001a\u00020.2\u0007\u0010\u0097\u0001\u001a\u00020.H\u0016J\u0012\u0010\u009a\u0001\u001a\u00020\u00002\u0007\u0010\u009b\u0001\u001a\u00020.H\u0016R\u0014\u0010\u0006\u001a\u00020\u00008VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008R\u0014\u0010\t\u001a\u0004\u0018\u00010\n8\u0000@\u0000X\u0081\u000e\u00a2\u0006\u0002\n\u0000R&\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\u000c8\u0007@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u009e\u0001"
    }
    d2 = {
        "Lokio/Buffer;",
        "Lokio/BufferedSource;",
        "Lokio/BufferedSink;",
        "",
        "Ljava/nio/channels/ByteChannel;",
        "()V",
        "buffer",
        "getBuffer",
        "()Lokio/Buffer;",
        "head",
        "Lokio/Segment;",
        "<set-?>",
        "",
        "size",
        "()J",
        "setSize$jvm",
        "(J)V",
        "clear",
        "",
        "clone",
        "close",
        "completeSegmentByteCount",
        "copyTo",
        "out",
        "Ljava/io/OutputStream;",
        "offset",
        "byteCount",
        "digest",
        "Lokio/ByteString;",
        "algorithm",
        "",
        "emit",
        "emitCompleteSegments",
        "equals",
        "",
        "other",
        "",
        "exhausted",
        "flush",
        "get",
        "",
        "pos",
        "getByte",
        "index",
        "-deprecated_getByte",
        "hashCode",
        "",
        "hmac",
        "key",
        "hmacSha1",
        "hmacSha256",
        "hmacSha512",
        "indexOf",
        "b",
        "fromIndex",
        "toIndex",
        "bytes",
        "indexOfElement",
        "targetBytes",
        "inputStream",
        "Ljava/io/InputStream;",
        "isOpen",
        "md5",
        "outputStream",
        "peek",
        "rangeEquals",
        "bytesOffset",
        "segment",
        "segmentPos",
        "",
        "bytesLimit",
        "read",
        "sink",
        "Ljava/nio/ByteBuffer;",
        "readAll",
        "Lokio/Sink;",
        "readAndWriteUnsafe",
        "Lokio/Buffer$UnsafeCursor;",
        "unsafeCursor",
        "readByte",
        "readByteArray",
        "readByteString",
        "readDecimalLong",
        "readFrom",
        "input",
        "forever",
        "readFully",
        "readHexadecimalUnsignedLong",
        "readInt",
        "readIntLe",
        "readLong",
        "readLongLe",
        "readShort",
        "",
        "readShortLe",
        "readString",
        "charset",
        "Ljava/nio/charset/Charset;",
        "readUnsafe",
        "readUtf8",
        "readUtf8CodePoint",
        "readUtf8Line",
        "newline",
        "readUtf8Line$jvm",
        "readUtf8LineStrict",
        "limit",
        "request",
        "require",
        "seek",
        "T",
        "lambda",
        "Lkotlin/Function2;",
        "(JLkotlin/jvm/functions/Function2;)Ljava/lang/Object;",
        "select",
        "options",
        "Lokio/Options;",
        "selectPrefix",
        "selectTruncated",
        "selectPrefix$jvm",
        "sha1",
        "sha256",
        "sha512",
        "-deprecated_size",
        "skip",
        "snapshot",
        "timeout",
        "Lokio/Timeout;",
        "toString",
        "writableSegment",
        "minimumCapacity",
        "writableSegment$jvm",
        "write",
        "source",
        "byteString",
        "Lokio/Source;",
        "writeAll",
        "writeByte",
        "writeDecimalLong",
        "v",
        "writeHexadecimalUnsignedLong",
        "writeInt",
        "i",
        "writeIntLe",
        "writeLong",
        "writeLongLe",
        "writeShort",
        "s",
        "writeShortLe",
        "writeString",
        "string",
        "beginIndex",
        "endIndex",
        "writeTo",
        "writeUtf8",
        "writeUtf8CodePoint",
        "codePoint",
        "Companion",
        "UnsafeCursor",
        "jvm"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xb
    }
.end annotation


# static fields
.field public static final Companion:Lokio/Buffer$Companion;

.field private static final DIGITS:[B


# instance fields
.field public head:Lokio/Segment;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private size:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lokio/Buffer$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lokio/Buffer$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lokio/Buffer;->Companion:Lokio/Buffer$Companion;

    .line 8
    .line 9
    const-string v0, "0123456789abcdef"

    .line 10
    .line 11
    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    sput-object v0, Lokio/Buffer;->DIGITS:[B

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic copyTo$default(Lokio/Buffer;Ljava/io/OutputStream;JJILjava/lang/Object;)Lokio/Buffer;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    and-int/lit8 p7, p6, 0x2

    .line 2
    .line 3
    if-eqz p7, :cond_0

    .line 4
    .line 5
    const-wide/16 p2, 0x0

    .line 6
    .line 7
    :cond_0
    move-wide v2, p2

    .line 8
    and-int/lit8 p2, p6, 0x4

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    iget-wide p2, p0, Lokio/Buffer;->size:J

    .line 13
    .line 14
    sub-long p4, p2, v2

    .line 15
    .line 16
    :cond_1
    move-object v0, p0

    .line 17
    move-object v1, p1

    .line 18
    move-wide v4, p4

    .line 19
    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->copyTo(Ljava/io/OutputStream;JJ)Lokio/Buffer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static bridge synthetic copyTo$default(Lokio/Buffer;Lokio/Buffer;JJILjava/lang/Object;)Lokio/Buffer;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_0

    const-wide/16 p2, 0x0

    :cond_0
    move-wide v2, p2

    and-int/lit8 p2, p6, 0x4

    if-eqz p2, :cond_1

    .line 24
    iget-wide p2, p0, Lokio/Buffer;->size:J

    sub-long p4, p2, v2

    :cond_1
    move-object v0, p0

    move-object v1, p1

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->copyTo(Lokio/Buffer;JJ)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method private final digest(Ljava/lang/String;)Lokio/ByteString;
    .locals 4

    .line 1
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lokio/Segment;->data:[B

    .line 10
    .line 11
    iget v1, p0, Lokio/Segment;->pos:I

    .line 12
    .line 13
    iget v2, p0, Lokio/Segment;->limit:I

    .line 14
    .line 15
    sub-int/2addr v2, v1

    .line 16
    invoke-virtual {p1, v0, v1, v2}, Ljava/security/MessageDigest;->update([BII)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 24
    .line 25
    .line 26
    :cond_0
    :goto_0
    if-eq v0, p0, :cond_1

    .line 27
    .line 28
    iget-object v1, v0, Lokio/Segment;->data:[B

    .line 29
    .line 30
    iget v2, v0, Lokio/Segment;->pos:I

    .line 31
    .line 32
    iget v3, v0, Lokio/Segment;->limit:I

    .line 33
    .line 34
    sub-int/2addr v3, v2

    .line 35
    invoke-virtual {p1, v1, v2, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 36
    .line 37
    .line 38
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 39
    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    new-instance p0, Lokio/ByteString;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    invoke-direct {p0, p1}, Lokio/ByteString;-><init>([B)V

    .line 56
    .line 57
    .line 58
    return-object p0
.end method

.method private final hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    .line 6
    .line 7
    invoke-virtual {p2}, Lokio/ByteString;->internalArray$jvm()[B

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-direct {v1, p2, p1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lokio/Segment;->data:[B

    .line 22
    .line 23
    iget p2, p0, Lokio/Segment;->pos:I

    .line 24
    .line 25
    iget v1, p0, Lokio/Segment;->limit:I

    .line 26
    .line 27
    sub-int/2addr v1, p2

    .line 28
    invoke-virtual {v0, p1, p2, v1}, Ljavax/crypto/Mac;->update([BII)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lokio/Segment;->next:Lokio/Segment;

    .line 32
    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 36
    .line 37
    .line 38
    :cond_0
    :goto_0
    if-eq p1, p0, :cond_1

    .line 39
    .line 40
    iget-object p2, p1, Lokio/Segment;->data:[B

    .line 41
    .line 42
    iget v1, p1, Lokio/Segment;->pos:I

    .line 43
    .line 44
    iget v2, p1, Lokio/Segment;->limit:I

    .line 45
    .line 46
    sub-int/2addr v2, v1

    .line 47
    invoke-virtual {v0, p2, v1, v2}, Ljavax/crypto/Mac;->update([BII)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p1, Lokio/Segment;->next:Lokio/Segment;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    new-instance p0, Lokio/ByteString;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljavax/crypto/Mac;->doFinal()[B

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    invoke-direct {p0, p1}, Lokio/ByteString;-><init>([B)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    return-object p0

    .line 71
    :catch_0
    move-exception p0

    .line 72
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    return-object p0
.end method

.method private final rangeEquals(Lokio/Segment;I[BII)Z
    .locals 4

    .line 56
    iget p0, p1, Lokio/Segment;->limit:I

    .line 57
    iget-object v0, p1, Lokio/Segment;->data:[B

    :goto_0
    if-ge p4, p5, :cond_3

    if-ne p2, p0, :cond_1

    .line 58
    iget-object p0, p1, Lokio/Segment;->next:Lokio/Segment;

    if-nez p0, :cond_0

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 59
    :cond_0
    iget-object p1, p0, Lokio/Segment;->data:[B

    .line 60
    iget p2, p0, Lokio/Segment;->pos:I

    .line 61
    iget v0, p0, Lokio/Segment;->limit:I

    move-object v3, p1

    move-object p1, p0

    move p0, v0

    move-object v0, v3

    .line 62
    :cond_1
    aget-byte v1, v0, p2

    aget-byte v2, p3, p4

    if-eq v1, v2, :cond_2

    const/4 p0, 0x0

    return p0

    :cond_2
    add-int/lit8 p2, p2, 0x1

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method public static bridge synthetic readAndWriteUnsafe$default(Lokio/Buffer;Lokio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lokio/Buffer$UnsafeCursor;
    .locals 0
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    new-instance p1, Lokio/Buffer$UnsafeCursor;

    .line 6
    .line 7
    invoke-direct {p1}, Lokio/Buffer$UnsafeCursor;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lokio/Buffer;->readAndWriteUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private final readFrom(Ljava/io/InputStream;JZ)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :goto_0
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p2, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    if-eqz p4, :cond_1

    .line 8
    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget v1, v0, Lokio/Segment;->limit:I

    .line 15
    .line 16
    rsub-int v1, v1, 0x2000

    .line 17
    .line 18
    int-to-long v1, v1

    .line 19
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    long-to-int v1, v1

    .line 24
    iget-object v2, v0, Lokio/Segment;->data:[B

    .line 25
    .line 26
    iget v3, v0, Lokio/Segment;->limit:I

    .line 27
    .line 28
    invoke-virtual {p1, v2, v3, v1}, Ljava/io/InputStream;->read([BII)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v2, -0x1

    .line 33
    if-ne v1, v2, :cond_3

    .line 34
    .line 35
    if-eqz p4, :cond_2

    .line 36
    .line 37
    :cond_1
    return-void

    .line 38
    :cond_2
    invoke-static {}, Ll/vg3;->a()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_3
    iget v2, v0, Lokio/Segment;->limit:I

    .line 43
    .line 44
    add-int/2addr v2, v1

    .line 45
    iput v2, v0, Lokio/Segment;->limit:I

    .line 46
    .line 47
    iget-wide v2, p0, Lokio/Buffer;->size:J

    .line 48
    .line 49
    int-to-long v0, v1

    .line 50
    add-long/2addr v2, v0

    .line 51
    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 52
    .line 53
    sub-long/2addr p2, v0

    .line 54
    goto :goto_0
.end method

.method public static bridge synthetic readUnsafe$default(Lokio/Buffer;Lokio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lokio/Buffer$UnsafeCursor;
    .locals 0
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    new-instance p1, Lokio/Buffer$UnsafeCursor;

    .line 6
    .line 7
    invoke-direct {p1}, Lokio/Buffer$UnsafeCursor;-><init>()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lokio/Buffer;->readUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private final seek(JLkotlin/jvm/functions/Function2;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(J",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Lokio/Segment;",
            "-",
            "Ljava/lang/Long;",
            "+TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    sub-long/2addr v1, p1

    .line 10
    cmp-long v1, v1, p1

    .line 11
    .line 12
    if-gez v1, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    :goto_0
    cmp-long p0, v1, p1

    .line 19
    .line 20
    if-lez p0, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget p0, v0, Lokio/Segment;->limit:I

    .line 30
    .line 31
    iget v3, v0, Lokio/Segment;->pos:I

    .line 32
    .line 33
    sub-int/2addr p0, v3

    .line 34
    int-to-long v3, p0

    .line 35
    sub-long/2addr v1, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p3, v0, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    const-wide/16 v1, 0x0

    .line 47
    .line 48
    :goto_1
    iget p0, v0, Lokio/Segment;->limit:I

    .line 49
    .line 50
    iget v3, v0, Lokio/Segment;->pos:I

    .line 51
    .line 52
    sub-int/2addr p0, v3

    .line 53
    int-to-long v3, p0

    .line 54
    add-long/2addr v3, v1

    .line 55
    cmp-long p0, v3, p1

    .line 56
    .line 57
    if-lez p0, :cond_3

    .line 58
    .line 59
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p3, v0, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_3
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 69
    .line 70
    if-nez v0, :cond_4

    .line 71
    .line 72
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 73
    .line 74
    .line 75
    :cond_4
    move-wide v1, v3

    .line 76
    goto :goto_1

    .line 77
    :cond_5
    const-wide/16 p0, -0x1

    .line 78
    .line 79
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const/4 p1, 0x0

    .line 84
    invoke-interface {p3, p1, p0}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0
.end method

.method public static bridge synthetic selectPrefix$jvm$default(Lokio/Buffer;Lokio/Options;ZILjava/lang/Object;)I
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->selectPrefix$jvm(Lokio/Options;Z)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static bridge synthetic writeTo$default(Lokio/Buffer;Ljava/io/OutputStream;JILjava/lang/Object;)Lokio/Buffer;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    and-int/lit8 p4, p4, 0x2

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget-wide p2, p0, Lokio/Buffer;->size:J

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->writeTo(Ljava/io/OutputStream;J)Lokio/Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final -deprecated_getByte(J)B
    .locals 0
    .annotation runtime Lkotlin/Deprecated;
    .end annotation

    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->getByte(J)B

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final -deprecated_size()J
    .locals 2
    .annotation runtime Lkotlin/Deprecated;
    .end annotation

    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public buffer()Lokio/Buffer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    return-object p0
.end method

.method public final clear()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->skip(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0

    .line 100
    invoke-virtual {p0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lokio/Buffer;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lokio/Buffer;

    .line 2
    .line 3
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lokio/Buffer;->size:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-virtual {v1}, Lokio/Segment;->sharedCopy()Lokio/Segment;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 27
    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object v2, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 34
    .line 35
    iput-object v2, v1, Lokio/Segment;->prev:Lokio/Segment;

    .line 36
    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 40
    .line 41
    .line 42
    :cond_3
    iget-object v1, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 43
    .line 44
    if-nez v1, :cond_4

    .line 45
    .line 46
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object v1, v1, Lokio/Segment;->prev:Lokio/Segment;

    .line 50
    .line 51
    iput-object v1, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 52
    .line 53
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 54
    .line 55
    if-nez v1, :cond_5

    .line 56
    .line 57
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 58
    .line 59
    .line 60
    :cond_5
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 61
    .line 62
    :goto_0
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 63
    .line 64
    if-eq v1, v2, :cond_9

    .line 65
    .line 66
    iget-object v2, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 67
    .line 68
    if-nez v2, :cond_6

    .line 69
    .line 70
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 71
    .line 72
    .line 73
    :cond_6
    iget-object v2, v2, Lokio/Segment;->prev:Lokio/Segment;

    .line 74
    .line 75
    if-nez v2, :cond_7

    .line 76
    .line 77
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 78
    .line 79
    .line 80
    :cond_7
    if-nez v1, :cond_8

    .line 81
    .line 82
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 83
    .line 84
    .line 85
    :cond_8
    invoke-virtual {v1}, Lokio/Segment;->sharedCopy()Lokio/Segment;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v2, v3}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 90
    .line 91
    .line 92
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_9
    iget-wide v1, p0, Lokio/Buffer;->size:J

    .line 96
    .line 97
    iput-wide v1, v0, Lokio/Buffer;->size:J

    .line 98
    .line 99
    return-object v0
.end method

.method public close()V
    .locals 0

    return-void
.end method

.method public final completeSegmentByteCount()J
    .locals 5

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    return-wide v2

    .line 10
    :cond_0
    iget-object p0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 11
    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p0, Lokio/Segment;->prev:Lokio/Segment;

    .line 18
    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 22
    .line 23
    .line 24
    :cond_2
    iget v2, p0, Lokio/Segment;->limit:I

    .line 25
    .line 26
    const/16 v3, 0x2000

    .line 27
    .line 28
    if-ge v2, v3, :cond_3

    .line 29
    .line 30
    iget-boolean v3, p0, Lokio/Segment;->owner:Z

    .line 31
    .line 32
    if-eqz v3, :cond_3

    .line 33
    .line 34
    iget p0, p0, Lokio/Segment;->pos:I

    .line 35
    .line 36
    sub-int/2addr v2, p0

    .line 37
    int-to-long v2, v2

    .line 38
    sub-long/2addr v0, v2

    .line 39
    :cond_3
    return-wide v0
.end method

.method public final copyTo(Ljava/io/OutputStream;)Lokio/Buffer;
    .locals 8
    .param p1    # Ljava/io/OutputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 126
    const/4 v6, 0x6

    const/4 v7, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v7}, Lokio/Buffer;->copyTo$default(Lokio/Buffer;Ljava/io/OutputStream;JJILjava/lang/Object;)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public final copyTo(Ljava/io/OutputStream;J)Lokio/Buffer;
    .locals 8
    .param p1    # Ljava/io/OutputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 116
    const/4 v6, 0x4

    const/4 v7, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-static/range {v0 .. v7}, Lokio/Buffer;->copyTo$default(Lokio/Buffer;Ljava/io/OutputStream;JJILjava/lang/Object;)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public final copyTo(Ljava/io/OutputStream;JJ)Lokio/Buffer;
    .locals 8
    .param p1    # Ljava/io/OutputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lokio/-Util;->checkOffsetAndCount(JJJ)V

    const-wide/16 p2, 0x0

    cmp-long p4, v4, p2

    if-nez p4, :cond_0

    goto :goto_2

    .line 118
    :cond_0
    iget-object p4, p0, Lokio/Buffer;->head:Lokio/Segment;

    :goto_0
    if-nez p4, :cond_1

    .line 119
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    :cond_1
    iget p5, p4, Lokio/Segment;->limit:I

    iget v0, p4, Lokio/Segment;->pos:I

    sub-int v1, p5, v0

    int-to-long v6, v1

    cmp-long v1, v2, v6

    if-ltz v1, :cond_2

    sub-int/2addr p5, v0

    int-to-long v0, p5

    sub-long/2addr v2, v0

    .line 120
    iget-object p4, p4, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_0

    :cond_2
    move-object v0, p4

    move-wide p4, v4

    :goto_1
    cmp-long v1, p4, p2

    if-lez v1, :cond_4

    if-nez v0, :cond_3

    .line 121
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    :cond_3
    iget v1, v0, Lokio/Segment;->pos:I

    int-to-long v4, v1

    add-long/2addr v4, v2

    long-to-int v1, v4

    .line 122
    iget v2, v0, Lokio/Segment;->limit:I

    sub-int/2addr v2, v1

    int-to-long v2, v2

    .line 123
    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 124
    iget-object v3, v0, Lokio/Segment;->data:[B

    invoke-virtual {p1, v3, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v1, v2

    sub-long/2addr p4, v1

    .line 125
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    move-wide v2, p2

    goto :goto_1

    :cond_4
    :goto_2
    return-object p0
.end method

.method public final copyTo(Lokio/Buffer;JJ)Lokio/Buffer;
    .locals 8
    .param p1    # Lokio/Buffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 5
    .line 6
    move-wide v2, p2

    .line 7
    move-wide v4, p4

    .line 8
    invoke-static/range {v0 .. v5}, Lokio/-Util;->checkOffsetAndCount(JJJ)V

    .line 9
    .line 10
    .line 11
    const-wide/16 p2, 0x0

    .line 12
    .line 13
    cmp-long p4, v4, p2

    .line 14
    .line 15
    if-nez p4, :cond_0

    .line 16
    .line 17
    goto :goto_3

    .line 18
    :cond_0
    iget-wide p4, p1, Lokio/Buffer;->size:J

    .line 19
    .line 20
    add-long/2addr p4, v4

    .line 21
    iput-wide p4, p1, Lokio/Buffer;->size:J

    .line 22
    .line 23
    iget-object p4, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 24
    .line 25
    :goto_0
    if-nez p4, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget p5, p4, Lokio/Segment;->limit:I

    .line 31
    .line 32
    iget v0, p4, Lokio/Segment;->pos:I

    .line 33
    .line 34
    sub-int v1, p5, v0

    .line 35
    .line 36
    int-to-long v6, v1

    .line 37
    cmp-long v1, v2, v6

    .line 38
    .line 39
    if-ltz v1, :cond_2

    .line 40
    .line 41
    sub-int/2addr p5, v0

    .line 42
    int-to-long v0, p5

    .line 43
    sub-long/2addr v2, v0

    .line 44
    iget-object p4, p4, Lokio/Segment;->next:Lokio/Segment;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    move-object v0, p4

    .line 48
    move-wide p4, v4

    .line 49
    :goto_1
    cmp-long v1, p4, p2

    .line 50
    .line 51
    if-lez v1, :cond_7

    .line 52
    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 56
    .line 57
    .line 58
    :cond_3
    invoke-virtual {v0}, Lokio/Segment;->sharedCopy()Lokio/Segment;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget v4, v1, Lokio/Segment;->pos:I

    .line 63
    .line 64
    long-to-int v2, v2

    .line 65
    add-int/2addr v4, v2

    .line 66
    iput v4, v1, Lokio/Segment;->pos:I

    .line 67
    .line 68
    long-to-int v2, p4

    .line 69
    add-int/2addr v4, v2

    .line 70
    iget v2, v1, Lokio/Segment;->limit:I

    .line 71
    .line 72
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    iput v2, v1, Lokio/Segment;->limit:I

    .line 77
    .line 78
    iget-object v2, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 79
    .line 80
    if-nez v2, :cond_4

    .line 81
    .line 82
    iput-object v1, v1, Lokio/Segment;->prev:Lokio/Segment;

    .line 83
    .line 84
    iput-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 85
    .line 86
    iput-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_4
    if-nez v2, :cond_5

    .line 90
    .line 91
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 92
    .line 93
    .line 94
    :cond_5
    iget-object v2, v2, Lokio/Segment;->prev:Lokio/Segment;

    .line 95
    .line 96
    if-nez v2, :cond_6

    .line 97
    .line 98
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 99
    .line 100
    .line 101
    :cond_6
    invoke-virtual {v2, v1}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 102
    .line 103
    .line 104
    :goto_2
    iget v2, v1, Lokio/Segment;->limit:I

    .line 105
    .line 106
    iget v1, v1, Lokio/Segment;->pos:I

    .line 107
    .line 108
    sub-int/2addr v2, v1

    .line 109
    int-to-long v1, v2

    .line 110
    sub-long/2addr p4, v1

    .line 111
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 112
    .line 113
    move-wide v2, p2

    .line 114
    goto :goto_1

    .line 115
    :cond_7
    :goto_3
    return-object p0
.end method

.method public emit()Lokio/Buffer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 6
    return-object p0
.end method

.method public bridge synthetic emit()Lokio/BufferedSink;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lokio/Buffer;->emit()Lokio/Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public emitCompleteSegments()Lokio/Buffer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 6
    return-object p0
.end method

.method public bridge synthetic emitCompleteSegments()Lokio/BufferedSink;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lokio/Buffer;->emitCompleteSegments()Lokio/Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 18
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    instance-of v3, v1, Lokio/Buffer;

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v3, :cond_1

    .line 13
    .line 14
    return v4

    .line 15
    :cond_1
    iget-wide v5, v0, Lokio/Buffer;->size:J

    .line 16
    .line 17
    check-cast v1, Lokio/Buffer;

    .line 18
    .line 19
    iget-wide v7, v1, Lokio/Buffer;->size:J

    .line 20
    .line 21
    cmp-long v3, v5, v7

    .line 22
    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    return v4

    .line 26
    :cond_2
    const-wide/16 v7, 0x0

    .line 27
    .line 28
    cmp-long v3, v5, v7

    .line 29
    .line 30
    if-nez v3, :cond_3

    .line 31
    .line 32
    return v2

    .line 33
    :cond_3
    iget-object v3, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 34
    .line 35
    if-nez v3, :cond_4

    .line 36
    .line 37
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 38
    .line 39
    .line 40
    :cond_4
    iget-object v1, v1, Lokio/Buffer;->head:Lokio/Segment;

    .line 41
    .line 42
    if-nez v1, :cond_5

    .line 43
    .line 44
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 45
    .line 46
    .line 47
    :cond_5
    iget v5, v3, Lokio/Segment;->pos:I

    .line 48
    .line 49
    iget v6, v1, Lokio/Segment;->pos:I

    .line 50
    .line 51
    move-wide v9, v7

    .line 52
    :goto_0
    iget-wide v11, v0, Lokio/Buffer;->size:J

    .line 53
    .line 54
    cmp-long v11, v9, v11

    .line 55
    .line 56
    if-gez v11, :cond_c

    .line 57
    .line 58
    iget v11, v3, Lokio/Segment;->limit:I

    .line 59
    .line 60
    sub-int/2addr v11, v5

    .line 61
    iget v12, v1, Lokio/Segment;->limit:I

    .line 62
    .line 63
    sub-int/2addr v12, v6

    .line 64
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    .line 65
    .line 66
    .line 67
    move-result v11

    .line 68
    int-to-long v11, v11

    .line 69
    move-wide v13, v7

    .line 70
    :goto_1
    cmp-long v15, v13, v11

    .line 71
    .line 72
    if-gez v15, :cond_7

    .line 73
    .line 74
    iget-object v15, v3, Lokio/Segment;->data:[B

    .line 75
    .line 76
    add-int/lit8 v16, v5, 0x1

    .line 77
    .line 78
    aget-byte v5, v15, v5

    .line 79
    .line 80
    iget-object v15, v1, Lokio/Segment;->data:[B

    .line 81
    .line 82
    add-int/lit8 v17, v6, 0x1

    .line 83
    .line 84
    aget-byte v6, v15, v6

    .line 85
    .line 86
    if-eq v5, v6, :cond_6

    .line 87
    .line 88
    return v4

    .line 89
    :cond_6
    const-wide/16 v5, 0x1

    .line 90
    .line 91
    add-long/2addr v13, v5

    .line 92
    move/from16 v5, v16

    .line 93
    .line 94
    move/from16 v6, v17

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_7
    iget v13, v3, Lokio/Segment;->limit:I

    .line 98
    .line 99
    if-ne v5, v13, :cond_9

    .line 100
    .line 101
    iget-object v3, v3, Lokio/Segment;->next:Lokio/Segment;

    .line 102
    .line 103
    if-nez v3, :cond_8

    .line 104
    .line 105
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 106
    .line 107
    .line 108
    :cond_8
    iget v5, v3, Lokio/Segment;->pos:I

    .line 109
    .line 110
    :cond_9
    iget v13, v1, Lokio/Segment;->limit:I

    .line 111
    .line 112
    if-ne v6, v13, :cond_b

    .line 113
    .line 114
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 115
    .line 116
    if-nez v1, :cond_a

    .line 117
    .line 118
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 119
    .line 120
    .line 121
    :cond_a
    iget v6, v1, Lokio/Segment;->pos:I

    .line 122
    .line 123
    :cond_b
    add-long/2addr v9, v11

    .line 124
    goto :goto_0

    .line 125
    :cond_c
    return v2
.end method

.method public exhausted()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public flush()V
    .locals 0

    return-void
.end method

.method public getBuffer()Lokio/Buffer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    return-object p0
.end method

.method public final getByte(J)B
    .locals 6
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v4, 0x1

    .line 4
    .line 5
    move-wide v2, p1

    .line 6
    invoke-static/range {v0 .. v5}, Lokio/-Util;->checkOffsetAndCount(JJJ)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 10
    .line 11
    if-eqz p1, :cond_5

    .line 12
    .line 13
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    sub-long/2addr v0, v2

    .line 18
    cmp-long p2, v0, v2

    .line 19
    .line 20
    if-gez p2, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    :goto_0
    cmp-long p0, v0, v2

    .line 27
    .line 28
    if-lez p0, :cond_1

    .line 29
    .line 30
    iget-object p1, p1, Lokio/Segment;->prev:Lokio/Segment;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget p0, p1, Lokio/Segment;->limit:I

    .line 38
    .line 39
    iget p2, p1, Lokio/Segment;->pos:I

    .line 40
    .line 41
    sub-int/2addr p0, p2

    .line 42
    int-to-long v4, p0

    .line 43
    sub-long/2addr v0, v4

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object p0, p1, Lokio/Segment;->data:[B

    .line 46
    .line 47
    iget p1, p1, Lokio/Segment;->pos:I

    .line 48
    .line 49
    int-to-long p1, p1

    .line 50
    add-long/2addr p1, v2

    .line 51
    sub-long/2addr p1, v0

    .line 52
    long-to-int p1, p1

    .line 53
    aget-byte p0, p0, p1

    .line 54
    .line 55
    return p0

    .line 56
    :cond_2
    const-wide/16 v0, 0x0

    .line 57
    .line 58
    :goto_1
    iget p0, p1, Lokio/Segment;->limit:I

    .line 59
    .line 60
    iget p2, p1, Lokio/Segment;->pos:I

    .line 61
    .line 62
    sub-int/2addr p0, p2

    .line 63
    int-to-long v4, p0

    .line 64
    add-long/2addr v4, v0

    .line 65
    cmp-long p0, v4, v2

    .line 66
    .line 67
    if-lez p0, :cond_3

    .line 68
    .line 69
    iget-object p0, p1, Lokio/Segment;->data:[B

    .line 70
    .line 71
    int-to-long p1, p2

    .line 72
    add-long/2addr p1, v2

    .line 73
    sub-long/2addr p1, v0

    .line 74
    long-to-int p1, p1

    .line 75
    aget-byte p0, p0, p1

    .line 76
    .line 77
    return p0

    .line 78
    :cond_3
    iget-object p1, p1, Lokio/Segment;->next:Lokio/Segment;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 83
    .line 84
    .line 85
    :cond_4
    move-wide v0, v4

    .line 86
    goto :goto_1

    .line 87
    :cond_5
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 88
    .line 89
    .line 90
    const/4 p0, 0x0

    .line 91
    throw p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    :cond_0
    iget v2, v0, Lokio/Segment;->pos:I

    .line 7
    .line 8
    iget v3, v0, Lokio/Segment;->limit:I

    .line 9
    .line 10
    :goto_0
    if-ge v2, v3, :cond_1

    .line 11
    .line 12
    mul-int/lit8 v1, v1, 0x1f

    .line 13
    .line 14
    iget-object v4, v0, Lokio/Segment;->data:[B

    .line 15
    .line 16
    aget-byte v4, v4, v2

    .line 17
    .line 18
    add-int/2addr v1, v4

    .line 19
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 30
    .line 31
    if-ne v0, v2, :cond_0

    .line 32
    .line 33
    return v1

    .line 34
    :cond_3
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public final hmacSha1(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "HmacSHA1"

    .line 5
    .line 6
    invoke-direct {p0, v0, p1}, Lokio/Buffer;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final hmacSha256(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "HmacSHA256"

    .line 5
    .line 6
    invoke-direct {p0, v0, p1}, Lokio/Buffer;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final hmacSha512(Lokio/ByteString;)Lokio/ByteString;
    .locals 1
    .param p1    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "HmacSHA512"

    .line 5
    .line 6
    invoke-direct {p0, v0, p1}, Lokio/Buffer;->hmac(Ljava/lang/String;Lokio/ByteString;)Lokio/ByteString;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public indexOf(B)J
    .locals 6

    const-wide/16 v2, 0x0

    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    .line 324
    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->indexOf(BJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public indexOf(BJ)J
    .locals 6

    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    .line 300
    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->indexOf(BJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public indexOf(BJJ)J
    .locals 9

    const-wide/16 v0, 0x0

    cmp-long v2, v0, p2

    if-gtz v2, :cond_10

    cmp-long v2, p4, p2

    if-ltz v2, :cond_10

    .line 301
    iget-wide v2, p0, Lokio/Buffer;->size:J

    cmp-long v4, p4, v2

    if-lez v4, :cond_0

    move-wide p4, v2

    :cond_0
    cmp-long v2, p2, p4

    const-wide/16 v3, -0x1

    if-nez v2, :cond_1

    return-wide v3

    .line 302
    :cond_1
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v2, :cond_f

    .line 303
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v5

    sub-long/2addr v5, p2

    cmp-long v5, v5, p2

    if-gez v5, :cond_8

    .line 304
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    move-result-wide v0

    :goto_0
    cmp-long p0, v0, p2

    if-lez p0, :cond_3

    .line 305
    iget-object v2, v2, Lokio/Segment;->prev:Lokio/Segment;

    if-nez v2, :cond_2

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 306
    :cond_2
    iget p0, v2, Lokio/Segment;->limit:I

    iget v5, v2, Lokio/Segment;->pos:I

    sub-int/2addr p0, v5

    int-to-long v5, p0

    sub-long/2addr v0, v5

    goto :goto_0

    :cond_3
    :goto_1
    cmp-long p0, v0, p4

    if-gez p0, :cond_7

    .line 307
    iget-object p0, v2, Lokio/Segment;->data:[B

    .line 308
    iget v5, v2, Lokio/Segment;->limit:I

    int-to-long v5, v5

    iget v7, v2, Lokio/Segment;->pos:I

    int-to-long v7, v7

    add-long/2addr v7, p4

    sub-long/2addr v7, v0

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    .line 309
    iget v6, v2, Lokio/Segment;->pos:I

    int-to-long v6, v6

    add-long/2addr v6, p2

    sub-long/2addr v6, v0

    long-to-int p2, v6

    :goto_2
    if-ge p2, v5, :cond_5

    .line 310
    aget-byte p3, p0, p2

    if-ne p3, p1, :cond_4

    .line 311
    :goto_3
    iget p0, v2, Lokio/Segment;->pos:I

    sub-int/2addr p2, p0

    int-to-long p0, p2

    add-long/2addr p0, v0

    return-wide p0

    :cond_4
    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 312
    :cond_5
    iget p0, v2, Lokio/Segment;->limit:I

    iget p2, v2, Lokio/Segment;->pos:I

    sub-int/2addr p0, p2

    int-to-long p2, p0

    add-long/2addr v0, p2

    .line 313
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    if-nez v2, :cond_6

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    :cond_6
    move-wide p2, v0

    goto :goto_1

    :cond_7
    return-wide v3

    .line 314
    :cond_8
    :goto_4
    iget p0, v2, Lokio/Segment;->limit:I

    iget v5, v2, Lokio/Segment;->pos:I

    sub-int/2addr p0, v5

    int-to-long v5, p0

    add-long/2addr v5, v0

    cmp-long p0, v5, p2

    if-lez p0, :cond_d

    :goto_5
    cmp-long p0, v0, p4

    if-gez p0, :cond_c

    .line 315
    iget-object p0, v2, Lokio/Segment;->data:[B

    .line 316
    iget v5, v2, Lokio/Segment;->limit:I

    int-to-long v5, v5

    iget v7, v2, Lokio/Segment;->pos:I

    int-to-long v7, v7

    add-long/2addr v7, p4

    sub-long/2addr v7, v0

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    .line 317
    iget v6, v2, Lokio/Segment;->pos:I

    int-to-long v6, v6

    add-long/2addr v6, p2

    sub-long/2addr v6, v0

    long-to-int p2, v6

    :goto_6
    if-ge p2, v5, :cond_a

    .line 318
    aget-byte p3, p0, p2

    if-ne p3, p1, :cond_9

    goto :goto_3

    :cond_9
    add-int/lit8 p2, p2, 0x1

    goto :goto_6

    .line 319
    :cond_a
    iget p0, v2, Lokio/Segment;->limit:I

    iget p2, v2, Lokio/Segment;->pos:I

    sub-int/2addr p0, p2

    int-to-long p2, p0

    add-long/2addr v0, p2

    .line 320
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    if-nez v2, :cond_b

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    :cond_b
    move-wide p2, v0

    goto :goto_5

    :cond_c
    return-wide v3

    .line 321
    :cond_d
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    if-nez v2, :cond_e

    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    :cond_e
    move-wide v0, v5

    goto :goto_4

    :cond_f
    return-wide v3

    .line 322
    :cond_10
    iget-wide p0, p0, Lokio/Buffer;->size:J

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "size="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " fromIndex="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " toIndex="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public indexOf(Lokio/ByteString;)J
    .locals 2
    .param p1    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    .line 323
    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOf(Lokio/ByteString;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public indexOf(Lokio/ByteString;J)J
    .locals 20
    .param p1    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    if-lez v3, :cond_11

    .line 15
    .line 16
    cmp-long v3, v1, v4

    .line 17
    .line 18
    if-ltz v3, :cond_10

    .line 19
    .line 20
    iget-object v3, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 21
    .line 22
    if-eqz v3, :cond_f

    .line 23
    .line 24
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 25
    .line 26
    .line 27
    move-result-wide v8

    .line 28
    sub-long/2addr v8, v1

    .line 29
    cmp-long v8, v8, v1

    .line 30
    .line 31
    const-wide/16 v9, 0x1

    .line 32
    .line 33
    const/4 v11, 0x0

    .line 34
    if-gez v8, :cond_7

    .line 35
    .line 36
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    :goto_0
    cmp-long v8, v4, v1

    .line 41
    .line 42
    if-lez v8, :cond_1

    .line 43
    .line 44
    iget-object v3, v3, Lokio/Segment;->prev:Lokio/Segment;

    .line 45
    .line 46
    if-nez v3, :cond_0

    .line 47
    .line 48
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget v8, v3, Lokio/Segment;->limit:I

    .line 52
    .line 53
    iget v12, v3, Lokio/Segment;->pos:I

    .line 54
    .line 55
    sub-int/2addr v8, v12

    .line 56
    int-to-long v12, v8

    .line 57
    sub-long/2addr v4, v12

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    move-object v8, v3

    .line 60
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->internalArray$jvm()[B

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    aget-byte v11, v3, v11

    .line 65
    .line 66
    move-wide v12, v4

    .line 67
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->size()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    iget-wide v14, v0, Lokio/Buffer;->size:J

    .line 72
    .line 73
    const-wide/16 v16, -0x1

    .line 74
    .line 75
    int-to-long v6, v5

    .line 76
    sub-long/2addr v14, v6

    .line 77
    add-long/2addr v14, v9

    .line 78
    :goto_1
    cmp-long v4, v12, v14

    .line 79
    .line 80
    if-gez v4, :cond_6

    .line 81
    .line 82
    iget-object v6, v8, Lokio/Segment;->data:[B

    .line 83
    .line 84
    iget v4, v8, Lokio/Segment;->limit:I

    .line 85
    .line 86
    iget v7, v8, Lokio/Segment;->pos:I

    .line 87
    .line 88
    int-to-long v9, v7

    .line 89
    add-long/2addr v9, v14

    .line 90
    sub-long/2addr v9, v12

    .line 91
    move-wide/from16 p1, v1

    .line 92
    .line 93
    int-to-long v0, v4

    .line 94
    invoke-static {v0, v1, v9, v10}, Ljava/lang/Math;->min(JJ)J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    long-to-int v7, v0

    .line 99
    iget v0, v8, Lokio/Segment;->pos:I

    .line 100
    .line 101
    int-to-long v0, v0

    .line 102
    add-long v0, v0, p1

    .line 103
    .line 104
    sub-long/2addr v0, v12

    .line 105
    long-to-int v0, v0

    .line 106
    move v9, v0

    .line 107
    :goto_2
    if-ge v9, v7, :cond_4

    .line 108
    .line 109
    aget-byte v0, v6, v9

    .line 110
    .line 111
    if-ne v0, v11, :cond_2

    .line 112
    .line 113
    add-int/lit8 v2, v9, 0x1

    .line 114
    .line 115
    const/4 v4, 0x1

    .line 116
    move-object/from16 v0, p0

    .line 117
    .line 118
    move-object v1, v8

    .line 119
    invoke-direct/range {v0 .. v5}, Lokio/Buffer;->rangeEquals(Lokio/Segment;I[BII)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_3

    .line 124
    .line 125
    iget v0, v1, Lokio/Segment;->pos:I

    .line 126
    .line 127
    sub-int/2addr v9, v0

    .line 128
    int-to-long v0, v9

    .line 129
    add-long/2addr v0, v12

    .line 130
    return-wide v0

    .line 131
    :cond_2
    move-object/from16 v0, p0

    .line 132
    .line 133
    move-object v1, v8

    .line 134
    :cond_3
    add-int/lit8 v9, v9, 0x1

    .line 135
    .line 136
    move-object v8, v1

    .line 137
    goto :goto_2

    .line 138
    :cond_4
    move-object/from16 v0, p0

    .line 139
    .line 140
    move-object v1, v8

    .line 141
    iget v2, v1, Lokio/Segment;->limit:I

    .line 142
    .line 143
    iget v4, v1, Lokio/Segment;->pos:I

    .line 144
    .line 145
    sub-int/2addr v2, v4

    .line 146
    int-to-long v6, v2

    .line 147
    add-long/2addr v12, v6

    .line 148
    iget-object v8, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 149
    .line 150
    if-nez v8, :cond_5

    .line 151
    .line 152
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 153
    .line 154
    .line 155
    :cond_5
    move-wide v1, v12

    .line 156
    goto :goto_1

    .line 157
    :cond_6
    return-wide v16

    .line 158
    :cond_7
    const-wide/16 v16, -0x1

    .line 159
    .line 160
    :goto_3
    iget v6, v3, Lokio/Segment;->limit:I

    .line 161
    .line 162
    iget v7, v3, Lokio/Segment;->pos:I

    .line 163
    .line 164
    sub-int/2addr v6, v7

    .line 165
    int-to-long v6, v6

    .line 166
    add-long/2addr v6, v4

    .line 167
    cmp-long v8, v6, v1

    .line 168
    .line 169
    if-lez v8, :cond_d

    .line 170
    .line 171
    move-object v8, v3

    .line 172
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->internalArray$jvm()[B

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    aget-byte v6, v3, v11

    .line 177
    .line 178
    move-wide v11, v4

    .line 179
    invoke-virtual/range {p1 .. p1}, Lokio/ByteString;->size()I

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    iget-wide v13, v0, Lokio/Buffer;->size:J

    .line 184
    .line 185
    move-wide/from16 v18, v9

    .line 186
    .line 187
    int-to-long v9, v5

    .line 188
    sub-long/2addr v13, v9

    .line 189
    add-long v13, v13, v18

    .line 190
    .line 191
    :goto_4
    cmp-long v4, v11, v13

    .line 192
    .line 193
    if-gez v4, :cond_c

    .line 194
    .line 195
    iget-object v7, v8, Lokio/Segment;->data:[B

    .line 196
    .line 197
    iget v4, v8, Lokio/Segment;->limit:I

    .line 198
    .line 199
    iget v9, v8, Lokio/Segment;->pos:I

    .line 200
    .line 201
    int-to-long v9, v9

    .line 202
    add-long/2addr v9, v13

    .line 203
    sub-long/2addr v9, v11

    .line 204
    move-wide/from16 p1, v1

    .line 205
    .line 206
    int-to-long v0, v4

    .line 207
    invoke-static {v0, v1, v9, v10}, Ljava/lang/Math;->min(JJ)J

    .line 208
    .line 209
    .line 210
    move-result-wide v0

    .line 211
    long-to-int v9, v0

    .line 212
    iget v0, v8, Lokio/Segment;->pos:I

    .line 213
    .line 214
    int-to-long v0, v0

    .line 215
    add-long v0, v0, p1

    .line 216
    .line 217
    sub-long/2addr v0, v11

    .line 218
    long-to-int v0, v0

    .line 219
    move v10, v0

    .line 220
    :goto_5
    if-ge v10, v9, :cond_a

    .line 221
    .line 222
    aget-byte v0, v7, v10

    .line 223
    .line 224
    if-ne v0, v6, :cond_8

    .line 225
    .line 226
    add-int/lit8 v2, v10, 0x1

    .line 227
    .line 228
    const/4 v4, 0x1

    .line 229
    move-object/from16 v0, p0

    .line 230
    .line 231
    move-object v1, v8

    .line 232
    invoke-direct/range {v0 .. v5}, Lokio/Buffer;->rangeEquals(Lokio/Segment;I[BII)Z

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    if-eqz v2, :cond_9

    .line 237
    .line 238
    iget v0, v1, Lokio/Segment;->pos:I

    .line 239
    .line 240
    sub-int/2addr v10, v0

    .line 241
    int-to-long v0, v10

    .line 242
    add-long/2addr v0, v11

    .line 243
    return-wide v0

    .line 244
    :cond_8
    move-object v1, v8

    .line 245
    :cond_9
    add-int/lit8 v10, v10, 0x1

    .line 246
    .line 247
    move-object v8, v1

    .line 248
    goto :goto_5

    .line 249
    :cond_a
    move-object v1, v8

    .line 250
    iget v0, v1, Lokio/Segment;->limit:I

    .line 251
    .line 252
    iget v2, v1, Lokio/Segment;->pos:I

    .line 253
    .line 254
    sub-int/2addr v0, v2

    .line 255
    int-to-long v7, v0

    .line 256
    add-long/2addr v11, v7

    .line 257
    iget-object v8, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 258
    .line 259
    if-nez v8, :cond_b

    .line 260
    .line 261
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 262
    .line 263
    .line 264
    :cond_b
    move-object/from16 v0, p0

    .line 265
    .line 266
    move-wide v1, v11

    .line 267
    goto :goto_4

    .line 268
    :cond_c
    return-wide v16

    .line 269
    :cond_d
    move-object v8, v3

    .line 270
    move-wide/from16 v18, v9

    .line 271
    .line 272
    iget-object v3, v8, Lokio/Segment;->next:Lokio/Segment;

    .line 273
    .line 274
    if-nez v3, :cond_e

    .line 275
    .line 276
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 277
    .line 278
    .line 279
    :cond_e
    move-object/from16 v0, p0

    .line 280
    .line 281
    move-wide v4, v6

    .line 282
    move-wide/from16 v9, v18

    .line 283
    .line 284
    goto :goto_3

    .line 285
    :cond_f
    const-wide/16 v16, -0x1

    .line 286
    .line 287
    return-wide v16

    .line 288
    :cond_10
    const-string v0, "fromIndex < 0: "

    .line 289
    .line 290
    invoke-static {v0, v1, v2}, Ll/iq70;->a(Ljava/lang/String;J)V

    .line 291
    .line 292
    .line 293
    return-wide v4

    .line 294
    :cond_11
    const-string v0, "bytes is empty"

    .line 295
    .line 296
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    return-wide v4
.end method

.method public indexOfElement(Lokio/ByteString;)J
    .locals 2
    .param p1    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    .line 317
    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOfElement(Lokio/ByteString;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public indexOfElement(Lokio/ByteString;J)J
    .locals 11
    .param p1    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v2, p2, v0

    .line 7
    .line 8
    if-ltz v2, :cond_19

    .line 9
    .line 10
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 11
    .line 12
    const-wide/16 v3, -0x1

    .line 13
    .line 14
    if-eqz v2, :cond_18

    .line 15
    .line 16
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    .line 17
    .line 18
    .line 19
    move-result-wide v5

    .line 20
    sub-long/2addr v5, p2

    .line 21
    cmp-long v5, v5, p2

    .line 22
    .line 23
    const/4 v6, 0x2

    .line 24
    const/4 v7, 0x0

    .line 25
    const/4 v8, 0x1

    .line 26
    if-gez v5, :cond_c

    .line 27
    .line 28
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    :goto_0
    cmp-long v5, v0, p2

    .line 33
    .line 34
    if-lez v5, :cond_1

    .line 35
    .line 36
    iget-object v2, v2, Lokio/Segment;->prev:Lokio/Segment;

    .line 37
    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget v5, v2, Lokio/Segment;->limit:I

    .line 44
    .line 45
    iget v9, v2, Lokio/Segment;->pos:I

    .line 46
    .line 47
    sub-int/2addr v5, v9

    .line 48
    int-to-long v9, v5

    .line 49
    sub-long/2addr v0, v9

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-ne v5, v6, :cond_6

    .line 56
    .line 57
    invoke-virtual {p1, v7}, Lokio/ByteString;->getByte(I)B

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    invoke-virtual {p1, v8}, Lokio/ByteString;->getByte(I)B

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    :goto_1
    iget-wide v6, p0, Lokio/Buffer;->size:J

    .line 66
    .line 67
    cmp-long v6, v0, v6

    .line 68
    .line 69
    if-gez v6, :cond_b

    .line 70
    .line 71
    iget-object v6, v2, Lokio/Segment;->data:[B

    .line 72
    .line 73
    iget v7, v2, Lokio/Segment;->pos:I

    .line 74
    .line 75
    int-to-long v7, v7

    .line 76
    add-long/2addr v7, p2

    .line 77
    sub-long/2addr v7, v0

    .line 78
    long-to-int p2, v7

    .line 79
    iget p3, v2, Lokio/Segment;->limit:I

    .line 80
    .line 81
    :goto_2
    if-ge p2, p3, :cond_4

    .line 82
    .line 83
    aget-byte v7, v6, p2

    .line 84
    .line 85
    if-eq v7, v5, :cond_3

    .line 86
    .line 87
    if-ne v7, p1, :cond_2

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_2
    add-int/lit8 p2, p2, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_3
    :goto_3
    iget p0, v2, Lokio/Segment;->pos:I

    .line 94
    .line 95
    :goto_4
    sub-int/2addr p2, p0

    .line 96
    int-to-long p0, p2

    .line 97
    add-long/2addr p0, v0

    .line 98
    return-wide p0

    .line 99
    :cond_4
    iget p2, v2, Lokio/Segment;->limit:I

    .line 100
    .line 101
    iget p3, v2, Lokio/Segment;->pos:I

    .line 102
    .line 103
    sub-int/2addr p2, p3

    .line 104
    int-to-long p2, p2

    .line 105
    add-long/2addr v0, p2

    .line 106
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 107
    .line 108
    if-nez v2, :cond_5

    .line 109
    .line 110
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 111
    .line 112
    .line 113
    :cond_5
    move-wide p2, v0

    .line 114
    goto :goto_1

    .line 115
    :cond_6
    invoke-virtual {p1}, Lokio/ByteString;->internalArray$jvm()[B

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    :goto_5
    iget-wide v5, p0, Lokio/Buffer;->size:J

    .line 120
    .line 121
    cmp-long v5, v0, v5

    .line 122
    .line 123
    if-gez v5, :cond_b

    .line 124
    .line 125
    iget-object v5, v2, Lokio/Segment;->data:[B

    .line 126
    .line 127
    iget v6, v2, Lokio/Segment;->pos:I

    .line 128
    .line 129
    int-to-long v8, v6

    .line 130
    add-long/2addr v8, p2

    .line 131
    sub-long/2addr v8, v0

    .line 132
    long-to-int p2, v8

    .line 133
    iget p3, v2, Lokio/Segment;->limit:I

    .line 134
    .line 135
    :goto_6
    if-ge p2, p3, :cond_9

    .line 136
    .line 137
    aget-byte v6, v5, p2

    .line 138
    .line 139
    array-length v8, p1

    .line 140
    move v9, v7

    .line 141
    :goto_7
    if-ge v9, v8, :cond_8

    .line 142
    .line 143
    aget-byte v10, p1, v9

    .line 144
    .line 145
    if-ne v6, v10, :cond_7

    .line 146
    .line 147
    :goto_8
    iget p0, v2, Lokio/Segment;->pos:I

    .line 148
    .line 149
    goto :goto_4

    .line 150
    :cond_7
    add-int/lit8 v9, v9, 0x1

    .line 151
    .line 152
    goto :goto_7

    .line 153
    :cond_8
    add-int/lit8 p2, p2, 0x1

    .line 154
    .line 155
    goto :goto_6

    .line 156
    :cond_9
    iget p2, v2, Lokio/Segment;->limit:I

    .line 157
    .line 158
    iget p3, v2, Lokio/Segment;->pos:I

    .line 159
    .line 160
    sub-int/2addr p2, p3

    .line 161
    int-to-long p2, p2

    .line 162
    add-long/2addr v0, p2

    .line 163
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 164
    .line 165
    if-nez v2, :cond_a

    .line 166
    .line 167
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 168
    .line 169
    .line 170
    :cond_a
    move-wide p2, v0

    .line 171
    goto :goto_5

    .line 172
    :cond_b
    return-wide v3

    .line 173
    :cond_c
    :goto_9
    iget v5, v2, Lokio/Segment;->limit:I

    .line 174
    .line 175
    iget v9, v2, Lokio/Segment;->pos:I

    .line 176
    .line 177
    sub-int/2addr v5, v9

    .line 178
    int-to-long v9, v5

    .line 179
    add-long/2addr v9, v0

    .line 180
    cmp-long v5, v9, p2

    .line 181
    .line 182
    if-lez v5, :cond_16

    .line 183
    .line 184
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-ne v5, v6, :cond_10

    .line 189
    .line 190
    invoke-virtual {p1, v7}, Lokio/ByteString;->getByte(I)B

    .line 191
    .line 192
    .line 193
    move-result v5

    .line 194
    invoke-virtual {p1, v8}, Lokio/ByteString;->getByte(I)B

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    :goto_a
    iget-wide v6, p0, Lokio/Buffer;->size:J

    .line 199
    .line 200
    cmp-long v6, v0, v6

    .line 201
    .line 202
    if-gez v6, :cond_15

    .line 203
    .line 204
    iget-object v6, v2, Lokio/Segment;->data:[B

    .line 205
    .line 206
    iget v7, v2, Lokio/Segment;->pos:I

    .line 207
    .line 208
    int-to-long v7, v7

    .line 209
    add-long/2addr v7, p2

    .line 210
    sub-long/2addr v7, v0

    .line 211
    long-to-int p2, v7

    .line 212
    iget p3, v2, Lokio/Segment;->limit:I

    .line 213
    .line 214
    :goto_b
    if-ge p2, p3, :cond_e

    .line 215
    .line 216
    aget-byte v7, v6, p2

    .line 217
    .line 218
    if-eq v7, v5, :cond_3

    .line 219
    .line 220
    if-ne v7, p1, :cond_d

    .line 221
    .line 222
    goto/16 :goto_3

    .line 223
    .line 224
    :cond_d
    add-int/lit8 p2, p2, 0x1

    .line 225
    .line 226
    goto :goto_b

    .line 227
    :cond_e
    iget p2, v2, Lokio/Segment;->limit:I

    .line 228
    .line 229
    iget p3, v2, Lokio/Segment;->pos:I

    .line 230
    .line 231
    sub-int/2addr p2, p3

    .line 232
    int-to-long p2, p2

    .line 233
    add-long/2addr v0, p2

    .line 234
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 235
    .line 236
    if-nez v2, :cond_f

    .line 237
    .line 238
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 239
    .line 240
    .line 241
    :cond_f
    move-wide p2, v0

    .line 242
    goto :goto_a

    .line 243
    :cond_10
    invoke-virtual {p1}, Lokio/ByteString;->internalArray$jvm()[B

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    :goto_c
    iget-wide v5, p0, Lokio/Buffer;->size:J

    .line 248
    .line 249
    cmp-long v5, v0, v5

    .line 250
    .line 251
    if-gez v5, :cond_15

    .line 252
    .line 253
    iget-object v5, v2, Lokio/Segment;->data:[B

    .line 254
    .line 255
    iget v6, v2, Lokio/Segment;->pos:I

    .line 256
    .line 257
    int-to-long v8, v6

    .line 258
    add-long/2addr v8, p2

    .line 259
    sub-long/2addr v8, v0

    .line 260
    long-to-int p2, v8

    .line 261
    iget p3, v2, Lokio/Segment;->limit:I

    .line 262
    .line 263
    :goto_d
    if-ge p2, p3, :cond_13

    .line 264
    .line 265
    aget-byte v6, v5, p2

    .line 266
    .line 267
    array-length v8, p1

    .line 268
    move v9, v7

    .line 269
    :goto_e
    if-ge v9, v8, :cond_12

    .line 270
    .line 271
    aget-byte v10, p1, v9

    .line 272
    .line 273
    if-ne v6, v10, :cond_11

    .line 274
    .line 275
    goto/16 :goto_8

    .line 276
    .line 277
    :cond_11
    add-int/lit8 v9, v9, 0x1

    .line 278
    .line 279
    goto :goto_e

    .line 280
    :cond_12
    add-int/lit8 p2, p2, 0x1

    .line 281
    .line 282
    goto :goto_d

    .line 283
    :cond_13
    iget p2, v2, Lokio/Segment;->limit:I

    .line 284
    .line 285
    iget p3, v2, Lokio/Segment;->pos:I

    .line 286
    .line 287
    sub-int/2addr p2, p3

    .line 288
    int-to-long p2, p2

    .line 289
    add-long/2addr v0, p2

    .line 290
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 291
    .line 292
    if-nez v2, :cond_14

    .line 293
    .line 294
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 295
    .line 296
    .line 297
    :cond_14
    move-wide p2, v0

    .line 298
    goto :goto_c

    .line 299
    :cond_15
    return-wide v3

    .line 300
    :cond_16
    iget-object v2, v2, Lokio/Segment;->next:Lokio/Segment;

    .line 301
    .line 302
    if-nez v2, :cond_17

    .line 303
    .line 304
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 305
    .line 306
    .line 307
    :cond_17
    move-wide v0, v9

    .line 308
    goto/16 :goto_9

    .line 309
    .line 310
    :cond_18
    return-wide v3

    .line 311
    :cond_19
    const-string p0, "fromIndex < 0: "

    .line 312
    .line 313
    invoke-static {p0, p2, p3}, Ll/iq70;->a(Ljava/lang/String;J)V

    .line 314
    .line 315
    .line 316
    return-wide v0
.end method

.method public inputStream()Ljava/io/InputStream;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lokio/Buffer$inputStream$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lokio/Buffer$inputStream$1;-><init>(Lokio/Buffer;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public isOpen()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final md5()Lokio/ByteString;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "MD5"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lokio/Buffer;->digest(Ljava/lang/String;)Lokio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public outputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lokio/Buffer$outputStream$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lokio/Buffer$outputStream$1;-><init>(Lokio/Buffer;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public peek()Lokio/BufferedSource;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lokio/PeekSource;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lokio/PeekSource;-><init>(Lokio/BufferedSource;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public rangeEquals(JLokio/ByteString;)Z
    .locals 6
    .param p3    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x0

    .line 55
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    move-result v5

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->rangeEquals(JLokio/ByteString;II)Z

    move-result p0

    return p0
.end method

.method public rangeEquals(JLokio/ByteString;II)Z
    .locals 6
    .param p3    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-ltz v0, :cond_3

    .line 10
    .line 11
    if-ltz p4, :cond_3

    .line 12
    .line 13
    if-ltz p5, :cond_3

    .line 14
    .line 15
    iget-wide v2, p0, Lokio/Buffer;->size:J

    .line 16
    .line 17
    sub-long/2addr v2, p1

    .line 18
    int-to-long v4, p5

    .line 19
    cmp-long v0, v2, v4

    .line 20
    .line 21
    if-ltz v0, :cond_3

    .line 22
    .line 23
    invoke-virtual {p3}, Lokio/ByteString;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sub-int/2addr v0, p4

    .line 28
    if-ge v0, p5, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    move v0, v1

    .line 32
    :goto_0
    if-ge v0, p5, :cond_2

    .line 33
    .line 34
    int-to-long v2, v0

    .line 35
    add-long/2addr v2, p1

    .line 36
    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    add-int v3, p4, v0

    .line 41
    .line 42
    invoke-virtual {p3, v3}, Lokio/ByteString;->getByte(I)B

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eq v2, v3, :cond_1

    .line 47
    .line 48
    return v1

    .line 49
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_3
    :goto_1
    return v1
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v0, :cond_1

    .line 60
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v1

    iget v2, v0, Lokio/Segment;->limit:I

    iget v3, v0, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 61
    iget-object v2, v0, Lokio/Segment;->data:[B

    iget v3, v0, Lokio/Segment;->pos:I

    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 62
    iget p1, v0, Lokio/Segment;->pos:I

    add-int/2addr p1, v1

    iput p1, v0, Lokio/Segment;->pos:I

    .line 63
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 64
    iget v2, v0, Lokio/Segment;->limit:I

    if-ne p1, v2, :cond_0

    .line 65
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object p1

    iput-object p1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 66
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    :cond_0
    return v1

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public read([B)I
    .locals 2
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 58
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->read([BII)I

    move-result p0

    return p0
.end method

.method public read([BII)I
    .locals 7
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    int-to-long v1, v0

    .line 6
    int-to-long v3, p2

    .line 7
    int-to-long v5, p3

    .line 8
    invoke-static/range {v1 .. v6}, Lokio/-Util;->checkOffsetAndCount(JJJ)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget v1, v0, Lokio/Segment;->limit:I

    .line 16
    .line 17
    iget v2, v0, Lokio/Segment;->pos:I

    .line 18
    .line 19
    sub-int/2addr v1, v2

    .line 20
    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    iget-object v1, v0, Lokio/Segment;->data:[B

    .line 25
    .line 26
    iget v2, v0, Lokio/Segment;->pos:I

    .line 27
    .line 28
    invoke-static {v1, v2, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 29
    .line 30
    .line 31
    iget p1, v0, Lokio/Segment;->pos:I

    .line 32
    .line 33
    add-int/2addr p1, p3

    .line 34
    iput p1, v0, Lokio/Segment;->pos:I

    .line 35
    .line 36
    iget-wide v1, p0, Lokio/Buffer;->size:J

    .line 37
    .line 38
    int-to-long v3, p3

    .line 39
    sub-long/2addr v1, v3

    .line 40
    iput-wide v1, p0, Lokio/Buffer;->size:J

    .line 41
    .line 42
    iget p2, v0, Lokio/Segment;->limit:I

    .line 43
    .line 44
    if-ne p1, p2, :cond_0

    .line 45
    .line 46
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 51
    .line 52
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return p3

    .line 56
    :cond_1
    const/4 p0, -0x1

    .line 57
    return p0
.end method

.method public read(Lokio/Buffer;J)J
    .locals 4
    .param p1    # Lokio/Buffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    .line 67
    iget-wide v2, p0, Lokio/Buffer;->size:J

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_0
    cmp-long v0, p2, v2

    if-lez v0, :cond_1

    move-wide p2, v2

    .line 68
    :cond_1
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    return-wide p2

    .line 69
    :cond_2
    const-string p0, "byteCount < 0: "

    invoke-static {p0, p2, p3}, Ll/iq70;->a(Ljava/lang/String;J)V

    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public readAll(Lokio/Sink;)J
    .locals 4
    .param p1    # Lokio/Sink;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmp-long v2, v0, v2

    .line 9
    .line 10
    if-lez v2, :cond_0

    .line 11
    .line 12
    invoke-interface {p1, p0, v0, v1}, Lokio/Sink;->write(Lokio/Buffer;J)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-wide v0
.end method

.method public final readAndWriteUnsafe()Lokio/Buffer$UnsafeCursor;
    .locals 2
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 21
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lokio/Buffer;->readAndWriteUnsafe$default(Lokio/Buffer;Lokio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lokio/Buffer$UnsafeCursor;

    move-result-object p0

    return-object p0
.end method

.method public final readAndWriteUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;
    .locals 1
    .param p1    # Lokio/Buffer$UnsafeCursor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iput-object p0, p1, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    iput-boolean p0, p1, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    .line 12
    .line 13
    return-object p1

    .line 14
    :cond_0
    const-string p0, "already attached to a buffer"

    .line 15
    .line 16
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public readByte()B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v1, v0, Lokio/Segment;->pos:I

    .line 17
    .line 18
    iget v2, v0, Lokio/Segment;->limit:I

    .line 19
    .line 20
    iget-object v3, v0, Lokio/Segment;->data:[B

    .line 21
    .line 22
    add-int/lit8 v4, v1, 0x1

    .line 23
    .line 24
    aget-byte v1, v3, v1

    .line 25
    .line 26
    iget-wide v5, p0, Lokio/Buffer;->size:J

    .line 27
    .line 28
    const-wide/16 v7, 0x1

    .line 29
    .line 30
    sub-long/2addr v5, v7

    .line 31
    iput-wide v5, p0, Lokio/Buffer;->size:J

    .line 32
    .line 33
    if-ne v4, v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 40
    .line 41
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 42
    .line 43
    .line 44
    return v1

    .line 45
    :cond_1
    iput v4, v0, Lokio/Segment;->pos:I

    .line 46
    .line 47
    return v1

    .line 48
    :cond_2
    invoke-static {}, Ll/vg3;->a()V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public readByteArray()[B
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 38
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object p0

    return-object p0
.end method

.method public readByteArray(J)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    const-wide/32 v0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-gtz v0, :cond_1

    .line 13
    .line 14
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 15
    .line 16
    cmp-long v0, v0, p1

    .line 17
    .line 18
    if-ltz v0, :cond_0

    .line 19
    .line 20
    long-to-int p1, p1

    .line 21
    new-array p1, p1, [B

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lokio/Buffer;->readFully([B)V

    .line 24
    .line 25
    .line 26
    return-object p1

    .line 27
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 28
    .line 29
    .line 30
    :goto_0
    const/4 p0, 0x0

    .line 31
    return-object p0

    .line 32
    :cond_1
    const-string p0, "byteCount: "

    .line 33
    .line 34
    invoke-static {p0, p1, p2}, Ll/iq70;->a(Ljava/lang/String;J)V

    .line 35
    .line 36
    .line 37
    goto :goto_0
.end method

.method public readByteString()Lokio/ByteString;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lokio/ByteString;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokio/Buffer;->readByteArray()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lokio/ByteString;-><init>([B)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public readByteString(J)Lokio/ByteString;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 11
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object p0

    invoke-direct {v0, p0}, Lokio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public readDecimalLong()J
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lokio/Buffer;->size:J

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-eqz v1, :cond_d

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const-wide/16 v5, -0x7

    .line 13
    .line 14
    move v2, v1

    .line 15
    move-wide v8, v3

    .line 16
    move-wide v6, v5

    .line 17
    move v5, v2

    .line 18
    :goto_0
    iget-object v10, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 19
    .line 20
    if-nez v10, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v11, v10, Lokio/Segment;->data:[B

    .line 26
    .line 27
    iget v12, v10, Lokio/Segment;->pos:I

    .line 28
    .line 29
    iget v13, v10, Lokio/Segment;->limit:I

    .line 30
    .line 31
    :goto_1
    if-ge v12, v13, :cond_8

    .line 32
    .line 33
    aget-byte v14, v11, v12

    .line 34
    .line 35
    const/16 v15, 0x30

    .line 36
    .line 37
    if-lt v14, v15, :cond_5

    .line 38
    .line 39
    const/16 v15, 0x39

    .line 40
    .line 41
    if-gt v14, v15, :cond_5

    .line 42
    .line 43
    rsub-int/lit8 v15, v14, 0x30

    .line 44
    .line 45
    const-wide v16, -0xcccccccccccccccL

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    cmp-long v16, v8, v16

    .line 51
    .line 52
    if-ltz v16, :cond_3

    .line 53
    .line 54
    if-nez v16, :cond_1

    .line 55
    .line 56
    move-wide/from16 v16, v3

    .line 57
    .line 58
    int-to-long v3, v15

    .line 59
    cmp-long v3, v3, v6

    .line 60
    .line 61
    if-gez v3, :cond_2

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    move-wide/from16 v16, v3

    .line 65
    .line 66
    :cond_2
    const-wide/16 v3, 0xa

    .line 67
    .line 68
    mul-long/2addr v8, v3

    .line 69
    int-to-long v3, v15

    .line 70
    add-long/2addr v8, v3

    .line 71
    goto :goto_3

    .line 72
    :cond_3
    move-wide/from16 v16, v3

    .line 73
    .line 74
    :goto_2
    new-instance v0, Lokio/Buffer;

    .line 75
    .line 76
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v8, v9}, Lokio/Buffer;->writeDecimalLong(J)Lokio/Buffer;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0, v14}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    if-nez v2, :cond_4

    .line 88
    .line 89
    invoke-virtual {v0}, Lokio/Buffer;->readByte()B

    .line 90
    .line 91
    .line 92
    :cond_4
    const-string v1, "Number too large: "

    .line 93
    .line 94
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-static {v1, v0}, Ll/ug3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-wide v16

    .line 102
    :cond_5
    move-wide/from16 v16, v3

    .line 103
    .line 104
    const/16 v3, 0x2d

    .line 105
    .line 106
    const/4 v4, 0x1

    .line 107
    if-ne v14, v3, :cond_6

    .line 108
    .line 109
    if-nez v1, :cond_6

    .line 110
    .line 111
    const-wide/16 v2, 0x1

    .line 112
    .line 113
    sub-long/2addr v6, v2

    .line 114
    move v2, v4

    .line 115
    :goto_3
    add-int/lit8 v12, v12, 0x1

    .line 116
    .line 117
    add-int/lit8 v1, v1, 0x1

    .line 118
    .line 119
    move-wide/from16 v3, v16

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_6
    if-eqz v1, :cond_7

    .line 123
    .line 124
    move v5, v4

    .line 125
    goto :goto_4

    .line 126
    :cond_7
    const-string v0, "Expected leading [0-9] or \'-\' character but was 0x"

    .line 127
    .line 128
    invoke-static {v14}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-static {v0, v1}, Ll/ug3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    return-wide v16

    .line 136
    :cond_8
    move-wide/from16 v16, v3

    .line 137
    .line 138
    :goto_4
    if-ne v12, v13, :cond_9

    .line 139
    .line 140
    invoke-virtual {v10}, Lokio/Segment;->pop()Lokio/Segment;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    iput-object v3, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 145
    .line 146
    invoke-static {v10}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 147
    .line 148
    .line 149
    goto :goto_5

    .line 150
    :cond_9
    iput v12, v10, Lokio/Segment;->pos:I

    .line 151
    .line 152
    :goto_5
    if-nez v5, :cond_b

    .line 153
    .line 154
    iget-object v3, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 155
    .line 156
    if-nez v3, :cond_a

    .line 157
    .line 158
    goto :goto_6

    .line 159
    :cond_a
    move-wide/from16 v3, v16

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_b
    :goto_6
    iget-wide v3, v0, Lokio/Buffer;->size:J

    .line 164
    .line 165
    int-to-long v5, v1

    .line 166
    sub-long/2addr v3, v5

    .line 167
    iput-wide v3, v0, Lokio/Buffer;->size:J

    .line 168
    .line 169
    if-eqz v2, :cond_c

    .line 170
    .line 171
    return-wide v8

    .line 172
    :cond_c
    neg-long v0, v8

    .line 173
    return-wide v0

    .line 174
    :cond_d
    move-wide/from16 v16, v3

    .line 175
    .line 176
    invoke-static {}, Ll/vg3;->a()V

    .line 177
    .line 178
    .line 179
    return-wide v16
.end method

.method public final readFrom(Ljava/io/InputStream;)Lokio/Buffer;
    .locals 3
    .param p1    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide v0, 0x7fffffffffffffffL

    const/4 v2, 0x1

    .line 57
    invoke-direct {p0, p1, v0, v1, v2}, Lokio/Buffer;->readFrom(Ljava/io/InputStream;JZ)V

    return-object p0
.end method

.method public final readFrom(Ljava/io/InputStream;J)Lokio/Buffer;
    .locals 2
    .param p1    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, p1, p2, p3, v0}, Lokio/Buffer;->readFrom(Ljava/io/InputStream;JZ)V

    return-object p0

    .line 56
    :cond_0
    const-string p0, "byteCount < 0: "

    invoke-static {p0, p2, p3}, Ll/iq70;->a(Ljava/lang/String;J)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public readFully(Lokio/Buffer;J)V
    .locals 3
    .param p1    # Lokio/Buffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v2, v0, p2

    if-ltz v2, :cond_0

    .line 24
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    return-void

    .line 25
    :cond_0
    invoke-virtual {p1, p0, v0, v1}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 26
    invoke-static {}, Ll/vg3;->a()V

    return-void
.end method

.method public readFully([B)V
    .locals 3
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    array-length v1, p1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    array-length v1, p1

    .line 9
    sub-int/2addr v1, v0

    .line 10
    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->read([BII)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, -0x1

    .line 15
    if-eq v1, v2, :cond_0

    .line 16
    .line 17
    add-int/2addr v0, v1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public readHexadecimalUnsignedLong()J
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_a

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    move v1, v0

    .line 11
    move-wide v4, v2

    .line 12
    :cond_0
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 13
    .line 14
    if-nez v6, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v7, v6, Lokio/Segment;->data:[B

    .line 20
    .line 21
    iget v8, v6, Lokio/Segment;->pos:I

    .line 22
    .line 23
    iget v9, v6, Lokio/Segment;->limit:I

    .line 24
    .line 25
    :goto_0
    if-ge v8, v9, :cond_7

    .line 26
    .line 27
    aget-byte v10, v7, v8

    .line 28
    .line 29
    const/16 v11, 0x30

    .line 30
    .line 31
    if-lt v10, v11, :cond_2

    .line 32
    .line 33
    const/16 v11, 0x39

    .line 34
    .line 35
    if-gt v10, v11, :cond_2

    .line 36
    .line 37
    add-int/lit8 v11, v10, -0x30

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    const/16 v11, 0x61

    .line 41
    .line 42
    if-lt v10, v11, :cond_3

    .line 43
    .line 44
    const/16 v11, 0x66

    .line 45
    .line 46
    if-gt v10, v11, :cond_3

    .line 47
    .line 48
    add-int/lit8 v11, v10, -0x57

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    const/16 v11, 0x41

    .line 52
    .line 53
    if-lt v10, v11, :cond_5

    .line 54
    .line 55
    const/16 v11, 0x46

    .line 56
    .line 57
    if-gt v10, v11, :cond_5

    .line 58
    .line 59
    add-int/lit8 v11, v10, -0x37

    .line 60
    .line 61
    :goto_1
    const-wide/high16 v12, -0x1000000000000000L    # -3.105036184601418E231

    .line 62
    .line 63
    and-long/2addr v12, v4

    .line 64
    cmp-long v12, v12, v2

    .line 65
    .line 66
    if-nez v12, :cond_4

    .line 67
    .line 68
    const/4 v10, 0x4

    .line 69
    shl-long/2addr v4, v10

    .line 70
    int-to-long v10, v11

    .line 71
    or-long/2addr v4, v10

    .line 72
    add-int/lit8 v8, v8, 0x1

    .line 73
    .line 74
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    new-instance p0, Lokio/Buffer;

    .line 78
    .line 79
    invoke-direct {p0}, Lokio/Buffer;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, v4, v5}, Lokio/Buffer;->writeHexadecimalUnsignedLong(J)Lokio/Buffer;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0, v10}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string v0, "Number too large: "

    .line 91
    .line 92
    invoke-virtual {p0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {v0, p0}, Ll/ug3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-wide v2

    .line 100
    :cond_5
    if-eqz v0, :cond_6

    .line 101
    .line 102
    const/4 v1, 0x1

    .line 103
    goto :goto_2

    .line 104
    :cond_6
    const-string p0, "Expected leading [0-9a-fA-F] character but was 0x"

    .line 105
    .line 106
    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {p0, v0}, Ll/ug3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    return-wide v2

    .line 114
    :cond_7
    :goto_2
    if-ne v8, v9, :cond_8

    .line 115
    .line 116
    invoke-virtual {v6}, Lokio/Segment;->pop()Lokio/Segment;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    iput-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 121
    .line 122
    invoke-static {v6}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 123
    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_8
    iput v8, v6, Lokio/Segment;->pos:I

    .line 127
    .line 128
    :goto_3
    if-nez v1, :cond_9

    .line 129
    .line 130
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 131
    .line 132
    if-nez v6, :cond_0

    .line 133
    .line 134
    :cond_9
    iget-wide v1, p0, Lokio/Buffer;->size:J

    .line 135
    .line 136
    int-to-long v6, v0

    .line 137
    sub-long/2addr v1, v6

    .line 138
    iput-wide v1, p0, Lokio/Buffer;->size:J

    .line 139
    .line 140
    return-wide v4

    .line 141
    :cond_a
    invoke-static {}, Ll/vg3;->a()V

    .line 142
    .line 143
    .line 144
    return-wide v2
.end method

.method public readInt()I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v2, 0x4

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-ltz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v1, v0, Lokio/Segment;->pos:I

    .line 17
    .line 18
    iget v4, v0, Lokio/Segment;->limit:I

    .line 19
    .line 20
    sub-int v5, v4, v1

    .line 21
    .line 22
    int-to-long v5, v5

    .line 23
    cmp-long v5, v5, v2

    .line 24
    .line 25
    if-gez v5, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    and-int/lit16 v0, v0, 0xff

    .line 32
    .line 33
    shl-int/lit8 v0, v0, 0x18

    .line 34
    .line 35
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    and-int/lit16 v1, v1, 0xff

    .line 40
    .line 41
    shl-int/lit8 v1, v1, 0x10

    .line 42
    .line 43
    or-int/2addr v0, v1

    .line 44
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    and-int/lit16 v1, v1, 0xff

    .line 49
    .line 50
    shl-int/lit8 v1, v1, 0x8

    .line 51
    .line 52
    or-int/2addr v0, v1

    .line 53
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    and-int/lit16 p0, p0, 0xff

    .line 58
    .line 59
    or-int/2addr p0, v0

    .line 60
    return p0

    .line 61
    :cond_1
    iget-object v5, v0, Lokio/Segment;->data:[B

    .line 62
    .line 63
    add-int/lit8 v6, v1, 0x1

    .line 64
    .line 65
    aget-byte v7, v5, v1

    .line 66
    .line 67
    and-int/lit16 v7, v7, 0xff

    .line 68
    .line 69
    shl-int/lit8 v7, v7, 0x18

    .line 70
    .line 71
    add-int/lit8 v8, v1, 0x2

    .line 72
    .line 73
    aget-byte v6, v5, v6

    .line 74
    .line 75
    and-int/lit16 v6, v6, 0xff

    .line 76
    .line 77
    shl-int/lit8 v6, v6, 0x10

    .line 78
    .line 79
    or-int/2addr v6, v7

    .line 80
    add-int/lit8 v7, v1, 0x3

    .line 81
    .line 82
    aget-byte v8, v5, v8

    .line 83
    .line 84
    and-int/lit16 v8, v8, 0xff

    .line 85
    .line 86
    shl-int/lit8 v8, v8, 0x8

    .line 87
    .line 88
    or-int/2addr v6, v8

    .line 89
    add-int/lit8 v1, v1, 0x4

    .line 90
    .line 91
    aget-byte v5, v5, v7

    .line 92
    .line 93
    and-int/lit16 v5, v5, 0xff

    .line 94
    .line 95
    or-int/2addr v5, v6

    .line 96
    iget-wide v6, p0, Lokio/Buffer;->size:J

    .line 97
    .line 98
    sub-long/2addr v6, v2

    .line 99
    iput-wide v6, p0, Lokio/Buffer;->size:J

    .line 100
    .line 101
    if-ne v1, v4, :cond_2

    .line 102
    .line 103
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 108
    .line 109
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 110
    .line 111
    .line 112
    return v5

    .line 113
    :cond_2
    iput v1, v0, Lokio/Segment;->pos:I

    .line 114
    .line 115
    return v5

    .line 116
    :cond_3
    invoke-static {}, Ll/vg3;->a()V

    .line 117
    .line 118
    .line 119
    const/4 p0, 0x0

    .line 120
    return p0
.end method

.method public readIntLe()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lokio/-Util;->reverseBytes(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public readLong()J
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v2, 0x8

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-ltz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v1, v0, Lokio/Segment;->pos:I

    .line 17
    .line 18
    iget v4, v0, Lokio/Segment;->limit:I

    .line 19
    .line 20
    sub-int v5, v4, v1

    .line 21
    .line 22
    int-to-long v5, v5

    .line 23
    cmp-long v5, v5, v2

    .line 24
    .line 25
    const/16 v6, 0x20

    .line 26
    .line 27
    if-gez v5, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    int-to-long v0, v0

    .line 34
    const-wide v2, 0xffffffffL

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    and-long/2addr v0, v2

    .line 40
    shl-long/2addr v0, v6

    .line 41
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    int-to-long v4, p0

    .line 46
    and-long/2addr v2, v4

    .line 47
    or-long/2addr v0, v2

    .line 48
    return-wide v0

    .line 49
    :cond_1
    iget-object v5, v0, Lokio/Segment;->data:[B

    .line 50
    .line 51
    add-int/lit8 v7, v1, 0x1

    .line 52
    .line 53
    aget-byte v8, v5, v1

    .line 54
    .line 55
    int-to-long v8, v8

    .line 56
    const-wide/16 v10, 0xff

    .line 57
    .line 58
    and-long/2addr v8, v10

    .line 59
    const/16 v12, 0x38

    .line 60
    .line 61
    shl-long/2addr v8, v12

    .line 62
    add-int/lit8 v12, v1, 0x2

    .line 63
    .line 64
    aget-byte v7, v5, v7

    .line 65
    .line 66
    int-to-long v13, v7

    .line 67
    and-long/2addr v13, v10

    .line 68
    const/16 v7, 0x30

    .line 69
    .line 70
    shl-long/2addr v13, v7

    .line 71
    or-long v7, v8, v13

    .line 72
    .line 73
    add-int/lit8 v9, v1, 0x3

    .line 74
    .line 75
    aget-byte v12, v5, v12

    .line 76
    .line 77
    int-to-long v12, v12

    .line 78
    and-long/2addr v12, v10

    .line 79
    const/16 v14, 0x28

    .line 80
    .line 81
    shl-long/2addr v12, v14

    .line 82
    or-long/2addr v7, v12

    .line 83
    add-int/lit8 v12, v1, 0x4

    .line 84
    .line 85
    aget-byte v9, v5, v9

    .line 86
    .line 87
    int-to-long v13, v9

    .line 88
    and-long/2addr v13, v10

    .line 89
    shl-long/2addr v13, v6

    .line 90
    or-long v6, v7, v13

    .line 91
    .line 92
    add-int/lit8 v8, v1, 0x5

    .line 93
    .line 94
    aget-byte v9, v5, v12

    .line 95
    .line 96
    int-to-long v12, v9

    .line 97
    and-long/2addr v12, v10

    .line 98
    const/16 v9, 0x18

    .line 99
    .line 100
    shl-long/2addr v12, v9

    .line 101
    or-long/2addr v6, v12

    .line 102
    add-int/lit8 v9, v1, 0x6

    .line 103
    .line 104
    aget-byte v8, v5, v8

    .line 105
    .line 106
    int-to-long v12, v8

    .line 107
    and-long/2addr v12, v10

    .line 108
    const/16 v8, 0x10

    .line 109
    .line 110
    shl-long/2addr v12, v8

    .line 111
    or-long/2addr v6, v12

    .line 112
    add-int/lit8 v8, v1, 0x7

    .line 113
    .line 114
    aget-byte v9, v5, v9

    .line 115
    .line 116
    int-to-long v12, v9

    .line 117
    and-long/2addr v12, v10

    .line 118
    const/16 v9, 0x8

    .line 119
    .line 120
    shl-long/2addr v12, v9

    .line 121
    or-long/2addr v6, v12

    .line 122
    add-int/2addr v1, v9

    .line 123
    aget-byte v5, v5, v8

    .line 124
    .line 125
    int-to-long v8, v5

    .line 126
    and-long/2addr v8, v10

    .line 127
    or-long v5, v6, v8

    .line 128
    .line 129
    iget-wide v7, p0, Lokio/Buffer;->size:J

    .line 130
    .line 131
    sub-long/2addr v7, v2

    .line 132
    iput-wide v7, p0, Lokio/Buffer;->size:J

    .line 133
    .line 134
    if-ne v1, v4, :cond_2

    .line 135
    .line 136
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iput-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 141
    .line 142
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 143
    .line 144
    .line 145
    return-wide v5

    .line 146
    :cond_2
    iput v1, v0, Lokio/Segment;->pos:I

    .line 147
    .line 148
    return-wide v5

    .line 149
    :cond_3
    invoke-static {}, Ll/vg3;->a()V

    .line 150
    .line 151
    .line 152
    const-wide/16 v0, 0x0

    .line 153
    .line 154
    return-wide v0
.end method

.method public readLongLe()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/Buffer;->readLong()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Lokio/-Util;->reverseBytes(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public readShort()S
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v2, 0x2

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-ltz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v1, v0, Lokio/Segment;->pos:I

    .line 17
    .line 18
    iget v4, v0, Lokio/Segment;->limit:I

    .line 19
    .line 20
    sub-int v5, v4, v1

    .line 21
    .line 22
    const/4 v6, 0x2

    .line 23
    if-ge v5, v6, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    and-int/lit16 v0, v0, 0xff

    .line 30
    .line 31
    shl-int/lit8 v0, v0, 0x8

    .line 32
    .line 33
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    and-int/lit16 p0, p0, 0xff

    .line 38
    .line 39
    or-int/2addr p0, v0

    .line 40
    int-to-short p0, p0

    .line 41
    return p0

    .line 42
    :cond_1
    iget-object v5, v0, Lokio/Segment;->data:[B

    .line 43
    .line 44
    add-int/lit8 v7, v1, 0x1

    .line 45
    .line 46
    aget-byte v8, v5, v1

    .line 47
    .line 48
    and-int/lit16 v8, v8, 0xff

    .line 49
    .line 50
    shl-int/lit8 v8, v8, 0x8

    .line 51
    .line 52
    add-int/2addr v1, v6

    .line 53
    aget-byte v5, v5, v7

    .line 54
    .line 55
    and-int/lit16 v5, v5, 0xff

    .line 56
    .line 57
    or-int/2addr v5, v8

    .line 58
    iget-wide v6, p0, Lokio/Buffer;->size:J

    .line 59
    .line 60
    sub-long/2addr v6, v2

    .line 61
    iput-wide v6, p0, Lokio/Buffer;->size:J

    .line 62
    .line 63
    if-ne v1, v4, :cond_2

    .line 64
    .line 65
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 70
    .line 71
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    iput v1, v0, Lokio/Segment;->pos:I

    .line 76
    .line 77
    :goto_0
    int-to-short p0, v5

    .line 78
    return p0

    .line 79
    :cond_3
    invoke-static {}, Ll/vg3;->a()V

    .line 80
    .line 81
    .line 82
    const/4 p0, 0x0

    .line 83
    return p0
.end method

.method public readShortLe()S
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/Buffer;->readShort()S

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lokio/-Util;->reverseBytes(S)S

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 6
    .param p3    # Ljava/nio/charset/Charset;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-ltz v0, :cond_5

    .line 10
    .line 11
    const-wide/32 v2, 0x7fffffff

    .line 12
    .line 13
    .line 14
    cmp-long v2, p1, v2

    .line 15
    .line 16
    if-gtz v2, :cond_5

    .line 17
    .line 18
    iget-wide v2, p0, Lokio/Buffer;->size:J

    .line 19
    .line 20
    cmp-long v2, v2, p1

    .line 21
    .line 22
    if-ltz v2, :cond_4

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const-string p0, ""

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget v1, v0, Lokio/Segment;->pos:I

    .line 37
    .line 38
    int-to-long v2, v1

    .line 39
    add-long/2addr v2, p1

    .line 40
    iget v4, v0, Lokio/Segment;->limit:I

    .line 41
    .line 42
    int-to-long v4, v4

    .line 43
    cmp-long v2, v2, v4

    .line 44
    .line 45
    if-lez v2, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    new-instance p1, Ljava/lang/String;

    .line 52
    .line 53
    invoke-direct {p1, p0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 54
    .line 55
    .line 56
    return-object p1

    .line 57
    :cond_2
    iget-object v2, v0, Lokio/Segment;->data:[B

    .line 58
    .line 59
    long-to-int v3, p1

    .line 60
    new-instance v4, Ljava/lang/String;

    .line 61
    .line 62
    invoke-direct {v4, v2, v1, v3, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 63
    .line 64
    .line 65
    iget p3, v0, Lokio/Segment;->pos:I

    .line 66
    .line 67
    add-int/2addr p3, v3

    .line 68
    iput p3, v0, Lokio/Segment;->pos:I

    .line 69
    .line 70
    iget-wide v1, p0, Lokio/Buffer;->size:J

    .line 71
    .line 72
    sub-long/2addr v1, p1

    .line 73
    iput-wide v1, p0, Lokio/Buffer;->size:J

    .line 74
    .line 75
    iget p1, v0, Lokio/Segment;->limit:I

    .line 76
    .line 77
    if-ne p3, p1, :cond_3

    .line 78
    .line 79
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 84
    .line 85
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    return-object v4

    .line 89
    :cond_4
    invoke-static {}, Ll/vg3;->a()V

    .line 90
    .line 91
    .line 92
    return-object v1

    .line 93
    :cond_5
    const-string p0, "byteCount: "

    .line 94
    .line 95
    invoke-static {p0, p1, p2}, Ll/iq70;->a(Ljava/lang/String;J)V

    .line 96
    .line 97
    .line 98
    return-object v1
.end method

.method public readString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .param p1    # Ljava/nio/charset/Charset;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    iget-wide v0, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v0, v1, p1}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final readUnsafe()Lokio/Buffer$UnsafeCursor;
    .locals 2
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 21
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lokio/Buffer;->readUnsafe$default(Lokio/Buffer;Lokio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lokio/Buffer$UnsafeCursor;

    move-result-object p0

    return-object p0
.end method

.method public final readUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;
    .locals 1
    .param p1    # Lokio/Buffer$UnsafeCursor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iput-object p0, p1, Lokio/Buffer$UnsafeCursor;->buffer:Lokio/Buffer;

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    iput-boolean p0, p1, Lokio/Buffer$UnsafeCursor;->readWrite:Z

    .line 12
    .line 13
    return-object p1

    .line 14
    :cond_0
    const-string p0, "already attached to a buffer"

    .line 15
    .line 16
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public readUtf8()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    sget-object v2, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public readUtf8(J)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 10
    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, p2, v0}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public readUtf8CodePoint()I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_b

    .line 9
    .line 10
    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    and-int/lit16 v2, v0, 0x80

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    const/16 v4, 0x80

    .line 18
    .line 19
    const v5, 0xfffd

    .line 20
    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    and-int/lit8 v2, v0, 0x7f

    .line 25
    .line 26
    move v6, v1

    .line 27
    move v1, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    and-int/lit16 v1, v0, 0xe0

    .line 30
    .line 31
    const/16 v2, 0xc0

    .line 32
    .line 33
    if-ne v1, v2, :cond_1

    .line 34
    .line 35
    and-int/lit8 v2, v0, 0x1f

    .line 36
    .line 37
    const/4 v1, 0x2

    .line 38
    move v6, v4

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    and-int/lit16 v1, v0, 0xf0

    .line 41
    .line 42
    const/16 v2, 0xe0

    .line 43
    .line 44
    if-ne v1, v2, :cond_2

    .line 45
    .line 46
    and-int/lit8 v2, v0, 0xf

    .line 47
    .line 48
    const/4 v1, 0x3

    .line 49
    const/16 v6, 0x800

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    and-int/lit16 v1, v0, 0xf8

    .line 53
    .line 54
    const/16 v2, 0xf0

    .line 55
    .line 56
    if-ne v1, v2, :cond_a

    .line 57
    .line 58
    and-int/lit8 v2, v0, 0x7

    .line 59
    .line 60
    const/4 v1, 0x4

    .line 61
    const/high16 v6, 0x10000

    .line 62
    .line 63
    :goto_0
    iget-wide v7, p0, Lokio/Buffer;->size:J

    .line 64
    .line 65
    int-to-long v9, v1

    .line 66
    cmp-long v7, v7, v9

    .line 67
    .line 68
    if-ltz v7, :cond_9

    .line 69
    .line 70
    :goto_1
    if-ge v3, v1, :cond_4

    .line 71
    .line 72
    int-to-long v7, v3

    .line 73
    invoke-virtual {p0, v7, v8}, Lokio/Buffer;->getByte(J)B

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    and-int/lit16 v11, v0, 0xc0

    .line 78
    .line 79
    if-ne v11, v4, :cond_3

    .line 80
    .line 81
    shl-int/lit8 v2, v2, 0x6

    .line 82
    .line 83
    and-int/lit8 v0, v0, 0x3f

    .line 84
    .line 85
    or-int/2addr v2, v0

    .line 86
    add-int/lit8 v3, v3, 0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    invoke-virtual {p0, v7, v8}, Lokio/Buffer;->skip(J)V

    .line 90
    .line 91
    .line 92
    return v5

    .line 93
    :cond_4
    invoke-virtual {p0, v9, v10}, Lokio/Buffer;->skip(J)V

    .line 94
    .line 95
    .line 96
    const p0, 0x10ffff

    .line 97
    .line 98
    .line 99
    if-le v2, p0, :cond_5

    .line 100
    .line 101
    return v5

    .line 102
    :cond_5
    const p0, 0xd800

    .line 103
    .line 104
    .line 105
    if-le p0, v2, :cond_6

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_6
    const p0, 0xdfff

    .line 109
    .line 110
    .line 111
    if-lt p0, v2, :cond_7

    .line 112
    .line 113
    return v5

    .line 114
    :cond_7
    :goto_2
    if-ge v2, v6, :cond_8

    .line 115
    .line 116
    return v5

    .line 117
    :cond_8
    return v2

    .line 118
    :cond_9
    new-instance v2, Ljava/io/EOFException;

    .line 119
    .line 120
    iget-wide v3, p0, Lokio/Buffer;->size:J

    .line 121
    .line 122
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v5, "size < "

    .line 129
    .line 130
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v1, ": "

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v1, " (to read code point prefixed 0x"

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string p0, ")"

    .line 153
    .line 154
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-direct {v2, p0}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    throw v2

    .line 165
    :cond_a
    const-wide/16 v0, 0x1

    .line 166
    .line 167
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->skip(J)V

    .line 168
    .line 169
    .line 170
    return v5

    .line 171
    :cond_b
    invoke-static {}, Ll/vg3;->a()V

    .line 172
    .line 173
    .line 174
    return v1
.end method

.method public readUtf8Line()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lokio/Buffer;->indexOf(B)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8Line$jvm(J)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 19
    .line 20
    const-wide/16 v2, 0x0

    .line 21
    .line 22
    cmp-long v2, v0, v2

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public final readUtf8Line$jvm(J)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    const-wide/16 v1, 0x1

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    sub-long v3, p1, v1

    .line 10
    .line 11
    invoke-virtual {p0, v3, v4}, Lokio/Buffer;->getByte(J)B

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v5, 0xd

    .line 16
    .line 17
    if-ne v0, v5, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v3, v4}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-wide/16 v0, 0x2

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->skip(J)V

    .line 26
    .line 27
    .line 28
    return-object p1

    .line 29
    :cond_0
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->skip(J)V

    .line 34
    .line 35
    .line 36
    return-object p1
.end method

.method public readUtf8LineStrict()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const-wide v0, 0x7fffffffffffffffL

    .line 114
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8LineStrict(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public readUtf8LineStrict(J)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_3

    .line 6
    .line 7
    const-wide v0, 0x7fffffffffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long v2, p1, v0

    .line 13
    .line 14
    const-wide/16 v6, 0x1

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    :goto_0
    move-wide v4, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    add-long v0, p1, v6

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :goto_1
    const-wide/16 v2, 0x0

    .line 24
    .line 25
    const/16 v1, 0xa

    .line 26
    .line 27
    move-object v0, p0

    .line 28
    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->indexOf(BJJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    const-wide/16 v8, -0x1

    .line 33
    .line 34
    cmp-long v8, v2, v8

    .line 35
    .line 36
    if-eqz v8, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readUtf8Line$jvm(J)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    return-object v0

    .line 43
    :cond_1
    iget-wide v2, p0, Lokio/Buffer;->size:J

    .line 44
    .line 45
    cmp-long v2, v4, v2

    .line 46
    .line 47
    if-gez v2, :cond_2

    .line 48
    .line 49
    sub-long v2, v4, v6

    .line 50
    .line 51
    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    const/16 v3, 0xd

    .line 56
    .line 57
    if-ne v2, v3, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, v4, v5}, Lokio/Buffer;->getByte(J)B

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-ne v2, v1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0, v4, v5}, Lokio/Buffer;->readUtf8Line$jvm(J)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    return-object v0

    .line 70
    :cond_2
    new-instance v1, Lokio/Buffer;

    .line 71
    .line 72
    invoke-direct {v1}, Lokio/Buffer;-><init>()V

    .line 73
    .line 74
    .line 75
    iget-wide v2, p0, Lokio/Buffer;->size:J

    .line 76
    .line 77
    const-wide/16 v4, 0x20

    .line 78
    .line 79
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 80
    .line 81
    .line 82
    move-result-wide v4

    .line 83
    const-wide/16 v2, 0x0

    .line 84
    .line 85
    move-object v0, p0

    .line 86
    invoke-virtual/range {v0 .. v5}, Lokio/Buffer;->copyTo(Lokio/Buffer;JJ)Lokio/Buffer;

    .line 87
    .line 88
    .line 89
    iget-wide v2, p0, Lokio/Buffer;->size:J

    .line 90
    .line 91
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(JJ)J

    .line 92
    .line 93
    .line 94
    move-result-wide v2

    .line 95
    invoke-virtual {v1}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Lokio/ByteString;->hex()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v2, v3, v0}, Ll/xg3;->a(JLjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :goto_2
    const/4 v0, 0x0

    .line 107
    return-object v0

    .line 108
    :cond_3
    const-string v0, "limit < 0: "

    .line 109
    .line 110
    invoke-static {v0, p1, p2}, Ll/iq70;->a(Ljava/lang/String;J)V

    .line 111
    .line 112
    .line 113
    goto :goto_2
.end method

.method public request(J)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    cmp-long p0, v0, p1

    .line 4
    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public require(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    cmp-long p0, v0, p1

    .line 4
    .line 5
    if-ltz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public select(Lokio/Options;)I
    .locals 3
    .param p1    # Lokio/Options;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-static {p0, p1, v2, v0, v1}, Lokio/Buffer;->selectPrefix$jvm$default(Lokio/Buffer;Lokio/Options;ZILjava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, -0x1

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-virtual {p1}, Lokio/Options;->getByteStrings$jvm()[Lokio/ByteString;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    aget-object p1, p1, v0

    .line 20
    .line 21
    invoke-virtual {p1}, Lokio/ByteString;->size()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    int-to-long v1, p1

    .line 26
    invoke-virtual {p0, v1, v2}, Lokio/Buffer;->skip(J)V

    .line 27
    .line 28
    .line 29
    return v0
.end method

.method public final selectPrefix$jvm(Lokio/Options;Z)I
    .locals 17
    .param p1    # Lokio/Options;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-object/from16 v0, p0

    .line 5
    .line 6
    iget-object v0, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 7
    .line 8
    const/4 v1, -0x2

    .line 9
    const/4 v2, -0x1

    .line 10
    if-eqz v0, :cond_11

    .line 11
    .line 12
    iget-object v3, v0, Lokio/Segment;->data:[B

    .line 13
    .line 14
    iget v4, v0, Lokio/Segment;->pos:I

    .line 15
    .line 16
    iget v5, v0, Lokio/Segment;->limit:I

    .line 17
    .line 18
    invoke-virtual/range {p1 .. p1}, Lokio/Options;->getTrie$jvm()[I

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    const/4 v7, 0x0

    .line 23
    move-object v9, v0

    .line 24
    move v10, v2

    .line 25
    move v8, v7

    .line 26
    :goto_0
    add-int/lit8 v11, v8, 0x1

    .line 27
    .line 28
    aget v12, v6, v8

    .line 29
    .line 30
    add-int/lit8 v8, v8, 0x2

    .line 31
    .line 32
    aget v11, v6, v11

    .line 33
    .line 34
    if-eq v11, v2, :cond_0

    .line 35
    .line 36
    move v10, v11

    .line 37
    :cond_0
    if-nez v9, :cond_1

    .line 38
    .line 39
    goto :goto_3

    .line 40
    :cond_1
    const/4 v11, 0x0

    .line 41
    if-gez v12, :cond_a

    .line 42
    .line 43
    mul-int/lit8 v12, v12, -0x1

    .line 44
    .line 45
    add-int v13, v8, v12

    .line 46
    .line 47
    :goto_1
    add-int/lit8 v12, v4, 0x1

    .line 48
    .line 49
    aget-byte v4, v3, v4

    .line 50
    .line 51
    and-int/lit16 v4, v4, 0xff

    .line 52
    .line 53
    add-int/lit8 v14, v8, 0x1

    .line 54
    .line 55
    aget v8, v6, v8

    .line 56
    .line 57
    if-eq v4, v8, :cond_2

    .line 58
    .line 59
    goto :goto_6

    .line 60
    :cond_2
    if-ne v14, v13, :cond_3

    .line 61
    .line 62
    const/4 v4, 0x1

    .line 63
    goto :goto_2

    .line 64
    :cond_3
    move v4, v7

    .line 65
    :goto_2
    if-ne v12, v5, :cond_8

    .line 66
    .line 67
    if-nez v9, :cond_4

    .line 68
    .line 69
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 70
    .line 71
    .line 72
    :cond_4
    iget-object v3, v9, Lokio/Segment;->next:Lokio/Segment;

    .line 73
    .line 74
    if-nez v3, :cond_5

    .line 75
    .line 76
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 77
    .line 78
    .line 79
    :cond_5
    iget v5, v3, Lokio/Segment;->pos:I

    .line 80
    .line 81
    iget-object v8, v3, Lokio/Segment;->data:[B

    .line 82
    .line 83
    iget v9, v3, Lokio/Segment;->limit:I

    .line 84
    .line 85
    if-ne v3, v0, :cond_7

    .line 86
    .line 87
    if-nez v4, :cond_6

    .line 88
    .line 89
    :goto_3
    if-eqz p2, :cond_b

    .line 90
    .line 91
    return v1

    .line 92
    :cond_6
    move-object v3, v8

    .line 93
    move-object v8, v11

    .line 94
    goto :goto_4

    .line 95
    :cond_7
    move-object/from16 v16, v8

    .line 96
    .line 97
    move-object v8, v3

    .line 98
    move-object/from16 v3, v16

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_8
    move-object v8, v9

    .line 102
    move v9, v5

    .line 103
    move v5, v12

    .line 104
    :goto_4
    if-eqz v4, :cond_9

    .line 105
    .line 106
    aget v4, v6, v14

    .line 107
    .line 108
    move v13, v5

    .line 109
    move v5, v9

    .line 110
    move-object v9, v8

    .line 111
    goto :goto_7

    .line 112
    :cond_9
    move v4, v5

    .line 113
    move v5, v9

    .line 114
    move-object v9, v8

    .line 115
    move v8, v14

    .line 116
    goto :goto_1

    .line 117
    :cond_a
    add-int/lit8 v13, v4, 0x1

    .line 118
    .line 119
    aget-byte v4, v3, v4

    .line 120
    .line 121
    and-int/lit16 v4, v4, 0xff

    .line 122
    .line 123
    add-int v14, v8, v12

    .line 124
    .line 125
    :goto_5
    if-ne v8, v14, :cond_c

    .line 126
    .line 127
    :cond_b
    :goto_6
    return v10

    .line 128
    :cond_c
    aget v15, v6, v8

    .line 129
    .line 130
    if-ne v4, v15, :cond_10

    .line 131
    .line 132
    add-int/2addr v8, v12

    .line 133
    aget v4, v6, v8

    .line 134
    .line 135
    if-ne v13, v5, :cond_e

    .line 136
    .line 137
    iget-object v9, v9, Lokio/Segment;->next:Lokio/Segment;

    .line 138
    .line 139
    if-nez v9, :cond_d

    .line 140
    .line 141
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 142
    .line 143
    .line 144
    :cond_d
    iget v3, v9, Lokio/Segment;->pos:I

    .line 145
    .line 146
    iget-object v5, v9, Lokio/Segment;->data:[B

    .line 147
    .line 148
    iget v8, v9, Lokio/Segment;->limit:I

    .line 149
    .line 150
    move v13, v3

    .line 151
    move-object v3, v5

    .line 152
    move v5, v8

    .line 153
    if-ne v9, v0, :cond_e

    .line 154
    .line 155
    move-object v9, v11

    .line 156
    :cond_e
    :goto_7
    if-ltz v4, :cond_f

    .line 157
    .line 158
    return v4

    .line 159
    :cond_f
    neg-int v8, v4

    .line 160
    move v4, v13

    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_10
    add-int/lit8 v8, v8, 0x1

    .line 164
    .line 165
    goto :goto_5

    .line 166
    :cond_11
    if-eqz p2, :cond_12

    .line 167
    .line 168
    return v1

    .line 169
    :cond_12
    return v2
.end method

.method public final setSize$jvm(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    return-void
.end method

.method public final sha1()Lokio/ByteString;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "SHA-1"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lokio/Buffer;->digest(Ljava/lang/String;)Lokio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final sha256()Lokio/ByteString;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "SHA-256"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lokio/Buffer;->digest(Ljava/lang/String;)Lokio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final sha512()Lokio/ByteString;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "SHA-512"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lokio/Buffer;->digest(Ljava/lang/String;)Lokio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final size()J
    .locals 2
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public skip(J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 1
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v1, v0, Lokio/Segment;->limit:I

    .line 12
    .line 13
    iget v2, v0, Lokio/Segment;->pos:I

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    int-to-long v1, v1

    .line 17
    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    long-to-int v1, v1

    .line 22
    iget-wide v2, p0, Lokio/Buffer;->size:J

    .line 23
    .line 24
    int-to-long v4, v1

    .line 25
    sub-long/2addr v2, v4

    .line 26
    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 27
    .line 28
    sub-long/2addr p1, v4

    .line 29
    iget v2, v0, Lokio/Segment;->pos:I

    .line 30
    .line 31
    add-int/2addr v2, v1

    .line 32
    iput v2, v0, Lokio/Segment;->pos:I

    .line 33
    .line 34
    iget v1, v0, Lokio/Segment;->limit:I

    .line 35
    .line 36
    if-ne v2, v1, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 43
    .line 44
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-static {}, Ll/vg3;->a()V

    .line 49
    .line 50
    .line 51
    :cond_2
    return-void
.end method

.method public final snapshot()Lokio/ByteString;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 2
    .line 3
    const-wide/32 v2, 0x7fffffff

    .line 4
    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-gtz v2, :cond_0

    .line 9
    .line 10
    long-to-int v0, v0

    .line 11
    invoke-virtual {p0, v0}, Lokio/Buffer;->snapshot(I)Lokio/ByteString;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "size > Integer.MAX_VALUE: "

    .line 21
    .line 22
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw v0
.end method

.method public final snapshot(I)Lokio/ByteString;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    if-nez p1, :cond_0

    .line 42
    sget-object p0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    return-object p0

    :cond_0
    sget-object v0, Lokio/SegmentedByteString;->Companion:Lokio/SegmentedByteString$Companion;

    invoke-virtual {v0, p0, p1}, Lokio/SegmentedByteString$Companion;->of(Lokio/Buffer;I)Lokio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public timeout()Lokio/Timeout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lokio/Timeout;->NONE:Lokio/Timeout;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lokio/Buffer;->snapshot()Lokio/ByteString;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lokio/ByteString;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final writableSegment$jvm(I)Lokio/Segment;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_5

    .line 3
    .line 4
    const/16 v0, 0x2000

    .line 5
    .line 6
    if-gt p1, v0, :cond_5

    .line 7
    .line 8
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lokio/SegmentPool;->take()Lokio/Segment;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 17
    .line 18
    iput-object p1, p1, Lokio/Segment;->prev:Lokio/Segment;

    .line 19
    .line 20
    iput-object p1, p1, Lokio/Segment;->next:Lokio/Segment;

    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    if-nez v1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p0, v1, Lokio/Segment;->prev:Lokio/Segment;

    .line 29
    .line 30
    if-nez p0, :cond_2

    .line 31
    .line 32
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget v1, p0, Lokio/Segment;->limit:I

    .line 36
    .line 37
    add-int/2addr v1, p1

    .line 38
    if-gt v1, v0, :cond_4

    .line 39
    .line 40
    iget-boolean p1, p0, Lokio/Segment;->owner:Z

    .line 41
    .line 42
    if-nez p1, :cond_3

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_3
    return-object p0

    .line 46
    :cond_4
    :goto_0
    invoke-static {}, Lokio/SegmentPool;->take()Lokio/Segment;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_5
    const-string p0, "unexpected capacity"

    .line 56
    .line 57
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
    return-object p0
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1    # Ljava/nio/ByteBuffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 198
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v0

    move v1, v0

    :goto_0
    if-lez v1, :cond_0

    const/4 v2, 0x1

    .line 199
    invoke-virtual {p0, v2}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    move-result-object v2

    .line 200
    iget v3, v2, Lokio/Segment;->limit:I

    rsub-int v3, v3, 0x2000

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 201
    iget-object v4, v2, Lokio/Segment;->data:[B

    iget v5, v2, Lokio/Segment;->limit:I

    invoke-virtual {p1, v4, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    sub-int/2addr v1, v3

    .line 202
    iget v4, v2, Lokio/Segment;->limit:I

    add-int/2addr v4, v3

    iput v4, v2, Lokio/Segment;->limit:I

    goto :goto_0

    .line 203
    :cond_0
    iget-wide v1, p0, Lokio/Buffer;->size:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lokio/Buffer;->size:J

    return v0
.end method

.method public write(Lokio/ByteString;)Lokio/Buffer;
    .locals 0
    .param p1    # Lokio/ByteString;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 190
    invoke-virtual {p1, p0}, Lokio/ByteString;->write$jvm(Lokio/Buffer;)V

    return-object p0
.end method

.method public write([B)Lokio/Buffer;
    .locals 2
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 191
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public write([BII)Lokio/Buffer;
    .locals 7
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lokio/-Util;->checkOffsetAndCount(JJJ)V

    add-int/2addr p3, p2

    :goto_0
    if-ge p2, p3, :cond_0

    const/4 v0, 0x1

    .line 193
    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    move-result-object v0

    sub-int v1, p3, p2

    .line 194
    iget v2, v0, Lokio/Segment;->limit:I

    rsub-int v2, v2, 0x2000

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 195
    iget-object v2, v0, Lokio/Segment;->data:[B

    iget v3, v0, Lokio/Segment;->limit:I

    invoke-static {p1, p2, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr p2, v1

    .line 196
    iget v2, v0, Lokio/Segment;->limit:I

    add-int/2addr v2, v1

    iput v2, v0, Lokio/Segment;->limit:I

    goto :goto_0

    .line 197
    :cond_0
    iget-wide p1, p0, Lokio/Buffer;->size:J

    add-long/2addr p1, v5

    iput-wide p1, p0, Lokio/Buffer;->size:J

    return-object p0
.end method

.method public bridge synthetic write(Lokio/ByteString;)Lokio/BufferedSink;
    .locals 0

    .line 206
    invoke-virtual {p0, p1}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public write(Lokio/Source;J)Lokio/BufferedSink;
    .locals 4
    .param p1    # Lokio/Source;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_1

    .line 204
    invoke-interface {p1, p0, p2, p3}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    sub-long/2addr p2, v0

    goto :goto_0

    .line 205
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    const/4 p0, 0x0

    :cond_1
    return-object p0
.end method

.method public bridge synthetic write([B)Lokio/BufferedSink;
    .locals 0

    .line 188
    invoke-virtual {p0, p1}, Lokio/Buffer;->write([B)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic write([BII)Lokio/BufferedSink;
    .locals 0

    .line 189
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public write(Lokio/Buffer;J)V
    .locals 6
    .param p1    # Lokio/Buffer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eq p1, p0, :cond_e

    .line 5
    .line 6
    iget-wide v0, p1, Lokio/Buffer;->size:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    move-wide v4, p2

    .line 11
    invoke-static/range {v0 .. v5}, Lokio/-Util;->checkOffsetAndCount(JJJ)V

    .line 12
    .line 13
    .line 14
    :goto_0
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    cmp-long v0, p2, v0

    .line 17
    .line 18
    if-lez v0, :cond_d

    .line 19
    .line 20
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget v0, v0, Lokio/Segment;->limit:I

    .line 28
    .line 29
    iget-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 30
    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget v1, v1, Lokio/Segment;->pos:I

    .line 37
    .line 38
    sub-int/2addr v0, v1

    .line 39
    int-to-long v0, v0

    .line 40
    cmp-long v0, p2, v0

    .line 41
    .line 42
    if-gez v0, :cond_8

    .line 43
    .line 44
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    const/4 v0, 0x0

    .line 57
    :goto_1
    if-eqz v0, :cond_6

    .line 58
    .line 59
    iget-boolean v1, v0, Lokio/Segment;->owner:Z

    .line 60
    .line 61
    if-eqz v1, :cond_6

    .line 62
    .line 63
    iget v1, v0, Lokio/Segment;->limit:I

    .line 64
    .line 65
    int-to-long v1, v1

    .line 66
    add-long/2addr v1, p2

    .line 67
    iget-boolean v3, v0, Lokio/Segment;->shared:Z

    .line 68
    .line 69
    if-eqz v3, :cond_4

    .line 70
    .line 71
    const/4 v3, 0x0

    .line 72
    goto :goto_2

    .line 73
    :cond_4
    iget v3, v0, Lokio/Segment;->pos:I

    .line 74
    .line 75
    :goto_2
    int-to-long v3, v3

    .line 76
    sub-long/2addr v1, v3

    .line 77
    const-wide/16 v3, 0x2000

    .line 78
    .line 79
    cmp-long v1, v1, v3

    .line 80
    .line 81
    if-gtz v1, :cond_6

    .line 82
    .line 83
    iget-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 84
    .line 85
    if-nez v1, :cond_5

    .line 86
    .line 87
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 88
    .line 89
    .line 90
    :cond_5
    long-to-int v2, p2

    .line 91
    invoke-virtual {v1, v0, v2}, Lokio/Segment;->writeTo(Lokio/Segment;I)V

    .line 92
    .line 93
    .line 94
    iget-wide v0, p1, Lokio/Buffer;->size:J

    .line 95
    .line 96
    sub-long/2addr v0, p2

    .line 97
    iput-wide v0, p1, Lokio/Buffer;->size:J

    .line 98
    .line 99
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 100
    .line 101
    add-long/2addr v0, p2

    .line 102
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 103
    .line 104
    return-void

    .line 105
    :cond_6
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 106
    .line 107
    if-nez v0, :cond_7

    .line 108
    .line 109
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 110
    .line 111
    .line 112
    :cond_7
    long-to-int v1, p2

    .line 113
    invoke-virtual {v0, v1}, Lokio/Segment;->split(I)Lokio/Segment;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 118
    .line 119
    :cond_8
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 120
    .line 121
    if-nez v0, :cond_9

    .line 122
    .line 123
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 124
    .line 125
    .line 126
    :cond_9
    iget v1, v0, Lokio/Segment;->limit:I

    .line 127
    .line 128
    iget v2, v0, Lokio/Segment;->pos:I

    .line 129
    .line 130
    sub-int/2addr v1, v2

    .line 131
    int-to-long v1, v1

    .line 132
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    iput-object v3, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 137
    .line 138
    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 139
    .line 140
    if-nez v3, :cond_a

    .line 141
    .line 142
    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 143
    .line 144
    iput-object v0, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 145
    .line 146
    iput-object v0, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_a
    if-nez v3, :cond_b

    .line 150
    .line 151
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 152
    .line 153
    .line 154
    :cond_b
    iget-object v3, v3, Lokio/Segment;->prev:Lokio/Segment;

    .line 155
    .line 156
    if-nez v3, :cond_c

    .line 157
    .line 158
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 159
    .line 160
    .line 161
    :cond_c
    invoke-virtual {v3, v0}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {v0}, Lokio/Segment;->compact()V

    .line 166
    .line 167
    .line 168
    :goto_3
    iget-wide v3, p1, Lokio/Buffer;->size:J

    .line 169
    .line 170
    sub-long/2addr v3, v1

    .line 171
    iput-wide v3, p1, Lokio/Buffer;->size:J

    .line 172
    .line 173
    iget-wide v3, p0, Lokio/Buffer;->size:J

    .line 174
    .line 175
    add-long/2addr v3, v1

    .line 176
    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 177
    .line 178
    sub-long/2addr p2, v1

    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :cond_d
    return-void

    .line 182
    :cond_e
    const-string p0, "source == this"

    .line 183
    .line 184
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public writeAll(Lokio/Source;)J
    .locals 6
    .param p1    # Lokio/Source;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    :goto_0
    const-wide/16 v2, 0x2000

    .line 7
    .line 8
    invoke-interface {p1, p0, v2, v3}, Lokio/Source;->read(Lokio/Buffer;J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    const-wide/16 v4, -0x1

    .line 13
    .line 14
    cmp-long v4, v2, v4

    .line 15
    .line 16
    if-nez v4, :cond_0

    .line 17
    .line 18
    return-wide v0

    .line 19
    :cond_0
    add-long/2addr v0, v2

    .line 20
    goto :goto_0
.end method

.method public writeByte(I)Lokio/Buffer;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, v0, Lokio/Segment;->data:[B

    .line 7
    .line 8
    iget v2, v0, Lokio/Segment;->limit:I

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    iput v3, v0, Lokio/Segment;->limit:I

    .line 13
    .line 14
    int-to-byte p1, p1

    .line 15
    aput-byte p1, v1, v2

    .line 16
    .line 17
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 18
    .line 19
    const-wide/16 v2, 0x1

    .line 20
    .line 21
    add-long/2addr v0, v2

    .line 22
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 23
    .line 24
    return-object p0
.end method

.method public bridge synthetic writeByte(I)Lokio/BufferedSink;
    .locals 0

    .line 25
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeDecimalLong(J)Lokio/Buffer;
    .locals 11
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x30

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 v3, 0x1

    .line 15
    if-gez v2, :cond_2

    .line 16
    .line 17
    neg-long p1, p1

    .line 18
    cmp-long v2, p1, v0

    .line 19
    .line 20
    if-gez v2, :cond_1

    .line 21
    .line 22
    const-string p1, "-9223372036854775808"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    move v2, v3

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/4 v2, 0x0

    .line 32
    :goto_0
    const-wide/32 v4, 0x5f5e100

    .line 33
    .line 34
    .line 35
    cmp-long v4, p1, v4

    .line 36
    .line 37
    const-wide/16 v5, 0xa

    .line 38
    .line 39
    if-gez v4, :cond_a

    .line 40
    .line 41
    const-wide/16 v7, 0x2710

    .line 42
    .line 43
    cmp-long v4, p1, v7

    .line 44
    .line 45
    if-gez v4, :cond_6

    .line 46
    .line 47
    const-wide/16 v7, 0x64

    .line 48
    .line 49
    cmp-long v4, p1, v7

    .line 50
    .line 51
    if-gez v4, :cond_4

    .line 52
    .line 53
    cmp-long v4, p1, v5

    .line 54
    .line 55
    if-gez v4, :cond_3

    .line 56
    .line 57
    goto/16 :goto_1

    .line 58
    .line 59
    :cond_3
    const/4 v3, 0x2

    .line 60
    goto/16 :goto_1

    .line 61
    .line 62
    :cond_4
    const-wide/16 v3, 0x3e8

    .line 63
    .line 64
    cmp-long v3, p1, v3

    .line 65
    .line 66
    if-gez v3, :cond_5

    .line 67
    .line 68
    const/4 v3, 0x3

    .line 69
    goto/16 :goto_1

    .line 70
    .line 71
    :cond_5
    const/4 v3, 0x4

    .line 72
    goto/16 :goto_1

    .line 73
    .line 74
    :cond_6
    const-wide/32 v3, 0xf4240

    .line 75
    .line 76
    .line 77
    cmp-long v3, p1, v3

    .line 78
    .line 79
    if-gez v3, :cond_8

    .line 80
    .line 81
    const-wide/32 v3, 0x186a0

    .line 82
    .line 83
    .line 84
    cmp-long v3, p1, v3

    .line 85
    .line 86
    if-gez v3, :cond_7

    .line 87
    .line 88
    const/4 v3, 0x5

    .line 89
    goto/16 :goto_1

    .line 90
    .line 91
    :cond_7
    const/4 v3, 0x6

    .line 92
    goto/16 :goto_1

    .line 93
    .line 94
    :cond_8
    const-wide/32 v3, 0x989680

    .line 95
    .line 96
    .line 97
    cmp-long v3, p1, v3

    .line 98
    .line 99
    if-gez v3, :cond_9

    .line 100
    .line 101
    const/4 v3, 0x7

    .line 102
    goto/16 :goto_1

    .line 103
    .line 104
    :cond_9
    const/16 v3, 0x8

    .line 105
    .line 106
    goto/16 :goto_1

    .line 107
    .line 108
    :cond_a
    const-wide v3, 0xe8d4a51000L

    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    cmp-long v3, p1, v3

    .line 114
    .line 115
    if-gez v3, :cond_e

    .line 116
    .line 117
    const-wide v3, 0x2540be400L

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    cmp-long v3, p1, v3

    .line 123
    .line 124
    if-gez v3, :cond_c

    .line 125
    .line 126
    const-wide/32 v3, 0x3b9aca00

    .line 127
    .line 128
    .line 129
    cmp-long v3, p1, v3

    .line 130
    .line 131
    if-gez v3, :cond_b

    .line 132
    .line 133
    const/16 v3, 0x9

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_b
    const/16 v3, 0xa

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_c
    const-wide v3, 0x174876e800L

    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    cmp-long v3, p1, v3

    .line 145
    .line 146
    if-gez v3, :cond_d

    .line 147
    .line 148
    const/16 v3, 0xb

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_d
    const/16 v3, 0xc

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_e
    const-wide v3, 0x38d7ea4c68000L

    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    cmp-long v3, p1, v3

    .line 160
    .line 161
    if-gez v3, :cond_11

    .line 162
    .line 163
    const-wide v3, 0x9184e72a000L

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    cmp-long v3, p1, v3

    .line 169
    .line 170
    if-gez v3, :cond_f

    .line 171
    .line 172
    const/16 v3, 0xd

    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_f
    const-wide v3, 0x5af3107a4000L

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    cmp-long v3, p1, v3

    .line 181
    .line 182
    if-gez v3, :cond_10

    .line 183
    .line 184
    const/16 v3, 0xe

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_10
    const/16 v3, 0xf

    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_11
    const-wide v3, 0x16345785d8a0000L

    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    cmp-long v3, p1, v3

    .line 196
    .line 197
    if-gez v3, :cond_13

    .line 198
    .line 199
    const-wide v3, 0x2386f26fc10000L

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    cmp-long v3, p1, v3

    .line 205
    .line 206
    if-gez v3, :cond_12

    .line 207
    .line 208
    const/16 v3, 0x10

    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_12
    const/16 v3, 0x11

    .line 212
    .line 213
    goto :goto_1

    .line 214
    :cond_13
    const-wide v3, 0xde0b6b3a7640000L

    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    cmp-long v3, p1, v3

    .line 220
    .line 221
    if-gez v3, :cond_14

    .line 222
    .line 223
    const/16 v3, 0x12

    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_14
    const/16 v3, 0x13

    .line 227
    .line 228
    :goto_1
    if-eqz v2, :cond_15

    .line 229
    .line 230
    add-int/lit8 v3, v3, 0x1

    .line 231
    .line 232
    :cond_15
    invoke-virtual {p0, v3}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    iget-object v7, v4, Lokio/Segment;->data:[B

    .line 237
    .line 238
    iget v8, v4, Lokio/Segment;->limit:I

    .line 239
    .line 240
    add-int/2addr v8, v3

    .line 241
    :goto_2
    cmp-long v9, p1, v0

    .line 242
    .line 243
    if-eqz v9, :cond_16

    .line 244
    .line 245
    rem-long v9, p1, v5

    .line 246
    .line 247
    long-to-int v9, v9

    .line 248
    add-int/lit8 v8, v8, -0x1

    .line 249
    .line 250
    sget-object v10, Lokio/Buffer;->DIGITS:[B

    .line 251
    .line 252
    aget-byte v9, v10, v9

    .line 253
    .line 254
    aput-byte v9, v7, v8

    .line 255
    .line 256
    div-long/2addr p1, v5

    .line 257
    goto :goto_2

    .line 258
    :cond_16
    if-eqz v2, :cond_17

    .line 259
    .line 260
    add-int/lit8 v8, v8, -0x1

    .line 261
    .line 262
    const/16 p1, 0x2d

    .line 263
    .line 264
    aput-byte p1, v7, v8

    .line 265
    .line 266
    :cond_17
    iget p1, v4, Lokio/Segment;->limit:I

    .line 267
    .line 268
    add-int/2addr p1, v3

    .line 269
    iput p1, v4, Lokio/Segment;->limit:I

    .line 270
    .line 271
    iget-wide p1, p0, Lokio/Buffer;->size:J

    .line 272
    .line 273
    int-to-long v0, v3

    .line 274
    add-long/2addr p1, v0

    .line 275
    iput-wide p1, p0, Lokio/Buffer;->size:J

    .line 276
    .line 277
    return-object p0
.end method

.method public bridge synthetic writeDecimalLong(J)Lokio/BufferedSink;
    .locals 0

    .line 278
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeDecimalLong(J)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeHexadecimalUnsignedLong(J)Lokio/Buffer;
    .locals 9
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x30

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->highestOneBit(J)J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x4

    .line 23
    div-int/2addr v0, v1

    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v3, v2, Lokio/Segment;->data:[B

    .line 31
    .line 32
    iget v4, v2, Lokio/Segment;->limit:I

    .line 33
    .line 34
    add-int v5, v4, v0

    .line 35
    .line 36
    add-int/lit8 v5, v5, -0x1

    .line 37
    .line 38
    :goto_0
    if-lt v5, v4, :cond_1

    .line 39
    .line 40
    sget-object v6, Lokio/Buffer;->DIGITS:[B

    .line 41
    .line 42
    const-wide/16 v7, 0xf

    .line 43
    .line 44
    and-long/2addr v7, p1

    .line 45
    long-to-int v7, v7

    .line 46
    aget-byte v6, v6, v7

    .line 47
    .line 48
    aput-byte v6, v3, v5

    .line 49
    .line 50
    ushr-long/2addr p1, v1

    .line 51
    add-int/lit8 v5, v5, -0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget p1, v2, Lokio/Segment;->limit:I

    .line 55
    .line 56
    add-int/2addr p1, v0

    .line 57
    iput p1, v2, Lokio/Segment;->limit:I

    .line 58
    .line 59
    iget-wide p1, p0, Lokio/Buffer;->size:J

    .line 60
    .line 61
    int-to-long v0, v0

    .line 62
    add-long/2addr p1, v0

    .line 63
    iput-wide p1, p0, Lokio/Buffer;->size:J

    .line 64
    .line 65
    return-object p0
.end method

.method public bridge synthetic writeHexadecimalUnsignedLong(J)Lokio/BufferedSink;
    .locals 0

    .line 66
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeHexadecimalUnsignedLong(J)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeInt(I)Lokio/Buffer;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lokio/Segment;->data:[B

    .line 7
    .line 8
    iget v3, v1, Lokio/Segment;->limit:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x18

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    add-int/lit8 v5, v3, 0x2

    .line 20
    .line 21
    ushr-int/lit8 v6, p1, 0x10

    .line 22
    .line 23
    and-int/lit16 v6, v6, 0xff

    .line 24
    .line 25
    int-to-byte v6, v6

    .line 26
    aput-byte v6, v2, v4

    .line 27
    .line 28
    add-int/lit8 v4, v3, 0x3

    .line 29
    .line 30
    ushr-int/lit8 v6, p1, 0x8

    .line 31
    .line 32
    and-int/lit16 v6, v6, 0xff

    .line 33
    .line 34
    int-to-byte v6, v6

    .line 35
    aput-byte v6, v2, v5

    .line 36
    .line 37
    add-int/2addr v3, v0

    .line 38
    and-int/lit16 p1, p1, 0xff

    .line 39
    .line 40
    int-to-byte p1, p1

    .line 41
    aput-byte p1, v2, v4

    .line 42
    .line 43
    iput v3, v1, Lokio/Segment;->limit:I

    .line 44
    .line 45
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 46
    .line 47
    const-wide/16 v2, 0x4

    .line 48
    .line 49
    add-long/2addr v0, v2

    .line 50
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 51
    .line 52
    return-object p0
.end method

.method public bridge synthetic writeInt(I)Lokio/BufferedSink;
    .locals 0

    .line 53
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeIntLe(I)Lokio/Buffer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {p1}, Lokio/-Util;->reverseBytes(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic writeIntLe(I)Lokio/BufferedSink;
    .locals 0

    .line 10
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeIntLe(I)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeLong(J)Lokio/Buffer;
    .locals 11
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, v1, Lokio/Segment;->data:[B

    .line 8
    .line 9
    iget v3, v1, Lokio/Segment;->limit:I

    .line 10
    .line 11
    add-int/lit8 v4, v3, 0x1

    .line 12
    .line 13
    const/16 v5, 0x38

    .line 14
    .line 15
    ushr-long v5, p1, v5

    .line 16
    .line 17
    const-wide/16 v7, 0xff

    .line 18
    .line 19
    and-long/2addr v5, v7

    .line 20
    long-to-int v5, v5

    .line 21
    int-to-byte v5, v5

    .line 22
    aput-byte v5, v2, v3

    .line 23
    .line 24
    add-int/lit8 v5, v3, 0x2

    .line 25
    .line 26
    const/16 v6, 0x30

    .line 27
    .line 28
    ushr-long v9, p1, v6

    .line 29
    .line 30
    and-long/2addr v9, v7

    .line 31
    long-to-int v6, v9

    .line 32
    int-to-byte v6, v6

    .line 33
    aput-byte v6, v2, v4

    .line 34
    .line 35
    add-int/lit8 v4, v3, 0x3

    .line 36
    .line 37
    const/16 v6, 0x28

    .line 38
    .line 39
    ushr-long v9, p1, v6

    .line 40
    .line 41
    and-long/2addr v9, v7

    .line 42
    long-to-int v6, v9

    .line 43
    int-to-byte v6, v6

    .line 44
    aput-byte v6, v2, v5

    .line 45
    .line 46
    add-int/lit8 v5, v3, 0x4

    .line 47
    .line 48
    const/16 v6, 0x20

    .line 49
    .line 50
    ushr-long v9, p1, v6

    .line 51
    .line 52
    and-long/2addr v9, v7

    .line 53
    long-to-int v6, v9

    .line 54
    int-to-byte v6, v6

    .line 55
    aput-byte v6, v2, v4

    .line 56
    .line 57
    add-int/lit8 v4, v3, 0x5

    .line 58
    .line 59
    const/16 v6, 0x18

    .line 60
    .line 61
    ushr-long v9, p1, v6

    .line 62
    .line 63
    and-long/2addr v9, v7

    .line 64
    long-to-int v6, v9

    .line 65
    int-to-byte v6, v6

    .line 66
    aput-byte v6, v2, v5

    .line 67
    .line 68
    add-int/lit8 v5, v3, 0x6

    .line 69
    .line 70
    const/16 v6, 0x10

    .line 71
    .line 72
    ushr-long v9, p1, v6

    .line 73
    .line 74
    and-long/2addr v9, v7

    .line 75
    long-to-int v6, v9

    .line 76
    int-to-byte v6, v6

    .line 77
    aput-byte v6, v2, v4

    .line 78
    .line 79
    add-int/lit8 v4, v3, 0x7

    .line 80
    .line 81
    ushr-long v9, p1, v0

    .line 82
    .line 83
    and-long/2addr v9, v7

    .line 84
    long-to-int v6, v9

    .line 85
    int-to-byte v6, v6

    .line 86
    aput-byte v6, v2, v5

    .line 87
    .line 88
    add-int/2addr v3, v0

    .line 89
    and-long/2addr p1, v7

    .line 90
    long-to-int p1, p1

    .line 91
    int-to-byte p1, p1

    .line 92
    aput-byte p1, v2, v4

    .line 93
    .line 94
    iput v3, v1, Lokio/Segment;->limit:I

    .line 95
    .line 96
    iget-wide p1, p0, Lokio/Buffer;->size:J

    .line 97
    .line 98
    const-wide/16 v0, 0x8

    .line 99
    .line 100
    add-long/2addr p1, v0

    .line 101
    iput-wide p1, p0, Lokio/Buffer;->size:J

    .line 102
    .line 103
    return-object p0
.end method

.method public bridge synthetic writeLong(J)Lokio/BufferedSink;
    .locals 0

    .line 104
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeLong(J)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeLongLe(J)Lokio/Buffer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {p1, p2}, Lokio/-Util;->reverseBytes(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeLong(J)Lokio/Buffer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic writeLongLe(J)Lokio/BufferedSink;
    .locals 0

    .line 10
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeLongLe(J)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeShort(I)Lokio/Buffer;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lokio/Segment;->data:[B

    .line 7
    .line 8
    iget v3, v1, Lokio/Segment;->limit:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x8

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    add-int/2addr v3, v0

    .line 20
    and-int/lit16 p1, p1, 0xff

    .line 21
    .line 22
    int-to-byte p1, p1

    .line 23
    aput-byte p1, v2, v4

    .line 24
    .line 25
    iput v3, v1, Lokio/Segment;->limit:I

    .line 26
    .line 27
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 28
    .line 29
    const-wide/16 v2, 0x2

    .line 30
    .line 31
    add-long/2addr v0, v2

    .line 32
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 33
    .line 34
    return-object p0
.end method

.method public bridge synthetic writeShort(I)Lokio/BufferedSink;
    .locals 0

    .line 35
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeShortLe(I)Lokio/Buffer;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    int-to-short p1, p1

    .line 2
    invoke-static {p1}, Lokio/-Util;->reverseBytes(S)S

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public bridge synthetic writeShortLe(I)Lokio/BufferedSink;
    .locals 0

    .line 11
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeShortLe(I)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/nio/charset/Charset;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-ltz p2, :cond_3

    .line 9
    .line 10
    if-lt p3, p2, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-gt p3, v1, :cond_1

    .line 17
    .line 18
    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 19
    .line 20
    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    const/4 p2, 0x0

    .line 43
    array-length p3, p1

    .line 44
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    const-string p0, " > "

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    const-string p2, "endIndex > string.length: "

    .line 56
    .line 57
    invoke-static {p2, p3, p0, p1}, Ll/nlk0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 58
    .line 59
    .line 60
    return-object v0

    .line 61
    :cond_2
    const-string p0, "endIndex < beginIndex: "

    .line 62
    .line 63
    const-string p1, " < "

    .line 64
    .line 65
    invoke-static {p0, p3, p1, p2}, Ll/nlk0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_3
    const-string p0, "beginIndex < 0: "

    .line 70
    .line 71
    invoke-static {p0, p2}, Ll/plk0;->a(Ljava/lang/String;I)V

    .line 72
    .line 73
    .line 74
    return-object v0
.end method

.method public writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/nio/charset/Charset;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 76
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1, p2}, Lokio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/BufferedSink;
    .locals 0

    .line 77
    invoke-virtual {p0, p1, p2, p3, p4}, Lokio/Buffer;->writeString(Ljava/lang/String;IILjava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/BufferedSink;
    .locals 0

    .line 75
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public final writeTo(Ljava/io/OutputStream;)Lokio/Buffer;
    .locals 6
    .param p1    # Ljava/io/OutputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 73
    const/4 v4, 0x2

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v5}, Lokio/Buffer;->writeTo$default(Lokio/Buffer;Ljava/io/OutputStream;JILjava/lang/Object;)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public final writeTo(Ljava/io/OutputStream;J)Lokio/Buffer;
    .locals 7
    .param p1    # Ljava/io/OutputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    move-wide v4, p2

    .line 9
    invoke-static/range {v0 .. v5}, Lokio/-Util;->checkOffsetAndCount(JJJ)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 13
    .line 14
    move-object v0, p2

    .line 15
    move-wide p2, v4

    .line 16
    :cond_0
    :goto_0
    const-wide/16 v1, 0x0

    .line 17
    .line 18
    cmp-long v1, p2, v1

    .line 19
    .line 20
    if-lez v1, :cond_2

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget v1, v0, Lokio/Segment;->limit:I

    .line 28
    .line 29
    iget v2, v0, Lokio/Segment;->pos:I

    .line 30
    .line 31
    sub-int/2addr v1, v2

    .line 32
    int-to-long v1, v1

    .line 33
    invoke-static {p2, p3, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    long-to-int v1, v1

    .line 38
    iget-object v2, v0, Lokio/Segment;->data:[B

    .line 39
    .line 40
    iget v3, v0, Lokio/Segment;->pos:I

    .line 41
    .line 42
    invoke-virtual {p1, v2, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 43
    .line 44
    .line 45
    iget v2, v0, Lokio/Segment;->pos:I

    .line 46
    .line 47
    add-int/2addr v2, v1

    .line 48
    iput v2, v0, Lokio/Segment;->pos:I

    .line 49
    .line 50
    iget-wide v3, p0, Lokio/Buffer;->size:J

    .line 51
    .line 52
    int-to-long v5, v1

    .line 53
    sub-long/2addr v3, v5

    .line 54
    iput-wide v3, p0, Lokio/Buffer;->size:J

    .line 55
    .line 56
    sub-long/2addr p2, v5

    .line 57
    iget v1, v0, Lokio/Segment;->limit:I

    .line 58
    .line 59
    if-ne v2, v1, :cond_0

    .line 60
    .line 61
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 66
    .line 67
    invoke-static {v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 68
    .line 69
    .line 70
    move-object v0, v1

    .line 71
    goto :goto_0

    .line 72
    :cond_2
    return-object p0
.end method

.method public writeUtf8(Ljava/lang/String;)Lokio/Buffer;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 300
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeUtf8(Ljava/lang/String;II)Lokio/Buffer;
    .locals 9
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-ltz p2, :cond_c

    .line 6
    .line 7
    if-lt p3, p2, :cond_b

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-gt p3, v1, :cond_a

    .line 14
    .line 15
    :goto_0
    if-ge p2, p3, :cond_9

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/16 v1, 0x80

    .line 22
    .line 23
    if-ge v0, v1, :cond_2

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {p0, v2}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v3, v2, Lokio/Segment;->data:[B

    .line 31
    .line 32
    iget v4, v2, Lokio/Segment;->limit:I

    .line 33
    .line 34
    sub-int/2addr v4, p2

    .line 35
    rsub-int v5, v4, 0x2000

    .line 36
    .line 37
    invoke-static {p3, v5}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    add-int/lit8 v6, p2, 0x1

    .line 42
    .line 43
    add-int/2addr p2, v4

    .line 44
    int-to-byte v0, v0

    .line 45
    aput-byte v0, v3, p2

    .line 46
    .line 47
    :goto_1
    if-ge v6, v5, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-lt p2, v1, :cond_0

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_0
    add-int/lit8 v0, v6, 0x1

    .line 57
    .line 58
    add-int/2addr v6, v4

    .line 59
    int-to-byte p2, p2

    .line 60
    aput-byte p2, v3, v6

    .line 61
    .line 62
    move v6, v0

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    :goto_2
    add-int/2addr v4, v6

    .line 65
    iget p2, v2, Lokio/Segment;->limit:I

    .line 66
    .line 67
    sub-int/2addr v4, p2

    .line 68
    add-int/2addr p2, v4

    .line 69
    iput p2, v2, Lokio/Segment;->limit:I

    .line 70
    .line 71
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 72
    .line 73
    int-to-long v2, v4

    .line 74
    add-long/2addr v0, v2

    .line 75
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 76
    .line 77
    move p2, v6

    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const/16 v2, 0x800

    .line 80
    .line 81
    if-ge v0, v2, :cond_3

    .line 82
    .line 83
    const/4 v2, 0x2

    .line 84
    invoke-virtual {p0, v2}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    iget-object v4, v3, Lokio/Segment;->data:[B

    .line 89
    .line 90
    iget v5, v3, Lokio/Segment;->limit:I

    .line 91
    .line 92
    shr-int/lit8 v6, v0, 0x6

    .line 93
    .line 94
    or-int/lit16 v6, v6, 0xc0

    .line 95
    .line 96
    int-to-byte v6, v6

    .line 97
    aput-byte v6, v4, v5

    .line 98
    .line 99
    add-int/lit8 v6, v5, 0x1

    .line 100
    .line 101
    and-int/lit8 v0, v0, 0x3f

    .line 102
    .line 103
    or-int/2addr v0, v1

    .line 104
    int-to-byte v0, v0

    .line 105
    aput-byte v0, v4, v6

    .line 106
    .line 107
    add-int/2addr v5, v2

    .line 108
    iput v5, v3, Lokio/Segment;->limit:I

    .line 109
    .line 110
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 111
    .line 112
    const-wide/16 v2, 0x2

    .line 113
    .line 114
    add-long/2addr v0, v2

    .line 115
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 116
    .line 117
    :goto_3
    add-int/lit8 p2, p2, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    const v2, 0xd800

    .line 121
    .line 122
    .line 123
    const/16 v3, 0x3f

    .line 124
    .line 125
    if-lt v0, v2, :cond_8

    .line 126
    .line 127
    const v2, 0xdfff

    .line 128
    .line 129
    .line 130
    if-le v0, v2, :cond_4

    .line 131
    .line 132
    goto :goto_6

    .line 133
    :cond_4
    add-int/lit8 v4, p2, 0x1

    .line 134
    .line 135
    if-ge v4, p3, :cond_5

    .line 136
    .line 137
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    goto :goto_4

    .line 142
    :cond_5
    const/4 v5, 0x0

    .line 143
    :goto_4
    const v6, 0xdbff

    .line 144
    .line 145
    .line 146
    if-gt v0, v6, :cond_7

    .line 147
    .line 148
    const v6, 0xdc00

    .line 149
    .line 150
    .line 151
    if-gt v6, v5, :cond_7

    .line 152
    .line 153
    if-ge v2, v5, :cond_6

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :cond_6
    and-int/lit16 v0, v0, 0x3ff

    .line 157
    .line 158
    shl-int/lit8 v0, v0, 0xa

    .line 159
    .line 160
    and-int/lit16 v2, v5, 0x3ff

    .line 161
    .line 162
    or-int/2addr v0, v2

    .line 163
    const/high16 v2, 0x10000

    .line 164
    .line 165
    add-int/2addr v0, v2

    .line 166
    const/4 v2, 0x4

    .line 167
    invoke-virtual {p0, v2}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 168
    .line 169
    .line 170
    move-result-object v4

    .line 171
    iget-object v5, v4, Lokio/Segment;->data:[B

    .line 172
    .line 173
    iget v6, v4, Lokio/Segment;->limit:I

    .line 174
    .line 175
    shr-int/lit8 v7, v0, 0x12

    .line 176
    .line 177
    or-int/lit16 v7, v7, 0xf0

    .line 178
    .line 179
    int-to-byte v7, v7

    .line 180
    aput-byte v7, v5, v6

    .line 181
    .line 182
    add-int/lit8 v7, v6, 0x1

    .line 183
    .line 184
    shr-int/lit8 v8, v0, 0xc

    .line 185
    .line 186
    and-int/2addr v8, v3

    .line 187
    or-int/2addr v8, v1

    .line 188
    int-to-byte v8, v8

    .line 189
    aput-byte v8, v5, v7

    .line 190
    .line 191
    add-int/lit8 v7, v6, 0x2

    .line 192
    .line 193
    shr-int/lit8 v8, v0, 0x6

    .line 194
    .line 195
    and-int/2addr v8, v3

    .line 196
    or-int/2addr v8, v1

    .line 197
    int-to-byte v8, v8

    .line 198
    aput-byte v8, v5, v7

    .line 199
    .line 200
    add-int/lit8 v7, v6, 0x3

    .line 201
    .line 202
    and-int/2addr v0, v3

    .line 203
    or-int/2addr v0, v1

    .line 204
    int-to-byte v0, v0

    .line 205
    aput-byte v0, v5, v7

    .line 206
    .line 207
    add-int/2addr v6, v2

    .line 208
    iput v6, v4, Lokio/Segment;->limit:I

    .line 209
    .line 210
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 211
    .line 212
    const-wide/16 v2, 0x4

    .line 213
    .line 214
    add-long/2addr v0, v2

    .line 215
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 216
    .line 217
    add-int/lit8 p2, p2, 0x2

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_7
    :goto_5
    invoke-virtual {p0, v3}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 222
    .line 223
    .line 224
    move p2, v4

    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :cond_8
    :goto_6
    const/4 v2, 0x3

    .line 228
    invoke-virtual {p0, v2}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 229
    .line 230
    .line 231
    move-result-object v4

    .line 232
    iget-object v5, v4, Lokio/Segment;->data:[B

    .line 233
    .line 234
    iget v6, v4, Lokio/Segment;->limit:I

    .line 235
    .line 236
    shr-int/lit8 v7, v0, 0xc

    .line 237
    .line 238
    or-int/lit16 v7, v7, 0xe0

    .line 239
    .line 240
    int-to-byte v7, v7

    .line 241
    aput-byte v7, v5, v6

    .line 242
    .line 243
    add-int/lit8 v7, v6, 0x1

    .line 244
    .line 245
    shr-int/lit8 v8, v0, 0x6

    .line 246
    .line 247
    and-int/2addr v3, v8

    .line 248
    or-int/2addr v3, v1

    .line 249
    int-to-byte v3, v3

    .line 250
    aput-byte v3, v5, v7

    .line 251
    .line 252
    add-int/lit8 v3, v6, 0x2

    .line 253
    .line 254
    and-int/lit8 v0, v0, 0x3f

    .line 255
    .line 256
    or-int/2addr v0, v1

    .line 257
    int-to-byte v0, v0

    .line 258
    aput-byte v0, v5, v3

    .line 259
    .line 260
    add-int/2addr v6, v2

    .line 261
    iput v6, v4, Lokio/Segment;->limit:I

    .line 262
    .line 263
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 264
    .line 265
    const-wide/16 v2, 0x3

    .line 266
    .line 267
    add-long/2addr v0, v2

    .line 268
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 269
    .line 270
    goto/16 :goto_3

    .line 271
    .line 272
    :cond_9
    return-object p0

    .line 273
    :cond_a
    const-string p0, " > "

    .line 274
    .line 275
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    const-string p2, "endIndex > string.length: "

    .line 280
    .line 281
    invoke-static {p2, p3, p0, p1}, Ll/nlk0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 282
    .line 283
    .line 284
    return-object v0

    .line 285
    :cond_b
    const-string p0, "endIndex < beginIndex: "

    .line 286
    .line 287
    const-string p1, " < "

    .line 288
    .line 289
    invoke-static {p0, p3, p1, p2}, Ll/nlk0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 290
    .line 291
    .line 292
    return-object v0

    .line 293
    :cond_c
    const-string p0, "beginIndex < 0: "

    .line 294
    .line 295
    invoke-static {p0, p2}, Ll/plk0;->a(Ljava/lang/String;I)V

    .line 296
    .line 297
    .line 298
    return-object v0
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;
    .locals 0

    .line 301
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;II)Lokio/BufferedSink;
    .locals 0

    .line 299
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

.method public writeUtf8CodePoint(I)Lokio/Buffer;
    .locals 8
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/16 v1, 0x800

    .line 10
    .line 11
    const/16 v2, 0x3f

    .line 12
    .line 13
    if-ge p1, v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-virtual {p0, v1}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, v3, Lokio/Segment;->data:[B

    .line 21
    .line 22
    iget v5, v3, Lokio/Segment;->limit:I

    .line 23
    .line 24
    shr-int/lit8 v6, p1, 0x6

    .line 25
    .line 26
    or-int/lit16 v6, v6, 0xc0

    .line 27
    .line 28
    int-to-byte v6, v6

    .line 29
    aput-byte v6, v4, v5

    .line 30
    .line 31
    add-int/lit8 v6, v5, 0x1

    .line 32
    .line 33
    and-int/2addr p1, v2

    .line 34
    or-int/2addr p1, v0

    .line 35
    int-to-byte p1, p1

    .line 36
    aput-byte p1, v4, v6

    .line 37
    .line 38
    add-int/2addr v5, v1

    .line 39
    iput v5, v3, Lokio/Segment;->limit:I

    .line 40
    .line 41
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 42
    .line 43
    const-wide/16 v2, 0x2

    .line 44
    .line 45
    add-long/2addr v0, v2

    .line 46
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    const v1, 0xd800

    .line 50
    .line 51
    .line 52
    if-le v1, p1, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const v1, 0xdfff

    .line 56
    .line 57
    .line 58
    if-lt v1, p1, :cond_3

    .line 59
    .line 60
    invoke-virtual {p0, v2}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 61
    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_3
    :goto_0
    const/high16 v1, 0x10000

    .line 65
    .line 66
    if-ge p1, v1, :cond_4

    .line 67
    .line 68
    const/4 v1, 0x3

    .line 69
    invoke-virtual {p0, v1}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget-object v4, v3, Lokio/Segment;->data:[B

    .line 74
    .line 75
    iget v5, v3, Lokio/Segment;->limit:I

    .line 76
    .line 77
    shr-int/lit8 v6, p1, 0xc

    .line 78
    .line 79
    or-int/lit16 v6, v6, 0xe0

    .line 80
    .line 81
    int-to-byte v6, v6

    .line 82
    aput-byte v6, v4, v5

    .line 83
    .line 84
    add-int/lit8 v6, v5, 0x1

    .line 85
    .line 86
    shr-int/lit8 v7, p1, 0x6

    .line 87
    .line 88
    and-int/2addr v7, v2

    .line 89
    or-int/2addr v7, v0

    .line 90
    int-to-byte v7, v7

    .line 91
    aput-byte v7, v4, v6

    .line 92
    .line 93
    add-int/lit8 v6, v5, 0x2

    .line 94
    .line 95
    and-int/2addr p1, v2

    .line 96
    or-int/2addr p1, v0

    .line 97
    int-to-byte p1, p1

    .line 98
    aput-byte p1, v4, v6

    .line 99
    .line 100
    add-int/2addr v5, v1

    .line 101
    iput v5, v3, Lokio/Segment;->limit:I

    .line 102
    .line 103
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 104
    .line 105
    const-wide/16 v2, 0x3

    .line 106
    .line 107
    add-long/2addr v0, v2

    .line 108
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_4
    const v1, 0x10ffff

    .line 112
    .line 113
    .line 114
    if-gt p1, v1, :cond_5

    .line 115
    .line 116
    const/4 v1, 0x4

    .line 117
    invoke-virtual {p0, v1}, Lokio/Buffer;->writableSegment$jvm(I)Lokio/Segment;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    iget-object v4, v3, Lokio/Segment;->data:[B

    .line 122
    .line 123
    iget v5, v3, Lokio/Segment;->limit:I

    .line 124
    .line 125
    shr-int/lit8 v6, p1, 0x12

    .line 126
    .line 127
    or-int/lit16 v6, v6, 0xf0

    .line 128
    .line 129
    int-to-byte v6, v6

    .line 130
    aput-byte v6, v4, v5

    .line 131
    .line 132
    add-int/lit8 v6, v5, 0x1

    .line 133
    .line 134
    shr-int/lit8 v7, p1, 0xc

    .line 135
    .line 136
    and-int/2addr v7, v2

    .line 137
    or-int/2addr v7, v0

    .line 138
    int-to-byte v7, v7

    .line 139
    aput-byte v7, v4, v6

    .line 140
    .line 141
    add-int/lit8 v6, v5, 0x2

    .line 142
    .line 143
    shr-int/lit8 v7, p1, 0x6

    .line 144
    .line 145
    and-int/2addr v7, v2

    .line 146
    or-int/2addr v7, v0

    .line 147
    int-to-byte v7, v7

    .line 148
    aput-byte v7, v4, v6

    .line 149
    .line 150
    add-int/lit8 v6, v5, 0x3

    .line 151
    .line 152
    and-int/2addr p1, v2

    .line 153
    or-int/2addr p1, v0

    .line 154
    int-to-byte p1, p1

    .line 155
    aput-byte p1, v4, v6

    .line 156
    .line 157
    add-int/2addr v5, v1

    .line 158
    iput v5, v3, Lokio/Segment;->limit:I

    .line 159
    .line 160
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 161
    .line 162
    const-wide/16 v2, 0x4

    .line 163
    .line 164
    add-long/2addr v0, v2

    .line 165
    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 166
    .line 167
    return-object p0

    .line 168
    :cond_5
    const-string p0, "Unexpected code point: "

    .line 169
    .line 170
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-static {p0, p1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    const/4 p0, 0x0

    .line 178
    return-object p0
.end method

.method public bridge synthetic writeUtf8CodePoint(I)Lokio/BufferedSink;
    .locals 0

    .line 179
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    move-result-object p0

    return-object p0
.end method

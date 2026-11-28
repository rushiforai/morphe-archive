.class public final Lnicoid/network238/okhttp3/internal/_UtilCommonKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u00ba\u0001\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u000e\n\u0002\u0010\u000c\n\u0002\u0008\t\n\u0002\u0010\u0005\n\u0002\u0008\u0003\n\u0002\u0010\n\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010!\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0003\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u001aI\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0000*\u0008\u0012\u0004\u0012\u00020\u00010\u00002\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u00002\u001a\u0010\u0005\u001a\u0016\u0012\u0006\u0008\u0000\u0012\u00020\u00010\u0003j\n\u0012\u0006\u0008\u0000\u0012\u00020\u0001`\u0004H\u0000\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u001aE\u0010\t\u001a\u00020\u0008*\u0008\u0012\u0004\u0012\u00020\u00010\u00002\u000e\u0010\u0002\u001a\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u00002\u001a\u0010\u0005\u001a\u0016\u0012\u0006\u0008\u0000\u0012\u00020\u00010\u0003j\n\u0012\u0006\u0008\u0000\u0012\u00020\u0001`\u0004H\u0000\u00a2\u0006\u0004\u0008\t\u0010\n\u001a9\u0010\r\u001a\u00020\u000c*\u0008\u0012\u0004\u0012\u00020\u00010\u00002\u0006\u0010\u000b\u001a\u00020\u00012\u0016\u0010\u0005\u001a\u0012\u0012\u0004\u0012\u00020\u00010\u0003j\u0008\u0012\u0004\u0012\u00020\u0001`\u0004H\u0000\u00a2\u0006\u0004\u0008\r\u0010\u000e\u001a\'\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0000*\u0008\u0012\u0004\u0012\u00020\u00010\u00002\u0006\u0010\u000b\u001a\u00020\u0001H\u0000\u00a2\u0006\u0004\u0008\u000f\u0010\u0010\u001a\'\u0010\u0013\u001a\u00020\u000c*\u00020\u00012\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u000cH\u0000\u00a2\u0006\u0004\u0008\u0013\u0010\u0014\u001a\'\u0010\u0015\u001a\u00020\u000c*\u00020\u00012\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u000cH\u0000\u00a2\u0006\u0004\u0008\u0015\u0010\u0014\u001a%\u0010\u0016\u001a\u00020\u0001*\u00020\u00012\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0016\u0010\u0017\u001a-\u0010\u0019\u001a\u00020\u000c*\u00020\u00012\u0006\u0010\u0018\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0019\u0010\u001a\u001a-\u0010\u0019\u001a\u00020\u000c*\u00020\u00012\u0006\u0010\u001c\u001a\u00020\u001b2\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0019\u0010\u001d\u001a\u0013\u0010\u001e\u001a\u00020\u000c*\u00020\u0001H\u0000\u00a2\u0006\u0004\u0008\u001e\u0010\u001f\u001a\u0017\u0010!\u001a\u00020\u00082\u0006\u0010 \u001a\u00020\u0001H\u0000\u00a2\u0006\u0004\u0008!\u0010\"\u001a\u0013\u0010#\u001a\u00020\u000c*\u00020\u001bH\u0000\u00a2\u0006\u0004\u0008#\u0010$\u001a\u001c\u0010\'\u001a\u00020\u000c*\u00020%2\u0006\u0010&\u001a\u00020\u000cH\u0080\u0004\u00a2\u0006\u0004\u0008\'\u0010(\u001a\u001c\u0010\'\u001a\u00020\u000c*\u00020)2\u0006\u0010&\u001a\u00020\u000cH\u0080\u0004\u00a2\u0006\u0004\u0008\'\u0010*\u001a\u001c\u0010\'\u001a\u00020+*\u00020\u000c2\u0006\u0010&\u001a\u00020+H\u0080\u0004\u00a2\u0006\u0004\u0008\'\u0010,\u001a\u001b\u00100\u001a\u00020/*\u00020-2\u0006\u0010.\u001a\u00020\u000cH\u0000\u00a2\u0006\u0004\u00080\u00101\u001a\u0013\u00103\u001a\u00020\u000c*\u000202H\u0000\u00a2\u0006\u0004\u00083\u00104\u001a!\u00107\u001a\u00020/2\u000c\u00106\u001a\u0008\u0012\u0004\u0012\u00020/05H\u0080\u0008\u00f8\u0001\u0000\u00a2\u0006\u0004\u00087\u00108\u001a\u001b\u0010;\u001a\u00020\u000c*\u0002092\u0006\u0010:\u001a\u00020%H\u0000\u00a2\u0006\u0004\u0008;\u0010<\u001a\u001d\u0010=\u001a\u00020\u000c*\u00020\u00012\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u000cH\u0000\u00a2\u0006\u0004\u0008=\u0010>\u001a\u0019\u0010@\u001a\u00020+*\u00020\u00012\u0006\u0010?\u001a\u00020+\u00a2\u0006\u0004\u0008@\u0010A\u001a\u001d\u0010B\u001a\u00020\u000c*\u0004\u0018\u00010\u00012\u0006\u0010?\u001a\u00020\u000cH\u0000\u00a2\u0006\u0004\u0008B\u0010>\u001a\u0015\u0010E\u001a\u00020/*\u00060Cj\u0002`D\u00a2\u0006\u0004\u0008E\u0010F\u001a\u001b\u0010J\u001a\u00020\u0008*\u00020G2\u0006\u0010I\u001a\u00020HH\u0000\u00a2\u0006\u0004\u0008J\u0010K\u001a\u001b\u0010M\u001a\u00020/*\u00020G2\u0006\u0010L\u001a\u00020HH\u0000\u00a2\u0006\u0004\u0008M\u0010N\u001a\u001b\u0010P\u001a\u00020/*\u00020G2\u0006\u0010O\u001a\u00020HH\u0000\u00a2\u0006\u0004\u0008P\u0010N\u001a\'\u0010T\u001a\u00020/\"\u0004\u0008\u0000\u0010Q*\u0008\u0012\u0004\u0012\u00028\u00000R2\u0006\u0010S\u001a\u00028\u0000H\u0000\u00a2\u0006\u0004\u0008T\u0010U\u001a)\u0010[\u001a\u00020Z*\u00060Vj\u0002`W2\u0010\u0010Y\u001a\u000c\u0012\u0008\u0012\u00060Vj\u0002`W0XH\u0000\u00a2\u0006\u0004\u0008[\u0010\\\u001a=\u0010a\u001a\u0008\u0012\u0004\u0012\u00028\u00000X\"\u0004\u0008\u0000\u0010]*\u0008\u0012\u0004\u0012\u00028\u00000^2\u0012\u0010`\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00080_H\u0080\u0008\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008a\u0010b\u001a\'\u0010f\u001a\u00020/2\u0006\u0010c\u001a\u00020+2\u0006\u0010d\u001a\u00020+2\u0006\u0010e\u001a\u00020+H\u0000\u00a2\u0006\u0004\u0008f\u0010g\u001a7\u0010i\u001a\u0008\u0012\u0004\u0012\u00028\u00000X\"\u0004\u0008\u0000\u0010]2\u000c\u0010h\u001a\u0008\u0012\u0004\u0012\u00028\u00000^2\u000c\u0010:\u001a\u0008\u0012\u0004\u0012\u00028\u00000^H\u0000\u00a2\u0006\u0004\u0008i\u0010j\"\u0014\u0010l\u001a\u00020k8\u0000X\u0081\u0004\u00a2\u0006\u0006\n\u0004\u0008l\u0010m\"\u001a\u0010o\u001a\u00020n8\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008o\u0010p\u001a\u0004\u0008q\u0010r\"\u0014\u0010s\u001a\u00020\u00018\u0000X\u0080T\u00a2\u0006\u0006\n\u0004\u0008s\u0010t\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006u"
    }
    d2 = {
        "",
        "",
        "other",
        "Ljava/util/Comparator;",
        "Lnicoid/network238/kotlin/Comparator;",
        "comparator",
        "intersect",
        "([Ljava/lang/String;[Ljava/lang/String;Ljava/util/Comparator;)[Ljava/lang/String;",
        "",
        "hasIntersection",
        "([Ljava/lang/String;[Ljava/lang/String;Ljava/util/Comparator;)Z",
        "value",
        "",
        "indexOf",
        "([Ljava/lang/String;Ljava/lang/String;Ljava/util/Comparator;)I",
        "concat",
        "([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;",
        "startIndex",
        "endIndex",
        "indexOfFirstNonAsciiWhitespace",
        "(Ljava/lang/String;II)I",
        "indexOfLastNonAsciiWhitespace",
        "trimSubstring",
        "(Ljava/lang/String;II)Ljava/lang/String;",
        "delimiters",
        "delimiterOffset",
        "(Ljava/lang/String;Ljava/lang/String;II)I",
        "",
        "delimiter",
        "(Ljava/lang/String;CII)I",
        "indexOfControlOrNonAscii",
        "(Ljava/lang/String;)I",
        "name",
        "isSensitiveHeader",
        "(Ljava/lang/String;)Z",
        "parseHexDigit",
        "(C)I",
        "",
        "mask",
        "and",
        "(BI)I",
        "",
        "(SI)I",
        "",
        "(IJ)J",
        "Lnicoid/network238/okio/BufferedSink;",
        "medium",
        "",
        "writeMedium",
        "(Lnicoid/network238/okio/BufferedSink;I)V",
        "Lnicoid/network238/okio/BufferedSource;",
        "readMedium",
        "(Lnicoid/network238/okio/BufferedSource;)I",
        "Lnicoid/network238/kotlin/Function0;",
        "block",
        "ignoreIoExceptions",
        "(Lnicoid/network238/kotlin/jvm/functions/Function0;)V",
        "Lnicoid/network238/okio/Buffer;",
        "b",
        "skipAll",
        "(Lnicoid/network238/okio/Buffer;B)I",
        "indexOfNonWhitespace",
        "(Ljava/lang/String;I)I",
        "defaultValue",
        "toLongOrDefault",
        "(Ljava/lang/String;J)J",
        "toNonNegativeInt",
        "Ljava/io/Closeable;",
        "Lnicoid/network238/okio/Closeable;",
        "closeQuietly",
        "(Ljava/io/Closeable;)V",
        "Lnicoid/network238/okio/FileSystem;",
        "Lnicoid/network238/okio/Path;",
        "file",
        "isCivilized",
        "(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Z",
        "path",
        "deleteIfExists",
        "(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V",
        "directory",
        "deleteContents",
        "E",
        "",
        "element",
        "addIfAbsent",
        "(Ljava/util/List;Ljava/lang/Object;)V",
        "Ljava/lang/Exception;",
        "Lnicoid/network238/kotlin/Exception;",
        "",
        "suppressed",
        "",
        "withSuppressed",
        "(Ljava/lang/Exception;Ljava/util/List;)Ljava/lang/Throwable;",
        "T",
        "",
        "Lnicoid/network238/kotlin/Function1;",
        "predicate",
        "filterList",
        "(Ljava/lang/Iterable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/util/List;",
        "arrayLength",
        "offset",
        "count",
        "checkOffsetAndCount",
        "(JJJ)V",
        "a",
        "interleave",
        "(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/List;",
        "",
        "EMPTY_BYTE_ARRAY",
        "[B",
        "Lnicoid/network238/okio/Options;",
        "UNICODE_BOMS",
        "Lnicoid/network238/okio/Options;",
        "getUNICODE_BOMS",
        "()Lnicoid/network238/okio/Options;",
        "USER_AGENT",
        "Ljava/lang/String;",
        "okhttp"
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
.field public static final EMPTY_BYTE_ARRAY:[B

.field private static final UNICODE_BOMS:Lnicoid/network238/okio/Options;

.field public static final USER_AGENT:Ljava/lang/String; = "okhttp/5.5.1"


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 34
    const/4 v0, 0x0

    new-array v1, v0, [B

    sput-object v1, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->EMPTY_BYTE_ARRAY:[B

    .line 38
    sget-object v1, Lnicoid/network238/okio/Options;->Companion:Lnicoid/network238/okio/Options$Companion;

    .line 40
    sget-object v2, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const-string v3, "efbbbf"

    invoke-virtual {v2, v3}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v3

    .line 42
    const-string v4, "feff"

    invoke-virtual {v2, v4}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v4

    .line 44
    const-string v5, "fffe0000"

    invoke-virtual {v2, v5}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v5

    .line 46
    const-string v6, "fffe"

    invoke-virtual {v2, v6}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v6

    .line 48
    const-string v7, "0000feff"

    invoke-virtual {v2, v7}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v2

    const/4 v7, 0x5

    new-array v7, v7, [Lnicoid/network238/okio/ByteString;

    aput-object v3, v7, v0

    const/4 v0, 0x1

    aput-object v4, v7, v0

    const/4 v0, 0x2

    aput-object v5, v7, v0

    const/4 v0, 0x3

    aput-object v6, v7, v0

    const/4 v0, 0x4

    aput-object v2, v7, v0

    .line 38
    invoke-virtual {v1, v7}, Lnicoid/network238/okio/Options$Companion;->of([Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Options;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->UNICODE_BOMS:Lnicoid/network238/okio/Options;

    return-void
.end method

.method public static final addIfAbsent(Ljava/util/List;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TE;>;TE;)V"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 351
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public static final and(BI)I
    .registers 2

    and-int/2addr p0, p1

    return p0
.end method

.method public static final and(SI)I
    .registers 2

    and-int/2addr p0, p1

    return p0
.end method

.method public static final and(IJ)J
    .registers 5

    int-to-long v0, p0

    and-long/2addr v0, p1

    return-wide v0
.end method

.method public static final checkOffsetAndCount(JJJ)V
    .registers 10

    or-long v0, p2, p4

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    cmp-long v0, p2, p0

    if-gtz v0, :cond_0

    sub-long v0, p0, p2

    cmp-long p4, v0, p4

    if-ltz p4, :cond_0

    return-void

    .line 378
    :cond_0
    new-instance p4, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance p5, Ljava/lang/StringBuilder;

    const-string v0, "length="

    invoke-direct {p5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ", offset="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ", count="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p4, p0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p4
.end method

.method public static final closeQuietly(Ljava/io/Closeable;)V
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 284
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void

    .line 286
    :catch_1
    move-exception p0

    throw p0
.end method

.method public static final concat([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    .line 102
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/ArraysKt;->getLastIndex([Ljava/lang/Object;)I

    move-result v0

    aput-object p1, p0, v0

    return-object p0
.end method

.method public static final deleteContents(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 328
    :try_start_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->list(Lnicoid/network238/okio/Path;)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 332
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okio/Path;

    .line 334
    :try_start_1
    invoke-virtual {p0, v1}, Lnicoid/network238/okio/FileSystem;->metadata(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/FileMetadata;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 335
    invoke-static {p0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->deleteContents(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    .line 338
    :cond_1
    invoke-virtual {p0, v1}, Lnicoid/network238/okio/FileSystem;->delete(Lnicoid/network238/okio/Path;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_2
    if-nez v0, :cond_3

    return-void

    .line 346
    :cond_3
    throw v0

    :catch_1
    move-exception p0

    return-void
.end method

.method public static final deleteIfExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 317
    :try_start_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->delete(Lnicoid/network238/okio/Path;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return-void
.end method

.method public static final delimiterOffset(Ljava/lang/String;CII)I
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    if-ge p2, p3, :cond_1

    .line 171
    invoke-virtual {p0, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, p1, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    return p3
.end method

.method public static final delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I
    .registers 8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    if-ge p2, p3, :cond_1

    .line 156
    invoke-virtual {p0, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p1, v0, v3, v1, v2}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    return p3
.end method

.method public static synthetic delimiterOffset$default(Ljava/lang/String;CIIILjava/lang/Object;)I
    .registers 6

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 168
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p3

    .line 165
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result p0

    return p0
.end method

.method public static synthetic delimiterOffset$default(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/Object;)I
    .registers 6

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 153
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p3

    .line 150
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result p0

    return p0
.end method

.method public static final filterList(Ljava/lang/Iterable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/util/List;
    .registers 7
    .param p0, "$this$filterList"    # Ljava/lang/Iterable;
    .param p1, "predicate"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "predicate"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 360
    .local v0, "$i$f$filterList":I
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 361
    .local v1, "result":Ljava/util/List;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 362
    .local v3, "i":Ljava/lang/Object;
    invoke-interface {p1, v3}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 363
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v4

    check-cast v1, Ljava/util/List;

    .line 364
    :cond_1
    const-string v4, "null cannot be cast to non-null type nicoid.network238.kotlin.collections.MutableList<T of nicoid.network238.okhttp3.internal._UtilCommonKt.filterList>"

    invoke-static {v1, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->asMutableList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 367
    .end local v3    # "i":Ljava/lang/Object;
    :cond_2
    return-object v1
.end method

.method public static final getUNICODE_BOMS()Lnicoid/network238/okio/Options;
    .registers 1

    .line 37
    sget-object v0, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->UNICODE_BOMS:Lnicoid/network238/okio/Options;

    return-object v0
.end method

.method public static final hasIntersection([Ljava/lang/String;[Ljava/lang/String;Ljava/util/Comparator;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/Comparator<",
            "-",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    array-length v0, p0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    array-length v0, p1

    if-eqz v0, :cond_2

    .line 84
    array-length v0, p0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p0, v2

    .line 85
    array-length v4, p1

    move v5, v1

    :goto_1
    if-ge v5, v4, :cond_1

    aget-object v6, p1, v5

    .line 86
    invoke-interface {p2, v3, v6}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-nez v6, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static final ignoreIoExceptions(Lnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 3
    .param p0, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 228
    .local v0, "$i$f$ignoreIoExceptions":I
    nop

    .line 229
    :try_start_0
    invoke-interface {p0}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 230
    :catch_0
    move-exception v1

    .line 232
    :goto_0
    return-void
.end method

.method public static final indexOf([Ljava/lang/String;Ljava/lang/String;Ljava/util/Comparator;)I
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Comparator<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 403
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 404
    aget-object v2, p0, v1

    .line 97
    invoke-interface {p2, v2, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-nez v2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static final indexOfControlOrNonAscii(Ljava/lang/String;)I
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 181
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 182
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 183
    const/16 v3, 0x1f

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v3

    if-lez v3, :cond_0

    const/16 v3, 0x7f

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v2

    if-gez v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static final indexOfFirstNonAsciiWhitespace(Ljava/lang/String;II)I
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    if-ge p1, p2, :cond_1

    .line 112
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    const/16 v1, 0xc

    if-eq v0, v1, :cond_0

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method public static synthetic indexOfFirstNonAsciiWhitespace$default(Ljava/lang/String;IIILjava/lang/Object;)I
    .registers 5

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    const/4 p1, 0x0

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    .line 109
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    .line 107
    :cond_1
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfFirstNonAsciiWhitespace(Ljava/lang/String;II)I

    move-result p0

    return p0
.end method

.method public static final indexOfLastNonAsciiWhitespace(Ljava/lang/String;II)I
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    add-int/lit8 p2, p2, -0x1

    if-gt p1, p2, :cond_1

    .line 128
    :goto_0
    invoke-virtual {p0, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    const/16 v1, 0xc

    if-eq v0, v1, :cond_0

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    add-int/lit8 p2, p2, 0x1

    return p2

    :cond_0
    if-eq p2, p1, :cond_1

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_1
    return p1
.end method

.method public static synthetic indexOfLastNonAsciiWhitespace$default(Ljava/lang/String;IIILjava/lang/Object;)I
    .registers 5

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    const/4 p1, 0x0

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    .line 125
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    .line 123
    :cond_1
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfLastNonAsciiWhitespace(Ljava/lang/String;II)I

    move-result p0

    return p0
.end method

.method public static final indexOfNonWhitespace(Ljava/lang/String;I)I
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 248
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    :goto_0
    if-ge p1, v0, :cond_1

    .line 249
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x20

    if-eq v1, v2, :cond_0

    const/16 v2, 0x9

    if-eq v1, v2, :cond_0

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 254
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    return p0
.end method

.method public static synthetic indexOfNonWhitespace$default(Ljava/lang/String;IILjava/lang/Object;)I
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 247
    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfNonWhitespace(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static final interleave(Ljava/lang/Iterable;Ljava/lang/Iterable;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;",
            "Ljava/lang/Iterable<",
            "+TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 386
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 387
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 389
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->createListBuilder()Ljava/util/List;

    move-result-object v0

    .line 390
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 389
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->build(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 391
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 392
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 394
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 395
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public static final intersect([Ljava/lang/String;[Ljava/lang/String;Ljava/util/Comparator;)[Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/Comparator<",
            "-",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, p0, v3

    .line 61
    array-length v5, p1

    move v6, v2

    :goto_1
    if-ge v6, v5, :cond_1

    aget-object v7, p1, v6

    .line 62
    invoke-interface {p2, v4, v7}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v7

    if-nez v7, :cond_0

    .line 63
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    nop

    .line 402
    new-array p0, v2, [Ljava/lang/String;

    invoke-interface {v0, p0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public static final isCivilized(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Z
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 303
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->sink(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Sink;

    move-result-object v0

    .line 305
    :try_start_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->delete(Lnicoid/network238/okio/Path;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 p0, 0x1

    if-eqz v0, :cond_0

    .line 419
    :try_start_1
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    :cond_0
    :goto_0
    return p0

    :catch_0
    move-exception v1

    .line 309
    :try_start_2
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v0, :cond_1

    .line 419
    :try_start_3
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    goto :goto_3

    .line 409
    :cond_1
    :goto_1
    const/4 v0, 0x0

    goto :goto_3

    .line 419
    :catchall_2
    move-exception v1

    if-eqz v0, :cond_2

    :try_start_4
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v0

    .line 409
    invoke-static {v1, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_2
    :goto_2
    move-object v0, v1

    :goto_3
    if-nez v0, :cond_3

    .line 310
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->delete(Lnicoid/network238/okio/Path;)V

    const/4 p0, 0x0

    return p0

    .line 429
    :cond_3
    throw v0
.end method

.method public static final isSensitiveHeader(Ljava/lang/String;)Z
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 192
    const-string v0, "Authorization"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 193
    const-string v0, "Cookie"

    invoke-static {p0, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 194
    const-string v0, "Proxy-Authorization"

    invoke-static {p0, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 195
    const-string v0, "Set-Cookie"

    invoke-static {p0, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    return v1
.end method

.method public static final parseHexDigit(C)I
    .registers 3

    const/16 v0, 0x30

    if-gt v0, p0, :cond_0

    const/16 v1, 0x3a

    if-ge p0, v1, :cond_0

    sub-int/2addr p0, v0

    return p0

    :cond_0
    const/16 v0, 0x61

    if-gt v0, p0, :cond_1

    const/16 v0, 0x67

    if-ge p0, v0, :cond_1

    add-int/lit8 p0, p0, -0x57

    return p0

    :cond_1
    const/16 v0, 0x41

    if-gt v0, p0, :cond_2

    const/16 v0, 0x47

    if-ge p0, v0, :cond_2

    add-int/lit8 p0, p0, -0x37

    return p0

    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method public static final readMedium(Lnicoid/network238/okio/BufferedSource;)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 221
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v0

    const/16 v1, 0xff

    invoke-static {v0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    .line 222
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result v2

    invoke-static {v2, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    .line 223
    invoke-interface {p0}, Lnicoid/network238/okio/BufferedSource;->readByte()B

    move-result p0

    invoke-static {p0, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result p0

    or-int/2addr v0, p0

    return v0
.end method

.method public static final skipAll(Lnicoid/network238/okio/Buffer;B)I
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 236
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v1

    if-ne v1, p1, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 238
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    goto :goto_0

    :cond_0
    return v0
.end method

.method public static final toLongOrDefault(Ljava/lang/String;J)J
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 259
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    move-exception p0

    return-wide p1
.end method

.method public static final toNonNegativeInt(Ljava/lang/String;I)I
    .registers 4

    if-eqz p0, :cond_2

    .line 270
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    const p0, 0x7fffffff

    return p0

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gez v0, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    long-to-int p0, p0

    return p0

    :catch_0
    move-exception p0

    :cond_2
    return p1
.end method

.method public static final trimSubstring(Ljava/lang/String;II)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 141
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfFirstNonAsciiWhitespace(Ljava/lang/String;II)I

    move-result p1

    .line 142
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfLastNonAsciiWhitespace(Ljava/lang/String;II)I

    move-result p2

    .line 143
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic trimSubstring$default(Ljava/lang/String;IIILjava/lang/Object;)Ljava/lang/String;
    .registers 5

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    const/4 p1, 0x0

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    .line 139
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    .line 137
    :cond_1
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final withSuppressed(Ljava/lang/Exception;Ljava/util/List;)Ljava/lang/Throwable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            "Ljava/util/List<",
            "+",
            "Ljava/lang/Exception;",
            ">;)",
            "Ljava/lang/Throwable;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 356
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Exception;

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static final writeMedium(Lnicoid/network238/okio/BufferedSink;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    ushr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    .line 213
    invoke-interface {p0, v0}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    ushr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    .line 214
    invoke-interface {p0, v0}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    and-int/lit16 p1, p1, 0xff

    .line 215
    invoke-interface {p0, p1}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    return-void
.end method

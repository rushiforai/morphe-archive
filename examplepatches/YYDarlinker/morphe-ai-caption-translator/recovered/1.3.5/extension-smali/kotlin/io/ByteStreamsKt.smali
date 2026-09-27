.class public final Lkotlin/io/ByteStreamsKt;
.super Ljava/lang/Object;
.source "IOStreams.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0084\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\u000e\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0086\u0082\u0004\u001a\u001c\u0010\u0003\u001a\u00020\u0004*\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u0087\u0088\u0004b\u0002\u0008\u0008\u001a\u0012\u0010\t\u001a\u00020\u0004*\u00020\nH\u0087\u0088\u0004b\u0002\u0008\u0008\u001a\"\u0010\t\u001a\u00020\u0004*\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000cH\u0087\u0088\u0004b\u0002\u0008\u0008\u001a\u001c\u0010\u000e\u001a\u00020\u0002*\u00020\u000f2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u000cH\u0087\u0088\u0004b\u0002\u0008\u0008\u001a\u001c\u0010\u0011\u001a\u00020\u0012*\u00020\u000f2\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u0087\u0088\u0004b\u0002\u0008\u0008\u001a\u001c\u0010\u0013\u001a\u00020\u0014*\u00020\u000f2\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u0087\u0088\u0004b\u0002\u0008\u0008\u001a\u001c\u0010\u000e\u001a\u00020\u0015*\u00020\u00162\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u000cH\u0087\u0088\u0004b\u0002\u0008\u0008\u001a\u001c\u0010\u0017\u001a\u00020\u0018*\u00020\u00162\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u0087\u0088\u0004b\u0002\u0008\u0008\u001a\u001c\u0010\u0019\u001a\u00020\u001a*\u00020\u00162\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u0087\u0088\u0004b\u0002\u0008\u0008\u001a$\u0010\u001b\u001a\u00020\u001c*\u00020\u000f2\u0006\u0010\u001d\u001a\u00020\u00162\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u000cH\u0087\u0080\u0008b\u0002\u0008\u001e\u001af\u0010\u001f\u001a\u00020\n*\u00020\u000f2\u0008\u0008\u0002\u0010 \u001a\u00020\u000cH\u0087\u0080\u0004b*\u0008!\u0012\u0008\u0008\"\u0012\u0004\u0008\u0008(#\u0012\u001c\u0008$\u0012\u0018\u0008\u000bB\u0014\u0008%\u0012\u0008\u0008&\u0012\u0004\u0008\u0008(\'\u0012\u0006\u0008(\u0012\u0002\u0008\u000cb \u0008)\u0012\u0008\u0008*\u0012\u0004\u0008\u0008(+\u0012\u0008\u0008,\u0012\u0004\u0008\u0008(-\u0012\u0008\u0008.\u0012\u0004\u0008\u0008(/\u001a\u001c\u0010\u001f\u001a\u00020\n*\u00020\u000fH\u0087\u0080\u0004b\u000c\u00080\u0012\u0008\u00081\u0012\u0004\u0008\u0008(+\u00a8\u00062"
    }
    d2 = {
        "iterator",
        "Lkotlin/collections/ByteIterator;",
        "Ljava/io/BufferedInputStream;",
        "byteInputStream",
        "Ljava/io/ByteArrayInputStream;",
        "",
        "charset",
        "Ljava/nio/charset/Charset;",
        "Lkotlin/internal/InlineOnly;",
        "inputStream",
        "",
        "offset",
        "",
        "length",
        "buffered",
        "Ljava/io/InputStream;",
        "bufferSize",
        "reader",
        "Ljava/io/InputStreamReader;",
        "bufferedReader",
        "Ljava/io/BufferedReader;",
        "Ljava/io/BufferedOutputStream;",
        "Ljava/io/OutputStream;",
        "writer",
        "Ljava/io/OutputStreamWriter;",
        "bufferedWriter",
        "Ljava/io/BufferedWriter;",
        "copyTo",
        "",
        "out",
        "Lkotlin/IgnorableReturnValue;",
        "readBytes",
        "estimatedSize",
        "Lkotlin/Deprecated;",
        "message",
        "Use readBytes() overload without estimatedSize parameter",
        "replaceWith",
        "Lkotlin/ReplaceWith;",
        "expression",
        "readBytes()",
        "imports",
        "Lkotlin/DeprecatedSinceKotlin;",
        "warningSince",
        "1.3",
        "errorSince",
        "1.5",
        "hiddenSince",
        "2.3",
        "Lkotlin/SinceKotlin;",
        "version",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private static final buffered(Ljava/io/InputStream;I)Ljava/io/BufferedInputStream;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    instance-of v0, p0, Ljava/io/BufferedInputStream;

    if-eqz v0, :cond_c

    check-cast p0, Ljava/io/BufferedInputStream;

    return-object p0

    :cond_c
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    return-object v0
.end method

.method private static final buffered(Ljava/io/OutputStream;I)Ljava/io/BufferedOutputStream;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    instance-of v0, p0, Ljava/io/BufferedOutputStream;

    if-eqz v0, :cond_c

    check-cast p0, Ljava/io/BufferedOutputStream;

    return-object p0

    :cond_c
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, p0, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    return-object v0
.end method

.method static synthetic buffered$default(Ljava/io/InputStream;IILjava/lang/Object;)Ljava/io/BufferedInputStream;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    const/16 p1, 0x2000

    .line 74
    :cond_6
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    instance-of p2, p0, Ljava/io/BufferedInputStream;

    if-eqz p2, :cond_12

    check-cast p0, Ljava/io/BufferedInputStream;

    return-object p0

    :cond_12
    new-instance p2, Ljava/io/BufferedInputStream;

    invoke-direct {p2, p0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    return-object p2
.end method

.method static synthetic buffered$default(Ljava/io/OutputStream;IILjava/lang/Object;)Ljava/io/BufferedOutputStream;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    const/16 p1, 0x2000

    .line 97
    :cond_6
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    instance-of p2, p0, Ljava/io/BufferedOutputStream;

    if-eqz p2, :cond_12

    check-cast p0, Ljava/io/BufferedOutputStream;

    return-object p0

    :cond_12
    new-instance p2, Ljava/io/BufferedOutputStream;

    invoke-direct {p2, p0, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    return-object p2
.end method

.method private static final bufferedReader(Ljava/io/InputStream;Ljava/nio/charset/Charset;)Ljava/io/BufferedReader;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "charset"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/io/InputStreamReader;

    .line 87
    invoke-direct {v0, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    check-cast v0, Ljava/io/Reader;

    instance-of p0, v0, Ljava/io/BufferedReader;

    if-eqz p0, :cond_18

    check-cast v0, Ljava/io/BufferedReader;

    return-object v0

    :cond_18
    new-instance p0, Ljava/io/BufferedReader;

    const/16 p1, 0x2000

    invoke-direct {p0, v0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    return-object p0
.end method

.method static synthetic bufferedReader$default(Ljava/io/InputStream;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/io/BufferedReader;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    .line 87
    sget-object p1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    :cond_6
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "charset"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p2, Ljava/io/InputStreamReader;

    invoke-direct {p2, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    check-cast p2, Ljava/io/Reader;

    instance-of p0, p2, Ljava/io/BufferedReader;

    if-eqz p0, :cond_1e

    check-cast p2, Ljava/io/BufferedReader;

    return-object p2

    :cond_1e
    new-instance p0, Ljava/io/BufferedReader;

    const/16 p1, 0x2000

    invoke-direct {p0, p2, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    return-object p0
.end method

.method private static final bufferedWriter(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)Ljava/io/BufferedWriter;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "charset"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/io/OutputStreamWriter;

    .line 110
    invoke-direct {v0, p0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    check-cast v0, Ljava/io/Writer;

    instance-of p0, v0, Ljava/io/BufferedWriter;

    if-eqz p0, :cond_18

    check-cast v0, Ljava/io/BufferedWriter;

    return-object v0

    :cond_18
    new-instance p0, Ljava/io/BufferedWriter;

    const/16 p1, 0x2000

    invoke-direct {p0, v0, p1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V

    return-object p0
.end method

.method static synthetic bufferedWriter$default(Ljava/io/OutputStream;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/io/BufferedWriter;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    .line 110
    sget-object p1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    :cond_6
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "charset"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p2, Ljava/io/OutputStreamWriter;

    invoke-direct {p2, p0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    check-cast p2, Ljava/io/Writer;

    instance-of p0, p2, Ljava/io/BufferedWriter;

    if-eqz p0, :cond_1e

    check-cast p2, Ljava/io/BufferedWriter;

    return-object p2

    :cond_1e
    new-instance p0, Ljava/io/BufferedWriter;

    const/16 p1, 0x2000

    invoke-direct {p0, p2, p1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V

    return-object p0
.end method

.method private static final byteInputStream(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/io/ByteArrayInputStream;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "charset"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    const-string p1, "getBytes(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method static synthetic byteInputStream$default(Ljava/lang/String;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/io/ByteArrayInputStream;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    .line 50
    sget-object p1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    :cond_6
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "charset"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p2, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    const-string p1, "getBytes(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p2, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object p2
.end method

.method public static final copyTo(Ljava/io/InputStream;Ljava/io/OutputStream;I)J
    .registers 8
    .annotation runtime Lkotlin/IgnorableReturnValue;
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "out"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    new-array p2, p2, [B

    .line 121
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    const-wide/16 v1, 0x0

    :goto_12
    if-ltz v0, :cond_1f

    const/4 v3, 0x0

    .line 123
    invoke-virtual {p1, p2, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v3, v0

    add-long/2addr v1, v3

    .line 125
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    goto :goto_12

    :cond_1f
    return-wide v1
.end method

.method public static synthetic copyTo$default(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_6

    const/16 p2, 0x2000

    .line 118
    :cond_6
    invoke-static {p0, p1, p2}, Lkotlin/io/ByteStreamsKt;->copyTo(Ljava/io/InputStream;Ljava/io/OutputStream;I)J

    move-result-wide p0

    return-wide p0
.end method

.method private static final inputStream([B)Ljava/io/ByteArrayInputStream;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method private static final inputStream([BII)Ljava/io/ByteArrayInputStream;
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0, p1, p2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    return-object v0
.end method

.method public static final iterator(Ljava/io/BufferedInputStream;)Lkotlin/collections/ByteIterator;
    .registers 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    new-instance v0, Lkotlin/io/ByteStreamsKt$iterator$1;

    invoke-direct {v0, p0}, Lkotlin/io/ByteStreamsKt$iterator$1;-><init>(Ljava/io/BufferedInputStream;)V

    check-cast v0, Lkotlin/collections/ByteIterator;

    return-object v0
.end method

.method public static final readBytes(Ljava/io/InputStream;)[B
    .registers 6

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 150
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x2000

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 151
    move-object v1, v0

    check-cast v1, Ljava/io/OutputStream;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p0, v1, v4, v2, v3}, Lkotlin/io/ByteStreamsKt;->copyTo$default(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J

    .line 152
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    const-string v0, "toByteArray(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final synthetic readBytes(Ljava/io/InputStream;I)[B
    .registers 6
    .annotation runtime Lkotlin/Deprecated;
        message = "Use readBytes() overload without estimatedSize parameter"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "readBytes()"
            imports = {}
        .end subannotation
    .end annotation

    .annotation runtime Lkotlin/DeprecatedSinceKotlin;
        errorSince = "1.5"
        hiddenSince = "2.3"
        warningSince = "1.3"
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 138
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-direct {v0, p1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 139
    move-object p1, v0

    check-cast p1, Ljava/io/OutputStream;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p0, p1, v3, v1, v2}, Lkotlin/io/ByteStreamsKt;->copyTo$default(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J

    .line 140
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    const-string p1, "toByteArray(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static synthetic readBytes$default(Ljava/io/InputStream;IILjava/lang/Object;)[B
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    const/16 p1, 0x2000

    .line 137
    :cond_6
    invoke-static {p0, p1}, Lkotlin/io/ByteStreamsKt;->readBytes(Ljava/io/InputStream;I)[B

    move-result-object p0

    return-object p0
.end method

.method private static final reader(Ljava/io/InputStream;Ljava/nio/charset/Charset;)Ljava/io/InputStreamReader;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "charset"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method static synthetic reader$default(Ljava/io/InputStream;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/io/InputStreamReader;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    .line 79
    sget-object p1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    :cond_6
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "charset"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p2, Ljava/io/InputStreamReader;

    invoke-direct {p2, p0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    return-object p2
.end method

.method private static final writer(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)Ljava/io/OutputStreamWriter;
    .registers 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "charset"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-direct {v0, p0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method static synthetic writer$default(Ljava/io/OutputStream;Ljava/nio/charset/Charset;ILjava/lang/Object;)Ljava/io/OutputStreamWriter;
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_6

    .line 102
    sget-object p1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    :cond_6
    const-string p2, "<this>"

    invoke-static {p0, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "charset"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p2, Ljava/io/OutputStreamWriter;

    invoke-direct {p2, p0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    return-object p2
.end method

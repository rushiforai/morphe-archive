.class public final Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u000c\u001a\n\u0010\u0002\u001a\u00020\u0003*\u00020\u0004\u001a\u000c\u0010\u0005\u001a\u00020\u0003*\u00020\u0004H\u0000\u001a\u000c\u0010\u0006\u001a\u00020\u0003*\u00020\u0004H\u0000\u001a\"\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u000bH\u0000\u001a0\u0010\r\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u00082\u0006\u0010\u000f\u001a\u00020\u000bH\u0000\u001a\u0010\u0010\u0010\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\u0008H\u0000\u001a\u0010\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u000e\u001a\u00020\u0008H\u0000\u001a\u0010\u0010\u0012\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u0008H\u0002\u001a\u0010\u0010\u0013\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\u0008H\u0000\u001a\u000e\u0010\u0014\u001a\u0004\u0018\u00010\u0004*\u00020\u0004H\u0000\u001a\u0012\u0010\u0015\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0016\u001a\u00020\u0004H\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "VERIFY_AS_IP_ADDRESS",
        "Lnicoid/network238/kotlin/text/Regex;",
        "canParseAsIpAddress",
        "",
        "",
        "containsInvalidLabelLengths",
        "containsInvalidHostnameAsciiCodes",
        "decodeIpv6",
        "",
        "input",
        "pos",
        "",
        "limit",
        "decodeIpv4Suffix",
        "address",
        "addressOffset",
        "inet6AddressToAscii",
        "canonicalizeInetAddress",
        "isMappedIpv4Address",
        "inet4AddressToAscii",
        "toCanonicalHost",
        "idnToAscii",
        "host",
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
.field private static final VERIFY_AS_IP_ADDRESS:Lnicoid/network238/kotlin/text/Regex;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 34
    new-instance v0, Lnicoid/network238/kotlin/text/Regex;

    const-string v1, "([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)"

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/text/Regex;-><init>(Ljava/lang/String;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->VERIFY_AS_IP_ADDRESS:Lnicoid/network238/kotlin/text/Regex;

    return-void
.end method

.method public static final canParseAsIpAddress(Ljava/lang/String;)Z
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    sget-object v0, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->VERIFY_AS_IP_ADDRESS:Lnicoid/network238/kotlin/text/Regex;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method public static final canonicalizeInetAddress([B)[B
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 245
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->isMappedIpv4Address([B)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xc

    const/16 v1, 0x10

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(II)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/collections/ArraysKt;->sliceArray([BLnicoid/network238/kotlin/ranges/IntRange;)[B

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static final containsInvalidHostnameAsciiCodes(Ljava/lang/String;)Z
    .registers 10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 65
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 69
    const/16 v3, 0x1f

    invoke-static {v4, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v3

    if-lez v3, :cond_0

    const/16 v3, 0x7f

    invoke-static {v4, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v3

    if-gez v3, :cond_0

    .line 75
    const/4 v7, 0x6

    const/4 v8, 0x0

    const-string v3, " #%/:?@[\\]"

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method public static final containsInvalidLabelLengths(Ljava/lang/String;)Z
    .registers 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-gt v1, v0, :cond_2

    const/16 v2, 0xfe

    if-ge v0, v2, :cond_2

    const/4 v0, 0x0

    move v4, v0

    :goto_0
    nop

    .line 48
    const/16 v3, 0x2e

    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v7, 0x0

    move-object v2, p0

    invoke-static/range {v2 .. v7}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result p0

    const/4 v3, -0x1

    if-ne p0, v3, :cond_0

    .line 51
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v4

    goto :goto_1

    :cond_0
    sub-int v5, p0, v4

    :goto_1
    if-gt v1, v5, :cond_2

    const/16 v4, 0x40

    if-ge v5, v4, :cond_2

    if-eq p0, v3, :cond_1

    .line 56
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v1

    if-eq p0, v3, :cond_1

    add-int/lit8 v4, p0, 0x1

    move-object p0, v2

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    return v1
.end method

.method public static final decodeIpv4Suffix(Ljava/lang/String;II[BI)Z
    .registers 12

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move v0, p4

    :goto_0
    const/4 v1, 0x0

    if-ge p1, p2, :cond_5

    .line 166
    array-length v2, p3

    if-eq v0, v2, :cond_6

    if-eq v0, p4, :cond_0

    .line 170
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_6

    add-int/lit8 p1, p1, 0x1

    :cond_0
    move v2, p1

    move v3, v1

    :goto_1
    if-ge v2, p2, :cond_2

    .line 178
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 179
    const/16 v5, 0x30

    invoke-static {v4, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v6

    if-ltz v6, :cond_2

    const/16 v6, 0x39

    invoke-static {v4, v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v6

    if-gtz v6, :cond_2

    if-nez v3, :cond_1

    if-ne p1, v2, :cond_3

    :cond_1
    mul-int/lit8 v3, v3, 0xa

    add-int/2addr v3, v4

    sub-int/2addr v3, v5

    const/16 v4, 0xff

    if-gt v3, v4, :cond_3

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    sub-int p1, v2, p1

    if-nez p1, :cond_4

    :cond_3
    goto :goto_2

    :cond_4
    add-int/lit8 p1, v0, 0x1

    int-to-byte v1, v3

    .line 189
    aput-byte v1, p3, v0

    move v0, p1

    move p1, v2

    goto :goto_0

    :cond_5
    add-int/lit8 p4, p4, 0x4

    if-ne v0, p4, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    :goto_2
    return v1
.end method

.method public static final decodeIpv6(Ljava/lang/String;II)[B
    .registers 16

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    const/16 v0, 0x10

    new-array v1, v0, [B

    const/4 v2, 0x0

    const/4 v3, -0x1

    move v6, p1

    move p1, v2

    move v10, v3

    move v11, v10

    :goto_0
    if-ge v6, p2, :cond_5

    if-eq p1, v0, :cond_6

    add-int/lit8 v12, v6, 0x2

    if-gt v12, p2, :cond_0

    .line 98
    const/4 v8, 0x4

    const/4 v9, 0x0

    const-string v5, "::"

    const/4 v7, 0x0

    move-object v4, p0

    invoke-static/range {v4 .. v9}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;IZILjava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    if-ne v10, v3, :cond_6

    add-int/lit8 p1, p1, 0x2

    move v10, p1

    if-eq v12, p2, :cond_5

    move v11, v12

    goto :goto_1

    .line 88
    :cond_0
    move-object v4, p0

    .line 98
    :cond_1
    if-eqz p1, :cond_3

    .line 107
    const/4 v8, 0x4

    const/4 v9, 0x0

    const-string v5, ":"

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;IZILjava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    add-int/lit8 v6, v6, 0x1

    move v11, v6

    goto :goto_1

    .line 109
    :cond_2
    const/4 v8, 0x4

    const/4 v9, 0x0

    const-string v5, "."

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;IZILjava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    add-int/lit8 p0, p1, -0x2

    .line 111
    invoke-static {v4, v11, p2, v1, p0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->decodeIpv4Suffix(Ljava/lang/String;II[BI)Z

    move-result p0

    if-eqz p0, :cond_6

    add-int/lit8 p1, p1, 0x2

    goto :goto_3

    :cond_3
    move v11, v6

    :goto_1
    move p0, v2

    move v6, v11

    :goto_2
    if-ge v6, p2, :cond_4

    .line 123
    invoke-virtual {v4, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->parseHexDigit(C)I

    move-result v5

    if-eq v5, v3, :cond_4

    shl-int/lit8 p0, p0, 0x4

    add-int/2addr p0, v5

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_4
    sub-int v5, v6, v11

    if-eqz v5, :cond_6

    const/4 v7, 0x4

    if-gt v5, v7, :cond_6

    add-int/lit8 v5, p1, 0x1

    ushr-int/lit8 v7, p0, 0x8

    and-int/lit16 v7, v7, 0xff

    int-to-byte v7, v7

    .line 132
    aput-byte v7, v1, p1

    add-int/lit8 p1, p1, 0x2

    and-int/lit16 p0, p0, 0xff

    int-to-byte p0, p0

    .line 133
    aput-byte p0, v1, v5

    move-object p0, v4

    goto :goto_0

    :cond_5
    :goto_3
    if-eq p1, v0, :cond_8

    if-ne v10, v3, :cond_7

    :cond_6
    const/4 p0, 0x0

    return-object p0

    :cond_7
    sub-int p0, p1, v10

    rsub-int/lit8 p0, p0, 0x10

    .line 147
    invoke-static {v1, v1, p0, v10, p1}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    sub-int/2addr v0, p1

    add-int/2addr v0, v10

    .line 148
    invoke-static {v1, v2, v10, v0}, Lnicoid/network238/kotlin/collections/ArraysKt;->fill([BBII)V

    :cond_8
    return-object v1
.end method

.method public static final idnToAscii(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 315
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object p0

    .line 316
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 319
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v1

    if-nez v1, :cond_1

    .line 320
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readUtf8CodePoint()I

    move-result v1

    .line 321
    invoke-static {}, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTableInstanceKt;->getIDNA_MAPPING_TABLE()Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lnicoid/network238/okhttp3/internal/idn/IdnaMappingTable;->map(ILnicoid/network238/okio/BufferedSink;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 325
    :cond_1
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_NormalizeJvmKt;->normalizeNfc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 326
    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    .line 329
    sget-object v0, Lnicoid/network238/okhttp3/internal/idn/Punycode;->INSTANCE:Lnicoid/network238/okhttp3/internal/idn/Punycode;

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/internal/idn/Punycode;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_2

    goto :goto_0

    .line 334
    :cond_2
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_NormalizeJvmKt;->normalizeNfc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    :goto_0
    const/4 p0, 0x0

    return-object p0

    .line 341
    :cond_3
    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/internal/idn/Punycode;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final inet4AddressToAscii([B)Ljava/lang/String;
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 265
    array-length v0, p0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 266
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 267
    const/4 v1, 0x0

    aget-byte v1, p0, v1

    const/16 v2, 0xff

    invoke-static {v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v1

    int-to-long v3, v1

    invoke-virtual {v0, v3, v4}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 268
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 269
    const/4 v3, 0x1

    aget-byte v3, p0, v3

    invoke-static {v3, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v0, v3, v4}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 270
    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 271
    const/4 v3, 0x2

    aget-byte v3, p0, v3

    invoke-static {v3, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v0, v3, v4}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 272
    invoke-virtual {v0, v1}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 273
    const/4 v1, 0x3

    aget-byte p0, p0, v1

    invoke-static {p0, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result p0

    int-to-long v1, p0

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okio/Buffer;->writeDecimalLong(J)Lnicoid/network238/okio/Buffer;

    move-result-object p0

    .line 274
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 265
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final inet6AddressToAscii([B)Ljava/lang/String;
    .registers 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, -0x1

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    .line 205
    :goto_0
    array-length v4, p0

    const/16 v5, 0x10

    if-ge v2, v4, :cond_2

    move v4, v2

    :goto_1
    if-ge v4, v5, :cond_0

    .line 207
    aget-byte v6, p0, v4

    if-nez v6, :cond_0

    add-int/lit8 v6, v4, 0x1

    aget-byte v6, p0, v6

    if-nez v6, :cond_0

    add-int/lit8 v4, v4, 0x2

    goto :goto_1

    :cond_0
    sub-int v5, v4, v2

    if-le v5, v3, :cond_1

    const/4 v6, 0x4

    if-lt v5, v6, :cond_1

    move v0, v2

    move v3, v5

    :cond_1
    add-int/lit8 v2, v4, 0x2

    goto :goto_0

    .line 220
    :cond_2
    new-instance v2, Lnicoid/network238/okio/Buffer;

    invoke-direct {v2}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 222
    :cond_3
    :goto_2
    array-length v4, p0

    if-ge v1, v4, :cond_6

    const/16 v4, 0x3a

    if-ne v1, v0, :cond_4

    .line 224
    invoke-virtual {v2, v4}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    add-int/2addr v1, v3

    if-ne v1, v5, :cond_3

    .line 226
    invoke-virtual {v2, v4}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    goto :goto_2

    :cond_4
    if-lez v1, :cond_5

    .line 228
    invoke-virtual {v2, v4}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 229
    :cond_5
    aget-byte v4, p0, v1

    const/16 v6, 0xff

    invoke-static {v4, v6}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v4

    shl-int/lit8 v4, v4, 0x8

    add-int/lit8 v7, v1, 0x1

    aget-byte v7, p0, v7

    invoke-static {v7, v6}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->and(BI)I

    move-result v6

    or-int/2addr v4, v6

    int-to-long v6, v4

    .line 230
    invoke-virtual {v2, v6, v7}, Lnicoid/network238/okio/Buffer;->writeHexadecimalUnsignedLong(J)Lnicoid/network238/okio/Buffer;

    add-int/lit8 v1, v1, 0x2

    goto :goto_2

    .line 234
    :cond_6
    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final isMappedIpv4Address([B)Z
    .registers 4

    .line 251
    array-length v0, p0

    const/16 v1, 0x10

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    move v0, v2

    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 254
    aget-byte v1, p0, v0

    if-nez v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 257
    aget-byte v0, p0, v1

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 258
    const/16 v0, 0xb

    aget-byte p0, p0, v0

    if-eq p0, v1, :cond_2

    :cond_1
    return v2

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public static final toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 289
    const-string v0, ":"

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p0, v0, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 293
    const-string v0, "["

    invoke-static {p0, v0, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "]"

    invoke-static {p0, v0, v1, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-static {p0, v1, v0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->decodeIpv6(Ljava/lang/String;II)[B

    move-result-object v0

    goto :goto_0

    .line 296
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, v1, v0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->decodeIpv6(Ljava/lang/String;II)[B

    move-result-object v0

    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    .line 300
    :cond_1
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->canonicalizeInetAddress([B)[B

    move-result-object v0

    .line 301
    array-length v1, v0

    const/16 v2, 0x10

    if-ne v1, v2, :cond_2

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->inet6AddressToAscii([B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 302
    :cond_2
    array-length v1, v0

    const/4 v2, 0x4

    if-ne v1, v2, :cond_3

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->inet4AddressToAscii([B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 303
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid IPv6 address: \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const/16 v1, 0x27

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 306
    :cond_4
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->idnToAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_5

    goto :goto_1

    .line 307
    :cond_5
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_6

    goto :goto_1

    .line 308
    :cond_6
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->containsInvalidHostnameAsciiCodes(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_1

    .line 309
    :cond_7
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->containsInvalidLabelLengths(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    :goto_1
    return-object v3

    :cond_8
    return-object p0
.end method

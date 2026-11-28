.class public final Lnicoid/network238/okio/SegmentedByteString;
.super Lnicoid/network238/okio/ByteString;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0008\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u000c\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0005\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u001f\u0008\u0000\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0010\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011H\u0016J\u0012\u0010\u0012\u001a\u00020\u000f2\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u0014H\u0016J\u0008\u0010\u0015\u001a\u00020\u000fH\u0016J\u0008\u0010\u0016\u001a\u00020\u0001H\u0016J\u0008\u0010\u0017\u001a\u00020\u0001H\u0016J\u0015\u0010\u0018\u001a\u00020\u00012\u0006\u0010\u0019\u001a\u00020\u000fH\u0010\u00a2\u0006\u0002\u0008\u001aJ\u001d\u0010\u001b\u001a\u00020\u00012\u0006\u0010\u0019\u001a\u00020\u000f2\u0006\u0010\u001c\u001a\u00020\u0001H\u0010\u00a2\u0006\u0002\u0008\u001dJ\u0012\u0010\u001e\u001a\u00020\u000f2\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u0014H\u0016J\u001c\u0010\u001f\u001a\u00020\u00012\u0008\u0008\u0002\u0010 \u001a\u00020!2\u0008\u0008\u0002\u0010\"\u001a\u00020!H\u0016J\u0015\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020!H\u0010\u00a2\u0006\u0002\u0008&J\r\u0010\'\u001a\u00020!H\u0010\u00a2\u0006\u0002\u0008(J\u0008\u0010)\u001a\u00020\u0004H\u0016J\u0008\u0010*\u001a\u00020+H\u0016J\u0010\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020/H\u0016J%\u0010,\u001a\u00020-2\u0006\u00100\u001a\u0002012\u0006\u00102\u001a\u00020!2\u0006\u00103\u001a\u00020!H\u0010\u00a2\u0006\u0002\u00084J(\u00105\u001a\u00020\u00142\u0006\u00102\u001a\u00020!2\u0006\u00106\u001a\u00020\u00012\u0006\u00107\u001a\u00020!2\u0006\u00103\u001a\u00020!H\u0016J(\u00105\u001a\u00020\u00142\u0006\u00102\u001a\u00020!2\u0006\u00106\u001a\u00020\u00042\u0006\u00107\u001a\u00020!2\u0006\u00103\u001a\u00020!H\u0016J,\u00108\u001a\u00020-2\u0008\u0008\u0002\u00102\u001a\u00020!2\u0006\u00109\u001a\u00020\u00042\u0008\u0008\u0002\u0010:\u001a\u00020!2\u0006\u00103\u001a\u00020!H\u0016J\u001a\u0010;\u001a\u00020!2\u0006\u00106\u001a\u00020\u00042\u0008\u0008\u0002\u0010<\u001a\u00020!H\u0016J\u001a\u0010=\u001a\u00020!2\u0006\u00106\u001a\u00020\u00042\u0008\u0008\u0002\u0010<\u001a\u00020!H\u0016J\u0008\u0010>\u001a\u00020\u0001H\u0002J\r\u0010?\u001a\u00020\u0004H\u0010\u00a2\u0006\u0002\u0008@J\u0013\u0010A\u001a\u00020\u00142\u0008\u00106\u001a\u0004\u0018\u00010BH\u0096\u0002J\u0008\u0010C\u001a\u00020!H\u0016J\u0008\u0010D\u001a\u00020\u000fH\u0016J\u0008\u0010E\u001a\u00020FH\u0002R\u001c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003X\u0080\u0004\u00a2\u0006\n\n\u0002\u0010\u000b\u001a\u0004\u0008\t\u0010\nR\u0014\u0010\u0005\u001a\u00020\u0006X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006G"
    }
    d2 = {
        "Lnicoid/network238/okio/SegmentedByteString;",
        "Lnicoid/network238/okio/ByteString;",
        "segments",
        "",
        "",
        "directory",
        "",
        "<init>",
        "([[B[I)V",
        "getSegments$okio",
        "()[[B",
        "[[B",
        "getDirectory$okio",
        "()[I",
        "string",
        "",
        "charset",
        "Ljava/nio/charset/Charset;",
        "base64",
        "includePadding",
        "",
        "hex",
        "toAsciiLowercase",
        "toAsciiUppercase",
        "digest",
        "algorithm",
        "digest$okio",
        "hmac",
        "key",
        "hmac$okio",
        "base64Url",
        "substring",
        "beginIndex",
        "",
        "endIndex",
        "internalGet",
        "",
        "pos",
        "internalGet$okio",
        "getSize",
        "getSize$okio",
        "toByteArray",
        "asByteBuffer",
        "Ljava/nio/ByteBuffer;",
        "write",
        "",
        "out",
        "Ljava/io/OutputStream;",
        "buffer",
        "Lnicoid/network238/okio/Buffer;",
        "offset",
        "byteCount",
        "write$okio",
        "rangeEquals",
        "other",
        "otherOffset",
        "copyInto",
        "target",
        "targetOffset",
        "indexOf",
        "fromIndex",
        "lastIndexOf",
        "toByteString",
        "internalArray",
        "internalArray$okio",
        "equals",
        "",
        "hashCode",
        "toString",
        "writeReplace",
        "Ljava/lang/Object;",
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
.field private final transient directory:[I

.field private final transient segments:[[B


# direct methods
.method public constructor <init>([[B[I)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    sget-object v0, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    .line 37
    invoke-direct {p0, v0}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    .line 38
    iput-object p1, p0, Lnicoid/network238/okio/SegmentedByteString;->segments:[[B

    .line 39
    iput-object p2, p0, Lnicoid/network238/okio/SegmentedByteString;->directory:[I

    return-void
.end method

.method private final toByteString()Lnicoid/network238/okio/ByteString;
    .registers 3

    .line 127
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0
.end method

.method private final writeReplace()Ljava/lang/Object;
    .registers 2

    .line 138
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .registers 2

    .line 86
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteArray()[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method public base64(Z)Ljava/lang/String;
    .registers 3

    .line 44
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString;->base64(Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public base64Url(Z)Ljava/lang/String;
    .registers 3

    .line 75
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString;->base64Url(Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public copyInto(I[BII)V
    .registers 16

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 309
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    int-to-long v1, v0

    int-to-long v3, p1

    int-to-long v5, p4

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 310
    array-length v0, p2

    int-to-long v0, v0

    int-to-long v7, p3

    move-wide v9, v5

    move-wide v5, v0

    invoke-static/range {v5 .. v10}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    add-int/2addr p4, p1

    .line 314
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v0

    :goto_0
    if-ge p1, p4, :cond_1

    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .line 317
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v1

    add-int/lit8 v2, v0, -0x1

    aget v1, v1, v2

    .line 318
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v2

    aget v2, v2, v0

    sub-int/2addr v2, v1

    .line 319
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v4

    array-length v4, v4

    add-int/2addr v4, v0

    aget v3, v3, v4

    add-int/2addr v2, v1

    .line 321
    invoke-static {p4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v2, p1

    sub-int v1, p1, v1

    add-int/2addr v3, v1

    .line 323
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v1

    aget-object v1, v1, v0

    add-int v4, v3, v2

    .line 324
    invoke-static {v1, p2, p3, v3, v4}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    add-int/2addr p3, v2

    add-int/2addr p1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public digest$okio(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    .line 141
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v0

    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_0

    .line 145
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    add-int v4, v0, v1

    aget v3, v3, v4

    .line 146
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v4

    aget v4, v4, v1

    .line 148
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v5

    aget-object v5, v5, v1

    sub-int v2, v4, v2

    .line 55
    invoke-virtual {p1, v5, v3, v2}, Ljava/security/MessageDigest;->update([BII)V

    add-int/lit8 v1, v1, 0x1

    move v2, v4

    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    .line 59
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p1, p0, :cond_0

    .line 334
    instance-of v0, p1, Lnicoid/network238/okio/ByteString;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    check-cast p1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    if-ne v0, v2, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    invoke-virtual {p0, v1, p1, v1, v0}, Lnicoid/network238/okio/SegmentedByteString;->rangeEquals(ILnicoid/network238/okio/ByteString;II)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public final getDirectory$okio()[I
    .registers 2

    .line 39
    iget-object v0, p0, Lnicoid/network238/okio/SegmentedByteString;->directory:[I

    return-object v0
.end method

.method public final getSegments$okio()[[B
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okio/SegmentedByteString;->segments:[[B

    return-object v0
.end method

.method public getSize$okio()I
    .registers 3

    .line 198
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    return v0
.end method

.method public hashCode()I
    .registers 9

    .line 336
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getHashCode$okio()I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 342
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v0

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    move v3, v2

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_2

    .line 346
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v4

    add-int v5, v0, v1

    aget v4, v4, v5

    .line 347
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v5

    aget v5, v5, v1

    .line 349
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v6

    aget-object v6, v6, v1

    sub-int v2, v5, v2

    add-int/2addr v2, v4

    :goto_1
    if-ge v4, v2, :cond_1

    mul-int/lit8 v3, v3, 0x1f

    .line 353
    aget-byte v7, v6, v4

    add-int/2addr v3, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    move v2, v5

    goto :goto_0

    .line 361
    :cond_2
    invoke-virtual {p0, v3}, Lnicoid/network238/okio/ByteString;->setHashCode$okio(I)V

    return v3
.end method

.method public hex()Ljava/lang/String;
    .registers 2

    .line 46
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hmac$okio(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    :try_start_0
    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    .line 65
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->toByteArray()[B

    move-result-object p2

    invoke-direct {v1, p2, p1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 153
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object p1

    array-length p1, p1

    const/4 p2, 0x0

    move v1, p2

    :goto_0
    if-ge p2, p1, :cond_0

    .line 157
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v2

    add-int v3, p1, p2

    aget v2, v2, v3

    .line 158
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    aget v3, v3, p2

    .line 160
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v4

    aget-object v4, v4, p2

    sub-int v1, v3, v1

    .line 67
    invoke-virtual {v0, v4, v2, v1}, Ljavax/crypto/Mac;->update([BII)V

    add-int/lit8 p2, p2, 0x1

    move v1, v3

    goto :goto_0

    .line 69
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

    .line 71
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public indexOf([BI)I
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/ByteString;->indexOf([BI)I

    move-result p1

    return p1
.end method

.method public internalArray$okio()[B
    .registers 2

    .line 129
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public internalGet$okio(I)B
    .registers 9

    .line 193
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v1

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    int-to-long v1, v0

    int-to-long v3, p1

    const-wide/16 v5, 0x1

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 194
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 195
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v1

    add-int/lit8 v2, v0, -0x1

    aget v1, v1, v2

    .line 196
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v3, v0

    aget v2, v2, v3

    .line 197
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v3

    aget-object v0, v3, v0

    sub-int/2addr p1, v1

    add-int/2addr p1, v2

    aget-byte p1, v0, p1

    return p1
.end method

.method public lastIndexOf([BI)I
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/ByteString;->lastIndexOf([BI)I

    move-result p1

    return p1
.end method

.method public rangeEquals(ILnicoid/network238/okio/ByteString;II)Z
    .registers 11

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 261
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    sub-int/2addr v1, p4

    if-gt p1, v1, :cond_2

    add-int/2addr p4, p1

    .line 265
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v1

    :goto_0
    if-ge p1, p4, :cond_1

    if-nez v1, :cond_0

    move v2, v0

    goto :goto_1

    .line 268
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v2

    add-int/lit8 v3, v1, -0x1

    aget v2, v2, v3

    .line 269
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    aget v3, v3, v1

    sub-int/2addr v3, v2

    .line 270
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v4

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v5

    array-length v5, v5

    add-int/2addr v5, v1

    aget v4, v4, v5

    add-int/2addr v3, v2

    .line 272
    invoke-static {p4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr v3, p1

    sub-int v2, p1, v2

    add-int/2addr v4, v2

    .line 274
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v2

    aget-object v2, v2, v1

    .line 275
    invoke-virtual {p2, p3, v2, v4, v3}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result v2

    if-eqz v2, :cond_2

    add-int/2addr p3, v3

    add-int/2addr p1, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public rangeEquals(I[BII)Z
    .registers 11

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 283
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    sub-int/2addr v1, p4

    if-gt p1, v1, :cond_2

    if-ltz p3, :cond_2

    .line 284
    array-length v1, p2

    sub-int/2addr v1, p4

    if-gt p3, v1, :cond_2

    add-int/2addr p4, p1

    .line 291
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v1

    :goto_0
    if-ge p1, p4, :cond_1

    if-nez v1, :cond_0

    move v2, v0

    goto :goto_1

    .line 294
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v2

    add-int/lit8 v3, v1, -0x1

    aget v2, v2, v3

    .line 295
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    aget v3, v3, v1

    sub-int/2addr v3, v2

    .line 296
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v4

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v5

    array-length v5, v5

    add-int/2addr v5, v1

    aget v4, v4, v5

    add-int/2addr v3, v2

    .line 298
    invoke-static {p4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr v3, p1

    sub-int v2, p1, v2

    add-int/2addr v4, v2

    .line 300
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v2

    aget-object v2, v2, v1

    .line 301
    invoke-static {v2, v4, p2, p3, v3}, Lnicoid/network238/okio/-SegmentedByteString;->arrayRangeEquals([BI[BII)Z

    move-result v2

    if-eqz v2, :cond_2

    add-int/2addr p3, v3

    add-int/2addr p1, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method

.method public string(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString;->string(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public substring(II)Lnicoid/network238/okio/ByteString;
    .registers 13

    if-ltz p1, :cond_6

    .line 167
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    const-string v1, "endIndex="

    if-gt p2, v0, :cond_5

    sub-int v0, p2, p1

    if-ltz v0, :cond_4

    if-nez p1, :cond_0

    .line 173
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    if-ne p2, v1, :cond_0

    return-object p0

    :cond_0
    if-ne p1, p2, :cond_1

    .line 174
    sget-object p1, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    return-object p1

    .line 177
    :cond_1
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v1

    add-int/lit8 p2, p2, -0x1

    .line 178
    invoke-static {p0, p2}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result p2

    .line 180
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v2

    add-int/lit8 v3, p2, 0x1

    invoke-static {v2, v1, v3}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[B

    .line 181
    array-length v3, v2

    shl-int/lit8 v3, v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    if-gt v1, p2, :cond_2

    move v5, v1

    move v6, v4

    .line 184
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v7

    aget v7, v7, v5

    sub-int/2addr v7, p1

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    aput v7, v3, v6

    add-int/lit8 v7, v6, 0x1

    .line 185
    array-length v8, v2

    add-int/2addr v6, v8

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v8

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v9, v5

    aget v8, v8, v9

    aput v8, v3, v6

    if-eq v5, p2, :cond_2

    add-int/lit8 v5, v5, 0x1

    move v6, v7

    goto :goto_0

    :cond_2
    if-nez v1, :cond_3

    goto :goto_1

    .line 189
    :cond_3
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object p2

    add-int/lit8 v1, v1, -0x1

    aget v4, p2, v1

    .line 190
    :goto_1
    array-length p2, v2

    aget v0, v3, p2

    sub-int/2addr p1, v4

    add-int/2addr v0, p1

    aput v0, v3, p2

    .line 192
    new-instance p1, Lnicoid/network238/okio/SegmentedByteString;

    invoke-direct {p1, v2, v3}, Lnicoid/network238/okio/SegmentedByteString;-><init>([[B[I)V

    return-object p1

    .line 170
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " < beginIndex="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 167
    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " > length("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x29

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 165
    :cond_6
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "beginIndex="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " < 0"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public toAsciiLowercase()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 48
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->toAsciiLowercase()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public toAsciiUppercase()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 50
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->toAsciiUppercase()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public toByteArray()[B
    .registers 10

    .line 199
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    new-array v0, v0, [B

    .line 202
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v1

    array-length v1, v1

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_0
    if-ge v2, v1, :cond_0

    .line 206
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v5

    add-int v6, v1, v2

    aget v5, v5, v6

    .line 207
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v6

    aget v6, v6, v2

    .line 209
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v7

    aget-object v7, v7, v2

    sub-int v4, v6, v4

    add-int v8, v5, v4

    .line 210
    invoke-static {v7, v0, v3, v5, v8}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    move v4, v6

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 135
    invoke-direct {p0}, Lnicoid/network238/okio/SegmentedByteString;->toByteString()Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/io/OutputStream;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 223
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v0

    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_0

    .line 227
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    add-int v4, v0, v1

    aget v3, v3, v4

    .line 228
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v4

    aget v4, v4, v1

    .line 230
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v5

    aget-object v5, v5, v1

    sub-int v2, v4, v2

    .line 91
    invoke-virtual {p1, v5, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    add-int/lit8 v1, v1, 0x1

    move v2, v4

    goto :goto_0

    :cond_0
    return-void
.end method

.method public write$okio(Lnicoid/network238/okio/Buffer;II)V
    .registers 15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    add-int v0, p2, p3

    .line 236
    invoke-static {p0, p2}, Lnicoid/network238/okio/internal/-SegmentedByteString;->segment(Lnicoid/network238/okio/SegmentedByteString;I)I

    move-result v1

    :goto_0
    if-ge p2, v0, :cond_2

    if-nez v1, :cond_0

    const/4 v2, 0x0

    goto :goto_1

    .line 239
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v2

    add-int/lit8 v3, v1, -0x1

    aget v2, v2, v3

    .line 240
    :goto_1
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v3

    aget v3, v3, v1

    sub-int/2addr v3, v2

    .line 241
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getDirectory$okio()[I

    move-result-object v4

    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v5

    array-length v5, v5

    add-int/2addr v5, v1

    aget v4, v4, v5

    add-int/2addr v3, v2

    .line 243
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr v3, p2

    sub-int v2, p2, v2

    add-int v7, v4, v2

    .line 245
    invoke-virtual {p0}, Lnicoid/network238/okio/SegmentedByteString;->getSegments$okio()[[B

    move-result-object v2

    aget-object v6, v2, v1

    .line 246
    new-instance v5, Lnicoid/network238/okio/Segment;

    add-int v8, v7, v3

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lnicoid/network238/okio/Segment;-><init>([BIIZZ)V

    .line 247
    iget-object v2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    if-nez v2, :cond_1

    .line 248
    iput-object v5, v5, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    .line 249
    iput-object v5, v5, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    .line 250
    iput-object v5, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    goto :goto_2

    .line 252
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v2, Lnicoid/network238/okio/Segment;->prev:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v5}, Lnicoid/network238/okio/Segment;->push(Lnicoid/network238/okio/Segment;)Lnicoid/network238/okio/Segment;

    :goto_2
    add-int/2addr p2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 259
    :cond_2
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    int-to-long p2, p3

    add-long/2addr v0, p2

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    return-void
.end method

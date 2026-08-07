.class public Lorg/apache/commons/codec/binary/Base64;
.super Lorg/apache/commons/codec/binary/BaseNCodec;
.source "SourceFile"


# static fields
.field private static final BITS_PER_ENCODED_BYTE:I = 0x6

.field private static final BYTES_PER_ENCODED_BLOCK:I = 0x4

.field private static final BYTES_PER_UNENCODED_BLOCK:I = 0x3

.field static final CHUNK_SEPARATOR:[B

.field private static final DECODE_TABLE:[B

.field private static final MASK_6BITS:I = 0x3f

.field private static final STANDARD_ENCODE_TABLE:[B

.field private static final URL_SAFE_ENCODE_TABLE:[B


# instance fields
.field private bitWorkArea:I

.field private final decodeSize:I

.field private final decodeTable:[B

.field private final encodeSize:I

.field private final encodeTable:[B

.field private final lineSeparator:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/apache/commons/codec/binary/Base64;->CHUNK_SEPARATOR:[B

    .line 8
    .line 9
    const/16 v0, 0x40

    .line 10
    .line 11
    new-array v0, v0, [B

    .line 12
    .line 13
    fill-array-data v0, :array_1

    .line 14
    .line 15
    .line 16
    sput-object v0, Lorg/apache/commons/codec/binary/Base64;->STANDARD_ENCODE_TABLE:[B

    .line 17
    .line 18
    const/16 v0, 0x40

    .line 19
    .line 20
    new-array v0, v0, [B

    .line 21
    .line 22
    fill-array-data v0, :array_2

    .line 23
    .line 24
    .line 25
    sput-object v0, Lorg/apache/commons/codec/binary/Base64;->URL_SAFE_ENCODE_TABLE:[B

    .line 26
    .line 27
    const/16 v0, 0x7b

    .line 28
    .line 29
    new-array v0, v0, [B

    .line 30
    .line 31
    fill-array-data v0, :array_3

    .line 32
    .line 33
    .line 34
    sput-object v0, Lorg/apache/commons/codec/binary/Base64;->DECODE_TABLE:[B

    .line 35
    .line 36
    return-void

    .line 37
    :array_0
    .array-data 1
        0xdt
        0xat
    .end array-data

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    nop

    .line 43
    :array_1
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_2
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data

    :array_3
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x3et
        -0x1t
        0x3et
        -0x1t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x3ft
        -0x1t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, v0}, Lorg/apache/commons/codec/binary/Base64;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 79
    sget-object v0, Lorg/apache/commons/codec/binary/Base64;->CHUNK_SEPARATOR:[B

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/codec/binary/Base64;-><init>(I[B)V

    return-void
.end method

.method public constructor <init>(I[B)V
    .locals 1

    const/4 v0, 0x0

    .line 80
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/codec/binary/Base64;-><init>(I[BZ)V

    return-void
.end method

.method public constructor <init>(I[BZ)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    move v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    array-length v1, p2

    .line 7
    :goto_0
    const/4 v2, 0x3

    .line 8
    const/4 v3, 0x4

    .line 9
    invoke-direct {p0, v2, v3, p1, v1}, Lorg/apache/commons/codec/binary/BaseNCodec;-><init>(IIII)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Lorg/apache/commons/codec/binary/Base64;->DECODE_TABLE:[B

    .line 13
    .line 14
    iput-object v1, p0, Lorg/apache/commons/codec/binary/Base64;->decodeTable:[B

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz p2, :cond_3

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Lorg/apache/commons/codec/binary/BaseNCodec;->containsAlphabetOrPad([B)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_2

    .line 24
    .line 25
    if-lez p1, :cond_1

    .line 26
    .line 27
    array-length p1, p2

    .line 28
    add-int/2addr p1, v3

    .line 29
    iput p1, p0, Lorg/apache/commons/codec/binary/Base64;->encodeSize:I

    .line 30
    .line 31
    array-length p1, p2

    .line 32
    new-array p1, p1, [B

    .line 33
    .line 34
    iput-object p1, p0, Lorg/apache/commons/codec/binary/Base64;->lineSeparator:[B

    .line 35
    .line 36
    array-length v1, p2

    .line 37
    invoke-static {p2, v0, p1, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iput v3, p0, Lorg/apache/commons/codec/binary/Base64;->encodeSize:I

    .line 42
    .line 43
    iput-object v1, p0, Lorg/apache/commons/codec/binary/Base64;->lineSeparator:[B

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    invoke-static {p2}, Lorg/apache/commons/codec/binary/StringUtils;->newStringUtf8([B)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "lineSeparator must not contain base64 characters: ["

    .line 51
    .line 52
    const-string p2, "]"

    .line 53
    .line 54
    invoke-static {p1, p0, p2}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    throw v1

    .line 58
    :cond_3
    iput v3, p0, Lorg/apache/commons/codec/binary/Base64;->encodeSize:I

    .line 59
    .line 60
    iput-object v1, p0, Lorg/apache/commons/codec/binary/Base64;->lineSeparator:[B

    .line 61
    .line 62
    :goto_1
    iget p1, p0, Lorg/apache/commons/codec/binary/Base64;->encodeSize:I

    .line 63
    .line 64
    add-int/lit8 p1, p1, -0x1

    .line 65
    .line 66
    iput p1, p0, Lorg/apache/commons/codec/binary/Base64;->decodeSize:I

    .line 67
    .line 68
    if-eqz p3, :cond_4

    .line 69
    .line 70
    sget-object p1, Lorg/apache/commons/codec/binary/Base64;->URL_SAFE_ENCODE_TABLE:[B

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    sget-object p1, Lorg/apache/commons/codec/binary/Base64;->STANDARD_ENCODE_TABLE:[B

    .line 74
    .line 75
    :goto_2
    iput-object p1, p0, Lorg/apache/commons/codec/binary/Base64;->encodeTable:[B

    .line 76
    .line 77
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    const/16 v0, 0x4c

    .line 78
    sget-object v1, Lorg/apache/commons/codec/binary/Base64;->CHUNK_SEPARATOR:[B

    invoke-direct {p0, v0, v1, p1}, Lorg/apache/commons/codec/binary/Base64;-><init>(I[BZ)V

    return-void
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .locals 1

    .line 1
    new-instance v0, Lorg/apache/commons/codec/binary/Base64;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/apache/commons/codec/binary/Base64;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lorg/apache/commons/codec/binary/BaseNCodec;->decode(Ljava/lang/String;)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static decodeBase64([B)[B
    .locals 1

    .line 11
    new-instance v0, Lorg/apache/commons/codec/binary/Base64;

    invoke-direct {v0}, Lorg/apache/commons/codec/binary/Base64;-><init>()V

    invoke-virtual {v0, p0}, Lorg/apache/commons/codec/binary/BaseNCodec;->decode([B)[B

    move-result-object p0

    return-object p0
.end method

.method public static decodeInteger([B)Ljava/math/BigInteger;
    .locals 2

    .line 1
    new-instance v0, Ljava/math/BigInteger;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {p0}, Lorg/apache/commons/codec/binary/Base64;->decodeBase64([B)[B

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-direct {v0, v1, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static encodeBase64([B)[B
    .locals 1

    const/4 v0, 0x0

    .line 68
    invoke-static {p0, v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZ)[B

    move-result-object p0

    return-object p0
.end method

.method public static encodeBase64([BZ)[B
    .locals 1

    const/4 v0, 0x0

    .line 66
    invoke-static {p0, p1, v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZZ)[B

    move-result-object p0

    return-object p0
.end method

.method public static encodeBase64([BZZ)[B
    .locals 1

    const v0, 0x7fffffff

    .line 67
    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZZI)[B

    move-result-object p0

    return-object p0
.end method

.method public static encodeBase64([BZZI)[B
    .locals 4

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    if-eqz p1, :cond_1

    .line 8
    .line 9
    new-instance p1, Lorg/apache/commons/codec/binary/Base64;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Lorg/apache/commons/codec/binary/Base64;-><init>(Z)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    new-instance p1, Lorg/apache/commons/codec/binary/Base64;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    sget-object v1, Lorg/apache/commons/codec/binary/Base64;->CHUNK_SEPARATOR:[B

    .line 19
    .line 20
    invoke-direct {p1, v0, v1, p2}, Lorg/apache/commons/codec/binary/Base64;-><init>(I[BZ)V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {p1, p0}, Lorg/apache/commons/codec/binary/BaseNCodec;->getEncodedLength([B)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    int-to-long v2, p3

    .line 28
    cmp-long p2, v0, v2

    .line 29
    .line 30
    if-gtz p2, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lorg/apache/commons/codec/binary/BaseNCodec;->encode([B)[B

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 38
    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string p2, "Input array too big, the output array would be bigger ("

    .line 42
    .line 43
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p2, ") than the specified maximum size of "

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    throw p0

    .line 65
    :cond_3
    :goto_1
    return-object p0
.end method

.method public static encodeBase64Chunked([B)[B
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZ)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static encodeBase64String([B)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZ)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-static {p0}, Lorg/apache/commons/codec/binary/StringUtils;->newStringUtf8([B)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static encodeBase64URLSafe([B)[B
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {p0, v0, v1}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZZ)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static encodeBase64URLSafeString([B)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {p0, v0, v1}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZZ)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lorg/apache/commons/codec/binary/StringUtils;->newStringUtf8([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static encodeInteger(Ljava/math/BigInteger;)[B
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/codec/binary/Base64;->toIntegerBytes(Ljava/math/BigInteger;)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, v0}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZ)[B

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "encodeInteger called with null parameter"

    .line 14
    .line 15
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public static isArrayByteBase64([B)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lorg/apache/commons/codec/binary/Base64;->isBase64([B)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static isBase64(B)Z
    .locals 2

    const/16 v0, 0x3d

    if-eq p0, v0, :cond_1

    if-ltz p0, :cond_0

    .line 29
    sget-object v0, Lorg/apache/commons/codec/binary/Base64;->DECODE_TABLE:[B

    array-length v1, v0

    if-ge p0, v1, :cond_0

    aget-byte p0, v0, p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static isBase64(Ljava/lang/String;)Z
    .locals 0

    .line 28
    invoke-static {p0}, Lorg/apache/commons/codec/binary/StringUtils;->getBytesUtf8(Ljava/lang/String;)[B

    move-result-object p0

    invoke-static {p0}, Lorg/apache/commons/codec/binary/Base64;->isBase64([B)Z

    move-result p0

    return p0
.end method

.method public static isBase64([B)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    array-length v2, p0

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    aget-byte v2, p0, v1

    .line 7
    .line 8
    invoke-static {v2}, Lorg/apache/commons/codec/binary/Base64;->isBase64(B)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    aget-byte v2, p0, v1

    .line 15
    .line 16
    invoke-static {v2}, Lorg/apache/commons/codec/binary/BaseNCodec;->isWhiteSpace(B)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public static toIntegerBytes(Ljava/math/BigInteger;)[B
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, 0x7

    .line 6
    .line 7
    shr-int/lit8 v0, v0, 0x3

    .line 8
    .line 9
    shl-int/lit8 v0, v0, 0x3

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    rem-int/lit8 v2, v2, 0x8

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    div-int/lit8 v2, v2, 0x8

    .line 29
    .line 30
    add-int/2addr v2, v3

    .line 31
    div-int/lit8 v4, v0, 0x8

    .line 32
    .line 33
    if-ne v2, v4, :cond_0

    .line 34
    .line 35
    return-object v1

    .line 36
    :cond_0
    array-length v2, v1

    .line 37
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    rem-int/lit8 p0, p0, 0x8

    .line 42
    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    add-int/lit8 v2, v2, -0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 v3, 0x0

    .line 49
    :goto_0
    div-int/lit8 v0, v0, 0x8

    .line 50
    .line 51
    sub-int p0, v0, v2

    .line 52
    .line 53
    new-array v0, v0, [B

    .line 54
    .line 55
    invoke-static {v1, v3, v0, p0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    .line 57
    .line 58
    return-object v0
.end method


# virtual methods
.method public decode([BII)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    if-gez p3, :cond_1

    .line 9
    .line 10
    iput-boolean v0, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 11
    .line 12
    :cond_1
    const/4 v1, 0x0

    .line 13
    :goto_0
    const/4 v2, 0x3

    .line 14
    if-ge v1, p3, :cond_4

    .line 15
    .line 16
    iget v3, p0, Lorg/apache/commons/codec/binary/Base64;->decodeSize:I

    .line 17
    .line 18
    invoke-virtual {p0, v3}, Lorg/apache/commons/codec/binary/BaseNCodec;->ensureBufferSize(I)V

    .line 19
    .line 20
    .line 21
    add-int/lit8 v3, p2, 0x1

    .line 22
    .line 23
    aget-byte p2, p1, p2

    .line 24
    .line 25
    const/16 v4, 0x3d

    .line 26
    .line 27
    if-ne p2, v4, :cond_2

    .line 28
    .line 29
    iput-boolean v0, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    if-ltz p2, :cond_3

    .line 33
    .line 34
    sget-object v4, Lorg/apache/commons/codec/binary/Base64;->DECODE_TABLE:[B

    .line 35
    .line 36
    array-length v5, v4

    .line 37
    if-ge p2, v5, :cond_3

    .line 38
    .line 39
    aget-byte p2, v4, p2

    .line 40
    .line 41
    if-ltz p2, :cond_3

    .line 42
    .line 43
    iget v4, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 44
    .line 45
    add-int/2addr v4, v0

    .line 46
    rem-int/lit8 v4, v4, 0x4

    .line 47
    .line 48
    iput v4, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 49
    .line 50
    iget v5, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 51
    .line 52
    shl-int/lit8 v5, v5, 0x6

    .line 53
    .line 54
    add-int/2addr v5, p2

    .line 55
    iput v5, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 56
    .line 57
    if-nez v4, :cond_3

    .line 58
    .line 59
    iget-object p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 60
    .line 61
    iget v4, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 62
    .line 63
    add-int/lit8 v6, v4, 0x1

    .line 64
    .line 65
    iput v6, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 66
    .line 67
    shr-int/lit8 v7, v5, 0x10

    .line 68
    .line 69
    and-int/lit16 v7, v7, 0xff

    .line 70
    .line 71
    int-to-byte v7, v7

    .line 72
    aput-byte v7, p2, v4

    .line 73
    .line 74
    add-int/lit8 v7, v4, 0x2

    .line 75
    .line 76
    iput v7, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 77
    .line 78
    shr-int/lit8 v8, v5, 0x8

    .line 79
    .line 80
    and-int/lit16 v8, v8, 0xff

    .line 81
    .line 82
    int-to-byte v8, v8

    .line 83
    aput-byte v8, p2, v6

    .line 84
    .line 85
    add-int/2addr v4, v2

    .line 86
    iput v4, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 87
    .line 88
    and-int/lit16 v2, v5, 0xff

    .line 89
    .line 90
    int-to-byte v2, v2

    .line 91
    aput-byte v2, p2, v7

    .line 92
    .line 93
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 94
    .line 95
    move p2, v3

    .line 96
    goto :goto_0

    .line 97
    :cond_4
    :goto_1
    iget-boolean p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 98
    .line 99
    if-eqz p1, :cond_7

    .line 100
    .line 101
    iget p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 102
    .line 103
    if-eqz p1, :cond_7

    .line 104
    .line 105
    iget p1, p0, Lorg/apache/commons/codec/binary/Base64;->decodeSize:I

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/binary/BaseNCodec;->ensureBufferSize(I)V

    .line 108
    .line 109
    .line 110
    iget p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 111
    .line 112
    const/4 p2, 0x2

    .line 113
    if-eq p1, p2, :cond_6

    .line 114
    .line 115
    if-eq p1, v2, :cond_5

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_5
    iget p1, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 119
    .line 120
    shr-int/lit8 p3, p1, 0x2

    .line 121
    .line 122
    iput p3, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 123
    .line 124
    iget-object v0, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 125
    .line 126
    iget v1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 127
    .line 128
    add-int/lit8 v2, v1, 0x1

    .line 129
    .line 130
    iput v2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 131
    .line 132
    shr-int/lit8 p1, p1, 0xa

    .line 133
    .line 134
    and-int/lit16 p1, p1, 0xff

    .line 135
    .line 136
    int-to-byte p1, p1

    .line 137
    aput-byte p1, v0, v1

    .line 138
    .line 139
    add-int/2addr v1, p2

    .line 140
    iput v1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 141
    .line 142
    and-int/lit16 p0, p3, 0xff

    .line 143
    .line 144
    int-to-byte p0, p0

    .line 145
    aput-byte p0, v0, v2

    .line 146
    .line 147
    return-void

    .line 148
    :cond_6
    iget p1, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 149
    .line 150
    shr-int/lit8 p1, p1, 0x4

    .line 151
    .line 152
    iput p1, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 153
    .line 154
    iget-object p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 155
    .line 156
    iget p3, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 157
    .line 158
    add-int/lit8 v0, p3, 0x1

    .line 159
    .line 160
    iput v0, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 161
    .line 162
    and-int/lit16 p0, p1, 0xff

    .line 163
    .line 164
    int-to-byte p0, p0

    .line 165
    aput-byte p0, p2, p3

    .line 166
    .line 167
    :cond_7
    :goto_2
    return-void
.end method

.method public encode([BII)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-gez p3, :cond_5

    .line 10
    .line 11
    iput-boolean v1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->eof:Z

    .line 12
    .line 13
    iget p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->lineLength:I

    .line 18
    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    goto/16 :goto_2

    .line 22
    .line 23
    :cond_1
    iget p1, p0, Lorg/apache/commons/codec/binary/Base64;->encodeSize:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/binary/BaseNCodec;->ensureBufferSize(I)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 29
    .line 30
    iget p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 31
    .line 32
    const/16 p3, 0x3d

    .line 33
    .line 34
    if-eq p2, v1, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    if-eq p2, v1, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    iget-object p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 41
    .line 42
    add-int/lit8 v2, p1, 0x1

    .line 43
    .line 44
    iput v2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 45
    .line 46
    iget-object v3, p0, Lorg/apache/commons/codec/binary/Base64;->encodeTable:[B

    .line 47
    .line 48
    iget v4, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 49
    .line 50
    shr-int/lit8 v5, v4, 0xa

    .line 51
    .line 52
    and-int/lit8 v5, v5, 0x3f

    .line 53
    .line 54
    aget-byte v5, v3, v5

    .line 55
    .line 56
    aput-byte v5, p2, p1

    .line 57
    .line 58
    add-int/lit8 v5, p1, 0x2

    .line 59
    .line 60
    iput v5, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 61
    .line 62
    shr-int/lit8 v6, v4, 0x4

    .line 63
    .line 64
    and-int/lit8 v6, v6, 0x3f

    .line 65
    .line 66
    aget-byte v6, v3, v6

    .line 67
    .line 68
    aput-byte v6, p2, v2

    .line 69
    .line 70
    add-int/lit8 v2, p1, 0x3

    .line 71
    .line 72
    iput v2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 73
    .line 74
    shl-int/lit8 v1, v4, 0x2

    .line 75
    .line 76
    and-int/lit8 v1, v1, 0x3f

    .line 77
    .line 78
    aget-byte v1, v3, v1

    .line 79
    .line 80
    aput-byte v1, p2, v5

    .line 81
    .line 82
    sget-object v1, Lorg/apache/commons/codec/binary/Base64;->STANDARD_ENCODE_TABLE:[B

    .line 83
    .line 84
    if-ne v3, v1, :cond_4

    .line 85
    .line 86
    add-int/lit8 v1, p1, 0x4

    .line 87
    .line 88
    iput v1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 89
    .line 90
    aput-byte p3, p2, v2

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    iget-object p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 94
    .line 95
    add-int/lit8 v1, p1, 0x1

    .line 96
    .line 97
    iput v1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 98
    .line 99
    iget-object v2, p0, Lorg/apache/commons/codec/binary/Base64;->encodeTable:[B

    .line 100
    .line 101
    iget v3, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 102
    .line 103
    shr-int/lit8 v4, v3, 0x2

    .line 104
    .line 105
    and-int/lit8 v4, v4, 0x3f

    .line 106
    .line 107
    aget-byte v4, v2, v4

    .line 108
    .line 109
    aput-byte v4, p2, p1

    .line 110
    .line 111
    add-int/lit8 v4, p1, 0x2

    .line 112
    .line 113
    iput v4, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 114
    .line 115
    shl-int/lit8 v3, v3, 0x4

    .line 116
    .line 117
    and-int/lit8 v3, v3, 0x3f

    .line 118
    .line 119
    aget-byte v3, v2, v3

    .line 120
    .line 121
    aput-byte v3, p2, v1

    .line 122
    .line 123
    sget-object v1, Lorg/apache/commons/codec/binary/Base64;->STANDARD_ENCODE_TABLE:[B

    .line 124
    .line 125
    if-ne v2, v1, :cond_4

    .line 126
    .line 127
    add-int/lit8 v1, p1, 0x3

    .line 128
    .line 129
    iput v1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 130
    .line 131
    aput-byte p3, p2, v4

    .line 132
    .line 133
    add-int/lit8 v2, p1, 0x4

    .line 134
    .line 135
    iput v2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 136
    .line 137
    aput-byte p3, p2, v1

    .line 138
    .line 139
    :cond_4
    :goto_0
    iget p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 140
    .line 141
    iget p3, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 142
    .line 143
    sub-int p1, p3, p1

    .line 144
    .line 145
    add-int/2addr p2, p1

    .line 146
    iput p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 147
    .line 148
    iget p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->lineLength:I

    .line 149
    .line 150
    if-lez p1, :cond_8

    .line 151
    .line 152
    if-lez p2, :cond_8

    .line 153
    .line 154
    iget-object p1, p0, Lorg/apache/commons/codec/binary/Base64;->lineSeparator:[B

    .line 155
    .line 156
    iget-object p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 157
    .line 158
    array-length v1, p1

    .line 159
    invoke-static {p1, v0, p2, p3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    .line 161
    .line 162
    iget p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 163
    .line 164
    iget-object p2, p0, Lorg/apache/commons/codec/binary/Base64;->lineSeparator:[B

    .line 165
    .line 166
    array-length p2, p2

    .line 167
    add-int/2addr p1, p2

    .line 168
    iput p1, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 169
    .line 170
    return-void

    .line 171
    :cond_5
    move v2, v0

    .line 172
    :goto_1
    if-ge v2, p3, :cond_8

    .line 173
    .line 174
    iget v3, p0, Lorg/apache/commons/codec/binary/Base64;->encodeSize:I

    .line 175
    .line 176
    invoke-virtual {p0, v3}, Lorg/apache/commons/codec/binary/BaseNCodec;->ensureBufferSize(I)V

    .line 177
    .line 178
    .line 179
    iget v3, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 180
    .line 181
    add-int/2addr v3, v1

    .line 182
    rem-int/lit8 v3, v3, 0x3

    .line 183
    .line 184
    iput v3, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->modulus:I

    .line 185
    .line 186
    add-int/lit8 v4, p2, 0x1

    .line 187
    .line 188
    aget-byte p2, p1, p2

    .line 189
    .line 190
    if-gez p2, :cond_6

    .line 191
    .line 192
    add-int/lit16 p2, p2, 0x100

    .line 193
    .line 194
    :cond_6
    iget v5, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 195
    .line 196
    shl-int/lit8 v5, v5, 0x8

    .line 197
    .line 198
    add-int/2addr v5, p2

    .line 199
    iput v5, p0, Lorg/apache/commons/codec/binary/Base64;->bitWorkArea:I

    .line 200
    .line 201
    if-nez v3, :cond_7

    .line 202
    .line 203
    iget-object p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->buffer:[B

    .line 204
    .line 205
    iget v3, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 206
    .line 207
    add-int/lit8 v6, v3, 0x1

    .line 208
    .line 209
    iput v6, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 210
    .line 211
    iget-object v7, p0, Lorg/apache/commons/codec/binary/Base64;->encodeTable:[B

    .line 212
    .line 213
    shr-int/lit8 v8, v5, 0x12

    .line 214
    .line 215
    and-int/lit8 v8, v8, 0x3f

    .line 216
    .line 217
    aget-byte v8, v7, v8

    .line 218
    .line 219
    aput-byte v8, p2, v3

    .line 220
    .line 221
    add-int/lit8 v8, v3, 0x2

    .line 222
    .line 223
    iput v8, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 224
    .line 225
    shr-int/lit8 v9, v5, 0xc

    .line 226
    .line 227
    and-int/lit8 v9, v9, 0x3f

    .line 228
    .line 229
    aget-byte v9, v7, v9

    .line 230
    .line 231
    aput-byte v9, p2, v6

    .line 232
    .line 233
    add-int/lit8 v6, v3, 0x3

    .line 234
    .line 235
    iput v6, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 236
    .line 237
    shr-int/lit8 v9, v5, 0x6

    .line 238
    .line 239
    and-int/lit8 v9, v9, 0x3f

    .line 240
    .line 241
    aget-byte v9, v7, v9

    .line 242
    .line 243
    aput-byte v9, p2, v8

    .line 244
    .line 245
    add-int/lit8 v3, v3, 0x4

    .line 246
    .line 247
    iput v3, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 248
    .line 249
    and-int/lit8 v5, v5, 0x3f

    .line 250
    .line 251
    aget-byte v5, v7, v5

    .line 252
    .line 253
    aput-byte v5, p2, v6

    .line 254
    .line 255
    iget v5, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 256
    .line 257
    add-int/lit8 v5, v5, 0x4

    .line 258
    .line 259
    iput v5, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 260
    .line 261
    iget v6, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->lineLength:I

    .line 262
    .line 263
    if-lez v6, :cond_7

    .line 264
    .line 265
    if-gt v6, v5, :cond_7

    .line 266
    .line 267
    iget-object v5, p0, Lorg/apache/commons/codec/binary/Base64;->lineSeparator:[B

    .line 268
    .line 269
    array-length v6, v5

    .line 270
    invoke-static {v5, v0, p2, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 271
    .line 272
    .line 273
    iget p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 274
    .line 275
    iget-object v3, p0, Lorg/apache/commons/codec/binary/Base64;->lineSeparator:[B

    .line 276
    .line 277
    array-length v3, v3

    .line 278
    add-int/2addr p2, v3

    .line 279
    iput p2, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->pos:I

    .line 280
    .line 281
    iput v0, p0, Lorg/apache/commons/codec/binary/BaseNCodec;->currentLinePos:I

    .line 282
    .line 283
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 284
    .line 285
    move p2, v4

    .line 286
    goto :goto_1

    .line 287
    :cond_8
    :goto_2
    return-void
.end method

.method public isInAlphabet(B)Z
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lorg/apache/commons/codec/binary/Base64;->decodeTable:[B

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    if-ge p1, v0, :cond_0

    .line 7
    .line 8
    aget-byte p0, p0, p1

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    if-eq p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public isUrlSafe()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/apache/commons/codec/binary/Base64;->encodeTable:[B

    .line 2
    .line 3
    sget-object v0, Lorg/apache/commons/codec/binary/Base64;->URL_SAFE_ENCODE_TABLE:[B

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

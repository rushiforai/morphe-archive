.class final enum Lnet/jpountz/lz4/LZ4UnsafeUtils;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnet/jpountz/lz4/LZ4UnsafeUtils;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnet/jpountz/lz4/LZ4UnsafeUtils;

.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lnet/jpountz/lz4/LZ4UnsafeUtils;

    .line 3
    .line 4
    sput-object v0, Lnet/jpountz/lz4/LZ4UnsafeUtils;->$VALUES:[Lnet/jpountz/lz4/LZ4UnsafeUtils;

    .line 5
    .line 6
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static commonBytes([BIII)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    add-int/lit8 v1, p3, -0x8

    .line 3
    .line 4
    if-gt p2, v1, :cond_2

    .line 5
    .line 6
    invoke-static {p0, p2}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    cmp-long v1, v1, v3

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x8

    .line 19
    .line 20
    add-int/lit8 p1, p1, 0x8

    .line 21
    .line 22
    add-int/lit8 p2, p2, 0x8

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object p3, Lnet/jpountz/util/Utils;->NATIVE_BYTE_ORDER:Ljava/nio/ByteOrder;

    .line 26
    .line 27
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 28
    .line 29
    if-ne p3, v1, :cond_1

    .line 30
    .line 31
    invoke-static {p0, p2}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 32
    .line 33
    .line 34
    move-result-wide p2

    .line 35
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 36
    .line 37
    .line 38
    move-result-wide p0

    .line 39
    xor-long/2addr p0, p2

    .line 40
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-static {p0, p2}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 46
    .line 47
    .line 48
    move-result-wide p2

    .line 49
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 50
    .line 51
    .line 52
    move-result-wide p0

    .line 53
    xor-long/2addr p0, p2

    .line 54
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    :goto_1
    ushr-int/lit8 p0, p0, 0x3

    .line 59
    .line 60
    add-int/2addr v0, p0

    .line 61
    return v0

    .line 62
    :cond_2
    :goto_2
    if-ge p2, p3, :cond_3

    .line 63
    .line 64
    add-int/lit8 v1, p1, 0x1

    .line 65
    .line 66
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    add-int/lit8 v2, p2, 0x1

    .line 71
    .line 72
    invoke-static {p0, p2}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-ne p1, p2, :cond_3

    .line 77
    .line 78
    add-int/lit8 v0, v0, 0x1

    .line 79
    .line 80
    move p1, v1

    .line 81
    move p2, v2

    .line 82
    goto :goto_2

    .line 83
    :cond_3
    return v0
.end method

.method public static commonBytesBackward([BIIII)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-le p1, p3, :cond_0

    .line 3
    .line 4
    if-le p2, p4, :cond_0

    .line 5
    .line 6
    add-int/lit8 p1, p1, -0x1

    .line 7
    .line 8
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/lit8 p2, p2, -0x1

    .line 13
    .line 14
    invoke-static {p0, p2}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return v0
.end method

.method public static encodeSequence([BIIII[BII)I
    .locals 4

    .line 1
    sub-int v0, p2, p1

    .line 2
    .line 3
    add-int/lit8 v1, p6, 0x1

    .line 4
    .line 5
    const/16 v2, 0xf

    .line 6
    .line 7
    if-lt v0, v2, :cond_0

    .line 8
    .line 9
    add-int/lit8 v3, v0, -0xf

    .line 10
    .line 11
    invoke-static {v3, p5, v1}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->writeLen(I[BI)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/16 v3, -0x10

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    shl-int/lit8 v3, v0, 0x4

    .line 19
    .line 20
    :goto_0
    invoke-static {p0, p1, p5, v1, v0}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->wildArraycopy([BI[BII)V

    .line 21
    .line 22
    .line 23
    add-int/2addr v1, v0

    .line 24
    sub-int/2addr p2, p3

    .line 25
    add-int/lit8 p0, v1, 0x1

    .line 26
    .line 27
    int-to-byte p1, p2

    .line 28
    aput-byte p1, p5, v1

    .line 29
    .line 30
    add-int/lit8 p1, v1, 0x2

    .line 31
    .line 32
    ushr-int/lit8 p2, p2, 0x8

    .line 33
    .line 34
    int-to-byte p2, p2

    .line 35
    aput-byte p2, p5, p0

    .line 36
    .line 37
    add-int/lit8 p0, p4, -0x4

    .line 38
    .line 39
    add-int/lit8 v1, v1, 0x8

    .line 40
    .line 41
    ushr-int/lit8 p2, p0, 0x8

    .line 42
    .line 43
    add-int/2addr v1, p2

    .line 44
    if-gt v1, p7, :cond_2

    .line 45
    .line 46
    if-lt p0, v2, :cond_1

    .line 47
    .line 48
    or-int/lit8 p0, v3, 0xf

    .line 49
    .line 50
    add-int/lit8 p4, p4, -0x13

    .line 51
    .line 52
    invoke-static {p4, p5, p1}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->writeLen(I[BI)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    or-int/2addr p0, v3

    .line 58
    :goto_1
    int-to-byte p0, p0

    .line 59
    aput-byte p0, p5, p6

    .line 60
    .line 61
    return p1

    .line 62
    :cond_2
    new-instance p0, Lnet/jpountz/lz4/LZ4Exception;

    .line 63
    .line 64
    const-string p1, "maxDestLen is too small"

    .line 65
    .line 66
    invoke-direct {p0, p1}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method public static lastLiterals([BII[BII)I
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lnet/jpountz/lz4/LZ4SafeUtils;->lastLiterals([BII[BII)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static readIntEquals([BII)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p0, p2}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static readShortLittleEndian([BI)I
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readShort([BI)S

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sget-object p1, Lnet/jpountz/util/Utils;->NATIVE_BYTE_ORDER:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Short;->reverseBytes(S)S

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    :cond_0
    const p1, 0xffff

    .line 16
    .line 17
    .line 18
    and-int/2addr p0, p1

    .line 19
    return p0
.end method

.method public static safeArraycopy([BI[BII)V
    .locals 4

    .line 1
    and-int/lit8 v0, p4, -0x8

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3, v0}, Lnet/jpountz/lz4/LZ4UnsafeUtils;->wildArraycopy([BI[BII)V

    .line 4
    .line 5
    .line 6
    and-int/lit8 p4, p4, 0x7

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, p4, :cond_0

    .line 10
    .line 11
    add-int v2, p3, v0

    .line 12
    .line 13
    add-int/2addr v2, v1

    .line 14
    add-int v3, p1, v0

    .line 15
    .line 16
    add-int/2addr v3, v1

    .line 17
    invoke-static {p0, v3}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-static {p2, v2, v3}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BIB)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public static safeIncrementalCopy([BIII)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p3, :cond_0

    .line 3
    .line 4
    add-int v1, p2, v0

    .line 5
    .line 6
    add-int v2, p1, v0

    .line 7
    .line 8
    aget-byte v3, p0, v2

    .line 9
    .line 10
    aput-byte v3, p0, v1

    .line 11
    .line 12
    invoke-static {p0, v2}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-static {p0, v1, v2}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BIB)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnet/jpountz/lz4/LZ4UnsafeUtils;
    .locals 1

    .line 1
    const-class v0, Lnet/jpountz/lz4/LZ4UnsafeUtils;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lnet/jpountz/lz4/LZ4UnsafeUtils;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lnet/jpountz/lz4/LZ4UnsafeUtils;
    .locals 1

    .line 1
    sget-object v0, Lnet/jpountz/lz4/LZ4UnsafeUtils;->$VALUES:[Lnet/jpountz/lz4/LZ4UnsafeUtils;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lnet/jpountz/lz4/LZ4UnsafeUtils;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lnet/jpountz/lz4/LZ4UnsafeUtils;

    .line 8
    .line 9
    return-object v0
.end method

.method public static wildArraycopy([BI[BII)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p4, :cond_0

    .line 3
    .line 4
    add-int v1, p3, v0

    .line 5
    .line 6
    add-int v2, p1, v0

    .line 7
    .line 8
    invoke-static {p0, v2}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    invoke-static {p2, v1, v2, v3}, Lnet/jpountz/util/UnsafeUtils;->writeLong([BIJ)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x8

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public static wildIncrementalCopy([BIII)V
    .locals 8

    .line 1
    sub-int v0, p2, p1

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    if-ge v0, v2, :cond_7

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    move v3, v0

    .line 10
    :goto_0
    if-ge v3, v2, :cond_0

    .line 11
    .line 12
    add-int v4, p2, v3

    .line 13
    .line 14
    add-int v5, p1, v3

    .line 15
    .line 16
    invoke-static {p0, v5}, Lnet/jpountz/util/UnsafeUtils;->readByte([BI)B

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    invoke-static {p0, v4, v5}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BIB)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    add-int/lit8 v2, p2, 0x4

    .line 27
    .line 28
    add-int/lit8 v3, p1, 0x4

    .line 29
    .line 30
    sub-int v4, v2, v3

    .line 31
    .line 32
    const/4 v5, 0x1

    .line 33
    if-eq v4, v5, :cond_6

    .line 34
    .line 35
    const/4 v6, 0x2

    .line 36
    if-eq v4, v6, :cond_5

    .line 37
    .line 38
    const/4 v7, 0x3

    .line 39
    if-eq v4, v7, :cond_4

    .line 40
    .line 41
    const/4 p1, 0x5

    .line 42
    if-eq v4, p1, :cond_3

    .line 43
    .line 44
    const/4 p1, 0x6

    .line 45
    if-eq v4, p1, :cond_2

    .line 46
    .line 47
    const/4 p1, 0x7

    .line 48
    if-eq v4, p1, :cond_1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move v0, v7

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    move v0, v6

    .line 54
    goto :goto_1

    .line 55
    :cond_3
    move v0, v5

    .line 56
    goto :goto_1

    .line 57
    :cond_4
    add-int/lit8 v3, p1, 0x1

    .line 58
    .line 59
    const/4 v0, -0x1

    .line 60
    goto :goto_1

    .line 61
    :cond_5
    add-int/lit8 v3, p1, 0x2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_6
    add-int/lit8 v3, p1, 0x1

    .line 65
    .line 66
    :goto_1
    invoke-static {p0, v3}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-static {p0, v2, p1}, Lnet/jpountz/util/UnsafeUtils;->writeInt([BII)V

    .line 71
    .line 72
    .line 73
    add-int/lit8 p2, p2, 0x8

    .line 74
    .line 75
    sub-int p1, v3, v0

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_7
    if-ge v0, v1, :cond_8

    .line 79
    .line 80
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    invoke-static {p0, p2, v2, v3}, Lnet/jpountz/util/UnsafeUtils;->writeLong([BIJ)V

    .line 85
    .line 86
    .line 87
    add-int/2addr p2, v0

    .line 88
    :cond_8
    :goto_2
    if-ge p2, p3, :cond_9

    .line 89
    .line 90
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    invoke-static {p0, p2, v2, v3}, Lnet/jpountz/util/UnsafeUtils;->writeLong([BIJ)V

    .line 95
    .line 96
    .line 97
    add-int/lit8 p2, p2, 0x8

    .line 98
    .line 99
    add-int/2addr p1, v1

    .line 100
    goto :goto_2

    .line 101
    :cond_9
    return-void
.end method

.method public static writeLen(I[BI)I
    .locals 2

    .line 1
    :goto_0
    const/16 v0, 0xff

    .line 2
    .line 3
    if-lt p0, v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v1, p2, 0x1

    .line 6
    .line 7
    invoke-static {p1, p2, v0}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    .line 8
    .line 9
    .line 10
    add-int/lit16 p0, p0, -0xff

    .line 11
    .line 12
    move p2, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    add-int/lit8 v0, p2, 0x1

    .line 15
    .line 16
    invoke-static {p1, p2, p0}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BII)V

    .line 17
    .line 18
    .line 19
    return v0
.end method

.method public static writeShortLittleEndian([BII)V
    .locals 2

    .line 1
    int-to-short p2, p2

    .line 2
    sget-object v0, Lnet/jpountz/util/Utils;->NATIVE_BYTE_ORDER:Ljava/nio/ByteOrder;

    .line 3
    .line 4
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-static {p2}, Ljava/lang/Short;->reverseBytes(S)S

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    :cond_0
    invoke-static {p0, p1, p2}, Lnet/jpountz/util/UnsafeUtils;->writeShort([BIS)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.class final enum Lnet/jpountz/lz4/LZ4ByteBufferUtils;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnet/jpountz/lz4/LZ4ByteBufferUtils;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnet/jpountz/lz4/LZ4ByteBufferUtils;

.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lnet/jpountz/lz4/LZ4ByteBufferUtils;

    .line 3
    .line 4
    sput-object v0, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->$VALUES:[Lnet/jpountz/lz4/LZ4ByteBufferUtils;

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

.method public static commonBytes(Ljava/nio/ByteBuffer;III)I
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
    invoke-static {p0, p2}, Lnet/jpountz/util/ByteBufferUtils;->readLong(Ljava/nio/ByteBuffer;I)J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-static {p0, p1}, Lnet/jpountz/util/ByteBufferUtils;->readLong(Ljava/nio/ByteBuffer;I)J

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
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 30
    .line 31
    if-ne p3, v1, :cond_1

    .line 32
    .line 33
    invoke-static {p0, p2}, Lnet/jpountz/util/ByteBufferUtils;->readLong(Ljava/nio/ByteBuffer;I)J

    .line 34
    .line 35
    .line 36
    move-result-wide p2

    .line 37
    invoke-static {p0, p1}, Lnet/jpountz/util/ByteBufferUtils;->readLong(Ljava/nio/ByteBuffer;I)J

    .line 38
    .line 39
    .line 40
    move-result-wide p0

    .line 41
    xor-long/2addr p0, p2

    .line 42
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    invoke-static {p0, p2}, Lnet/jpountz/util/ByteBufferUtils;->readLong(Ljava/nio/ByteBuffer;I)J

    .line 48
    .line 49
    .line 50
    move-result-wide p2

    .line 51
    invoke-static {p0, p1}, Lnet/jpountz/util/ByteBufferUtils;->readLong(Ljava/nio/ByteBuffer;I)J

    .line 52
    .line 53
    .line 54
    move-result-wide p0

    .line 55
    xor-long/2addr p0, p2

    .line 56
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    :goto_1
    ushr-int/lit8 p0, p0, 0x3

    .line 61
    .line 62
    add-int/2addr v0, p0

    .line 63
    return v0

    .line 64
    :cond_2
    :goto_2
    if-ge p2, p3, :cond_3

    .line 65
    .line 66
    add-int/lit8 v1, p1, 0x1

    .line 67
    .line 68
    invoke-static {p0, p1}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    add-int/lit8 v2, p2, 0x1

    .line 73
    .line 74
    invoke-static {p0, p2}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-ne p1, p2, :cond_3

    .line 79
    .line 80
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    move p1, v1

    .line 83
    move p2, v2

    .line 84
    goto :goto_2

    .line 85
    :cond_3
    return v0
.end method

.method public static commonBytesBackward(Ljava/nio/ByteBuffer;IIII)I
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
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/lit8 p2, p2, -0x1

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->get(I)B

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

.method public static copyTo(Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;)V
    .locals 1

    .line 1
    iget v0, p0, Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;->len:I

    .line 2
    .line 3
    iput v0, p1, Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;->len:I

    .line 4
    .line 5
    iget v0, p0, Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;->start:I

    .line 6
    .line 7
    iput v0, p1, Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;->start:I

    .line 8
    .line 9
    iget p0, p0, Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;->ref:I

    .line 10
    .line 11
    iput p0, p1, Lnet/jpountz/lz4/LZ4ByteBufferUtils$Match;->ref:I

    .line 12
    .line 13
    return-void
.end method

.method public static encodeSequence(Ljava/nio/ByteBuffer;IIIILjava/nio/ByteBuffer;II)I
    .locals 5

    .line 1
    sub-int v0, p2, p1

    .line 2
    .line 3
    add-int/lit8 v1, p6, 0x1

    .line 4
    .line 5
    add-int v2, v1, v0

    .line 6
    .line 7
    add-int/lit8 v2, v2, 0x8

    .line 8
    .line 9
    ushr-int/lit8 v3, v0, 0x8

    .line 10
    .line 11
    add-int/2addr v2, v3

    .line 12
    const-string v3, "maxDestLen is too small"

    .line 13
    .line 14
    if-gt v2, p7, :cond_3

    .line 15
    .line 16
    const/16 v2, 0xf

    .line 17
    .line 18
    if-lt v0, v2, :cond_0

    .line 19
    .line 20
    add-int/lit8 v4, v0, -0xf

    .line 21
    .line 22
    invoke-static {v4, p5, v1}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->writeLen(ILjava/nio/ByteBuffer;I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/16 v4, -0x10

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    shl-int/lit8 v4, v0, 0x4

    .line 30
    .line 31
    :goto_0
    invoke-static {p0, p1, p5, v1, v0}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->wildArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 32
    .line 33
    .line 34
    add-int/2addr v1, v0

    .line 35
    sub-int/2addr p2, p3

    .line 36
    add-int/lit8 p0, v1, 0x1

    .line 37
    .line 38
    int-to-byte p1, p2

    .line 39
    invoke-virtual {p5, v1, p1}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    add-int/lit8 p1, v1, 0x2

    .line 43
    .line 44
    ushr-int/lit8 p2, p2, 0x8

    .line 45
    .line 46
    int-to-byte p2, p2

    .line 47
    invoke-virtual {p5, p0, p2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    add-int/lit8 p0, p4, -0x4

    .line 51
    .line 52
    add-int/lit8 v1, v1, 0x8

    .line 53
    .line 54
    ushr-int/lit8 p2, p0, 0x8

    .line 55
    .line 56
    add-int/2addr v1, p2

    .line 57
    if-gt v1, p7, :cond_2

    .line 58
    .line 59
    if-lt p0, v2, :cond_1

    .line 60
    .line 61
    or-int/lit8 p0, v4, 0xf

    .line 62
    .line 63
    add-int/lit8 p4, p4, -0x13

    .line 64
    .line 65
    invoke-static {p4, p5, p1}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->writeLen(ILjava/nio/ByteBuffer;I)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    or-int/2addr p0, v4

    .line 71
    :goto_1
    int-to-byte p0, p0

    .line 72
    invoke-virtual {p5, p6, p0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    .line 75
    return p1

    .line 76
    :cond_2
    new-instance p0, Lnet/jpountz/lz4/LZ4Exception;

    .line 77
    .line 78
    invoke-direct {p0, v3}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw p0

    .line 82
    :cond_3
    new-instance p0, Lnet/jpountz/lz4/LZ4Exception;

    .line 83
    .line 84
    invoke-direct {p0, v3}, Lnet/jpountz/lz4/LZ4Exception;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p0
.end method

.method public static hash(Ljava/nio/ByteBuffer;I)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lnet/jpountz/lz4/LZ4Utils;->hash(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static hash64k(Ljava/nio/ByteBuffer;I)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Lnet/jpountz/lz4/LZ4Utils;->hash64k(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static lastLiterals(Ljava/nio/ByteBuffer;IILjava/nio/ByteBuffer;II)I
    .locals 2

    .line 1
    add-int v0, p4, p2

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    add-int/lit16 v1, p2, 0xf0

    .line 6
    .line 7
    div-int/lit16 v1, v1, 0xff

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    if-gt v0, p5, :cond_1

    .line 11
    .line 12
    const/16 p5, 0xf

    .line 13
    .line 14
    if-lt p2, p5, :cond_0

    .line 15
    .line 16
    add-int/lit8 p5, p4, 0x1

    .line 17
    .line 18
    const/16 v0, -0x10

    .line 19
    .line 20
    invoke-virtual {p3, p4, v0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    add-int/lit8 p4, p2, -0xf

    .line 24
    .line 25
    invoke-static {p4, p3, p5}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->writeLen(ILjava/nio/ByteBuffer;I)I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    add-int/lit8 p5, p4, 0x1

    .line 31
    .line 32
    shl-int/lit8 v0, p2, 0x4

    .line 33
    .line 34
    int-to-byte v0, v0

    .line 35
    invoke-virtual {p3, p4, v0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move p4, p5

    .line 39
    :goto_0
    invoke-static {p0, p1, p3, p4, p2}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->safeArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V

    .line 40
    .line 41
    .line 42
    add-int/2addr p4, p2

    .line 43
    return p4

    .line 44
    :cond_1
    new-instance p0, Lnet/jpountz/lz4/LZ4Exception;

    .line 45
    .line 46
    invoke-direct {p0}, Lnet/jpountz/lz4/LZ4Exception;-><init>()V

    .line 47
    .line 48
    .line 49
    throw p0
.end method

.method public static readIntEquals(Ljava/nio/ByteBuffer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->getInt(I)I

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

.method public static safeArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V
    .locals 3

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
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-virtual {p2, v1, v2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public static safeIncrementalCopy(Ljava/nio/ByteBuffer;III)V
    .locals 3

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
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    invoke-virtual {p0, v1, v2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lnet/jpountz/lz4/LZ4ByteBufferUtils;
    .locals 1

    .line 1
    const-class v0, Lnet/jpountz/lz4/LZ4ByteBufferUtils;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lnet/jpountz/lz4/LZ4ByteBufferUtils;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lnet/jpountz/lz4/LZ4ByteBufferUtils;
    .locals 1

    .line 1
    sget-object v0, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->$VALUES:[Lnet/jpountz/lz4/LZ4ByteBufferUtils;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lnet/jpountz/lz4/LZ4ByteBufferUtils;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lnet/jpountz/lz4/LZ4ByteBufferUtils;

    .line 8
    .line 9
    return-object v0
.end method

.method public static wildArraycopy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V
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
    :try_start_0
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->getLong(I)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    invoke-virtual {p2, v1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x8

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    const-string p0, "Malformed input at offset "

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/f7r;->a(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static wildIncrementalCopy(Ljava/nio/ByteBuffer;III)V
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
    invoke-static {p0, v5}, Lnet/jpountz/util/ByteBufferUtils;->readByte(Ljava/nio/ByteBuffer;I)B

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    invoke-static {p0, v4, v5}, Lnet/jpountz/util/ByteBufferUtils;->writeByte(Ljava/nio/ByteBuffer;II)V

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
    invoke-static {p0, v3}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-static {p0, v2, p1}, Lnet/jpountz/util/ByteBufferUtils;->writeInt(Ljava/nio/ByteBuffer;II)V

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
    invoke-static {p0, p1}, Lnet/jpountz/util/ByteBufferUtils;->readLong(Ljava/nio/ByteBuffer;I)J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    invoke-static {p0, p2, v2, v3}, Lnet/jpountz/util/ByteBufferUtils;->writeLong(Ljava/nio/ByteBuffer;IJ)V

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
    invoke-static {p0, p1}, Lnet/jpountz/util/ByteBufferUtils;->readLong(Ljava/nio/ByteBuffer;I)J

    .line 91
    .line 92
    .line 93
    move-result-wide v2

    .line 94
    invoke-static {p0, p2, v2, v3}, Lnet/jpountz/util/ByteBufferUtils;->writeLong(Ljava/nio/ByteBuffer;IJ)V

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

.method public static writeLen(ILjava/nio/ByteBuffer;I)I
    .locals 2

    .line 1
    :goto_0
    const/16 v0, 0xff

    .line 2
    .line 3
    if-lt p0, v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, p2, 0x1

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    invoke-virtual {p1, p2, v1}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    add-int/lit16 p0, p0, -0xff

    .line 12
    .line 13
    move p2, v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    add-int/lit8 v0, p2, 0x1

    .line 16
    .line 17
    int-to-byte p0, p0

    .line 18
    invoke-virtual {p1, p2, p0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    return v0
.end method

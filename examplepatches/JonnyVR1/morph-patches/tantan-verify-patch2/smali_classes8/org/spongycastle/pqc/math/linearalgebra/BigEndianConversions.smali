.class public final Lorg/spongycastle/pqc/math/linearalgebra/BigEndianConversions;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static I2OSP(I[BI)V
    .locals 3

    add-int/lit8 v0, p2, 0x1

    ushr-int/lit8 v1, p0, 0x18

    int-to-byte v1, v1

    .line 80
    aput-byte v1, p1, p2

    add-int/lit8 v1, p2, 0x2

    ushr-int/lit8 v2, p0, 0x10

    int-to-byte v2, v2

    .line 81
    aput-byte v2, p1, v0

    add-int/lit8 p2, p2, 0x3

    ushr-int/lit8 v0, p0, 0x8

    int-to-byte v0, v0

    .line 82
    aput-byte v0, p1, v1

    int-to-byte p0, p0

    .line 83
    aput-byte p0, p1, p2

    return-void
.end method

.method public static I2OSP(I[BII)V
    .locals 3

    add-int/lit8 p3, p3, -0x1

    move v0, p3

    :goto_0
    if-ltz v0, :cond_0

    add-int v1, p2, v0

    sub-int v2, p3, v0

    mul-int/lit8 v2, v2, 0x8

    ushr-int v2, p0, v2

    int-to-byte v2, v2

    .line 86
    aput-byte v2, p1, v1

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static I2OSP(J[BI)V
    .locals 4

    .line 1
    add-int/lit8 v0, p3, 0x1

    .line 2
    .line 3
    const/16 v1, 0x38

    .line 4
    .line 5
    ushr-long v1, p0, v1

    .line 6
    .line 7
    long-to-int v1, v1

    .line 8
    int-to-byte v1, v1

    .line 9
    aput-byte v1, p2, p3

    .line 10
    .line 11
    add-int/lit8 v1, p3, 0x2

    .line 12
    .line 13
    const/16 v2, 0x30

    .line 14
    .line 15
    ushr-long v2, p0, v2

    .line 16
    .line 17
    long-to-int v2, v2

    .line 18
    int-to-byte v2, v2

    .line 19
    aput-byte v2, p2, v0

    .line 20
    .line 21
    add-int/lit8 v0, p3, 0x3

    .line 22
    .line 23
    const/16 v2, 0x28

    .line 24
    .line 25
    ushr-long v2, p0, v2

    .line 26
    .line 27
    long-to-int v2, v2

    .line 28
    int-to-byte v2, v2

    .line 29
    aput-byte v2, p2, v1

    .line 30
    .line 31
    add-int/lit8 v1, p3, 0x4

    .line 32
    .line 33
    const/16 v2, 0x20

    .line 34
    .line 35
    ushr-long v2, p0, v2

    .line 36
    .line 37
    long-to-int v2, v2

    .line 38
    int-to-byte v2, v2

    .line 39
    aput-byte v2, p2, v0

    .line 40
    .line 41
    add-int/lit8 v0, p3, 0x5

    .line 42
    .line 43
    const/16 v2, 0x18

    .line 44
    .line 45
    ushr-long v2, p0, v2

    .line 46
    .line 47
    long-to-int v2, v2

    .line 48
    int-to-byte v2, v2

    .line 49
    aput-byte v2, p2, v1

    .line 50
    .line 51
    add-int/lit8 v1, p3, 0x6

    .line 52
    .line 53
    const/16 v2, 0x10

    .line 54
    .line 55
    ushr-long v2, p0, v2

    .line 56
    .line 57
    long-to-int v2, v2

    .line 58
    int-to-byte v2, v2

    .line 59
    aput-byte v2, p2, v0

    .line 60
    .line 61
    add-int/lit8 p3, p3, 0x7

    .line 62
    .line 63
    const/16 v0, 0x8

    .line 64
    .line 65
    ushr-long v2, p0, v0

    .line 66
    .line 67
    long-to-int v0, v2

    .line 68
    int-to-byte v0, v0

    .line 69
    aput-byte v0, p2, v1

    .line 70
    .line 71
    long-to-int p0, p0

    .line 72
    int-to-byte p0, p0

    .line 73
    aput-byte p0, p2, p3

    .line 74
    .line 75
    return-void
.end method

.method public static I2OSP(I)[B
    .locals 5

    ushr-int/lit8 v0, p0, 0x18

    int-to-byte v0, v0

    ushr-int/lit8 v1, p0, 0x10

    int-to-byte v1, v1

    ushr-int/lit8 v2, p0, 0x8

    int-to-byte v2, v2

    int-to-byte p0, p0

    const/4 v3, 0x4

    .line 85
    new-array v3, v3, [B

    const/4 v4, 0x0

    aput-byte v0, v3, v4

    const/4 v0, 0x1

    aput-byte v1, v3, v0

    const/4 v0, 0x2

    aput-byte v2, v3, v0

    const/4 v0, 0x3

    aput-byte p0, v3, v0

    return-object v3
.end method

.method public static I2OSP(II)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ArithmeticException;
        }
    .end annotation

    if-gez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 76
    :cond_0
    invoke-static {p0}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->ceilLog256(I)I

    move-result v0

    if-gt v0, p1, :cond_2

    .line 77
    new-array v1, p1, [B

    add-int/lit8 v2, p1, -0x1

    move v3, v2

    :goto_0
    sub-int v4, p1, v0

    if-lt v3, v4, :cond_1

    sub-int v4, v2, v3

    mul-int/lit8 v4, v4, 0x8

    ushr-int v4, p0, v4

    int-to-byte v4, v4

    .line 78
    aput-byte v4, v1, v3

    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_1
    return-object v1

    .line 79
    :cond_2
    const-string p0, "Cannot encode given integer into specified number of octets."

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static I2OSP(J)[B
    .locals 9

    const/16 v0, 0x38

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    const/16 v1, 0x30

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    const/16 v2, 0x28

    ushr-long v2, p0, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    const/16 v3, 0x20

    ushr-long v3, p0, v3

    long-to-int v3, v3

    int-to-byte v3, v3

    const/16 v4, 0x18

    ushr-long v4, p0, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    const/16 v5, 0x10

    ushr-long v5, p0, v5

    long-to-int v5, v5

    int-to-byte v5, v5

    const/16 v6, 0x8

    ushr-long v7, p0, v6

    long-to-int v7, v7

    int-to-byte v7, v7

    long-to-int p0, p0

    int-to-byte p0, p0

    .line 84
    new-array p1, v6, [B

    const/4 v6, 0x0

    aput-byte v0, p1, v6

    const/4 v0, 0x1

    aput-byte v1, p1, v0

    const/4 v0, 0x2

    aput-byte v2, p1, v0

    const/4 v0, 0x3

    aput-byte v3, p1, v0

    const/4 v0, 0x4

    aput-byte v4, p1, v0

    const/4 v0, 0x5

    aput-byte v5, p1, v0

    const/4 v0, 0x6

    aput-byte v7, p1, v0

    const/4 v0, 0x7

    aput-byte p0, p1, v0

    return-object p1
.end method

.method public static OS2IP([B)I
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x4

    .line 3
    const/4 v2, 0x0

    .line 4
    if-gt v0, v1, :cond_2

    .line 5
    .line 6
    array-length v0, p0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    move v0, v2

    .line 11
    :goto_0
    array-length v1, p0

    .line 12
    if-ge v2, v1, :cond_1

    .line 13
    .line 14
    aget-byte v1, p0, v2

    .line 15
    .line 16
    and-int/lit16 v1, v1, 0xff

    .line 17
    .line 18
    array-length v3, p0

    .line 19
    add-int/lit8 v3, v3, -0x1

    .line 20
    .line 21
    sub-int/2addr v3, v2

    .line 22
    mul-int/lit8 v3, v3, 0x8

    .line 23
    .line 24
    shl-int/2addr v1, v3

    .line 25
    or-int/2addr v0, v1

    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v0

    .line 30
    :cond_2
    const-string p0, "invalid input length"

    .line 31
    .line 32
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return v2
.end method

.method public static OS2IP([BI)I
    .locals 3

    add-int/lit8 v0, p1, 0x1

    .line 36
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    add-int/lit8 v2, p1, 0x2

    .line 37
    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x3

    .line 38
    aget-byte v1, p0, v2

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 39
    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    or-int/2addr p0, v0

    return p0
.end method

.method public static OS2IP([BII)I
    .locals 4

    .line 40
    array-length v0, p0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    array-length v0, p0

    add-int v2, p1, p2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_0

    goto :goto_1

    :cond_0
    move v0, v1

    :goto_0
    if-ge v1, p2, :cond_1

    add-int v2, p1, v1

    .line 41
    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    sub-int v3, p2, v1

    add-int/lit8 v3, v3, -0x1

    mul-int/lit8 v3, v3, 0x8

    shl-int/2addr v2, v3

    or-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0

    :cond_2
    :goto_1
    return v1
.end method

.method public static OS2LIP([BI)J
    .locals 8

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    aget-byte v1, p0, p1

    .line 4
    .line 5
    int-to-long v1, v1

    .line 6
    const-wide/16 v3, 0xff

    .line 7
    .line 8
    and-long/2addr v1, v3

    .line 9
    const/16 v5, 0x38

    .line 10
    .line 11
    shl-long/2addr v1, v5

    .line 12
    add-int/lit8 v5, p1, 0x2

    .line 13
    .line 14
    aget-byte v0, p0, v0

    .line 15
    .line 16
    int-to-long v6, v0

    .line 17
    and-long/2addr v6, v3

    .line 18
    const/16 v0, 0x30

    .line 19
    .line 20
    shl-long/2addr v6, v0

    .line 21
    or-long v0, v1, v6

    .line 22
    .line 23
    add-int/lit8 v2, p1, 0x3

    .line 24
    .line 25
    aget-byte v5, p0, v5

    .line 26
    .line 27
    int-to-long v5, v5

    .line 28
    and-long/2addr v5, v3

    .line 29
    const/16 v7, 0x28

    .line 30
    .line 31
    shl-long/2addr v5, v7

    .line 32
    or-long/2addr v0, v5

    .line 33
    add-int/lit8 v5, p1, 0x4

    .line 34
    .line 35
    aget-byte v2, p0, v2

    .line 36
    .line 37
    int-to-long v6, v2

    .line 38
    and-long/2addr v6, v3

    .line 39
    const/16 v2, 0x20

    .line 40
    .line 41
    shl-long/2addr v6, v2

    .line 42
    or-long/2addr v0, v6

    .line 43
    add-int/lit8 v2, p1, 0x5

    .line 44
    .line 45
    aget-byte v5, p0, v5

    .line 46
    .line 47
    int-to-long v5, v5

    .line 48
    and-long/2addr v3, v5

    .line 49
    const/16 v5, 0x18

    .line 50
    .line 51
    shl-long/2addr v3, v5

    .line 52
    or-long/2addr v0, v3

    .line 53
    add-int/lit8 v3, p1, 0x6

    .line 54
    .line 55
    aget-byte v2, p0, v2

    .line 56
    .line 57
    and-int/lit16 v2, v2, 0xff

    .line 58
    .line 59
    shl-int/lit8 v2, v2, 0x10

    .line 60
    .line 61
    int-to-long v4, v2

    .line 62
    or-long/2addr v0, v4

    .line 63
    add-int/lit8 p1, p1, 0x7

    .line 64
    .line 65
    aget-byte v2, p0, v3

    .line 66
    .line 67
    and-int/lit16 v2, v2, 0xff

    .line 68
    .line 69
    shl-int/lit8 v2, v2, 0x8

    .line 70
    .line 71
    int-to-long v2, v2

    .line 72
    or-long/2addr v0, v2

    .line 73
    aget-byte p0, p0, p1

    .line 74
    .line 75
    and-int/lit16 p0, p0, 0xff

    .line 76
    .line 77
    int-to-long p0, p0

    .line 78
    or-long/2addr p0, v0

    .line 79
    return-wide p0
.end method

.method public static toByteArray([I)[B
    .locals 4

    .line 29
    array-length v0, p0

    shl-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 30
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 31
    aget v2, p0, v1

    shl-int/lit8 v3, v1, 0x2

    invoke-static {v2, v0, v3}, Lorg/spongycastle/pqc/math/linearalgebra/BigEndianConversions;->I2OSP(I[BI)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static toByteArray([II)[B
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    new-array v1, p1, [B

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    add-int/lit8 v4, v0, -0x2

    .line 7
    .line 8
    if-gt v2, v4, :cond_0

    .line 9
    .line 10
    aget v4, p0, v2

    .line 11
    .line 12
    invoke-static {v4, v1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/BigEndianConversions;->I2OSP(I[BI)V

    .line 13
    .line 14
    .line 15
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    add-int/lit8 v3, v3, 0x4

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    aget p0, p0, v0

    .line 23
    .line 24
    sub-int/2addr p1, v3

    .line 25
    invoke-static {p0, v1, v3, p1}, Lorg/spongycastle/pqc/math/linearalgebra/BigEndianConversions;->I2OSP(I[BII)V

    .line 26
    .line 27
    .line 28
    return-object v1
.end method

.method public static toIntArray([B)[I
    .locals 6

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, 0x3

    .line 3
    .line 4
    div-int/lit8 v0, v0, 0x4

    .line 5
    .line 6
    array-length v1, p0

    .line 7
    and-int/lit8 v1, v1, 0x3

    .line 8
    .line 9
    new-array v2, v0, [I

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    move v4, v3

    .line 13
    :goto_0
    add-int/lit8 v5, v0, -0x2

    .line 14
    .line 15
    if-gt v3, v5, :cond_0

    .line 16
    .line 17
    invoke-static {p0, v4}, Lorg/spongycastle/pqc/math/linearalgebra/BigEndianConversions;->OS2IP([BI)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    aput v5, v2, v3

    .line 22
    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    add-int/lit8 v4, v4, 0x4

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    if-eqz v1, :cond_1

    .line 29
    .line 30
    add-int/lit8 v0, v0, -0x1

    .line 31
    .line 32
    invoke-static {p0, v4, v1}, Lorg/spongycastle/pqc/math/linearalgebra/BigEndianConversions;->OS2IP([BII)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    aput p0, v2, v0

    .line 37
    .line 38
    return-object v2

    .line 39
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 40
    .line 41
    invoke-static {p0, v4}, Lorg/spongycastle/pqc/math/linearalgebra/BigEndianConversions;->OS2IP([BI)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    aput p0, v2, v0

    .line 46
    .line 47
    return-object v2
.end method

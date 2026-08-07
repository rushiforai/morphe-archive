.class public abstract Lorg/spongycastle/math/raw/Nat128;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M:J = 0xffffffffL


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static add([I[I[I)I
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    aget v5, p1, v0

    .line 12
    .line 13
    int-to-long v5, v5

    .line 14
    and-long/2addr v5, v3

    .line 15
    add-long/2addr v1, v5

    .line 16
    long-to-int v5, v1

    .line 17
    aput v5, p2, v0

    .line 18
    .line 19
    const/16 v0, 0x20

    .line 20
    .line 21
    ushr-long/2addr v1, v0

    .line 22
    const/4 v5, 0x1

    .line 23
    aget v6, p0, v5

    .line 24
    .line 25
    int-to-long v6, v6

    .line 26
    and-long/2addr v6, v3

    .line 27
    aget v8, p1, v5

    .line 28
    .line 29
    int-to-long v8, v8

    .line 30
    and-long/2addr v8, v3

    .line 31
    add-long/2addr v6, v8

    .line 32
    add-long/2addr v1, v6

    .line 33
    long-to-int v6, v1

    .line 34
    aput v6, p2, v5

    .line 35
    .line 36
    ushr-long/2addr v1, v0

    .line 37
    const/4 v5, 0x2

    .line 38
    aget v6, p0, v5

    .line 39
    .line 40
    int-to-long v6, v6

    .line 41
    and-long/2addr v6, v3

    .line 42
    aget v8, p1, v5

    .line 43
    .line 44
    int-to-long v8, v8

    .line 45
    and-long/2addr v8, v3

    .line 46
    add-long/2addr v6, v8

    .line 47
    add-long/2addr v1, v6

    .line 48
    long-to-int v6, v1

    .line 49
    aput v6, p2, v5

    .line 50
    .line 51
    ushr-long/2addr v1, v0

    .line 52
    const/4 v5, 0x3

    .line 53
    aget p0, p0, v5

    .line 54
    .line 55
    int-to-long v6, p0

    .line 56
    and-long/2addr v6, v3

    .line 57
    aget p0, p1, v5

    .line 58
    .line 59
    int-to-long p0, p0

    .line 60
    and-long/2addr p0, v3

    .line 61
    add-long/2addr v6, p0

    .line 62
    add-long/2addr v1, v6

    .line 63
    long-to-int p0, v1

    .line 64
    aput p0, p2, v5

    .line 65
    .line 66
    ushr-long p0, v1, v0

    .line 67
    .line 68
    long-to-int p0, p0

    .line 69
    return p0
.end method

.method public static addBothTo([I[I[I)I
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    aget v5, p1, v0

    .line 12
    .line 13
    int-to-long v5, v5

    .line 14
    and-long/2addr v5, v3

    .line 15
    add-long/2addr v1, v5

    .line 16
    aget v5, p2, v0

    .line 17
    .line 18
    int-to-long v5, v5

    .line 19
    and-long/2addr v5, v3

    .line 20
    add-long/2addr v1, v5

    .line 21
    long-to-int v5, v1

    .line 22
    aput v5, p2, v0

    .line 23
    .line 24
    const/16 v0, 0x20

    .line 25
    .line 26
    ushr-long/2addr v1, v0

    .line 27
    const/4 v5, 0x1

    .line 28
    aget v6, p0, v5

    .line 29
    .line 30
    int-to-long v6, v6

    .line 31
    and-long/2addr v6, v3

    .line 32
    aget v8, p1, v5

    .line 33
    .line 34
    int-to-long v8, v8

    .line 35
    and-long/2addr v8, v3

    .line 36
    add-long/2addr v6, v8

    .line 37
    aget v8, p2, v5

    .line 38
    .line 39
    int-to-long v8, v8

    .line 40
    and-long/2addr v8, v3

    .line 41
    add-long/2addr v6, v8

    .line 42
    add-long/2addr v1, v6

    .line 43
    long-to-int v6, v1

    .line 44
    aput v6, p2, v5

    .line 45
    .line 46
    ushr-long/2addr v1, v0

    .line 47
    const/4 v5, 0x2

    .line 48
    aget v6, p0, v5

    .line 49
    .line 50
    int-to-long v6, v6

    .line 51
    and-long/2addr v6, v3

    .line 52
    aget v8, p1, v5

    .line 53
    .line 54
    int-to-long v8, v8

    .line 55
    and-long/2addr v8, v3

    .line 56
    add-long/2addr v6, v8

    .line 57
    aget v8, p2, v5

    .line 58
    .line 59
    int-to-long v8, v8

    .line 60
    and-long/2addr v8, v3

    .line 61
    add-long/2addr v6, v8

    .line 62
    add-long/2addr v1, v6

    .line 63
    long-to-int v6, v1

    .line 64
    aput v6, p2, v5

    .line 65
    .line 66
    ushr-long/2addr v1, v0

    .line 67
    const/4 v5, 0x3

    .line 68
    aget p0, p0, v5

    .line 69
    .line 70
    int-to-long v6, p0

    .line 71
    and-long/2addr v6, v3

    .line 72
    aget p0, p1, v5

    .line 73
    .line 74
    int-to-long p0, p0

    .line 75
    and-long/2addr p0, v3

    .line 76
    add-long/2addr v6, p0

    .line 77
    aget p0, p2, v5

    .line 78
    .line 79
    int-to-long p0, p0

    .line 80
    and-long/2addr p0, v3

    .line 81
    add-long/2addr v6, p0

    .line 82
    add-long/2addr v1, v6

    .line 83
    long-to-int p0, v1

    .line 84
    aput p0, p2, v5

    .line 85
    .line 86
    ushr-long p0, v1, v0

    .line 87
    .line 88
    long-to-int p0, p0

    .line 89
    return p0
.end method

.method public static addTo([II[III)I
    .locals 9

    .line 1
    int-to-long v0, p4

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p4, p0, p1

    .line 9
    .line 10
    int-to-long v4, p4

    .line 11
    and-long/2addr v4, v2

    .line 12
    aget p4, p2, p3

    .line 13
    .line 14
    int-to-long v6, p4

    .line 15
    and-long/2addr v6, v2

    .line 16
    add-long/2addr v4, v6

    .line 17
    add-long/2addr v0, v4

    .line 18
    long-to-int p4, v0

    .line 19
    aput p4, p2, p3

    .line 20
    .line 21
    const/16 p4, 0x20

    .line 22
    .line 23
    ushr-long/2addr v0, p4

    .line 24
    add-int/lit8 v4, p1, 0x1

    .line 25
    .line 26
    aget v4, p0, v4

    .line 27
    .line 28
    int-to-long v4, v4

    .line 29
    and-long/2addr v4, v2

    .line 30
    add-int/lit8 v6, p3, 0x1

    .line 31
    .line 32
    aget v7, p2, v6

    .line 33
    .line 34
    int-to-long v7, v7

    .line 35
    and-long/2addr v7, v2

    .line 36
    add-long/2addr v4, v7

    .line 37
    add-long/2addr v0, v4

    .line 38
    long-to-int v4, v0

    .line 39
    aput v4, p2, v6

    .line 40
    .line 41
    ushr-long/2addr v0, p4

    .line 42
    add-int/lit8 v4, p1, 0x2

    .line 43
    .line 44
    aget v4, p0, v4

    .line 45
    .line 46
    int-to-long v4, v4

    .line 47
    and-long/2addr v4, v2

    .line 48
    add-int/lit8 v6, p3, 0x2

    .line 49
    .line 50
    aget v7, p2, v6

    .line 51
    .line 52
    int-to-long v7, v7

    .line 53
    and-long/2addr v7, v2

    .line 54
    add-long/2addr v4, v7

    .line 55
    add-long/2addr v0, v4

    .line 56
    long-to-int v4, v0

    .line 57
    aput v4, p2, v6

    .line 58
    .line 59
    ushr-long/2addr v0, p4

    .line 60
    add-int/lit8 p1, p1, 0x3

    .line 61
    .line 62
    aget p0, p0, p1

    .line 63
    .line 64
    int-to-long p0, p0

    .line 65
    and-long/2addr p0, v2

    .line 66
    add-int/lit8 p3, p3, 0x3

    .line 67
    .line 68
    aget v4, p2, p3

    .line 69
    .line 70
    int-to-long v4, v4

    .line 71
    and-long/2addr v2, v4

    .line 72
    add-long/2addr p0, v2

    .line 73
    add-long/2addr v0, p0

    .line 74
    long-to-int p0, v0

    .line 75
    aput p0, p2, p3

    .line 76
    .line 77
    ushr-long p0, v0, p4

    .line 78
    .line 79
    long-to-int p0, p0

    .line 80
    return p0
.end method

.method public static addTo([I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 81
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p1, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    add-long/2addr v1, v5

    long-to-int v5, v1

    .line 82
    aput v5, p1, v0

    const/16 v0, 0x20

    ushr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 83
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 84
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 85
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    add-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 86
    aput v6, p1, v5

    ushr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 87
    aget p0, p0, v5

    int-to-long v6, p0

    and-long/2addr v6, v3

    aget p0, p1, v5

    int-to-long v8, p0

    and-long/2addr v3, v8

    add-long/2addr v6, v3

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 88
    aput p0, p1, v5

    ushr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static addToEachOther([II[II)I
    .locals 11

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p2, p3

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    add-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p0, p1

    .line 17
    .line 18
    aput v4, p2, p3

    .line 19
    .line 20
    const/16 v4, 0x20

    .line 21
    .line 22
    ushr-long/2addr v0, v4

    .line 23
    add-int/lit8 v5, p1, 0x1

    .line 24
    .line 25
    aget v6, p0, v5

    .line 26
    .line 27
    int-to-long v6, v6

    .line 28
    and-long/2addr v6, v2

    .line 29
    add-int/lit8 v8, p3, 0x1

    .line 30
    .line 31
    aget v9, p2, v8

    .line 32
    .line 33
    int-to-long v9, v9

    .line 34
    and-long/2addr v9, v2

    .line 35
    add-long/2addr v6, v9

    .line 36
    add-long/2addr v0, v6

    .line 37
    long-to-int v6, v0

    .line 38
    aput v6, p0, v5

    .line 39
    .line 40
    aput v6, p2, v8

    .line 41
    .line 42
    ushr-long/2addr v0, v4

    .line 43
    add-int/lit8 v5, p1, 0x2

    .line 44
    .line 45
    aget v6, p0, v5

    .line 46
    .line 47
    int-to-long v6, v6

    .line 48
    and-long/2addr v6, v2

    .line 49
    add-int/lit8 v8, p3, 0x2

    .line 50
    .line 51
    aget v9, p2, v8

    .line 52
    .line 53
    int-to-long v9, v9

    .line 54
    and-long/2addr v9, v2

    .line 55
    add-long/2addr v6, v9

    .line 56
    add-long/2addr v0, v6

    .line 57
    long-to-int v6, v0

    .line 58
    aput v6, p0, v5

    .line 59
    .line 60
    aput v6, p2, v8

    .line 61
    .line 62
    ushr-long/2addr v0, v4

    .line 63
    add-int/lit8 p1, p1, 0x3

    .line 64
    .line 65
    aget v5, p0, p1

    .line 66
    .line 67
    int-to-long v5, v5

    .line 68
    and-long/2addr v5, v2

    .line 69
    add-int/lit8 p3, p3, 0x3

    .line 70
    .line 71
    aget v7, p2, p3

    .line 72
    .line 73
    int-to-long v7, v7

    .line 74
    and-long/2addr v2, v7

    .line 75
    add-long/2addr v5, v2

    .line 76
    add-long/2addr v0, v5

    .line 77
    long-to-int v2, v0

    .line 78
    aput v2, p0, p1

    .line 79
    .line 80
    aput v2, p2, p3

    .line 81
    .line 82
    ushr-long p0, v0, v4

    .line 83
    .line 84
    long-to-int p0, p0

    .line 85
    return p0
.end method

.method public static copy([I[I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    aput v1, p1, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    aget v1, p0, v0

    .line 8
    .line 9
    aput v1, p1, v0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    aget v1, p0, v0

    .line 13
    .line 14
    aput v1, p1, v0

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    aget p0, p0, v0

    .line 18
    .line 19
    aput p0, p1, v0

    .line 20
    .line 21
    return-void
.end method

.method public static copy64([J[J)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    aput-wide v1, p1, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    aget-wide v1, p0, v0

    .line 8
    .line 9
    aput-wide v1, p1, v0

    .line 10
    .line 11
    return-void
.end method

.method public static create()[I
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    return-object v0
.end method

.method public static create64()[J
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [J

    .line 3
    .line 4
    return-object v0
.end method

.method public static createExt()[I
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    return-object v0
.end method

.method public static createExt64()[J
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [J

    .line 3
    .line 4
    return-object v0
.end method

.method public static diff([II[II[II)Z
    .locals 2

    .line 1
    invoke-static {p0, p1, p2, p3}, Lorg/spongycastle/math/raw/Nat128;->gte([II[II)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/math/raw/Nat128;->sub([II[II[II)I

    .line 8
    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    move-object v1, p2

    .line 12
    move-object p2, p0

    .line 13
    move-object p0, v1

    .line 14
    move v1, p3

    .line 15
    move p3, p1

    .line 16
    move p1, v1

    .line 17
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/math/raw/Nat128;->sub([II[II[II)I

    .line 18
    .line 19
    .line 20
    return v0
.end method

.method public static eq([I[I)Z
    .locals 3

    .line 1
    const/4 v0, 0x3

    .line 2
    :goto_0
    if-ltz v0, :cond_1

    .line 3
    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    aget v2, p1, v0

    .line 7
    .line 8
    if-eq v1, v2, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public static eq64([J[J)Z
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ltz v1, :cond_1

    .line 4
    .line 5
    aget-wide v2, p0, v1

    .line 6
    .line 7
    aget-wide v4, p1, v1

    .line 8
    .line 9
    cmp-long v2, v2, v4

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return v0
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x80

    .line 12
    .line 13
    if-gt v0, v1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create()[I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    add-int/lit8 v2, v1, 0x1

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    aput v3, v0, v1

    .line 33
    .line 34
    const/16 v1, 0x20

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    move v1, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-object v0

    .line 43
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public static fromBigInteger64(Ljava/math/BigInteger;)[J
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0x80

    .line 12
    .line 13
    if-gt v0, v1, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    add-int/lit8 v2, v1, 0x1

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    aput-wide v3, v0, v1

    .line 33
    .line 34
    const/16 v1, 0x40

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    move v1, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-object v0

    .line 43
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public static getBit([II)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    :goto_0
    and-int/lit8 p0, p0, 0x1

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    shr-int/lit8 v1, p1, 0x5

    .line 10
    .line 11
    if-ltz v1, :cond_2

    .line 12
    .line 13
    const/4 v2, 0x4

    .line 14
    if-lt v1, v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    and-int/lit8 p1, p1, 0x1f

    .line 18
    .line 19
    aget p0, p0, v1

    .line 20
    .line 21
    ushr-int/2addr p0, p1

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    :goto_1
    return v0
.end method

.method public static gte([II[II)Z
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    :goto_0
    const/4 v1, 0x1

    .line 3
    if-ltz v0, :cond_2

    .line 4
    .line 5
    add-int v2, p1, v0

    .line 6
    .line 7
    aget v2, p0, v2

    .line 8
    .line 9
    const/high16 v3, -0x80000000

    .line 10
    .line 11
    xor-int/2addr v2, v3

    .line 12
    add-int v4, p3, v0

    .line 13
    .line 14
    aget v4, p2, v4

    .line 15
    .line 16
    xor-int/2addr v3, v4

    .line 17
    if-ge v2, v3, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    if-le v2, v3, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    return v1
.end method

.method public static gte([I[I)Z
    .locals 5

    const/4 v0, 0x3

    :goto_0
    const/4 v1, 0x1

    if-ltz v0, :cond_2

    .line 28
    aget v2, p0, v0

    const/high16 v3, -0x80000000

    xor-int/2addr v2, v3

    .line 29
    aget v4, p1, v0

    xor-int/2addr v3, v4

    if-ge v2, v3, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-le v2, v3, :cond_1

    return v1

    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static isOne([I)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    if-eq v1, v2, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    move v1, v2

    .line 9
    :goto_0
    const/4 v3, 0x4

    .line 10
    if-ge v1, v3, :cond_2

    .line 11
    .line 12
    aget v3, p0, v1

    .line 13
    .line 14
    if-eqz v3, :cond_1

    .line 15
    .line 16
    return v0

    .line 17
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    return v2
.end method

.method public static isOne64([J)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const-wide/16 v3, 0x1

    .line 5
    .line 6
    cmp-long v1, v1, v3

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 v1, 0x1

    .line 12
    aget-wide v2, p0, v1

    .line 13
    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    cmp-long p0, v2, v4

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    return v0

    .line 21
    :cond_1
    return v1
.end method

.method public static isZero([I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x4

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    aget v2, p0, v1

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static isZero64([J)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x2

    .line 4
    if-ge v1, v2, :cond_1

    .line 5
    .line 6
    aget-wide v2, p0, v1

    .line 7
    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    cmp-long v2, v2, v4

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public static mul([II[II[II)V
    .locals 22

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    add-int/lit8 v4, p3, 0x1

    .line 11
    .line 12
    aget v4, p2, v4

    .line 13
    .line 14
    int-to-long v4, v4

    .line 15
    and-long/2addr v4, v2

    .line 16
    add-int/lit8 v6, p3, 0x2

    .line 17
    .line 18
    aget v6, p2, v6

    .line 19
    .line 20
    int-to-long v6, v6

    .line 21
    and-long/2addr v6, v2

    .line 22
    add-int/lit8 v8, p3, 0x3

    .line 23
    .line 24
    aget v8, p2, v8

    .line 25
    .line 26
    int-to-long v8, v8

    .line 27
    and-long/2addr v8, v2

    .line 28
    aget v10, p0, p1

    .line 29
    .line 30
    int-to-long v10, v10

    .line 31
    and-long/2addr v10, v2

    .line 32
    mul-long v12, v10, v0

    .line 33
    .line 34
    long-to-int v14, v12

    .line 35
    aput v14, p4, p5

    .line 36
    .line 37
    const/16 v14, 0x20

    .line 38
    .line 39
    ushr-long/2addr v12, v14

    .line 40
    mul-long v15, v10, v4

    .line 41
    .line 42
    add-long/2addr v12, v15

    .line 43
    add-int/lit8 v15, p5, 0x1

    .line 44
    .line 45
    move-wide/from16 v16, v2

    .line 46
    .line 47
    long-to-int v2, v12

    .line 48
    aput v2, p4, v15

    .line 49
    .line 50
    ushr-long v2, v12, v14

    .line 51
    .line 52
    mul-long v12, v10, v6

    .line 53
    .line 54
    add-long/2addr v2, v12

    .line 55
    add-int/lit8 v12, p5, 0x2

    .line 56
    .line 57
    long-to-int v13, v2

    .line 58
    aput v13, p4, v12

    .line 59
    .line 60
    ushr-long/2addr v2, v14

    .line 61
    mul-long/2addr v10, v8

    .line 62
    add-long/2addr v2, v10

    .line 63
    add-int/lit8 v10, p5, 0x3

    .line 64
    .line 65
    long-to-int v11, v2

    .line 66
    aput v11, p4, v10

    .line 67
    .line 68
    ushr-long/2addr v2, v14

    .line 69
    add-int/lit8 v10, p5, 0x4

    .line 70
    .line 71
    long-to-int v2, v2

    .line 72
    aput v2, p4, v10

    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    move v3, v2

    .line 76
    move/from16 v2, p5

    .line 77
    .line 78
    :goto_0
    const/4 v10, 0x4

    .line 79
    if-ge v3, v10, :cond_0

    .line 80
    .line 81
    add-int/lit8 v10, v2, 0x1

    .line 82
    .line 83
    add-int v11, p1, v3

    .line 84
    .line 85
    aget v11, p0, v11

    .line 86
    .line 87
    int-to-long v11, v11

    .line 88
    and-long v11, v11, v16

    .line 89
    .line 90
    mul-long v18, v11, v0

    .line 91
    .line 92
    aget v13, p4, v10

    .line 93
    .line 94
    move/from16 p2, v14

    .line 95
    .line 96
    int-to-long v14, v13

    .line 97
    and-long v13, v14, v16

    .line 98
    .line 99
    add-long v13, v18, v13

    .line 100
    .line 101
    long-to-int v15, v13

    .line 102
    aput v15, p4, v10

    .line 103
    .line 104
    ushr-long v13, v13, p2

    .line 105
    .line 106
    mul-long v18, v11, v4

    .line 107
    .line 108
    add-int/lit8 v15, v2, 0x2

    .line 109
    .line 110
    move-wide/from16 v20, v0

    .line 111
    .line 112
    aget v0, p4, v15

    .line 113
    .line 114
    int-to-long v0, v0

    .line 115
    and-long v0, v0, v16

    .line 116
    .line 117
    add-long v18, v18, v0

    .line 118
    .line 119
    add-long v13, v13, v18

    .line 120
    .line 121
    long-to-int v0, v13

    .line 122
    aput v0, p4, v15

    .line 123
    .line 124
    ushr-long v0, v13, p2

    .line 125
    .line 126
    mul-long v13, v11, v6

    .line 127
    .line 128
    add-int/lit8 v15, v2, 0x3

    .line 129
    .line 130
    move-wide/from16 v18, v0

    .line 131
    .line 132
    aget v0, p4, v15

    .line 133
    .line 134
    int-to-long v0, v0

    .line 135
    and-long v0, v0, v16

    .line 136
    .line 137
    add-long/2addr v13, v0

    .line 138
    add-long v0, v18, v13

    .line 139
    .line 140
    long-to-int v13, v0

    .line 141
    aput v13, p4, v15

    .line 142
    .line 143
    ushr-long v0, v0, p2

    .line 144
    .line 145
    mul-long/2addr v11, v8

    .line 146
    add-int/lit8 v13, v2, 0x4

    .line 147
    .line 148
    aget v14, p4, v13

    .line 149
    .line 150
    int-to-long v14, v14

    .line 151
    and-long v14, v14, v16

    .line 152
    .line 153
    add-long/2addr v11, v14

    .line 154
    add-long/2addr v0, v11

    .line 155
    long-to-int v11, v0

    .line 156
    aput v11, p4, v13

    .line 157
    .line 158
    ushr-long v0, v0, p2

    .line 159
    .line 160
    add-int/lit8 v2, v2, 0x5

    .line 161
    .line 162
    long-to-int v0, v0

    .line 163
    aput v0, p4, v2

    .line 164
    .line 165
    add-int/lit8 v3, v3, 0x1

    .line 166
    .line 167
    move/from16 v14, p2

    .line 168
    .line 169
    move v2, v10

    .line 170
    move-wide/from16 v0, v20

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_0
    return-void
.end method

.method public static mul([I[I[I)V
    .locals 23

    const/4 v0, 0x0

    .line 174
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/4 v5, 0x1

    .line 175
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    const/4 v8, 0x2

    .line 176
    aget v9, p1, v8

    int-to-long v9, v9

    and-long/2addr v9, v3

    const/4 v11, 0x3

    .line 177
    aget v12, p1, v11

    int-to-long v12, v12

    and-long/2addr v12, v3

    .line 178
    aget v14, p0, v0

    int-to-long v14, v14

    and-long/2addr v14, v3

    move/from16 v16, v0

    move-wide/from16 v17, v1

    mul-long v0, v14, v17

    long-to-int v2, v0

    .line 179
    aput v2, p2, v16

    const/16 v2, 0x20

    ushr-long/2addr v0, v2

    mul-long v19, v14, v6

    add-long v0, v0, v19

    move/from16 p1, v2

    long-to-int v2, v0

    .line 180
    aput v2, p2, v5

    ushr-long v0, v0, p1

    mul-long v19, v14, v9

    add-long v0, v0, v19

    long-to-int v2, v0

    .line 181
    aput v2, p2, v8

    ushr-long v0, v0, p1

    mul-long/2addr v14, v12

    add-long/2addr v0, v14

    long-to-int v2, v0

    .line 182
    aput v2, p2, v11

    ushr-long v0, v0, p1

    long-to-int v0, v0

    const/4 v1, 0x4

    .line 183
    aput v0, p2, v1

    :goto_0
    if-ge v5, v1, :cond_0

    .line 184
    aget v0, p0, v5

    int-to-long v14, v0

    and-long/2addr v14, v3

    mul-long v19, v14, v17

    .line 185
    aget v0, p2, v5

    int-to-long v1, v0

    and-long v0, v1, v3

    add-long v0, v19, v0

    long-to-int v2, v0

    .line 186
    aput v2, p2, v5

    ushr-long v0, v0, p1

    mul-long v19, v14, v6

    add-int/lit8 v2, v5, 0x1

    .line 187
    aget v11, p2, v2

    move-wide/from16 v21, v3

    int-to-long v3, v11

    and-long v3, v3, v21

    add-long v19, v19, v3

    add-long v0, v0, v19

    long-to-int v3, v0

    .line 188
    aput v3, p2, v2

    ushr-long v0, v0, p1

    mul-long v3, v14, v9

    add-int/lit8 v11, v5, 0x2

    .line 189
    aget v8, p2, v11

    move-wide/from16 v19, v0

    int-to-long v0, v8

    and-long v0, v0, v21

    add-long/2addr v3, v0

    add-long v0, v19, v3

    long-to-int v3, v0

    .line 190
    aput v3, p2, v11

    ushr-long v0, v0, p1

    mul-long/2addr v14, v12

    add-int/lit8 v3, v5, 0x3

    .line 191
    aget v4, p2, v3

    move-wide/from16 v19, v0

    int-to-long v0, v4

    and-long v0, v0, v21

    add-long/2addr v14, v0

    add-long v0, v19, v14

    long-to-int v4, v0

    .line 192
    aput v4, p2, v3

    ushr-long v0, v0, p1

    add-int/lit8 v5, v5, 0x4

    long-to-int v0, v0

    .line 193
    aput v0, p2, v5

    move v5, v2

    move-wide/from16 v3, v21

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static mul33Add(I[II[II[II)J
    .locals 12

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p0, p1, p2

    .line 9
    .line 10
    int-to-long v4, p0

    .line 11
    and-long/2addr v4, v2

    .line 12
    mul-long v6, v0, v4

    .line 13
    .line 14
    aget p0, p3, p4

    .line 15
    .line 16
    int-to-long v8, p0

    .line 17
    and-long/2addr v8, v2

    .line 18
    add-long/2addr v6, v8

    .line 19
    long-to-int p0, v6

    .line 20
    aput p0, p5, p6

    .line 21
    .line 22
    const/16 p0, 0x20

    .line 23
    .line 24
    ushr-long/2addr v6, p0

    .line 25
    add-int/lit8 v8, p2, 0x1

    .line 26
    .line 27
    aget v8, p1, v8

    .line 28
    .line 29
    int-to-long v8, v8

    .line 30
    and-long/2addr v8, v2

    .line 31
    mul-long v10, v0, v8

    .line 32
    .line 33
    add-long/2addr v10, v4

    .line 34
    add-int/lit8 v4, p4, 0x1

    .line 35
    .line 36
    aget v4, p3, v4

    .line 37
    .line 38
    int-to-long v4, v4

    .line 39
    and-long/2addr v4, v2

    .line 40
    add-long/2addr v10, v4

    .line 41
    add-long/2addr v6, v10

    .line 42
    add-int/lit8 v4, p6, 0x1

    .line 43
    .line 44
    long-to-int v5, v6

    .line 45
    aput v5, p5, v4

    .line 46
    .line 47
    ushr-long v4, v6, p0

    .line 48
    .line 49
    add-int/lit8 v6, p2, 0x2

    .line 50
    .line 51
    aget v6, p1, v6

    .line 52
    .line 53
    int-to-long v6, v6

    .line 54
    and-long/2addr v6, v2

    .line 55
    mul-long v10, v0, v6

    .line 56
    .line 57
    add-long/2addr v10, v8

    .line 58
    add-int/lit8 v8, p4, 0x2

    .line 59
    .line 60
    aget v8, p3, v8

    .line 61
    .line 62
    int-to-long v8, v8

    .line 63
    and-long/2addr v8, v2

    .line 64
    add-long/2addr v10, v8

    .line 65
    add-long/2addr v4, v10

    .line 66
    add-int/lit8 v8, p6, 0x2

    .line 67
    .line 68
    long-to-int v9, v4

    .line 69
    aput v9, p5, v8

    .line 70
    .line 71
    ushr-long/2addr v4, p0

    .line 72
    add-int/lit8 p2, p2, 0x3

    .line 73
    .line 74
    aget p1, p1, p2

    .line 75
    .line 76
    int-to-long p1, p1

    .line 77
    and-long/2addr p1, v2

    .line 78
    mul-long/2addr v0, p1

    .line 79
    add-long/2addr v0, v6

    .line 80
    add-int/lit8 v6, p4, 0x3

    .line 81
    .line 82
    aget v6, p3, v6

    .line 83
    .line 84
    int-to-long v6, v6

    .line 85
    and-long/2addr v2, v6

    .line 86
    add-long/2addr v0, v2

    .line 87
    add-long/2addr v4, v0

    .line 88
    add-int/lit8 v0, p6, 0x3

    .line 89
    .line 90
    long-to-int v1, v4

    .line 91
    aput v1, p5, v0

    .line 92
    .line 93
    ushr-long v0, v4, p0

    .line 94
    .line 95
    add-long/2addr v0, p1

    .line 96
    return-wide v0
.end method

.method public static mul33DWordAdd(IJ[II)I
    .locals 10

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    and-long v4, p1, v2

    .line 9
    .line 10
    mul-long v6, v0, v4

    .line 11
    .line 12
    aget p0, p3, p4

    .line 13
    .line 14
    int-to-long v8, p0

    .line 15
    and-long/2addr v8, v2

    .line 16
    add-long/2addr v6, v8

    .line 17
    long-to-int p0, v6

    .line 18
    aput p0, p3, p4

    .line 19
    .line 20
    const/16 p0, 0x20

    .line 21
    .line 22
    ushr-long/2addr v6, p0

    .line 23
    ushr-long/2addr p1, p0

    .line 24
    mul-long/2addr v0, p1

    .line 25
    add-long/2addr v0, v4

    .line 26
    add-int/lit8 v4, p4, 0x1

    .line 27
    .line 28
    aget v5, p3, v4

    .line 29
    .line 30
    int-to-long v8, v5

    .line 31
    and-long/2addr v8, v2

    .line 32
    add-long/2addr v0, v8

    .line 33
    add-long/2addr v6, v0

    .line 34
    long-to-int v0, v6

    .line 35
    aput v0, p3, v4

    .line 36
    .line 37
    ushr-long v0, v6, p0

    .line 38
    .line 39
    add-int/lit8 v4, p4, 0x2

    .line 40
    .line 41
    aget v5, p3, v4

    .line 42
    .line 43
    int-to-long v5, v5

    .line 44
    and-long/2addr v5, v2

    .line 45
    add-long/2addr p1, v5

    .line 46
    add-long/2addr v0, p1

    .line 47
    long-to-int p1, v0

    .line 48
    aput p1, p3, v4

    .line 49
    .line 50
    ushr-long p1, v0, p0

    .line 51
    .line 52
    add-int/lit8 p4, p4, 0x3

    .line 53
    .line 54
    aget v0, p3, p4

    .line 55
    .line 56
    int-to-long v0, v0

    .line 57
    and-long/2addr v0, v2

    .line 58
    add-long/2addr p1, v0

    .line 59
    long-to-int v0, p1

    .line 60
    aput v0, p3, p4

    .line 61
    .line 62
    ushr-long p0, p1, p0

    .line 63
    .line 64
    long-to-int p0, p0

    .line 65
    return p0
.end method

.method public static mul33WordAdd(II[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    int-to-long p0, p1

    .line 9
    and-long/2addr p0, v2

    .line 10
    mul-long/2addr v0, p0

    .line 11
    aget v4, p2, p3

    .line 12
    .line 13
    int-to-long v4, v4

    .line 14
    and-long/2addr v4, v2

    .line 15
    add-long/2addr v0, v4

    .line 16
    long-to-int v4, v0

    .line 17
    aput v4, p2, p3

    .line 18
    .line 19
    const/16 v4, 0x20

    .line 20
    .line 21
    ushr-long/2addr v0, v4

    .line 22
    add-int/lit8 v5, p3, 0x1

    .line 23
    .line 24
    aget v6, p2, v5

    .line 25
    .line 26
    int-to-long v6, v6

    .line 27
    and-long/2addr v6, v2

    .line 28
    add-long/2addr p0, v6

    .line 29
    add-long/2addr v0, p0

    .line 30
    long-to-int p0, v0

    .line 31
    aput p0, p2, v5

    .line 32
    .line 33
    ushr-long p0, v0, v4

    .line 34
    .line 35
    add-int/lit8 v0, p3, 0x2

    .line 36
    .line 37
    aget v1, p2, v0

    .line 38
    .line 39
    int-to-long v5, v1

    .line 40
    and-long v1, v5, v2

    .line 41
    .line 42
    add-long/2addr p0, v1

    .line 43
    long-to-int v1, p0

    .line 44
    aput v1, p2, v0

    .line 45
    .line 46
    ushr-long/2addr p0, v4

    .line 47
    const-wide/16 v0, 0x0

    .line 48
    .line 49
    cmp-long p0, p0, v0

    .line 50
    .line 51
    if-nez p0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return p0

    .line 55
    :cond_0
    const/4 p0, 0x4

    .line 56
    const/4 p1, 0x3

    .line 57
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0
.end method

.method public static mulAddTo([II[II[II)I
    .locals 23

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    add-int/lit8 v4, p3, 0x1

    .line 11
    .line 12
    aget v4, p2, v4

    .line 13
    .line 14
    int-to-long v4, v4

    .line 15
    and-long/2addr v4, v2

    .line 16
    add-int/lit8 v6, p3, 0x2

    .line 17
    .line 18
    aget v6, p2, v6

    .line 19
    .line 20
    int-to-long v6, v6

    .line 21
    and-long/2addr v6, v2

    .line 22
    add-int/lit8 v8, p3, 0x3

    .line 23
    .line 24
    aget v8, p2, v8

    .line 25
    .line 26
    int-to-long v8, v8

    .line 27
    and-long/2addr v8, v2

    .line 28
    const-wide/16 v10, 0x0

    .line 29
    .line 30
    const/4 v12, 0x0

    .line 31
    move v13, v12

    .line 32
    move-wide v11, v10

    .line 33
    :goto_0
    move/from16 v10, p5

    .line 34
    .line 35
    const/4 v14, 0x4

    .line 36
    if-ge v13, v14, :cond_0

    .line 37
    .line 38
    add-int v15, p1, v13

    .line 39
    .line 40
    aget v15, p0, v15

    .line 41
    .line 42
    move-wide/from16 v16, v2

    .line 43
    .line 44
    int-to-long v2, v15

    .line 45
    and-long v2, v2, v16

    .line 46
    .line 47
    mul-long v18, v2, v0

    .line 48
    .line 49
    aget v15, p4, v10

    .line 50
    .line 51
    move/from16 p2, v14

    .line 52
    .line 53
    int-to-long v14, v15

    .line 54
    and-long v14, v14, v16

    .line 55
    .line 56
    add-long v14, v18, v14

    .line 57
    .line 58
    move-wide/from16 v18, v0

    .line 59
    .line 60
    long-to-int v0, v14

    .line 61
    aput v0, p4, v10

    .line 62
    .line 63
    const/16 v0, 0x20

    .line 64
    .line 65
    ushr-long/2addr v14, v0

    .line 66
    mul-long v20, v2, v4

    .line 67
    .line 68
    add-int/lit8 v1, v10, 0x1

    .line 69
    .line 70
    move/from16 p3, v0

    .line 71
    .line 72
    aget v0, p4, v1

    .line 73
    .line 74
    move/from16 p5, v1

    .line 75
    .line 76
    int-to-long v0, v0

    .line 77
    and-long v0, v0, v16

    .line 78
    .line 79
    add-long v20, v20, v0

    .line 80
    .line 81
    add-long v14, v14, v20

    .line 82
    .line 83
    long-to-int v0, v14

    .line 84
    aput v0, p4, p5

    .line 85
    .line 86
    ushr-long v0, v14, p3

    .line 87
    .line 88
    mul-long v14, v2, v6

    .line 89
    .line 90
    add-int/lit8 v20, v10, 0x2

    .line 91
    .line 92
    move-wide/from16 v21, v0

    .line 93
    .line 94
    aget v0, p4, v20

    .line 95
    .line 96
    int-to-long v0, v0

    .line 97
    and-long v0, v0, v16

    .line 98
    .line 99
    add-long/2addr v14, v0

    .line 100
    add-long v0, v21, v14

    .line 101
    .line 102
    long-to-int v14, v0

    .line 103
    aput v14, p4, v20

    .line 104
    .line 105
    ushr-long v0, v0, p3

    .line 106
    .line 107
    mul-long/2addr v2, v8

    .line 108
    add-int/lit8 v14, v10, 0x3

    .line 109
    .line 110
    aget v15, p4, v14

    .line 111
    .line 112
    move-wide/from16 v20, v0

    .line 113
    .line 114
    int-to-long v0, v15

    .line 115
    and-long v0, v0, v16

    .line 116
    .line 117
    add-long/2addr v2, v0

    .line 118
    add-long v0, v20, v2

    .line 119
    .line 120
    long-to-int v2, v0

    .line 121
    aput v2, p4, v14

    .line 122
    .line 123
    ushr-long v0, v0, p3

    .line 124
    .line 125
    add-int/lit8 v10, v10, 0x4

    .line 126
    .line 127
    aget v2, p4, v10

    .line 128
    .line 129
    int-to-long v2, v2

    .line 130
    and-long v2, v2, v16

    .line 131
    .line 132
    add-long/2addr v11, v2

    .line 133
    add-long/2addr v0, v11

    .line 134
    long-to-int v2, v0

    .line 135
    aput v2, p4, v10

    .line 136
    .line 137
    ushr-long v11, v0, p3

    .line 138
    .line 139
    add-int/lit8 v13, v13, 0x1

    .line 140
    .line 141
    move-wide/from16 v2, v16

    .line 142
    .line 143
    move-wide/from16 v0, v18

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_0
    long-to-int v0, v11

    .line 147
    return v0
.end method

.method public static mulAddTo([I[I[I)I
    .locals 23

    const/4 v0, 0x0

    .line 148
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/4 v5, 0x1

    .line 149
    aget v5, p1, v5

    int-to-long v5, v5

    and-long/2addr v5, v3

    const/4 v7, 0x2

    .line 150
    aget v7, p1, v7

    int-to-long v7, v7

    and-long/2addr v7, v3

    const/4 v9, 0x3

    .line 151
    aget v9, p1, v9

    int-to-long v9, v9

    and-long/2addr v9, v3

    const-wide/16 v11, 0x0

    :goto_0
    const/4 v13, 0x4

    if-ge v0, v13, :cond_0

    .line 152
    aget v13, p0, v0

    int-to-long v13, v13

    and-long/2addr v13, v3

    mul-long v15, v13, v1

    move-wide/from16 v17, v3

    .line 153
    aget v3, p2, v0

    int-to-long v3, v3

    and-long v3, v3, v17

    add-long/2addr v3, v15

    long-to-int v15, v3

    .line 154
    aput v15, p2, v0

    const/16 v15, 0x20

    ushr-long/2addr v3, v15

    mul-long v19, v13, v5

    add-int/lit8 v16, v0, 0x1

    move/from16 p1, v15

    .line 155
    aget v15, p2, v16

    move-wide/from16 v21, v1

    move v2, v0

    int-to-long v0, v15

    and-long v0, v0, v17

    add-long v19, v19, v0

    add-long v3, v3, v19

    long-to-int v0, v3

    .line 156
    aput v0, p2, v16

    ushr-long v0, v3, p1

    mul-long v3, v13, v7

    add-int/lit8 v15, v2, 0x2

    move-wide/from16 v19, v0

    .line 157
    aget v0, p2, v15

    int-to-long v0, v0

    and-long v0, v0, v17

    add-long/2addr v3, v0

    add-long v0, v19, v3

    long-to-int v3, v0

    .line 158
    aput v3, p2, v15

    ushr-long v0, v0, p1

    mul-long/2addr v13, v9

    add-int/lit8 v3, v2, 0x3

    .line 159
    aget v4, p2, v3

    move-wide/from16 v19, v0

    int-to-long v0, v4

    and-long v0, v0, v17

    add-long/2addr v13, v0

    add-long v0, v19, v13

    long-to-int v4, v0

    .line 160
    aput v4, p2, v3

    ushr-long v0, v0, p1

    add-int/lit8 v2, v2, 0x4

    .line 161
    aget v3, p2, v2

    int-to-long v3, v3

    and-long v3, v3, v17

    add-long/2addr v11, v3

    add-long/2addr v0, v11

    long-to-int v3, v0

    .line 162
    aput v3, p2, v2

    ushr-long v11, v0, p1

    move/from16 v0, v16

    move-wide/from16 v3, v17

    move-wide/from16 v1, v21

    goto :goto_0

    :cond_0
    long-to-int v0, v11

    return v0
.end method

.method public static mulWord(I[I[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    aget v6, p1, p0

    .line 12
    .line 13
    int-to-long v6, v6

    .line 14
    and-long/2addr v6, v2

    .line 15
    mul-long/2addr v6, v0

    .line 16
    add-long/2addr v4, v6

    .line 17
    add-int v6, p3, p0

    .line 18
    .line 19
    long-to-int v7, v4

    .line 20
    aput v7, p2, v6

    .line 21
    .line 22
    const/16 v6, 0x20

    .line 23
    .line 24
    ushr-long/2addr v4, v6

    .line 25
    add-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    const/4 v6, 0x4

    .line 28
    if-lt p0, v6, :cond_0

    .line 29
    .line 30
    long-to-int p0, v4

    .line 31
    return p0
.end method

.method public static mulWordAddExt(I[II[II)I
    .locals 11

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    aget p0, p1, p2

    .line 9
    .line 10
    int-to-long v4, p0

    .line 11
    and-long/2addr v4, v2

    .line 12
    mul-long/2addr v4, v0

    .line 13
    aget p0, p3, p4

    .line 14
    .line 15
    int-to-long v6, p0

    .line 16
    and-long/2addr v6, v2

    .line 17
    add-long/2addr v4, v6

    .line 18
    long-to-int p0, v4

    .line 19
    aput p0, p3, p4

    .line 20
    .line 21
    const/16 p0, 0x20

    .line 22
    .line 23
    ushr-long/2addr v4, p0

    .line 24
    add-int/lit8 v6, p2, 0x1

    .line 25
    .line 26
    aget v6, p1, v6

    .line 27
    .line 28
    int-to-long v6, v6

    .line 29
    and-long/2addr v6, v2

    .line 30
    mul-long/2addr v6, v0

    .line 31
    add-int/lit8 v8, p4, 0x1

    .line 32
    .line 33
    aget v9, p3, v8

    .line 34
    .line 35
    int-to-long v9, v9

    .line 36
    and-long/2addr v9, v2

    .line 37
    add-long/2addr v6, v9

    .line 38
    add-long/2addr v4, v6

    .line 39
    long-to-int v6, v4

    .line 40
    aput v6, p3, v8

    .line 41
    .line 42
    ushr-long/2addr v4, p0

    .line 43
    add-int/lit8 v6, p2, 0x2

    .line 44
    .line 45
    aget v6, p1, v6

    .line 46
    .line 47
    int-to-long v6, v6

    .line 48
    and-long/2addr v6, v2

    .line 49
    mul-long/2addr v6, v0

    .line 50
    add-int/lit8 v8, p4, 0x2

    .line 51
    .line 52
    aget v9, p3, v8

    .line 53
    .line 54
    int-to-long v9, v9

    .line 55
    and-long/2addr v9, v2

    .line 56
    add-long/2addr v6, v9

    .line 57
    add-long/2addr v4, v6

    .line 58
    long-to-int v6, v4

    .line 59
    aput v6, p3, v8

    .line 60
    .line 61
    ushr-long/2addr v4, p0

    .line 62
    add-int/lit8 p2, p2, 0x3

    .line 63
    .line 64
    aget p1, p1, p2

    .line 65
    .line 66
    int-to-long p1, p1

    .line 67
    and-long/2addr p1, v2

    .line 68
    mul-long/2addr v0, p1

    .line 69
    add-int/lit8 p4, p4, 0x3

    .line 70
    .line 71
    aget p1, p3, p4

    .line 72
    .line 73
    int-to-long p1, p1

    .line 74
    and-long/2addr p1, v2

    .line 75
    add-long/2addr v0, p1

    .line 76
    add-long/2addr v4, v0

    .line 77
    long-to-int p1, v4

    .line 78
    aput p1, p3, p4

    .line 79
    .line 80
    ushr-long p0, v4, p0

    .line 81
    .line 82
    long-to-int p0, p0

    .line 83
    return p0
.end method

.method public static mulWordDwordAdd(IJ[II)I
    .locals 8

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    and-long v4, p1, v2

    .line 9
    .line 10
    mul-long/2addr v4, v0

    .line 11
    aget p0, p3, p4

    .line 12
    .line 13
    int-to-long v6, p0

    .line 14
    and-long/2addr v6, v2

    .line 15
    add-long/2addr v4, v6

    .line 16
    long-to-int p0, v4

    .line 17
    aput p0, p3, p4

    .line 18
    .line 19
    const/16 p0, 0x20

    .line 20
    .line 21
    ushr-long/2addr v4, p0

    .line 22
    ushr-long/2addr p1, p0

    .line 23
    mul-long/2addr v0, p1

    .line 24
    add-int/lit8 p1, p4, 0x1

    .line 25
    .line 26
    aget p2, p3, p1

    .line 27
    .line 28
    int-to-long v6, p2

    .line 29
    and-long/2addr v6, v2

    .line 30
    add-long/2addr v0, v6

    .line 31
    add-long/2addr v4, v0

    .line 32
    long-to-int p2, v4

    .line 33
    aput p2, p3, p1

    .line 34
    .line 35
    ushr-long p1, v4, p0

    .line 36
    .line 37
    add-int/lit8 v0, p4, 0x2

    .line 38
    .line 39
    aget v1, p3, v0

    .line 40
    .line 41
    int-to-long v4, v1

    .line 42
    and-long v1, v4, v2

    .line 43
    .line 44
    add-long/2addr p1, v1

    .line 45
    long-to-int v1, p1

    .line 46
    aput v1, p3, v0

    .line 47
    .line 48
    ushr-long p0, p1, p0

    .line 49
    .line 50
    const-wide/16 v0, 0x0

    .line 51
    .line 52
    cmp-long p0, p0, v0

    .line 53
    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_0
    const/4 p0, 0x4

    .line 59
    const/4 p1, 0x3

    .line 60
    invoke-static {p0, p3, p4, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method public static mulWordsAdd(II[II)I
    .locals 6

    .line 1
    int-to-long v0, p0

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    int-to-long p0, p1

    .line 9
    and-long/2addr p0, v2

    .line 10
    mul-long/2addr p0, v0

    .line 11
    aget v0, p2, p3

    .line 12
    .line 13
    int-to-long v0, v0

    .line 14
    and-long/2addr v0, v2

    .line 15
    add-long/2addr p0, v0

    .line 16
    long-to-int v0, p0

    .line 17
    aput v0, p2, p3

    .line 18
    .line 19
    const/16 v0, 0x20

    .line 20
    .line 21
    ushr-long/2addr p0, v0

    .line 22
    add-int/lit8 v1, p3, 0x1

    .line 23
    .line 24
    aget v4, p2, v1

    .line 25
    .line 26
    int-to-long v4, v4

    .line 27
    and-long/2addr v2, v4

    .line 28
    add-long/2addr p0, v2

    .line 29
    long-to-int v2, p0

    .line 30
    aput v2, p2, v1

    .line 31
    .line 32
    ushr-long/2addr p0, v0

    .line 33
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    cmp-long p0, p0, v0

    .line 36
    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x4

    .line 42
    const/4 p1, 0x2

    .line 43
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0
.end method

.method public static square([II[II)V
    .locals 24

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    const/4 v4, 0x0

    .line 11
    const/16 v6, 0x8

    .line 12
    .line 13
    const/4 v7, 0x3

    .line 14
    :goto_0
    add-int/lit8 v8, v7, -0x1

    .line 15
    .line 16
    add-int v7, p1, v7

    .line 17
    .line 18
    aget v7, p0, v7

    .line 19
    .line 20
    int-to-long v9, v7

    .line 21
    and-long/2addr v9, v2

    .line 22
    mul-long/2addr v9, v9

    .line 23
    add-int/lit8 v7, v6, -0x1

    .line 24
    .line 25
    add-int v7, p3, v7

    .line 26
    .line 27
    shl-int/lit8 v4, v4, 0x1f

    .line 28
    .line 29
    const/16 v11, 0x21

    .line 30
    .line 31
    ushr-long v12, v9, v11

    .line 32
    .line 33
    long-to-int v12, v12

    .line 34
    or-int/2addr v4, v12

    .line 35
    aput v4, p2, v7

    .line 36
    .line 37
    add-int/lit8 v6, v6, -0x2

    .line 38
    .line 39
    add-int v4, p3, v6

    .line 40
    .line 41
    const/4 v7, 0x1

    .line 42
    ushr-long v12, v9, v7

    .line 43
    .line 44
    long-to-int v12, v12

    .line 45
    aput v12, p2, v4

    .line 46
    .line 47
    long-to-int v4, v9

    .line 48
    if-gtz v8, :cond_0

    .line 49
    .line 50
    mul-long v8, v0, v0

    .line 51
    .line 52
    shl-int/lit8 v4, v4, 0x1f

    .line 53
    .line 54
    int-to-long v12, v4

    .line 55
    and-long/2addr v12, v2

    .line 56
    ushr-long v10, v8, v11

    .line 57
    .line 58
    or-long/2addr v10, v12

    .line 59
    long-to-int v4, v8

    .line 60
    aput v4, p2, p3

    .line 61
    .line 62
    const/16 v4, 0x20

    .line 63
    .line 64
    ushr-long/2addr v8, v4

    .line 65
    long-to-int v6, v8

    .line 66
    and-int/2addr v6, v7

    .line 67
    add-int/lit8 v8, p1, 0x1

    .line 68
    .line 69
    aget v8, p0, v8

    .line 70
    .line 71
    int-to-long v8, v8

    .line 72
    and-long/2addr v8, v2

    .line 73
    add-int/lit8 v12, p3, 0x2

    .line 74
    .line 75
    aget v13, p2, v12

    .line 76
    .line 77
    int-to-long v13, v13

    .line 78
    and-long/2addr v13, v2

    .line 79
    mul-long v15, v8, v0

    .line 80
    .line 81
    add-long/2addr v10, v15

    .line 82
    long-to-int v15, v10

    .line 83
    add-int/lit8 v16, p3, 0x1

    .line 84
    .line 85
    shl-int/lit8 v17, v15, 0x1

    .line 86
    .line 87
    or-int v6, v17, v6

    .line 88
    .line 89
    aput v6, p2, v16

    .line 90
    .line 91
    ushr-int/lit8 v6, v15, 0x1f

    .line 92
    .line 93
    ushr-long/2addr v10, v4

    .line 94
    add-long/2addr v13, v10

    .line 95
    add-int/lit8 v10, p1, 0x2

    .line 96
    .line 97
    aget v10, p0, v10

    .line 98
    .line 99
    int-to-long v10, v10

    .line 100
    and-long/2addr v10, v2

    .line 101
    add-int/lit8 v15, p3, 0x3

    .line 102
    .line 103
    move-wide/from16 v16, v2

    .line 104
    .line 105
    aget v2, p2, v15

    .line 106
    .line 107
    int-to-long v2, v2

    .line 108
    and-long v2, v2, v16

    .line 109
    .line 110
    add-int/lit8 v18, p3, 0x4

    .line 111
    .line 112
    move/from16 v19, v4

    .line 113
    .line 114
    aget v4, p2, v18

    .line 115
    .line 116
    move/from16 v21, v6

    .line 117
    .line 118
    const/16 v20, 0x3

    .line 119
    .line 120
    int-to-long v5, v4

    .line 121
    and-long v4, v5, v16

    .line 122
    .line 123
    mul-long v22, v10, v0

    .line 124
    .line 125
    add-long v13, v13, v22

    .line 126
    .line 127
    long-to-int v6, v13

    .line 128
    shl-int/lit8 v22, v6, 0x1

    .line 129
    .line 130
    or-int v21, v22, v21

    .line 131
    .line 132
    aput v21, p2, v12

    .line 133
    .line 134
    ushr-int/lit8 v6, v6, 0x1f

    .line 135
    .line 136
    ushr-long v12, v13, v19

    .line 137
    .line 138
    mul-long v21, v10, v8

    .line 139
    .line 140
    add-long v12, v12, v21

    .line 141
    .line 142
    add-long/2addr v2, v12

    .line 143
    ushr-long v12, v2, v19

    .line 144
    .line 145
    add-long/2addr v4, v12

    .line 146
    and-long v2, v2, v16

    .line 147
    .line 148
    add-int/lit8 v12, p1, 0x3

    .line 149
    .line 150
    aget v12, p0, v12

    .line 151
    .line 152
    int-to-long v12, v12

    .line 153
    and-long v12, v12, v16

    .line 154
    .line 155
    add-int/lit8 v14, p3, 0x5

    .line 156
    .line 157
    move/from16 v21, v7

    .line 158
    .line 159
    aget v7, p2, v14

    .line 160
    .line 161
    move-wide/from16 v22, v0

    .line 162
    .line 163
    int-to-long v0, v7

    .line 164
    and-long v0, v0, v16

    .line 165
    .line 166
    add-int/lit8 v7, p3, 0x6

    .line 167
    .line 168
    move-wide/from16 p0, v0

    .line 169
    .line 170
    aget v0, p2, v7

    .line 171
    .line 172
    int-to-long v0, v0

    .line 173
    and-long v0, v0, v16

    .line 174
    .line 175
    mul-long v16, v12, v22

    .line 176
    .line 177
    add-long v2, v2, v16

    .line 178
    .line 179
    move-wide/from16 v16, v0

    .line 180
    .line 181
    long-to-int v0, v2

    .line 182
    shl-int/lit8 v1, v0, 0x1

    .line 183
    .line 184
    or-int/2addr v1, v6

    .line 185
    aput v1, p2, v15

    .line 186
    .line 187
    ushr-int/lit8 v0, v0, 0x1f

    .line 188
    .line 189
    ushr-long v1, v2, v19

    .line 190
    .line 191
    mul-long/2addr v8, v12

    .line 192
    add-long/2addr v1, v8

    .line 193
    add-long/2addr v4, v1

    .line 194
    ushr-long v1, v4, v19

    .line 195
    .line 196
    mul-long/2addr v12, v10

    .line 197
    add-long/2addr v1, v12

    .line 198
    add-long v1, p0, v1

    .line 199
    .line 200
    ushr-long v8, v1, v19

    .line 201
    .line 202
    add-long v8, v16, v8

    .line 203
    .line 204
    long-to-int v3, v4

    .line 205
    shl-int/lit8 v4, v3, 0x1

    .line 206
    .line 207
    or-int/2addr v0, v4

    .line 208
    aput v0, p2, v18

    .line 209
    .line 210
    ushr-int/lit8 v0, v3, 0x1f

    .line 211
    .line 212
    long-to-int v1, v1

    .line 213
    shl-int/lit8 v2, v1, 0x1

    .line 214
    .line 215
    or-int/2addr v0, v2

    .line 216
    aput v0, p2, v14

    .line 217
    .line 218
    ushr-int/lit8 v0, v1, 0x1f

    .line 219
    .line 220
    long-to-int v1, v8

    .line 221
    shl-int/lit8 v2, v1, 0x1

    .line 222
    .line 223
    or-int/2addr v0, v2

    .line 224
    aput v0, p2, v7

    .line 225
    .line 226
    ushr-int/lit8 v0, v1, 0x1f

    .line 227
    .line 228
    add-int/lit8 v1, p3, 0x7

    .line 229
    .line 230
    aget v2, p2, v1

    .line 231
    .line 232
    shr-long v3, v8, v19

    .line 233
    .line 234
    long-to-int v3, v3

    .line 235
    add-int/2addr v2, v3

    .line 236
    shl-int/lit8 v2, v2, 0x1

    .line 237
    .line 238
    or-int/2addr v0, v2

    .line 239
    aput v0, p2, v1

    .line 240
    .line 241
    return-void

    .line 242
    :cond_0
    move v7, v8

    .line 243
    goto/16 :goto_0
.end method

.method public static square([I[I)V
    .locals 25

    const/4 v0, 0x0

    .line 244
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    const/4 v5, 0x3

    const/16 v6, 0x8

    move v8, v0

    move v7, v5

    :goto_0
    add-int/lit8 v9, v7, -0x1

    .line 245
    aget v7, p0, v7

    int-to-long v10, v7

    and-long/2addr v10, v3

    mul-long/2addr v10, v10

    add-int/lit8 v7, v6, -0x1

    shl-int/lit8 v8, v8, 0x1f

    const/16 v12, 0x21

    ushr-long v13, v10, v12

    long-to-int v13, v13

    or-int/2addr v8, v13

    .line 246
    aput v8, p1, v7

    add-int/lit8 v6, v6, -0x2

    const/4 v7, 0x1

    ushr-long v13, v10, v7

    long-to-int v8, v13

    .line 247
    aput v8, p1, v6

    long-to-int v8, v10

    if-gtz v9, :cond_0

    mul-long v9, v1, v1

    shl-int/lit8 v6, v8, 0x1f

    int-to-long v13, v6

    and-long/2addr v13, v3

    ushr-long v11, v9, v12

    or-long/2addr v11, v13

    long-to-int v6, v9

    .line 248
    aput v6, p1, v0

    const/16 v0, 0x20

    ushr-long v8, v9, v0

    long-to-int v6, v8

    and-int/2addr v6, v7

    .line 249
    aget v8, p0, v7

    int-to-long v8, v8

    and-long/2addr v8, v3

    const/4 v10, 0x2

    .line 250
    aget v13, p1, v10

    int-to-long v13, v13

    and-long/2addr v13, v3

    mul-long v15, v8, v1

    add-long/2addr v11, v15

    long-to-int v15, v11

    shl-int/lit8 v16, v15, 0x1

    or-int v6, v16, v6

    .line 251
    aput v6, p1, v7

    ushr-int/lit8 v6, v15, 0x1f

    ushr-long/2addr v11, v0

    add-long/2addr v13, v11

    .line 252
    aget v11, p0, v10

    int-to-long v11, v11

    and-long/2addr v11, v3

    .line 253
    aget v15, p1, v5

    move-wide/from16 v16, v1

    move v2, v0

    int-to-long v0, v15

    and-long/2addr v0, v3

    const/4 v15, 0x4

    move/from16 v18, v2

    .line 254
    aget v2, p1, v15

    move-wide/from16 v19, v3

    int-to-long v3, v2

    and-long v2, v3, v19

    mul-long v21, v11, v16

    add-long v13, v13, v21

    long-to-int v4, v13

    shl-int/lit8 v21, v4, 0x1

    or-int v6, v21, v6

    .line 255
    aput v6, p1, v10

    ushr-int/lit8 v4, v4, 0x1f

    ushr-long v13, v13, v18

    mul-long v21, v11, v8

    add-long v13, v13, v21

    add-long/2addr v0, v13

    ushr-long v13, v0, v18

    add-long/2addr v2, v13

    and-long v0, v0, v19

    .line 256
    aget v6, p0, v5

    int-to-long v13, v6

    and-long v13, v13, v19

    const/4 v6, 0x5

    .line 257
    aget v10, p1, v6

    move/from16 v21, v5

    move/from16 p0, v6

    int-to-long v5, v10

    and-long v5, v5, v19

    const/4 v10, 0x6

    move/from16 v22, v7

    .line 258
    aget v7, p1, v10

    move-wide/from16 v23, v11

    move v12, v10

    int-to-long v10, v7

    and-long v10, v10, v19

    mul-long v16, v16, v13

    add-long v0, v0, v16

    long-to-int v7, v0

    shl-int/lit8 v16, v7, 0x1

    or-int v4, v16, v4

    .line 259
    aput v4, p1, v21

    ushr-int/lit8 v4, v7, 0x1f

    ushr-long v0, v0, v18

    mul-long/2addr v8, v13

    add-long/2addr v0, v8

    add-long/2addr v2, v0

    ushr-long v0, v2, v18

    mul-long v13, v13, v23

    add-long/2addr v0, v13

    add-long/2addr v5, v0

    ushr-long v0, v5, v18

    add-long/2addr v10, v0

    and-long v0, v5, v19

    long-to-int v2, v2

    shl-int/lit8 v3, v2, 0x1

    or-int/2addr v3, v4

    .line 260
    aput v3, p1, v15

    ushr-int/lit8 v2, v2, 0x1f

    long-to-int v0, v0

    shl-int/lit8 v1, v0, 0x1

    or-int/2addr v1, v2

    .line 261
    aput v1, p1, p0

    ushr-int/lit8 v0, v0, 0x1f

    long-to-int v1, v10

    shl-int/lit8 v2, v1, 0x1

    or-int/2addr v0, v2

    .line 262
    aput v0, p1, v12

    ushr-int/lit8 v0, v1, 0x1f

    const/4 v1, 0x7

    .line 263
    aget v2, p1, v1

    shr-long v3, v10, v18

    long-to-int v3, v3

    add-int/2addr v2, v3

    shl-int/lit8 v2, v2, 0x1

    or-int/2addr v0, v2

    .line 264
    aput v0, p1, v1

    return-void

    :cond_0
    move v7, v9

    goto/16 :goto_0
.end method

.method public static sub([II[II[II)I
    .locals 9

    .line 1
    aget v0, p0, p1

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p2, p3

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    sub-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p4, p5

    .line 17
    .line 18
    const/16 v4, 0x20

    .line 19
    .line 20
    shr-long/2addr v0, v4

    .line 21
    add-int/lit8 v5, p1, 0x1

    .line 22
    .line 23
    aget v5, p0, v5

    .line 24
    .line 25
    int-to-long v5, v5

    .line 26
    and-long/2addr v5, v2

    .line 27
    add-int/lit8 v7, p3, 0x1

    .line 28
    .line 29
    aget v7, p2, v7

    .line 30
    .line 31
    int-to-long v7, v7

    .line 32
    and-long/2addr v7, v2

    .line 33
    sub-long/2addr v5, v7

    .line 34
    add-long/2addr v0, v5

    .line 35
    add-int/lit8 v5, p5, 0x1

    .line 36
    .line 37
    long-to-int v6, v0

    .line 38
    aput v6, p4, v5

    .line 39
    .line 40
    shr-long/2addr v0, v4

    .line 41
    add-int/lit8 v5, p1, 0x2

    .line 42
    .line 43
    aget v5, p0, v5

    .line 44
    .line 45
    int-to-long v5, v5

    .line 46
    and-long/2addr v5, v2

    .line 47
    add-int/lit8 v7, p3, 0x2

    .line 48
    .line 49
    aget v7, p2, v7

    .line 50
    .line 51
    int-to-long v7, v7

    .line 52
    and-long/2addr v7, v2

    .line 53
    sub-long/2addr v5, v7

    .line 54
    add-long/2addr v0, v5

    .line 55
    add-int/lit8 v5, p5, 0x2

    .line 56
    .line 57
    long-to-int v6, v0

    .line 58
    aput v6, p4, v5

    .line 59
    .line 60
    shr-long/2addr v0, v4

    .line 61
    add-int/lit8 p1, p1, 0x3

    .line 62
    .line 63
    aget p0, p0, p1

    .line 64
    .line 65
    int-to-long p0, p0

    .line 66
    and-long/2addr p0, v2

    .line 67
    add-int/lit8 p3, p3, 0x3

    .line 68
    .line 69
    aget p2, p2, p3

    .line 70
    .line 71
    int-to-long p2, p2

    .line 72
    and-long/2addr p2, v2

    .line 73
    sub-long/2addr p0, p2

    .line 74
    add-long/2addr v0, p0

    .line 75
    add-int/lit8 p5, p5, 0x3

    .line 76
    .line 77
    long-to-int p0, v0

    .line 78
    aput p0, p4, p5

    .line 79
    .line 80
    shr-long p0, v0, v4

    .line 81
    .line 82
    long-to-int p0, p0

    .line 83
    return p0
.end method

.method public static sub([I[I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 84
    aget v1, p0, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p1, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    sub-long/2addr v1, v5

    long-to-int v5, v1

    .line 85
    aput v5, p2, v0

    const/16 v0, 0x20

    shr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 86
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 87
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 88
    aget v6, p0, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p1, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 89
    aput v6, p2, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 90
    aget p0, p0, v5

    int-to-long v6, p0

    and-long/2addr v6, v3

    aget p0, p1, v5

    int-to-long p0, p0

    and-long/2addr p0, v3

    sub-long/2addr v6, p0

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 91
    aput p0, p2, v5

    shr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static subBothFrom([I[I[I)I
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p2, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    aget v5, p0, v0

    .line 12
    .line 13
    int-to-long v5, v5

    .line 14
    and-long/2addr v5, v3

    .line 15
    sub-long/2addr v1, v5

    .line 16
    aget v5, p1, v0

    .line 17
    .line 18
    int-to-long v5, v5

    .line 19
    and-long/2addr v5, v3

    .line 20
    sub-long/2addr v1, v5

    .line 21
    long-to-int v5, v1

    .line 22
    aput v5, p2, v0

    .line 23
    .line 24
    const/16 v0, 0x20

    .line 25
    .line 26
    shr-long/2addr v1, v0

    .line 27
    const/4 v5, 0x1

    .line 28
    aget v6, p2, v5

    .line 29
    .line 30
    int-to-long v6, v6

    .line 31
    and-long/2addr v6, v3

    .line 32
    aget v8, p0, v5

    .line 33
    .line 34
    int-to-long v8, v8

    .line 35
    and-long/2addr v8, v3

    .line 36
    sub-long/2addr v6, v8

    .line 37
    aget v8, p1, v5

    .line 38
    .line 39
    int-to-long v8, v8

    .line 40
    and-long/2addr v8, v3

    .line 41
    sub-long/2addr v6, v8

    .line 42
    add-long/2addr v1, v6

    .line 43
    long-to-int v6, v1

    .line 44
    aput v6, p2, v5

    .line 45
    .line 46
    shr-long/2addr v1, v0

    .line 47
    const/4 v5, 0x2

    .line 48
    aget v6, p2, v5

    .line 49
    .line 50
    int-to-long v6, v6

    .line 51
    and-long/2addr v6, v3

    .line 52
    aget v8, p0, v5

    .line 53
    .line 54
    int-to-long v8, v8

    .line 55
    and-long/2addr v8, v3

    .line 56
    sub-long/2addr v6, v8

    .line 57
    aget v8, p1, v5

    .line 58
    .line 59
    int-to-long v8, v8

    .line 60
    and-long/2addr v8, v3

    .line 61
    sub-long/2addr v6, v8

    .line 62
    add-long/2addr v1, v6

    .line 63
    long-to-int v6, v1

    .line 64
    aput v6, p2, v5

    .line 65
    .line 66
    shr-long/2addr v1, v0

    .line 67
    const/4 v5, 0x3

    .line 68
    aget v6, p2, v5

    .line 69
    .line 70
    int-to-long v6, v6

    .line 71
    and-long/2addr v6, v3

    .line 72
    aget p0, p0, v5

    .line 73
    .line 74
    int-to-long v8, p0

    .line 75
    and-long/2addr v8, v3

    .line 76
    sub-long/2addr v6, v8

    .line 77
    aget p0, p1, v5

    .line 78
    .line 79
    int-to-long p0, p0

    .line 80
    and-long/2addr p0, v3

    .line 81
    sub-long/2addr v6, p0

    .line 82
    add-long/2addr v1, v6

    .line 83
    long-to-int p0, v1

    .line 84
    aput p0, p2, v5

    .line 85
    .line 86
    shr-long p0, v1, v0

    .line 87
    .line 88
    long-to-int p0, p0

    .line 89
    return p0
.end method

.method public static subFrom([II[II)I
    .locals 10

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    aget v4, p0, p1

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v4, v2

    .line 14
    sub-long/2addr v0, v4

    .line 15
    long-to-int v4, v0

    .line 16
    aput v4, p2, p3

    .line 17
    .line 18
    const/16 v4, 0x20

    .line 19
    .line 20
    shr-long/2addr v0, v4

    .line 21
    add-int/lit8 v5, p3, 0x1

    .line 22
    .line 23
    aget v6, p2, v5

    .line 24
    .line 25
    int-to-long v6, v6

    .line 26
    and-long/2addr v6, v2

    .line 27
    add-int/lit8 v8, p1, 0x1

    .line 28
    .line 29
    aget v8, p0, v8

    .line 30
    .line 31
    int-to-long v8, v8

    .line 32
    and-long/2addr v8, v2

    .line 33
    sub-long/2addr v6, v8

    .line 34
    add-long/2addr v0, v6

    .line 35
    long-to-int v6, v0

    .line 36
    aput v6, p2, v5

    .line 37
    .line 38
    shr-long/2addr v0, v4

    .line 39
    add-int/lit8 v5, p3, 0x2

    .line 40
    .line 41
    aget v6, p2, v5

    .line 42
    .line 43
    int-to-long v6, v6

    .line 44
    and-long/2addr v6, v2

    .line 45
    add-int/lit8 v8, p1, 0x2

    .line 46
    .line 47
    aget v8, p0, v8

    .line 48
    .line 49
    int-to-long v8, v8

    .line 50
    and-long/2addr v8, v2

    .line 51
    sub-long/2addr v6, v8

    .line 52
    add-long/2addr v0, v6

    .line 53
    long-to-int v6, v0

    .line 54
    aput v6, p2, v5

    .line 55
    .line 56
    shr-long/2addr v0, v4

    .line 57
    add-int/lit8 p3, p3, 0x3

    .line 58
    .line 59
    aget v5, p2, p3

    .line 60
    .line 61
    int-to-long v5, v5

    .line 62
    and-long/2addr v5, v2

    .line 63
    add-int/lit8 p1, p1, 0x3

    .line 64
    .line 65
    aget p0, p0, p1

    .line 66
    .line 67
    int-to-long p0, p0

    .line 68
    and-long/2addr p0, v2

    .line 69
    sub-long/2addr v5, p0

    .line 70
    add-long/2addr v0, v5

    .line 71
    long-to-int p0, v0

    .line 72
    aput p0, p2, p3

    .line 73
    .line 74
    shr-long p0, v0, v4

    .line 75
    .line 76
    long-to-int p0, p0

    .line 77
    return p0
.end method

.method public static subFrom([I[I)I
    .locals 10

    const/4 v0, 0x0

    .line 78
    aget v1, p1, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    aget v5, p0, v0

    int-to-long v5, v5

    and-long/2addr v5, v3

    sub-long/2addr v1, v5

    long-to-int v5, v1

    .line 79
    aput v5, p1, v0

    const/16 v0, 0x20

    shr-long/2addr v1, v0

    const/4 v5, 0x1

    .line 80
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 81
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x2

    .line 82
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget v8, p0, v5

    int-to-long v8, v8

    and-long/2addr v8, v3

    sub-long/2addr v6, v8

    add-long/2addr v1, v6

    long-to-int v6, v1

    .line 83
    aput v6, p1, v5

    shr-long/2addr v1, v0

    const/4 v5, 0x3

    .line 84
    aget v6, p1, v5

    int-to-long v6, v6

    and-long/2addr v6, v3

    aget p0, p0, v5

    int-to-long v8, p0

    and-long/2addr v3, v8

    sub-long/2addr v6, v3

    add-long/2addr v1, v6

    long-to-int p0, v1

    .line 85
    aput p0, p1, v5

    shr-long p0, v1, v0

    long-to-int p0, p0

    return p0
.end method

.method public static toBigInteger([I)Ljava/math/BigInteger;
    .locals 4

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    const/4 v2, 0x4

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    aget v2, p0, v1

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    rsub-int/lit8 v3, v1, 0x3

    .line 14
    .line 15
    shl-int/lit8 v3, v3, 0x2

    .line 16
    .line 17
    invoke-static {v2, v0, v3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 18
    .line 19
    .line 20
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance p0, Ljava/math/BigInteger;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-direct {p0, v1, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public static toBigInteger64([J)Ljava/math/BigInteger;
    .locals 6

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    const/4 v2, 0x2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    aget-wide v2, p0, v1

    .line 10
    .line 11
    const-wide/16 v4, 0x0

    .line 12
    .line 13
    cmp-long v4, v2, v4

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    rsub-int/lit8 v4, v1, 0x1

    .line 18
    .line 19
    shl-int/lit8 v4, v4, 0x3

    .line 20
    .line 21
    invoke-static {v2, v3, v0, v4}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 22
    .line 23
    .line 24
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    new-instance p0, Ljava/math/BigInteger;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-direct {p0, v1, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public static zero([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aput v0, p0, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aput v0, p0, v1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    aput v0, p0, v1

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    aput v0, p0, v1

    .line 12
    .line 13
    return-void
.end method

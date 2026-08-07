.class public abstract Lorg/spongycastle/crypto/modes/gcm/GCMUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final E1:I = -0x1f000000

.field private static final E1L:J = -0x1f00000000000000L

.field private static final LOOKUP:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->generateLookup()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->LOOKUP:[I

    .line 6
    .line 7
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

.method public static asBytes([I[B)V
    .locals 1

    const/4 v0, 0x0

    .line 10
    invoke-static {p0, p1, v0}, Lorg/spongycastle/util/Pack;->intToBigEndian([I[BI)V

    return-void
.end method

.method public static asBytes([J[B)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-static {p0, p1, v0}, Lorg/spongycastle/util/Pack;->longToBigEndian([J[BI)V

    return-void
.end method

.method public static asBytes([I)[B
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {p0, v0, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian([I[BI)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static asBytes([J)[B
    .locals 2

    const/16 v0, 0x10

    .line 11
    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 12
    invoke-static {p0, v0, v1}, Lorg/spongycastle/util/Pack;->longToBigEndian([J[BI)V

    return-object v0
.end method

.method public static asInts([B[I)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0, p1}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI[I)V

    return-void
.end method

.method public static asInts([B)[I
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p0, v1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI[I)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static asLongs([B[J)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0, p1}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI[J)V

    return-void
.end method

.method public static asLongs([B)[J
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [J

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p0, v1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToLong([BI[J)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method private static generateLookup()[I
    .locals 8

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    if-ge v3, v0, :cond_2

    .line 8
    .line 9
    const/4 v4, 0x7

    .line 10
    move v5, v2

    .line 11
    :goto_1
    if-ltz v4, :cond_1

    .line 12
    .line 13
    const/4 v6, 0x1

    .line 14
    shl-int/2addr v6, v4

    .line 15
    and-int/2addr v6, v3

    .line 16
    if-eqz v6, :cond_0

    .line 17
    .line 18
    rsub-int/lit8 v6, v4, 0x7

    .line 19
    .line 20
    const/high16 v7, -0x1f000000

    .line 21
    .line 22
    ushr-int v6, v7, v6

    .line 23
    .line 24
    xor-int/2addr v5, v6

    .line 25
    :cond_0
    add-int/lit8 v4, v4, -0x1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    aput v5, v1, v3

    .line 29
    .line 30
    add-int/lit8 v3, v3, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    return-object v1
.end method

.method public static multiply([B[B)V
    .locals 1

    .line 89
    invoke-static {p0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->asInts([B)[I

    move-result-object v0

    .line 90
    invoke-static {p1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->asInts([B)[I

    move-result-object p1

    .line 91
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->multiply([I[I)V

    .line 92
    invoke-static {v0, p0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->asBytes([I[B)V

    return-void
.end method

.method public static multiply([I[I)V
    .locals 17

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    aget v3, p0, v2

    .line 6
    .line 7
    const/4 v4, 0x2

    .line 8
    aget v5, p0, v4

    .line 9
    .line 10
    const/4 v6, 0x3

    .line 11
    aget v7, p0, v6

    .line 12
    .line 13
    move v8, v0

    .line 14
    move v9, v8

    .line 15
    move v10, v9

    .line 16
    move v11, v10

    .line 17
    move v12, v11

    .line 18
    :goto_0
    const/4 v13, 0x4

    .line 19
    if-ge v8, v13, :cond_1

    .line 20
    .line 21
    aget v13, p1, v8

    .line 22
    .line 23
    move v14, v0

    .line 24
    :goto_1
    const/16 v15, 0x20

    .line 25
    .line 26
    if-ge v14, v15, :cond_0

    .line 27
    .line 28
    shr-int/lit8 v15, v13, 0x1f

    .line 29
    .line 30
    shl-int/2addr v13, v2

    .line 31
    and-int v16, v1, v15

    .line 32
    .line 33
    xor-int v9, v9, v16

    .line 34
    .line 35
    and-int v16, v3, v15

    .line 36
    .line 37
    xor-int v10, v10, v16

    .line 38
    .line 39
    and-int v16, v5, v15

    .line 40
    .line 41
    xor-int v11, v11, v16

    .line 42
    .line 43
    and-int/2addr v15, v7

    .line 44
    xor-int/2addr v12, v15

    .line 45
    shl-int/lit8 v15, v7, 0x1f

    .line 46
    .line 47
    shr-int/lit8 v15, v15, 0x8

    .line 48
    .line 49
    ushr-int/lit8 v7, v7, 0x1

    .line 50
    .line 51
    shl-int/lit8 v16, v5, 0x1f

    .line 52
    .line 53
    or-int v7, v7, v16

    .line 54
    .line 55
    ushr-int/lit8 v5, v5, 0x1

    .line 56
    .line 57
    shl-int/lit8 v16, v3, 0x1f

    .line 58
    .line 59
    or-int v5, v5, v16

    .line 60
    .line 61
    ushr-int/lit8 v3, v3, 0x1

    .line 62
    .line 63
    shl-int/lit8 v16, v1, 0x1f

    .line 64
    .line 65
    or-int v3, v3, v16

    .line 66
    .line 67
    ushr-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    const/high16 v16, -0x1f000000

    .line 70
    .line 71
    and-int v15, v15, v16

    .line 72
    .line 73
    xor-int/2addr v1, v15

    .line 74
    add-int/lit8 v14, v14, 0x1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_0
    add-int/lit8 v8, v8, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    aput v9, p0, v0

    .line 81
    .line 82
    aput v10, p0, v2

    .line 83
    .line 84
    aput v11, p0, v4

    .line 85
    .line 86
    aput v12, p0, v6

    .line 87
    .line 88
    return-void
.end method

.method public static multiply([J[J)V
    .locals 19

    const/4 v0, 0x0

    .line 93
    aget-wide v1, p0, v0

    const/4 v3, 0x1

    aget-wide v4, p0, v3

    const-wide/16 v6, 0x0

    move v10, v0

    move-wide v8, v6

    :goto_0
    const/4 v11, 0x2

    if-ge v10, v11, :cond_1

    .line 94
    aget-wide v11, p1, v10

    move v13, v0

    :goto_1
    const/16 v14, 0x40

    if-ge v13, v14, :cond_0

    const/16 v14, 0x3f

    shr-long v15, v11, v14

    shl-long/2addr v11, v3

    and-long v17, v1, v15

    xor-long v6, v6, v17

    and-long/2addr v15, v4

    xor-long/2addr v8, v15

    shl-long v15, v4, v14

    const/16 v17, 0x8

    shr-long v15, v15, v17

    ushr-long/2addr v4, v3

    shl-long v17, v1, v14

    or-long v4, v4, v17

    ushr-long/2addr v1, v3

    const-wide/high16 v17, -0x1f00000000000000L    # -1.757388200993436E159

    and-long v14, v15, v17

    xor-long/2addr v1, v14

    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 95
    :cond_1
    aput-wide v6, p0, v0

    .line 96
    aput-wide v8, p0, v3

    return-void
.end method

.method public static multiplyP([I)V
    .locals 4

    .line 1
    invoke-static {p0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->shiftRight([I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    shr-int/lit8 v0, v0, 0x8

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    aget v2, p0, v1

    .line 9
    .line 10
    const/high16 v3, -0x1f000000

    .line 11
    .line 12
    and-int/2addr v0, v3

    .line 13
    xor-int/2addr v0, v2

    .line 14
    aput v0, p0, v1

    .line 15
    .line 16
    return-void
.end method

.method public static multiplyP([I[I)V
    .locals 3

    .line 17
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->shiftRight([I[I)I

    move-result p0

    shr-int/lit8 p0, p0, 0x8

    const/4 v0, 0x0

    .line 18
    aget v1, p1, v0

    const/high16 v2, -0x1f000000

    and-int/2addr p0, v2

    xor-int/2addr p0, v1

    aput p0, p1, v0

    return-void
.end method

.method public static multiplyP8([I)V
    .locals 4

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-static {p0, v0}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->shiftRightN([II)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    aget v2, p0, v1

    .line 9
    .line 10
    sget-object v3, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->LOOKUP:[I

    .line 11
    .line 12
    ushr-int/lit8 v0, v0, 0x18

    .line 13
    .line 14
    aget v0, v3, v0

    .line 15
    .line 16
    xor-int/2addr v0, v2

    .line 17
    aput v0, p0, v1

    .line 18
    .line 19
    return-void
.end method

.method public static multiplyP8([I[I)V
    .locals 3

    const/16 v0, 0x8

    .line 20
    invoke-static {p0, v0, p1}, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->shiftRightN([II[I)I

    move-result p0

    const/4 v0, 0x0

    .line 21
    aget v1, p1, v0

    sget-object v2, Lorg/spongycastle/crypto/modes/gcm/GCMUtil;->LOOKUP:[I

    ushr-int/lit8 p0, p0, 0x18

    aget p0, v2, p0

    xor-int/2addr p0, v1

    aput p0, p1, v0

    return-void
.end method

.method public static oneAsBytes()[B
    .locals 3

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/16 v2, -0x80

    .line 7
    .line 8
    aput-byte v2, v0, v1

    .line 9
    .line 10
    return-object v0
.end method

.method public static oneAsInts()[I
    .locals 3

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/high16 v2, -0x80000000

    .line 6
    .line 7
    aput v2, v0, v1

    .line 8
    .line 9
    return-object v0
.end method

.method public static oneAsLongs()[J
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [J

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const-wide/high16 v2, -0x8000000000000000L

    .line 6
    .line 7
    aput-wide v2, v0, v1

    .line 8
    .line 9
    return-object v0
.end method

.method public static shiftRight([I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    ushr-int/lit8 v2, v1, 0x1

    .line 5
    .line 6
    aput v2, p0, v0

    .line 7
    .line 8
    shl-int/lit8 v0, v1, 0x1f

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    aget v2, p0, v1

    .line 12
    .line 13
    ushr-int/lit8 v3, v2, 0x1

    .line 14
    .line 15
    or-int/2addr v0, v3

    .line 16
    aput v0, p0, v1

    .line 17
    .line 18
    shl-int/lit8 v0, v2, 0x1f

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    aget v2, p0, v1

    .line 22
    .line 23
    ushr-int/lit8 v3, v2, 0x1

    .line 24
    .line 25
    or-int/2addr v0, v3

    .line 26
    aput v0, p0, v1

    .line 27
    .line 28
    shl-int/lit8 v0, v2, 0x1f

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    aget v2, p0, v1

    .line 32
    .line 33
    ushr-int/lit8 v3, v2, 0x1

    .line 34
    .line 35
    or-int/2addr v0, v3

    .line 36
    aput v0, p0, v1

    .line 37
    .line 38
    shl-int/lit8 p0, v2, 0x1f

    .line 39
    .line 40
    return p0
.end method

.method public static shiftRight([I[I)I
    .locals 4

    const/4 v0, 0x0

    .line 41
    aget v1, p0, v0

    ushr-int/lit8 v2, v1, 0x1

    .line 42
    aput v2, p1, v0

    shl-int/lit8 v0, v1, 0x1f

    const/4 v1, 0x1

    .line 43
    aget v2, p0, v1

    ushr-int/lit8 v3, v2, 0x1

    or-int/2addr v0, v3

    .line 44
    aput v0, p1, v1

    shl-int/lit8 v0, v2, 0x1f

    const/4 v1, 0x2

    .line 45
    aget v2, p0, v1

    ushr-int/lit8 v3, v2, 0x1

    or-int/2addr v0, v3

    .line 46
    aput v0, p1, v1

    shl-int/lit8 v0, v2, 0x1f

    const/4 v1, 0x3

    .line 47
    aget p0, p0, v1

    ushr-int/lit8 v2, p0, 0x1

    or-int/2addr v0, v2

    .line 48
    aput v0, p1, v1

    shl-int/lit8 p0, p0, 0x1f

    return p0
.end method

.method public static shiftRight([J)J
    .locals 8

    const/4 v0, 0x0

    .line 49
    aget-wide v1, p0, v0

    const/4 v3, 0x1

    ushr-long v4, v1, v3

    .line 50
    aput-wide v4, p0, v0

    const/16 v0, 0x3f

    shl-long/2addr v1, v0

    .line 51
    aget-wide v4, p0, v3

    ushr-long v6, v4, v3

    or-long/2addr v1, v6

    .line 52
    aput-wide v1, p0, v3

    shl-long v0, v4, v0

    return-wide v0
.end method

.method public static shiftRight([J[J)J
    .locals 8

    const/4 v0, 0x0

    .line 53
    aget-wide v1, p0, v0

    const/4 v3, 0x1

    ushr-long v4, v1, v3

    .line 54
    aput-wide v4, p1, v0

    const/16 v0, 0x3f

    shl-long/2addr v1, v0

    .line 55
    aget-wide v4, p0, v3

    ushr-long v6, v4, v3

    or-long/2addr v1, v6

    .line 56
    aput-wide v1, p1, v3

    shl-long p0, v4, v0

    return-wide p0
.end method

.method public static shiftRightN([II)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    rsub-int/lit8 v2, p1, 0x20

    .line 5
    .line 6
    ushr-int v3, v1, p1

    .line 7
    .line 8
    aput v3, p0, v0

    .line 9
    .line 10
    shl-int v0, v1, v2

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    aget v3, p0, v1

    .line 14
    .line 15
    ushr-int v4, v3, p1

    .line 16
    .line 17
    or-int/2addr v0, v4

    .line 18
    aput v0, p0, v1

    .line 19
    .line 20
    shl-int v0, v3, v2

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    aget v3, p0, v1

    .line 24
    .line 25
    ushr-int v4, v3, p1

    .line 26
    .line 27
    or-int/2addr v0, v4

    .line 28
    aput v0, p0, v1

    .line 29
    .line 30
    shl-int v0, v3, v2

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    aget v3, p0, v1

    .line 34
    .line 35
    ushr-int p1, v3, p1

    .line 36
    .line 37
    or-int/2addr p1, v0

    .line 38
    aput p1, p0, v1

    .line 39
    .line 40
    shl-int p0, v3, v2

    .line 41
    .line 42
    return p0
.end method

.method public static shiftRightN([II[I)I
    .locals 5

    const/4 v0, 0x0

    .line 43
    aget v1, p0, v0

    rsub-int/lit8 v2, p1, 0x20

    ushr-int v3, v1, p1

    .line 44
    aput v3, p2, v0

    shl-int v0, v1, v2

    const/4 v1, 0x1

    .line 45
    aget v3, p0, v1

    ushr-int v4, v3, p1

    or-int/2addr v0, v4

    .line 46
    aput v0, p2, v1

    shl-int v0, v3, v2

    const/4 v1, 0x2

    .line 47
    aget v3, p0, v1

    ushr-int v4, v3, p1

    or-int/2addr v0, v4

    .line 48
    aput v0, p2, v1

    shl-int v0, v3, v2

    const/4 v1, 0x3

    .line 49
    aget p0, p0, v1

    ushr-int p1, p0, p1

    or-int/2addr p1, v0

    .line 50
    aput p1, p2, v1

    shl-int/2addr p0, v2

    return p0
.end method

.method public static xor([B[B)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :cond_0
    aget-byte v1, p0, v0

    .line 3
    .line 4
    aget-byte v2, p1, v0

    .line 5
    .line 6
    xor-int/2addr v1, v2

    .line 7
    int-to-byte v1, v1

    .line 8
    aput-byte v1, p0, v0

    .line 9
    .line 10
    add-int/lit8 v1, v0, 0x1

    .line 11
    .line 12
    aget-byte v2, p0, v1

    .line 13
    .line 14
    aget-byte v3, p1, v1

    .line 15
    .line 16
    xor-int/2addr v2, v3

    .line 17
    int-to-byte v2, v2

    .line 18
    aput-byte v2, p0, v1

    .line 19
    .line 20
    add-int/lit8 v1, v0, 0x2

    .line 21
    .line 22
    aget-byte v2, p0, v1

    .line 23
    .line 24
    aget-byte v3, p1, v1

    .line 25
    .line 26
    xor-int/2addr v2, v3

    .line 27
    int-to-byte v2, v2

    .line 28
    aput-byte v2, p0, v1

    .line 29
    .line 30
    add-int/lit8 v1, v0, 0x3

    .line 31
    .line 32
    aget-byte v2, p0, v1

    .line 33
    .line 34
    aget-byte v3, p1, v1

    .line 35
    .line 36
    xor-int/2addr v2, v3

    .line 37
    int-to-byte v2, v2

    .line 38
    aput-byte v2, p0, v1

    .line 39
    .line 40
    add-int/lit8 v0, v0, 0x4

    .line 41
    .line 42
    const/16 v1, 0x10

    .line 43
    .line 44
    if-lt v0, v1, :cond_0

    .line 45
    .line 46
    return-void
.end method

.method public static xor([B[BII)V
    .locals 2

    :goto_0
    add-int/lit8 p3, p3, -0x1

    if-ltz p3, :cond_0

    .line 47
    aget-byte v0, p0, p3

    add-int v1, p2, p3

    aget-byte v1, p1, v1

    xor-int/2addr v0, v1

    int-to-byte v0, v0

    aput-byte v0, p0, p3

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static xor([B[B[B)V
    .locals 4

    const/4 v0, 0x0

    .line 48
    :cond_0
    aget-byte v1, p0, v0

    aget-byte v2, p1, v0

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    add-int/lit8 v1, v0, 0x1

    .line 49
    aget-byte v2, p0, v1

    aget-byte v3, p1, v1

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p2, v1

    add-int/lit8 v1, v0, 0x2

    .line 50
    aget-byte v2, p0, v1

    aget-byte v3, p1, v1

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p2, v1

    add-int/lit8 v1, v0, 0x3

    .line 51
    aget-byte v2, p0, v1

    aget-byte v3, p1, v1

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p2, v1

    add-int/lit8 v0, v0, 0x4

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    return-void
.end method

.method public static xor([I[I)V
    .locals 3

    const/4 v0, 0x0

    .line 52
    aget v1, p0, v0

    aget v2, p1, v0

    xor-int/2addr v1, v2

    aput v1, p0, v0

    const/4 v0, 0x1

    .line 53
    aget v1, p0, v0

    aget v2, p1, v0

    xor-int/2addr v1, v2

    aput v1, p0, v0

    const/4 v0, 0x2

    .line 54
    aget v1, p0, v0

    aget v2, p1, v0

    xor-int/2addr v1, v2

    aput v1, p0, v0

    const/4 v0, 0x3

    .line 55
    aget v1, p0, v0

    aget p1, p1, v0

    xor-int/2addr p1, v1

    aput p1, p0, v0

    return-void
.end method

.method public static xor([I[I[I)V
    .locals 3

    const/4 v0, 0x0

    .line 56
    aget v1, p0, v0

    aget v2, p1, v0

    xor-int/2addr v1, v2

    aput v1, p2, v0

    const/4 v0, 0x1

    .line 57
    aget v1, p0, v0

    aget v2, p1, v0

    xor-int/2addr v1, v2

    aput v1, p2, v0

    const/4 v0, 0x2

    .line 58
    aget v1, p0, v0

    aget v2, p1, v0

    xor-int/2addr v1, v2

    aput v1, p2, v0

    const/4 v0, 0x3

    .line 59
    aget p0, p0, v0

    aget p1, p1, v0

    xor-int/2addr p0, p1

    aput p0, p2, v0

    return-void
.end method

.method public static xor([J[J)V
    .locals 5

    const/4 v0, 0x0

    .line 60
    aget-wide v1, p0, v0

    aget-wide v3, p1, v0

    xor-long/2addr v1, v3

    aput-wide v1, p0, v0

    const/4 v0, 0x1

    .line 61
    aget-wide v1, p0, v0

    aget-wide v3, p1, v0

    xor-long/2addr v1, v3

    aput-wide v1, p0, v0

    return-void
.end method

.method public static xor([J[J[J)V
    .locals 5

    const/4 v0, 0x0

    .line 62
    aget-wide v1, p0, v0

    aget-wide v3, p1, v0

    xor-long/2addr v1, v3

    aput-wide v1, p2, v0

    const/4 v0, 0x1

    .line 63
    aget-wide v1, p0, v0

    aget-wide p0, p1, v0

    xor-long/2addr p0, v1

    aput-wide p0, p2, v0

    return-void
.end method

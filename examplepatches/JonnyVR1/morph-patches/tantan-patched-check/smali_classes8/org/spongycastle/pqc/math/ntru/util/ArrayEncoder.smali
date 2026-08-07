.class public Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final BIT1_TABLE:[I

.field private static final BIT2_TABLE:[I

.field private static final BIT3_TABLE:[I

.field private static final COEFF1_TABLE:[I

.field private static final COEFF2_TABLE:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->COEFF1_TABLE:[I

    .line 9
    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    fill-array-data v0, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v0, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->COEFF2_TABLE:[I

    .line 16
    .line 17
    const/16 v0, 0x9

    .line 18
    .line 19
    new-array v1, v0, [I

    .line 20
    .line 21
    fill-array-data v1, :array_2

    .line 22
    .line 23
    .line 24
    sput-object v1, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->BIT1_TABLE:[I

    .line 25
    .line 26
    new-array v1, v0, [I

    .line 27
    .line 28
    fill-array-data v1, :array_3

    .line 29
    .line 30
    .line 31
    sput-object v1, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->BIT2_TABLE:[I

    .line 32
    .line 33
    new-array v0, v0, [I

    .line 34
    .line 35
    fill-array-data v0, :array_4

    .line 36
    .line 37
    .line 38
    sput-object v0, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->BIT3_TABLE:[I

    .line 39
    .line 40
    return-void

    .line 41
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x1
        0x1
        0x1
        -0x1
        -0x1
    .end array-data

    .line 42
    .line 43
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
    :array_1
    .array-data 4
        0x0
        0x1
        -0x1
        0x0
        0x1
        -0x1
        0x0
        0x1
    .end array-data

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
    :array_2
    .array-data 4
        0x1
        0x1
        0x1
        0x0
        0x0
        0x0
        0x1
        0x0
        0x1
    .end array-data

    :array_3
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x0
        0x0
        0x0
        0x1
        0x0
    .end array-data

    :array_4
    .array-data 4
        0x1
        0x0
        0x1
        0x0
        0x0
        0x1
        0x1
        0x1
        0x0
    .end array-data
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

.method public static decodeMod3Sves([BI)[I
    .locals 6

    .line 1
    new-array v0, p1, [I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :cond_0
    array-length v3, p0

    .line 6
    mul-int/lit8 v3, v3, 0x8

    .line 7
    .line 8
    if-ge v1, v3, :cond_1

    .line 9
    .line 10
    add-int/lit8 v3, v1, 0x1

    .line 11
    .line 12
    invoke-static {p0, v1}, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->getBit([BI)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    add-int/lit8 v5, v1, 0x2

    .line 17
    .line 18
    invoke-static {p0, v3}, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->getBit([BI)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    add-int/lit8 v1, v1, 0x3

    .line 23
    .line 24
    invoke-static {p0, v5}, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->getBit([BI)I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    mul-int/lit8 v4, v4, 0x4

    .line 29
    .line 30
    mul-int/lit8 v3, v3, 0x2

    .line 31
    .line 32
    add-int/2addr v4, v3

    .line 33
    add-int/2addr v4, v5

    .line 34
    add-int/lit8 v3, v2, 0x1

    .line 35
    .line 36
    sget-object v5, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->COEFF1_TABLE:[I

    .line 37
    .line 38
    aget v5, v5, v4

    .line 39
    .line 40
    aput v5, v0, v2

    .line 41
    .line 42
    add-int/lit8 v2, v2, 0x2

    .line 43
    .line 44
    sget-object v5, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->COEFF2_TABLE:[I

    .line 45
    .line 46
    aget v4, v5, v4

    .line 47
    .line 48
    aput v4, v0, v3

    .line 49
    .line 50
    add-int/lit8 v3, p1, -0x2

    .line 51
    .line 52
    if-le v2, v3, :cond_0

    .line 53
    .line 54
    :cond_1
    return-object v0
.end method

.method public static decodeMod3Tight(Ljava/io/InputStream;I)[I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    int-to-double v0, p1

    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    .line 48
    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    const-wide/high16 v2, 0x4020000000000000L    # 8.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    .line 49
    invoke-static {p0, v0}, Lorg/spongycastle/pqc/math/ntru/util/Util;->readFullLength(Ljava/io/InputStream;I)[B

    move-result-object p0

    .line 50
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->decodeMod3Tight([BI)[I

    move-result-object p0

    return-object p0
.end method

.method public static decodeMod3Tight([BI)[I
    .locals 7

    .line 1
    new-instance v0, Ljava/math/BigInteger;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 5
    .line 6
    .line 7
    new-array p0, p1, [I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, p1, :cond_1

    .line 11
    .line 12
    const-wide/16 v3, 0x3

    .line 13
    .line 14
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    invoke-virtual {v0, v5}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    invoke-virtual {v5}, Ljava/math/BigInteger;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    add-int/lit8 v6, v5, -0x1

    .line 27
    .line 28
    aput v6, p0, v2

    .line 29
    .line 30
    if-le v6, v1, :cond_0

    .line 31
    .line 32
    add-int/lit8 v5, v5, -0x4

    .line 33
    .line 34
    aput v5, p0, v2

    .line 35
    .line 36
    :cond_0
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return-object p0
.end method

.method public static decodeModQ(Ljava/io/InputStream;II)[I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    invoke-static {p2}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result v0

    rsub-int/lit8 v0, v0, 0x1f

    mul-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x7

    .line 39
    div-int/lit8 v0, v0, 0x8

    .line 40
    invoke-static {p0, v0}, Lorg/spongycastle/pqc/math/ntru/util/Util;->readFullLength(Ljava/io/InputStream;I)[B

    move-result-object p0

    .line 41
    invoke-static {p0, p1, p2}, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->decodeModQ([BII)[I

    move-result-object p0

    return-object p0
.end method

.method public static decodeModQ([BII)[I
    .locals 6

    .line 1
    new-array v0, p1, [I

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    rsub-int/lit8 p2, p2, 0x1f

    .line 8
    .line 9
    mul-int/2addr p1, p2

    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    :goto_0
    if-ge v1, p1, :cond_1

    .line 13
    .line 14
    if-lez v1, :cond_0

    .line 15
    .line 16
    rem-int v3, v1, p2

    .line 17
    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    :cond_0
    invoke-static {p0, v1}, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->getBit([BI)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    aget v4, v0, v2

    .line 27
    .line 28
    rem-int v5, v1, p2

    .line 29
    .line 30
    shl-int/2addr v3, v5

    .line 31
    add-int/2addr v4, v3

    .line 32
    aput v4, v0, v2

    .line 33
    .line 34
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-object v0
.end method

.method public static encodeMod3Sves([I)[B
    .locals 11

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x3

    .line 3
    mul-int/2addr v0, v1

    .line 4
    add-int/lit8 v0, v0, 0x1

    .line 5
    .line 6
    div-int/lit8 v0, v0, 0x2

    .line 7
    .line 8
    const/4 v2, 0x7

    .line 9
    add-int/2addr v0, v2

    .line 10
    div-int/lit8 v0, v0, 0x8

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    move v4, v3

    .line 16
    move v5, v4

    .line 17
    move v6, v5

    .line 18
    :cond_0
    array-length v7, p0

    .line 19
    div-int/lit8 v7, v7, 0x2

    .line 20
    .line 21
    mul-int/lit8 v7, v7, 0x2

    .line 22
    .line 23
    if-ge v4, v7, :cond_4

    .line 24
    .line 25
    add-int/lit8 v7, v4, 0x1

    .line 26
    .line 27
    aget v8, p0, v4

    .line 28
    .line 29
    add-int/lit8 v8, v8, 0x1

    .line 30
    .line 31
    add-int/lit8 v4, v4, 0x2

    .line 32
    .line 33
    aget v7, p0, v7

    .line 34
    .line 35
    add-int/lit8 v7, v7, 0x1

    .line 36
    .line 37
    if-nez v8, :cond_2

    .line 38
    .line 39
    if-eqz v7, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string p0, "Illegal encoding!"

    .line 43
    .line 44
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return-object p0

    .line 49
    :cond_2
    :goto_0
    mul-int/lit8 v8, v8, 0x3

    .line 50
    .line 51
    add-int/2addr v8, v7

    .line 52
    sget-object v7, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->BIT1_TABLE:[I

    .line 53
    .line 54
    aget v7, v7, v8

    .line 55
    .line 56
    sget-object v9, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->BIT2_TABLE:[I

    .line 57
    .line 58
    aget v9, v9, v8

    .line 59
    .line 60
    sget-object v10, Lorg/spongycastle/pqc/math/ntru/util/ArrayEncoder;->BIT3_TABLE:[I

    .line 61
    .line 62
    aget v8, v10, v8

    .line 63
    .line 64
    filled-new-array {v7, v9, v8}, [I

    .line 65
    .line 66
    .line 67
    move-result-object v7

    .line 68
    move v8, v3

    .line 69
    :goto_1
    if-ge v8, v1, :cond_0

    .line 70
    .line 71
    aget-byte v9, v0, v6

    .line 72
    .line 73
    aget v10, v7, v8

    .line 74
    .line 75
    shl-int/2addr v10, v5

    .line 76
    or-int/2addr v9, v10

    .line 77
    int-to-byte v9, v9

    .line 78
    aput-byte v9, v0, v6

    .line 79
    .line 80
    if-ne v5, v2, :cond_3

    .line 81
    .line 82
    add-int/lit8 v6, v6, 0x1

    .line 83
    .line 84
    move v5, v3

    .line 85
    goto :goto_2

    .line 86
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 87
    .line 88
    :goto_2
    add-int/lit8 v8, v8, 0x1

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_4
    return-object v0
.end method

.method public static encodeMod3Tight([I)[B
    .locals 5

    .line 1
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    .line 2
    .line 3
    array-length v1, p0

    .line 4
    const/4 v2, 0x1

    .line 5
    sub-int/2addr v1, v2

    .line 6
    :goto_0
    const-wide/16 v3, 0x3

    .line 7
    .line 8
    if-ltz v1, :cond_0

    .line 9
    .line 10
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    aget v3, p0, v1

    .line 19
    .line 20
    add-int/2addr v3, v2

    .line 21
    int-to-long v3, v3

    .line 22
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v0, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    add-int/lit8 v1, v1, -0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    array-length p0, p0

    .line 38
    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->pow(I)Ljava/math/BigInteger;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    add-int/lit8 p0, p0, 0x7

    .line 47
    .line 48
    div-int/lit8 p0, p0, 0x8

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    array-length v1, v0

    .line 55
    if-ge v1, p0, :cond_1

    .line 56
    .line 57
    new-array v1, p0, [B

    .line 58
    .line 59
    array-length v2, v0

    .line 60
    sub-int/2addr p0, v2

    .line 61
    array-length v2, v0

    .line 62
    const/4 v3, 0x0

    .line 63
    invoke-static {v0, v3, v1, p0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 64
    .line 65
    .line 66
    return-object v1

    .line 67
    :cond_1
    array-length v1, v0

    .line 68
    if-le v1, p0, :cond_2

    .line 69
    .line 70
    array-length p0, v0

    .line 71
    invoke-static {v0, v2, p0}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_2
    return-object v0
.end method

.method public static encodeModQ([II)[B
    .locals 9

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    rsub-int/lit8 p1, p1, 0x1f

    .line 6
    .line 7
    array-length v0, p0

    .line 8
    mul-int/2addr v0, p1

    .line 9
    const/4 v1, 0x7

    .line 10
    add-int/2addr v0, v1

    .line 11
    div-int/lit8 v0, v0, 0x8

    .line 12
    .line 13
    new-array v0, v0, [B

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    move v3, v2

    .line 17
    move v4, v3

    .line 18
    move v5, v4

    .line 19
    :goto_0
    array-length v6, p0

    .line 20
    if-ge v3, v6, :cond_2

    .line 21
    .line 22
    move v6, v2

    .line 23
    :goto_1
    if-ge v6, p1, :cond_1

    .line 24
    .line 25
    aget v7, p0, v3

    .line 26
    .line 27
    shr-int/2addr v7, v6

    .line 28
    and-int/lit8 v7, v7, 0x1

    .line 29
    .line 30
    aget-byte v8, v0, v5

    .line 31
    .line 32
    shl-int/2addr v7, v4

    .line 33
    or-int/2addr v7, v8

    .line 34
    int-to-byte v7, v7

    .line 35
    aput-byte v7, v0, v5

    .line 36
    .line 37
    if-ne v4, v1, :cond_0

    .line 38
    .line 39
    add-int/lit8 v5, v5, 0x1

    .line 40
    .line 41
    move v4, v2

    .line 42
    goto :goto_2

    .line 43
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 44
    .line 45
    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return-object v0
.end method

.method private static getBit([BI)I
    .locals 1

    .line 1
    div-int/lit8 v0, p1, 0x8

    .line 2
    .line 3
    aget-byte p0, p0, v0

    .line 4
    .line 5
    and-int/lit16 p0, p0, 0xff

    .line 6
    .line 7
    rem-int/lit8 p1, p1, 0x8

    .line 8
    .line 9
    shr-int/2addr p0, p1

    .line 10
    and-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    return p0
.end method

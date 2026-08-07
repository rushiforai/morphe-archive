.class public abstract Lorg/spongycastle/math/ec/WNafUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DEFAULT_WINDOW_SIZE_CUTOFFS:[I

.field private static final EMPTY_BYTES:[B

.field private static final EMPTY_INTS:[I

.field private static final EMPTY_POINTS:[Lorg/spongycastle/math/ec/ECPoint;

.field public static final PRECOMP_NAME:Ljava/lang/String; = "bc_wnaf"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/spongycastle/math/ec/WNafUtil;->DEFAULT_WINDOW_SIZE_CUTOFFS:[I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v1, v0, [B

    .line 11
    .line 12
    sput-object v1, Lorg/spongycastle/math/ec/WNafUtil;->EMPTY_BYTES:[B

    .line 13
    .line 14
    new-array v1, v0, [I

    .line 15
    .line 16
    sput-object v1, Lorg/spongycastle/math/ec/WNafUtil;->EMPTY_INTS:[I

    .line 17
    .line 18
    new-array v0, v0, [Lorg/spongycastle/math/ec/ECPoint;

    .line 19
    .line 20
    sput-object v0, Lorg/spongycastle/math/ec/WNafUtil;->EMPTY_POINTS:[Lorg/spongycastle/math/ec/ECPoint;

    .line 21
    .line 22
    return-void

    :array_0
    .array-data 4
        0xd
        0x29
        0x79
        0x151
        0x381
        0x901
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

.method public static generateCompactNaf(Ljava/math/BigInteger;)[I
    .locals 10

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    ushr-int/lit8 v0, v0, 0x10

    .line 6
    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lorg/spongycastle/math/ec/WNafUtil;->EMPTY_INTS:[I

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    shr-int/lit8 v3, v2, 0x1

    .line 32
    .line 33
    new-array v4, v3, [I

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->xor(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sub-int/2addr v2, v0

    .line 40
    const/4 v5, 0x0

    .line 41
    move v7, v0

    .line 42
    move v6, v5

    .line 43
    :goto_0
    if-ge v7, v2, :cond_3

    .line 44
    .line 45
    invoke-virtual {v1, v7}, Ljava/math/BigInteger;->testBit(I)Z

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    if-nez v8, :cond_1

    .line 50
    .line 51
    add-int/lit8 v6, v6, 0x1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_1
    invoke-virtual {p0, v7}, Ljava/math/BigInteger;->testBit(I)Z

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    if-eqz v8, :cond_2

    .line 59
    .line 60
    const/4 v8, -0x1

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v8, v0

    .line 63
    :goto_1
    add-int/lit8 v9, v5, 0x1

    .line 64
    .line 65
    shl-int/lit8 v8, v8, 0x10

    .line 66
    .line 67
    or-int/2addr v6, v8

    .line 68
    aput v6, v4, v5

    .line 69
    .line 70
    add-int/lit8 v7, v7, 0x1

    .line 71
    .line 72
    move v6, v0

    .line 73
    move v5, v9

    .line 74
    :goto_2
    add-int/2addr v7, v0

    .line 75
    goto :goto_0

    .line 76
    :cond_3
    add-int/lit8 p0, v5, 0x1

    .line 77
    .line 78
    const/high16 v0, 0x10000

    .line 79
    .line 80
    or-int/2addr v0, v6

    .line 81
    aput v0, v4, v5

    .line 82
    .line 83
    if-le v3, p0, :cond_4

    .line 84
    .line 85
    invoke-static {v4, p0}, Lorg/spongycastle/math/ec/WNafUtil;->trim([II)[I

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :cond_4
    return-object v4

    .line 91
    :cond_5
    const-string p0, "\'k\' must have bitlength < 2^16"

    .line 92
    .line 93
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    const/4 p0, 0x0

    .line 97
    return-object p0
.end method

.method public static generateCompactWindowNaf(ILjava/math/BigInteger;)[I
    .locals 13

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    invoke-static {p1}, Lorg/spongycastle/math/ec/WNafUtil;->generateCompactNaf(Ljava/math/BigInteger;)[I

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 v1, 0x0

    .line 10
    if-lt p0, v0, :cond_a

    .line 11
    .line 12
    const/16 v0, 0x10

    .line 13
    .line 14
    if-gt p0, v0, :cond_a

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    ushr-int/2addr v2, v0

    .line 21
    if-nez v2, :cond_9

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    sget-object p0, Lorg/spongycastle/math/ec/WNafUtil;->EMPTY_INTS:[I

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    div-int/2addr v1, p0

    .line 37
    const/4 v2, 0x1

    .line 38
    add-int/2addr v1, v2

    .line 39
    new-array v3, v1, [I

    .line 40
    .line 41
    shl-int v4, v2, p0

    .line 42
    .line 43
    add-int/lit8 v5, v4, -0x1

    .line 44
    .line 45
    ushr-int/lit8 v6, v4, 0x1

    .line 46
    .line 47
    const/4 v7, 0x0

    .line 48
    move v8, v7

    .line 49
    move v9, v8

    .line 50
    move v10, v9

    .line 51
    :goto_0
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 52
    .line 53
    .line 54
    move-result v11

    .line 55
    if-gt v8, v11, :cond_7

    .line 56
    .line 57
    invoke-virtual {p1, v8}, Ljava/math/BigInteger;->testBit(I)Z

    .line 58
    .line 59
    .line 60
    move-result v11

    .line 61
    if-ne v11, v10, :cond_2

    .line 62
    .line 63
    add-int/lit8 v8, v8, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-virtual {p1, v8}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1}, Ljava/math/BigInteger;->intValue()I

    .line 71
    .line 72
    .line 73
    move-result v11

    .line 74
    and-int/2addr v11, v5

    .line 75
    if-eqz v10, :cond_3

    .line 76
    .line 77
    add-int/lit8 v11, v11, 0x1

    .line 78
    .line 79
    :cond_3
    and-int v10, v11, v6

    .line 80
    .line 81
    if-eqz v10, :cond_4

    .line 82
    .line 83
    move v10, v2

    .line 84
    goto :goto_1

    .line 85
    :cond_4
    move v10, v7

    .line 86
    :goto_1
    if-eqz v10, :cond_5

    .line 87
    .line 88
    sub-int/2addr v11, v4

    .line 89
    :cond_5
    if-lez v9, :cond_6

    .line 90
    .line 91
    add-int/lit8 v8, v8, -0x1

    .line 92
    .line 93
    :cond_6
    add-int/lit8 v12, v9, 0x1

    .line 94
    .line 95
    shl-int/2addr v11, v0

    .line 96
    or-int/2addr v8, v11

    .line 97
    aput v8, v3, v9

    .line 98
    .line 99
    move v8, p0

    .line 100
    move v9, v12

    .line 101
    goto :goto_0

    .line 102
    :cond_7
    if-le v1, v9, :cond_8

    .line 103
    .line 104
    invoke-static {v3, v9}, Lorg/spongycastle/math/ec/WNafUtil;->trim([II)[I

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :cond_8
    return-object v3

    .line 110
    :cond_9
    const-string p0, "\'k\' must have bitlength < 2^16"

    .line 111
    .line 112
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-object v1

    .line 116
    :cond_a
    const-string p0, "\'width\' must be in the range [2, 16]"

    .line 117
    .line 118
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-object v1
.end method

.method public static generateJSF(Ljava/math/BigInteger;Ljava/math/BigInteger;)[B
    .locals 17

    .line 1
    invoke-virtual/range {p0 .. p0}, Ljava/math/BigInteger;->bitLength()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual/range {p1 .. p1}, Ljava/math/BigInteger;->bitLength()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    new-array v1, v0, [B

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    move-object/from16 v3, p0

    .line 19
    .line 20
    move-object/from16 v4, p1

    .line 21
    .line 22
    move v5, v2

    .line 23
    move v6, v5

    .line 24
    move v7, v6

    .line 25
    move v8, v7

    .line 26
    :goto_0
    or-int v9, v5, v6

    .line 27
    .line 28
    if-nez v9, :cond_2

    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/math/BigInteger;->bitLength()I

    .line 31
    .line 32
    .line 33
    move-result v9

    .line 34
    if-gt v9, v7, :cond_2

    .line 35
    .line 36
    invoke-virtual {v4}, Ljava/math/BigInteger;->bitLength()I

    .line 37
    .line 38
    .line 39
    move-result v9

    .line 40
    if-le v9, v7, :cond_0

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    if-le v0, v8, :cond_1

    .line 44
    .line 45
    invoke-static {v1, v8}, Lorg/spongycastle/math/ec/WNafUtil;->trim([BI)[B

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    return-object v0

    .line 50
    :cond_1
    return-object v1

    .line 51
    :cond_2
    :goto_1
    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    .line 52
    .line 53
    .line 54
    move-result v9

    .line 55
    ushr-int/2addr v9, v7

    .line 56
    add-int/2addr v9, v5

    .line 57
    and-int/lit8 v10, v9, 0x7

    .line 58
    .line 59
    invoke-virtual {v4}, Ljava/math/BigInteger;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v11

    .line 63
    ushr-int/2addr v11, v7

    .line 64
    add-int/2addr v11, v6

    .line 65
    and-int/lit8 v12, v11, 0x7

    .line 66
    .line 67
    and-int/lit8 v13, v9, 0x1

    .line 68
    .line 69
    const/4 v14, 0x4

    .line 70
    const/4 v15, 0x2

    .line 71
    if-eqz v13, :cond_3

    .line 72
    .line 73
    and-int/lit8 v16, v9, 0x2

    .line 74
    .line 75
    sub-int v13, v13, v16

    .line 76
    .line 77
    add-int/2addr v10, v13

    .line 78
    if-ne v10, v14, :cond_3

    .line 79
    .line 80
    and-int/lit8 v10, v11, 0x3

    .line 81
    .line 82
    if-ne v10, v15, :cond_3

    .line 83
    .line 84
    neg-int v13, v13

    .line 85
    :cond_3
    and-int/lit8 v10, v11, 0x1

    .line 86
    .line 87
    if-eqz v10, :cond_4

    .line 88
    .line 89
    and-int/lit8 v11, v11, 0x2

    .line 90
    .line 91
    sub-int/2addr v10, v11

    .line 92
    add-int/2addr v12, v10

    .line 93
    if-ne v12, v14, :cond_4

    .line 94
    .line 95
    and-int/lit8 v9, v9, 0x3

    .line 96
    .line 97
    if-ne v9, v15, :cond_4

    .line 98
    .line 99
    neg-int v10, v10

    .line 100
    :cond_4
    shl-int/lit8 v9, v5, 0x1

    .line 101
    .line 102
    add-int/lit8 v11, v13, 0x1

    .line 103
    .line 104
    if-ne v9, v11, :cond_5

    .line 105
    .line 106
    xor-int/lit8 v5, v5, 0x1

    .line 107
    .line 108
    :cond_5
    shl-int/lit8 v9, v6, 0x1

    .line 109
    .line 110
    add-int/lit8 v11, v10, 0x1

    .line 111
    .line 112
    if-ne v9, v11, :cond_6

    .line 113
    .line 114
    xor-int/lit8 v6, v6, 0x1

    .line 115
    .line 116
    :cond_6
    add-int/lit8 v7, v7, 0x1

    .line 117
    .line 118
    const/16 v9, 0x1e

    .line 119
    .line 120
    if-ne v7, v9, :cond_7

    .line 121
    .line 122
    invoke-virtual {v3, v9}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v4, v9}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    move v7, v2

    .line 131
    :cond_7
    add-int/lit8 v9, v8, 0x1

    .line 132
    .line 133
    shl-int/lit8 v11, v13, 0x4

    .line 134
    .line 135
    and-int/lit8 v10, v10, 0xf

    .line 136
    .line 137
    or-int/2addr v10, v11

    .line 138
    int-to-byte v10, v10

    .line 139
    aput-byte v10, v1, v8

    .line 140
    .line 141
    move v8, v9

    .line 142
    goto :goto_0
.end method

.method public static generateNaf(Ljava/math/BigInteger;)[B
    .locals 8

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lorg/spongycastle/math/ec/WNafUtil;->EMPTY_BYTES:[B

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    add-int/lit8 v3, v2, -0x1

    .line 24
    .line 25
    new-array v4, v3, [B

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->xor(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move v5, v0

    .line 32
    :goto_0
    if-ge v5, v3, :cond_3

    .line 33
    .line 34
    invoke-virtual {v1, v5}, Ljava/math/BigInteger;->testBit(I)Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-eqz v6, :cond_2

    .line 39
    .line 40
    add-int/lit8 v6, v5, -0x1

    .line 41
    .line 42
    invoke-virtual {p0, v5}, Ljava/math/BigInteger;->testBit(I)Z

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    if-eqz v7, :cond_1

    .line 47
    .line 48
    const/4 v7, -0x1

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v7, v0

    .line 51
    :goto_1
    int-to-byte v7, v7

    .line 52
    aput-byte v7, v4, v6

    .line 53
    .line 54
    add-int/lit8 v5, v5, 0x1

    .line 55
    .line 56
    :cond_2
    add-int/2addr v5, v0

    .line 57
    goto :goto_0

    .line 58
    :cond_3
    add-int/lit8 v2, v2, -0x2

    .line 59
    .line 60
    aput-byte v0, v4, v2

    .line 61
    .line 62
    return-object v4
.end method

.method public static generateWindowNaf(ILjava/math/BigInteger;)[B
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    invoke-static {p1}, Lorg/spongycastle/math/ec/WNafUtil;->generateNaf(Ljava/math/BigInteger;)[B

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :cond_0
    if-lt p0, v0, :cond_9

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    if-gt p0, v0, :cond_9

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget-object p0, Lorg/spongycastle/math/ec/WNafUtil;->EMPTY_BYTES:[B

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    add-int/2addr v0, v1

    .line 30
    new-array v2, v0, [B

    .line 31
    .line 32
    shl-int v3, v1, p0

    .line 33
    .line 34
    add-int/lit8 v4, v3, -0x1

    .line 35
    .line 36
    ushr-int/lit8 v5, v3, 0x1

    .line 37
    .line 38
    const/4 v6, 0x0

    .line 39
    move v7, v6

    .line 40
    move v8, v7

    .line 41
    move v9, v8

    .line 42
    :goto_0
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 43
    .line 44
    .line 45
    move-result v10

    .line 46
    if-gt v7, v10, :cond_7

    .line 47
    .line 48
    invoke-virtual {p1, v7}, Ljava/math/BigInteger;->testBit(I)Z

    .line 49
    .line 50
    .line 51
    move-result v10

    .line 52
    if-ne v10, v9, :cond_2

    .line 53
    .line 54
    add-int/lit8 v7, v7, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    invoke-virtual {p1, v7}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ljava/math/BigInteger;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v10

    .line 65
    and-int/2addr v10, v4

    .line 66
    if-eqz v9, :cond_3

    .line 67
    .line 68
    add-int/lit8 v10, v10, 0x1

    .line 69
    .line 70
    :cond_3
    and-int v9, v10, v5

    .line 71
    .line 72
    if-eqz v9, :cond_4

    .line 73
    .line 74
    move v9, v1

    .line 75
    goto :goto_1

    .line 76
    :cond_4
    move v9, v6

    .line 77
    :goto_1
    if-eqz v9, :cond_5

    .line 78
    .line 79
    sub-int/2addr v10, v3

    .line 80
    :cond_5
    if-lez v8, :cond_6

    .line 81
    .line 82
    add-int/lit8 v7, v7, -0x1

    .line 83
    .line 84
    :cond_6
    add-int/2addr v8, v7

    .line 85
    add-int/lit8 v7, v8, 0x1

    .line 86
    .line 87
    int-to-byte v10, v10

    .line 88
    aput-byte v10, v2, v8

    .line 89
    .line 90
    move v8, v7

    .line 91
    move v7, p0

    .line 92
    goto :goto_0

    .line 93
    :cond_7
    if-le v0, v8, :cond_8

    .line 94
    .line 95
    invoke-static {v2, v8}, Lorg/spongycastle/math/ec/WNafUtil;->trim([BI)[B

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_8
    return-object v2

    .line 101
    :cond_9
    const-string p0, "\'width\' must be in the range [2, 8]"

    .line 102
    .line 103
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    const/4 p0, 0x0

    .line 107
    return-object p0
.end method

.method public static getNafWeight(Ljava/math/BigInteger;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Ljava/math/BigInteger;->xor(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitCount()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public static getWNafPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/WNafPreCompInfo;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "bc_wnaf"

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Lorg/spongycastle/math/ec/ECCurve;->getPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;)Lorg/spongycastle/math/ec/PreCompInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lorg/spongycastle/math/ec/WNafUtil;->getWNafPreCompInfo(Lorg/spongycastle/math/ec/PreCompInfo;)Lorg/spongycastle/math/ec/WNafPreCompInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static getWNafPreCompInfo(Lorg/spongycastle/math/ec/PreCompInfo;)Lorg/spongycastle/math/ec/WNafPreCompInfo;
    .locals 1

    if-eqz p0, :cond_0

    .line 16
    instance-of v0, p0, Lorg/spongycastle/math/ec/WNafPreCompInfo;

    if-eqz v0, :cond_0

    .line 17
    check-cast p0, Lorg/spongycastle/math/ec/WNafPreCompInfo;

    return-object p0

    .line 18
    :cond_0
    new-instance p0, Lorg/spongycastle/math/ec/WNafPreCompInfo;

    invoke-direct {p0}, Lorg/spongycastle/math/ec/WNafPreCompInfo;-><init>()V

    return-object p0
.end method

.method public static getWindowSize(I)I
    .locals 1

    .line 16
    sget-object v0, Lorg/spongycastle/math/ec/WNafUtil;->DEFAULT_WINDOW_SIZE_CUTOFFS:[I

    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/WNafUtil;->getWindowSize(I[I)I

    move-result p0

    return p0
.end method

.method public static getWindowSize(I[I)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p1

    .line 3
    if-ge v0, v1, :cond_1

    .line 4
    .line 5
    aget v1, p1, v0

    .line 6
    .line 7
    if-ge p0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    return v0
.end method

.method public static mapPointWithPrecomp(Lorg/spongycastle/math/ec/ECPoint;IZLorg/spongycastle/math/ec/ECPointMap;)Lorg/spongycastle/math/ec/ECPoint;
    .locals 8

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/ec/WNafUtil;->precompute(Lorg/spongycastle/math/ec/ECPoint;IZ)Lorg/spongycastle/math/ec/WNafPreCompInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p3, p0}, Lorg/spongycastle/math/ec/ECPointMap;->map(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "bc_wnaf"

    .line 14
    .line 15
    invoke-virtual {v0, p0, v1}, Lorg/spongycastle/math/ec/ECCurve;->getPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;)Lorg/spongycastle/math/ec/PreCompInfo;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Lorg/spongycastle/math/ec/WNafUtil;->getWNafPreCompInfo(Lorg/spongycastle/math/ec/PreCompInfo;)Lorg/spongycastle/math/ec/WNafPreCompInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->getTwice()Lorg/spongycastle/math/ec/ECPoint;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-interface {p3, v3}, Lorg/spongycastle/math/ec/ECPointMap;->map(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, v3}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->setTwice(Lorg/spongycastle/math/ec/ECPoint;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->getPreComp()[Lorg/spongycastle/math/ec/ECPoint;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    array-length v3, p1

    .line 41
    new-array v4, v3, [Lorg/spongycastle/math/ec/ECPoint;

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    move v6, v5

    .line 45
    :goto_0
    array-length v7, p1

    .line 46
    if-ge v6, v7, :cond_1

    .line 47
    .line 48
    aget-object v7, p1, v6

    .line 49
    .line 50
    invoke-interface {p3, v7}, Lorg/spongycastle/math/ec/ECPointMap;->map(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    aput-object v7, v4, v6

    .line 55
    .line 56
    add-int/lit8 v6, v6, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-virtual {v2, v4}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->setPreComp([Lorg/spongycastle/math/ec/ECPoint;)V

    .line 60
    .line 61
    .line 62
    if-eqz p2, :cond_3

    .line 63
    .line 64
    new-array p1, v3, [Lorg/spongycastle/math/ec/ECPoint;

    .line 65
    .line 66
    :goto_1
    if-ge v5, v3, :cond_2

    .line 67
    .line 68
    aget-object p2, v4, v5

    .line 69
    .line 70
    invoke-virtual {p2}, Lorg/spongycastle/math/ec/ECPoint;->negate()Lorg/spongycastle/math/ec/ECPoint;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    aput-object p2, p1, v5

    .line 75
    .line 76
    add-int/lit8 v5, v5, 0x1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-virtual {v2, p1}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->setPreCompNeg([Lorg/spongycastle/math/ec/ECPoint;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    invoke-virtual {v0, p0, v1, v2}, Lorg/spongycastle/math/ec/ECCurve;->setPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;Lorg/spongycastle/math/ec/PreCompInfo;)V

    .line 83
    .line 84
    .line 85
    return-object p0
.end method

.method public static precompute(Lorg/spongycastle/math/ec/ECPoint;IZ)Lorg/spongycastle/math/ec/WNafPreCompInfo;
    .locals 13

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "bc_wnaf"

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Lorg/spongycastle/math/ec/ECCurve;->getPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;)Lorg/spongycastle/math/ec/PreCompInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2}, Lorg/spongycastle/math/ec/WNafUtil;->getWNafPreCompInfo(Lorg/spongycastle/math/ec/PreCompInfo;)Lorg/spongycastle/math/ec/WNafPreCompInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v3, 0x2

    .line 16
    sub-int/2addr p1, v3

    .line 17
    const/4 v4, 0x0

    .line 18
    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v5, 0x1

    .line 23
    shl-int p1, v5, p1

    .line 24
    .line 25
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->getPreComp()[Lorg/spongycastle/math/ec/ECPoint;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    if-nez v6, :cond_0

    .line 30
    .line 31
    sget-object v6, Lorg/spongycastle/math/ec/WNafUtil;->EMPTY_POINTS:[Lorg/spongycastle/math/ec/ECPoint;

    .line 32
    .line 33
    move v7, v4

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    array-length v7, v6

    .line 36
    :goto_0
    if-ge v7, p1, :cond_7

    .line 37
    .line 38
    invoke-static {v6, p1}, Lorg/spongycastle/math/ec/WNafUtil;->resizeTable([Lorg/spongycastle/math/ec/ECPoint;I)[Lorg/spongycastle/math/ec/ECPoint;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    if-ne p1, v5, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->normalize()Lorg/spongycastle/math/ec/ECPoint;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    aput-object v3, v6, v4

    .line 49
    .line 50
    goto/16 :goto_4

    .line 51
    .line 52
    :cond_1
    if-nez v7, :cond_2

    .line 53
    .line 54
    aput-object p0, v6, v4

    .line 55
    .line 56
    move v8, v5

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    move v8, v7

    .line 59
    :goto_1
    const/4 v9, 0x0

    .line 60
    if-ne p1, v3, :cond_3

    .line 61
    .line 62
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->threeTimes()Lorg/spongycastle/math/ec/ECPoint;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    aput-object v3, v6, v5

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_3
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->getTwice()Lorg/spongycastle/math/ec/ECPoint;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    add-int/lit8 v10, v8, -0x1

    .line 74
    .line 75
    aget-object v10, v6, v10

    .line 76
    .line 77
    if-nez v5, :cond_5

    .line 78
    .line 79
    aget-object v5, v6, v4

    .line 80
    .line 81
    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->twice()Lorg/spongycastle/math/ec/ECPoint;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-virtual {v2, v5}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->setTwice(Lorg/spongycastle/math/ec/ECPoint;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0}, Lorg/spongycastle/math/ec/ECAlgorithms;->isFpCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    .line 89
    .line 90
    .line 91
    move-result v11

    .line 92
    if-eqz v11, :cond_5

    .line 93
    .line 94
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    .line 95
    .line 96
    .line 97
    move-result v11

    .line 98
    const/16 v12, 0x40

    .line 99
    .line 100
    if-lt v11, v12, :cond_5

    .line 101
    .line 102
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getCoordinateSystem()I

    .line 103
    .line 104
    .line 105
    move-result v11

    .line 106
    if-eq v11, v3, :cond_4

    .line 107
    .line 108
    const/4 v3, 0x3

    .line 109
    if-eq v11, v3, :cond_4

    .line 110
    .line 111
    const/4 v3, 0x4

    .line 112
    if-eq v11, v3, :cond_4

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_4
    invoke-virtual {v5, v4}, Lorg/spongycastle/math/ec/ECPoint;->getZCoord(I)Lorg/spongycastle/math/ec/ECFieldElement;

    .line 116
    .line 117
    .line 118
    move-result-object v9

    .line 119
    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECPoint;->getYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 128
    .line 129
    .line 130
    move-result-object v5

    .line 131
    invoke-virtual {v5}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-virtual {v0, v3, v5}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-virtual {v9}, Lorg/spongycastle/math/ec/ECFieldElement;->square()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-virtual {v3, v9}, Lorg/spongycastle/math/ec/ECFieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    .line 144
    .line 145
    .line 146
    move-result-object v11

    .line 147
    invoke-virtual {v10, v3}, Lorg/spongycastle/math/ec/ECPoint;->scaleX(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECPoint;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3, v11}, Lorg/spongycastle/math/ec/ECPoint;->scaleY(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECPoint;

    .line 152
    .line 153
    .line 154
    move-result-object v10

    .line 155
    if-nez v7, :cond_5

    .line 156
    .line 157
    aput-object v10, v6, v4

    .line 158
    .line 159
    :cond_5
    :goto_2
    if-ge v8, p1, :cond_6

    .line 160
    .line 161
    add-int/lit8 v3, v8, 0x1

    .line 162
    .line 163
    invoke-virtual {v10, v5}, Lorg/spongycastle/math/ec/ECPoint;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 164
    .line 165
    .line 166
    move-result-object v10

    .line 167
    aput-object v10, v6, v8

    .line 168
    .line 169
    move v8, v3

    .line 170
    goto :goto_2

    .line 171
    :cond_6
    :goto_3
    sub-int v3, p1, v7

    .line 172
    .line 173
    invoke-virtual {v0, v6, v7, v3, v9}, Lorg/spongycastle/math/ec/ECCurve;->normalizeAll([Lorg/spongycastle/math/ec/ECPoint;IILorg/spongycastle/math/ec/ECFieldElement;)V

    .line 174
    .line 175
    .line 176
    :cond_7
    :goto_4
    invoke-virtual {v2, v6}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->setPreComp([Lorg/spongycastle/math/ec/ECPoint;)V

    .line 177
    .line 178
    .line 179
    if-eqz p2, :cond_b

    .line 180
    .line 181
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->getPreCompNeg()[Lorg/spongycastle/math/ec/ECPoint;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    if-nez p2, :cond_8

    .line 186
    .line 187
    new-array p2, p1, [Lorg/spongycastle/math/ec/ECPoint;

    .line 188
    .line 189
    goto :goto_5

    .line 190
    :cond_8
    array-length v4, p2

    .line 191
    if-ge v4, p1, :cond_9

    .line 192
    .line 193
    invoke-static {p2, p1}, Lorg/spongycastle/math/ec/WNafUtil;->resizeTable([Lorg/spongycastle/math/ec/ECPoint;I)[Lorg/spongycastle/math/ec/ECPoint;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    :cond_9
    :goto_5
    if-ge v4, p1, :cond_a

    .line 198
    .line 199
    aget-object v3, v6, v4

    .line 200
    .line 201
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->negate()Lorg/spongycastle/math/ec/ECPoint;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    aput-object v3, p2, v4

    .line 206
    .line 207
    add-int/lit8 v4, v4, 0x1

    .line 208
    .line 209
    goto :goto_5

    .line 210
    :cond_a
    invoke-virtual {v2, p2}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->setPreCompNeg([Lorg/spongycastle/math/ec/ECPoint;)V

    .line 211
    .line 212
    .line 213
    :cond_b
    invoke-virtual {v0, p0, v1, v2}, Lorg/spongycastle/math/ec/ECCurve;->setPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;Lorg/spongycastle/math/ec/PreCompInfo;)V

    .line 214
    .line 215
    .line 216
    return-object v2
.end method

.method private static resizeTable([Lorg/spongycastle/math/ec/ECPoint;I)[Lorg/spongycastle/math/ec/ECPoint;
    .locals 2

    .line 1
    new-array p1, p1, [Lorg/spongycastle/math/ec/ECPoint;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    array-length v1, p0

    .line 5
    invoke-static {p0, v0, p1, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method private static trim([BI)[B
    .locals 2

    .line 1
    new-array v0, p1, [B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method private static trim([II)[I
    .locals 2

    .line 8
    new-array v0, p1, [I

    const/4 v1, 0x0

    .line 9
    invoke-static {p0, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

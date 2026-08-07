.class final Lorg/spongycastle/pqc/crypto/mceliece/Conversions;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ONE:Ljava/math/BigInteger;

.field private static final ZERO:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/pqc/crypto/mceliece/Conversions;->ZERO:Ljava/math/BigInteger;

    .line 8
    .line 9
    const-wide/16 v0, 0x1

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lorg/spongycastle/pqc/crypto/mceliece/Conversions;->ONE:Ljava/math/BigInteger;

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static decode(IILorg/spongycastle/pqc/math/linearalgebra/GF2Vector;)[B
    .locals 7

    .line 1
    invoke-virtual {p2}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->getLength()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ne v0, p0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getHammingWeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne v0, p1, :cond_3

    .line 12
    .line 13
    invoke-virtual {p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->binomial(II)Ljava/math/BigInteger;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lorg/spongycastle/pqc/crypto/mceliece/Conversions;->ZERO:Ljava/math/BigInteger;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    move v3, p0

    .line 25
    :goto_0
    if-ge v2, p0, :cond_2

    .line 26
    .line 27
    sub-int v4, v3, p1

    .line 28
    .line 29
    int-to-long v4, v4

    .line 30
    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v0, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    int-to-long v4, v3

    .line 39
    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v0, v4}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    add-int/lit8 v3, v3, -0x1

    .line 48
    .line 49
    shr-int/lit8 v4, v2, 0x5

    .line 50
    .line 51
    aget v4, p2, v4

    .line 52
    .line 53
    and-int/lit8 v5, v2, 0x1f

    .line 54
    .line 55
    const/4 v6, 0x1

    .line 56
    shl-int v5, v6, v5

    .line 57
    .line 58
    and-int/2addr v4, v5

    .line 59
    if-eqz v4, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    add-int/lit8 v4, p1, -0x1

    .line 66
    .line 67
    if-ne v3, v4, :cond_0

    .line 68
    .line 69
    sget-object p1, Lorg/spongycastle/pqc/crypto/mceliece/Conversions;->ONE:Ljava/math/BigInteger;

    .line 70
    .line 71
    :goto_1
    move-object v0, p1

    .line 72
    move p1, v4

    .line 73
    goto :goto_2

    .line 74
    :cond_0
    int-to-long v5, p1

    .line 75
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sub-int v0, v3, v4

    .line 84
    .line 85
    int-to-long v5, v0

    .line 86
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    goto :goto_1

    .line 95
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    invoke-static {v1}, Lorg/spongycastle/pqc/math/linearalgebra/BigIntUtils;->toMinimalByteArray(Ljava/math/BigInteger;)[B

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_3
    const-string p0, "vector has wrong length or hamming weight"

    .line 104
    .line 105
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const/4 p0, 0x0

    .line 109
    return-object p0
.end method

.method public static encode(II[B)Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-lt p0, p1, :cond_4

    .line 3
    .line 4
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->binomial(II)Ljava/math/BigInteger;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    new-instance v2, Ljava/math/BigInteger;

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-direct {v2, v3, p2}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-gez p2, :cond_3

    .line 19
    .line 20
    new-instance p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 21
    .line 22
    invoke-direct {p2, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(I)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    move v3, p0

    .line 27
    :goto_0
    if-ge v0, p0, :cond_2

    .line 28
    .line 29
    sub-int v4, v3, p1

    .line 30
    .line 31
    int-to-long v4, v4

    .line 32
    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    int-to-long v4, v3

    .line 41
    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v1, v4}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    add-int/lit8 v3, v3, -0x1

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-gtz v4, :cond_1

    .line 56
    .line 57
    invoke-virtual {p2, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->setBit(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    add-int/lit8 v4, p1, -0x1

    .line 65
    .line 66
    if-ne v3, v4, :cond_0

    .line 67
    .line 68
    sget-object p1, Lorg/spongycastle/pqc/crypto/mceliece/Conversions;->ONE:Ljava/math/BigInteger;

    .line 69
    .line 70
    :goto_1
    move-object v1, p1

    .line 71
    move p1, v4

    .line 72
    goto :goto_2

    .line 73
    :cond_0
    int-to-long v5, p1

    .line 74
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v1, p1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    sub-int v1, v3, v4

    .line 83
    .line 84
    int-to-long v5, v1

    .line 85
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {p1, v1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    goto :goto_1

    .line 94
    :cond_1
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    return-object p2

    .line 98
    :cond_3
    const-string p0, "Encoded number too large."

    .line 99
    .line 100
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v0

    .line 104
    :cond_4
    const-string p0, "n < t"

    .line 105
    .line 106
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-object v0
.end method

.method public static signConversion(II[B)[B
    .locals 10

    .line 1
    if-lt p0, p1, :cond_9

    .line 2
    .line 3
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->binomial(II)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    sub-int/2addr v1, v2

    .line 13
    shr-int/lit8 v3, v1, 0x3

    .line 14
    .line 15
    and-int/lit8 v1, v1, 0x7

    .line 16
    .line 17
    const/16 v4, 0x8

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    add-int/lit8 v3, v3, -0x1

    .line 22
    .line 23
    move v1, v4

    .line 24
    :cond_0
    shr-int/lit8 v5, p0, 0x3

    .line 25
    .line 26
    and-int/lit8 v6, p0, 0x7

    .line 27
    .line 28
    if-nez v6, :cond_1

    .line 29
    .line 30
    add-int/lit8 v5, v5, -0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move v4, v6

    .line 34
    :goto_0
    add-int/lit8 v6, v5, 0x1

    .line 35
    .line 36
    new-array v7, v6, [B

    .line 37
    .line 38
    array-length v8, p2

    .line 39
    const/4 v9, 0x0

    .line 40
    if-ge v8, v6, :cond_2

    .line 41
    .line 42
    array-length v4, p2

    .line 43
    invoke-static {p2, v9, v7, v9, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    array-length p2, p2

    .line 47
    :goto_1
    if-ge p2, v6, :cond_3

    .line 48
    .line 49
    aput-byte v9, v7, p2

    .line 50
    .line 51
    add-int/lit8 p2, p2, 0x1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    invoke-static {p2, v9, v7, v9, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    shl-int v4, v2, v4

    .line 58
    .line 59
    sub-int/2addr v4, v2

    .line 60
    aget-byte p2, p2, v5

    .line 61
    .line 62
    and-int/2addr p2, v4

    .line 63
    int-to-byte p2, p2

    .line 64
    aput-byte p2, v7, v5

    .line 65
    .line 66
    :cond_3
    sget-object p2, Lorg/spongycastle/pqc/crypto/mceliece/Conversions;->ZERO:Ljava/math/BigInteger;

    .line 67
    .line 68
    move v5, p0

    .line 69
    move v4, v9

    .line 70
    :goto_2
    if-ge v4, p0, :cond_6

    .line 71
    .line 72
    new-instance v6, Ljava/math/BigInteger;

    .line 73
    .line 74
    sub-int v8, v5, p1

    .line 75
    .line 76
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    invoke-direct {v6, v8}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v6, Ljava/math/BigInteger;

    .line 88
    .line 89
    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    invoke-direct {v6, v8}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    add-int/lit8 v5, v5, -0x1

    .line 101
    .line 102
    ushr-int/lit8 v6, v4, 0x3

    .line 103
    .line 104
    and-int/lit8 v8, v4, 0x7

    .line 105
    .line 106
    shl-int v8, v2, v8

    .line 107
    .line 108
    aget-byte v6, v7, v6

    .line 109
    .line 110
    and-int/2addr v6, v8

    .line 111
    int-to-byte v6, v6

    .line 112
    if-eqz v6, :cond_5

    .line 113
    .line 114
    invoke-virtual {p2, v0}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    add-int/lit8 v6, p1, -0x1

    .line 119
    .line 120
    if-ne v5, v6, :cond_4

    .line 121
    .line 122
    sget-object p1, Lorg/spongycastle/pqc/crypto/mceliece/Conversions;->ONE:Ljava/math/BigInteger;

    .line 123
    .line 124
    :goto_3
    move-object v0, p1

    .line 125
    move p1, v6

    .line 126
    goto :goto_4

    .line 127
    :cond_4
    new-instance v8, Ljava/math/BigInteger;

    .line 128
    .line 129
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-direct {v8, p1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    new-instance v0, Ljava/math/BigInteger;

    .line 141
    .line 142
    sub-int v8, v5, v6

    .line 143
    .line 144
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    invoke-direct {v0, v8}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    goto :goto_3

    .line 156
    :cond_5
    :goto_4
    add-int/lit8 v4, v4, 0x1

    .line 157
    .line 158
    goto :goto_2

    .line 159
    :cond_6
    add-int/lit8 p0, v3, 0x1

    .line 160
    .line 161
    new-array p1, p0, [B

    .line 162
    .line 163
    invoke-virtual {p2}, Ljava/math/BigInteger;->toByteArray()[B

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    array-length v0, p2

    .line 168
    if-ge v0, p0, :cond_8

    .line 169
    .line 170
    array-length v0, p2

    .line 171
    invoke-static {p2, v9, p1, v9, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 172
    .line 173
    .line 174
    array-length p2, p2

    .line 175
    :goto_5
    if-ge p2, p0, :cond_7

    .line 176
    .line 177
    aput-byte v9, p1, p2

    .line 178
    .line 179
    add-int/lit8 p2, p2, 0x1

    .line 180
    .line 181
    goto :goto_5

    .line 182
    :cond_7
    return-object p1

    .line 183
    :cond_8
    invoke-static {p2, v9, p1, v9, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 184
    .line 185
    .line 186
    shl-int p0, v2, v1

    .line 187
    .line 188
    sub-int/2addr p0, v2

    .line 189
    aget-byte p2, p2, v3

    .line 190
    .line 191
    and-int/2addr p0, p2

    .line 192
    int-to-byte p0, p0

    .line 193
    aput-byte p0, p1, v3

    .line 194
    .line 195
    return-object p1

    .line 196
    :cond_9
    const-string p0, "n < t"

    .line 197
    .line 198
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    const/4 p0, 0x0

    .line 202
    return-object p0
.end method

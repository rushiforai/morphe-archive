.class public Lorg/spongycastle/crypto/generators/DSAParametersGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ONE:Ljava/math/BigInteger;

.field private static final TWO:Ljava/math/BigInteger;

.field private static final ZERO:Ljava/math/BigInteger;


# instance fields
.field private L:I

.field private N:I

.field private certainty:I

.field private digest:Lorg/spongycastle/crypto/Digest;

.field private iterations:I

.field private random:Ljava/security/SecureRandom;

.field private usageIndex:I

.field private use186_3:Z


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
    sput-object v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->ZERO:Ljava/math/BigInteger;

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
    sput-object v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 16
    .line 17
    const-wide/16 v0, 0x2

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA1Digest;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    return-void
.end method

.method private static calculateGenerator_FIPS186_2(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;
    .locals 4

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :cond_0
    sget-object v1, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 18
    .line 19
    invoke-static {v1, v0, p2}, Lorg/spongycastle/util/BigIntegers;->createRandomInRange(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, p1, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

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
    const/4 v3, 0x1

    .line 32
    if-le v2, v3, :cond_0

    .line 33
    .line 34
    return-object v1
.end method

.method private static calculateGenerator_FIPS186_3_Unverifiable(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->calculateGenerator_FIPS186_2(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static calculateGenerator_FIPS186_3_Verifiable(Lorg/spongycastle/crypto/Digest;Ljava/math/BigInteger;Ljava/math/BigInteger;[BI)Ljava/math/BigInteger;
    .locals 5

    .line 1
    sget-object v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v0, "6767656E"

    .line 12
    .line 13
    invoke-static {v0}, Lorg/spongycastle/util/encoders/Hex;->decode(Ljava/lang/String;)[B

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    array-length v1, p3

    .line 18
    array-length v2, v0

    .line 19
    add-int/2addr v1, v2

    .line 20
    add-int/lit8 v2, v1, 0x3

    .line 21
    .line 22
    new-array v2, v2, [B

    .line 23
    .line 24
    array-length v3, p3

    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-static {p3, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    array-length p3, p3

    .line 30
    array-length v3, v0

    .line 31
    invoke-static {v0, v4, v2, p3, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    int-to-byte p3, p4

    .line 35
    aput-byte p3, v2, v1

    .line 36
    .line 37
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    new-array p3, p3, [B

    .line 42
    .line 43
    const/4 p4, 0x1

    .line 44
    move v0, p4

    .line 45
    :goto_0
    const/high16 v1, 0x10000

    .line 46
    .line 47
    if-ge v0, v1, :cond_1

    .line 48
    .line 49
    invoke-static {v2}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->inc([B)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0, v2, p3, v4}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ljava/math/BigInteger;

    .line 56
    .line 57
    invoke-direct {v1, p4, p3}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p2, p1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget-object v3, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->TWO:Ljava/math/BigInteger;

    .line 65
    .line 66
    invoke-virtual {v1, v3}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-ltz v3, :cond_0

    .line 71
    .line 72
    return-object v1

    .line 73
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/4 p0, 0x0

    .line 77
    return-object p0
.end method

.method private generateParameters_FIPS186_2()Lorg/spongycastle/crypto/params/DSAParameters;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x14

    .line 4
    .line 5
    new-array v2, v1, [B

    .line 6
    .line 7
    new-array v3, v1, [B

    .line 8
    .line 9
    new-array v4, v1, [B

    .line 10
    .line 11
    new-array v5, v1, [B

    .line 12
    .line 13
    iget v6, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->L:I

    .line 14
    .line 15
    add-int/lit8 v7, v6, -0x1

    .line 16
    .line 17
    div-int/lit16 v7, v7, 0xa0

    .line 18
    .line 19
    div-int/lit8 v6, v6, 0x8

    .line 20
    .line 21
    new-array v8, v6, [B

    .line 22
    .line 23
    iget-object v9, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 24
    .line 25
    instance-of v9, v9, Lorg/spongycastle/crypto/digests/SHA1Digest;

    .line 26
    .line 27
    if-eqz v9, :cond_6

    .line 28
    .line 29
    :cond_0
    :goto_0
    iget-object v9, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 30
    .line 31
    invoke-virtual {v9, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 32
    .line 33
    .line 34
    iget-object v9, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 35
    .line 36
    const/4 v10, 0x0

    .line 37
    invoke-static {v9, v2, v3, v10}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2, v10, v4, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    invoke-static {v4}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->inc([B)V

    .line 44
    .line 45
    .line 46
    iget-object v9, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 47
    .line 48
    invoke-static {v9, v4, v4, v10}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 49
    .line 50
    .line 51
    move v9, v10

    .line 52
    :goto_1
    if-eq v9, v1, :cond_1

    .line 53
    .line 54
    aget-byte v11, v3, v9

    .line 55
    .line 56
    aget-byte v12, v4, v9

    .line 57
    .line 58
    xor-int/2addr v11, v12

    .line 59
    int-to-byte v11, v11

    .line 60
    aput-byte v11, v5, v9

    .line 61
    .line 62
    add-int/lit8 v9, v9, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    aget-byte v9, v5, v10

    .line 66
    .line 67
    or-int/lit8 v9, v9, -0x80

    .line 68
    .line 69
    int-to-byte v9, v9

    .line 70
    aput-byte v9, v5, v10

    .line 71
    .line 72
    const/16 v9, 0x13

    .line 73
    .line 74
    aget-byte v11, v5, v9

    .line 75
    .line 76
    const/4 v12, 0x1

    .line 77
    or-int/2addr v11, v12

    .line 78
    int-to-byte v11, v11

    .line 79
    aput-byte v11, v5, v9

    .line 80
    .line 81
    new-instance v9, Ljava/math/BigInteger;

    .line 82
    .line 83
    invoke-direct {v9, v12, v5}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 84
    .line 85
    .line 86
    invoke-direct {v0, v9}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->isProbablePrime(Ljava/math/BigInteger;)Z

    .line 87
    .line 88
    .line 89
    move-result v11

    .line 90
    if-nez v11, :cond_2

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 94
    .line 95
    .line 96
    move-result-object v11

    .line 97
    invoke-static {v11}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->inc([B)V

    .line 98
    .line 99
    .line 100
    move v13, v10

    .line 101
    :goto_2
    const/16 v14, 0x1000

    .line 102
    .line 103
    if-ge v13, v14, :cond_0

    .line 104
    .line 105
    move v14, v12

    .line 106
    :goto_3
    if-gt v14, v7, :cond_3

    .line 107
    .line 108
    invoke-static {v11}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->inc([B)V

    .line 109
    .line 110
    .line 111
    iget-object v15, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 112
    .line 113
    mul-int/lit8 v16, v14, 0x14

    .line 114
    .line 115
    sub-int v1, v6, v16

    .line 116
    .line 117
    invoke-static {v15, v11, v8, v1}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 118
    .line 119
    .line 120
    add-int/lit8 v14, v14, 0x1

    .line 121
    .line 122
    const/16 v1, 0x14

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_3
    mul-int/lit8 v1, v7, 0x14

    .line 126
    .line 127
    sub-int v1, v6, v1

    .line 128
    .line 129
    invoke-static {v11}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->inc([B)V

    .line 130
    .line 131
    .line 132
    iget-object v14, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 133
    .line 134
    invoke-static {v14, v11, v3, v10}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 135
    .line 136
    .line 137
    rsub-int/lit8 v14, v1, 0x14

    .line 138
    .line 139
    invoke-static {v3, v14, v8, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 140
    .line 141
    .line 142
    aget-byte v1, v8, v10

    .line 143
    .line 144
    or-int/lit8 v1, v1, -0x80

    .line 145
    .line 146
    int-to-byte v1, v1

    .line 147
    aput-byte v1, v8, v10

    .line 148
    .line 149
    new-instance v1, Ljava/math/BigInteger;

    .line 150
    .line 151
    invoke-direct {v1, v12, v8}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v9, v12}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 155
    .line 156
    .line 157
    move-result-object v14

    .line 158
    invoke-virtual {v1, v14}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 159
    .line 160
    .line 161
    move-result-object v14

    .line 162
    sget-object v15, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 163
    .line 164
    invoke-virtual {v14, v15}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 165
    .line 166
    .line 167
    move-result-object v14

    .line 168
    invoke-virtual {v1, v14}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    .line 173
    .line 174
    .line 175
    move-result v14

    .line 176
    iget v15, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->L:I

    .line 177
    .line 178
    if-eq v14, v15, :cond_4

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_4
    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->isProbablePrime(Ljava/math/BigInteger;)Z

    .line 182
    .line 183
    .line 184
    move-result v14

    .line 185
    if-eqz v14, :cond_5

    .line 186
    .line 187
    iget-object v0, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 188
    .line 189
    invoke-static {v1, v9, v0}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->calculateGenerator_FIPS186_2(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    new-instance v3, Lorg/spongycastle/crypto/params/DSAParameters;

    .line 194
    .line 195
    new-instance v4, Lorg/spongycastle/crypto/params/DSAValidationParameters;

    .line 196
    .line 197
    invoke-direct {v4, v2, v13}, Lorg/spongycastle/crypto/params/DSAValidationParameters;-><init>([BI)V

    .line 198
    .line 199
    .line 200
    invoke-direct {v3, v1, v9, v0, v4}, Lorg/spongycastle/crypto/params/DSAParameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/DSAValidationParameters;)V

    .line 201
    .line 202
    .line 203
    return-object v3

    .line 204
    :cond_5
    :goto_4
    add-int/lit8 v13, v13, 0x1

    .line 205
    .line 206
    const/16 v1, 0x14

    .line 207
    .line 208
    goto :goto_2

    .line 209
    :cond_6
    const-string v0, "can only use SHA-1 for generating FIPS 186-2 parameters"

    .line 210
    .line 211
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    const/4 v0, 0x0

    .line 215
    return-object v0
.end method

.method private generateParameters_FIPS186_3()Lorg/spongycastle/crypto/params/DSAParameters;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 4
    .line 5
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    mul-int/lit8 v2, v2, 0x8

    .line 10
    .line 11
    iget v3, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->N:I

    .line 12
    .line 13
    div-int/lit8 v3, v3, 0x8

    .line 14
    .line 15
    new-array v3, v3, [B

    .line 16
    .line 17
    iget v4, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->L:I

    .line 18
    .line 19
    add-int/lit8 v5, v4, -0x1

    .line 20
    .line 21
    div-int/2addr v5, v2

    .line 22
    add-int/lit8 v6, v4, -0x1

    .line 23
    .line 24
    rem-int/2addr v6, v2

    .line 25
    div-int/lit8 v4, v4, 0x8

    .line 26
    .line 27
    new-array v2, v4, [B

    .line 28
    .line 29
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    new-array v7, v6, [B

    .line 34
    .line 35
    :cond_0
    :goto_0
    iget-object v8, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 36
    .line 37
    invoke-virtual {v8, v3}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 38
    .line 39
    .line 40
    const/4 v8, 0x0

    .line 41
    invoke-static {v1, v3, v7, v8}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 42
    .line 43
    .line 44
    new-instance v9, Ljava/math/BigInteger;

    .line 45
    .line 46
    const/4 v10, 0x1

    .line 47
    invoke-direct {v9, v10, v7}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 48
    .line 49
    .line 50
    sget-object v11, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 51
    .line 52
    iget v12, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->N:I

    .line 53
    .line 54
    sub-int/2addr v12, v10

    .line 55
    invoke-virtual {v11, v12}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 56
    .line 57
    .line 58
    move-result-object v11

    .line 59
    invoke-virtual {v9, v11}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    invoke-virtual {v9, v8}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    .line 64
    .line 65
    .line 66
    move-result-object v9

    .line 67
    iget v11, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->N:I

    .line 68
    .line 69
    sub-int/2addr v11, v10

    .line 70
    invoke-virtual {v9, v11}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    .line 71
    .line 72
    .line 73
    move-result-object v9

    .line 74
    invoke-direct {v0, v9}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->isProbablePrime(Ljava/math/BigInteger;)Z

    .line 75
    .line 76
    .line 77
    move-result v11

    .line 78
    if-nez v11, :cond_1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 82
    .line 83
    .line 84
    move-result-object v11

    .line 85
    iget v12, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->L:I

    .line 86
    .line 87
    mul-int/lit8 v12, v12, 0x4

    .line 88
    .line 89
    move v13, v8

    .line 90
    :goto_1
    if-ge v13, v12, :cond_0

    .line 91
    .line 92
    move v14, v10

    .line 93
    :goto_2
    if-gt v14, v5, :cond_2

    .line 94
    .line 95
    invoke-static {v11}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->inc([B)V

    .line 96
    .line 97
    .line 98
    mul-int v15, v14, v6

    .line 99
    .line 100
    sub-int v15, v4, v15

    .line 101
    .line 102
    invoke-static {v1, v11, v2, v15}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 103
    .line 104
    .line 105
    add-int/lit8 v14, v14, 0x1

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    mul-int v14, v5, v6

    .line 109
    .line 110
    sub-int v14, v4, v14

    .line 111
    .line 112
    invoke-static {v11}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->inc([B)V

    .line 113
    .line 114
    .line 115
    invoke-static {v1, v11, v7, v8}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 116
    .line 117
    .line 118
    sub-int v15, v6, v14

    .line 119
    .line 120
    invoke-static {v7, v15, v2, v8, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 121
    .line 122
    .line 123
    aget-byte v14, v2, v8

    .line 124
    .line 125
    or-int/lit8 v14, v14, -0x80

    .line 126
    .line 127
    int-to-byte v14, v14

    .line 128
    aput-byte v14, v2, v8

    .line 129
    .line 130
    new-instance v14, Ljava/math/BigInteger;

    .line 131
    .line 132
    invoke-direct {v14, v10, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v9, v10}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 136
    .line 137
    .line 138
    move-result-object v15

    .line 139
    invoke-virtual {v14, v15}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 140
    .line 141
    .line 142
    move-result-object v15

    .line 143
    sget-object v8, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->ONE:Ljava/math/BigInteger;

    .line 144
    .line 145
    invoke-virtual {v15, v8}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 146
    .line 147
    .line 148
    move-result-object v8

    .line 149
    invoke-virtual {v14, v8}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 150
    .line 151
    .line 152
    move-result-object v8

    .line 153
    invoke-virtual {v8}, Ljava/math/BigInteger;->bitLength()I

    .line 154
    .line 155
    .line 156
    move-result v14

    .line 157
    iget v15, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->L:I

    .line 158
    .line 159
    if-eq v14, v15, :cond_3

    .line 160
    .line 161
    goto :goto_3

    .line 162
    :cond_3
    invoke-direct {v0, v8}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->isProbablePrime(Ljava/math/BigInteger;)Z

    .line 163
    .line 164
    .line 165
    move-result v14

    .line 166
    if-eqz v14, :cond_5

    .line 167
    .line 168
    iget v2, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->usageIndex:I

    .line 169
    .line 170
    if-ltz v2, :cond_4

    .line 171
    .line 172
    invoke-static {v1, v8, v9, v3, v2}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->calculateGenerator_FIPS186_3_Verifiable(Lorg/spongycastle/crypto/Digest;Ljava/math/BigInteger;Ljava/math/BigInteger;[BI)Ljava/math/BigInteger;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    if-eqz v1, :cond_4

    .line 177
    .line 178
    new-instance v2, Lorg/spongycastle/crypto/params/DSAParameters;

    .line 179
    .line 180
    new-instance v4, Lorg/spongycastle/crypto/params/DSAValidationParameters;

    .line 181
    .line 182
    iget v0, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->usageIndex:I

    .line 183
    .line 184
    invoke-direct {v4, v3, v13, v0}, Lorg/spongycastle/crypto/params/DSAValidationParameters;-><init>([BII)V

    .line 185
    .line 186
    .line 187
    invoke-direct {v2, v8, v9, v1, v4}, Lorg/spongycastle/crypto/params/DSAParameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/DSAValidationParameters;)V

    .line 188
    .line 189
    .line 190
    return-object v2

    .line 191
    :cond_4
    iget-object v0, v0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 192
    .line 193
    invoke-static {v8, v9, v0}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->calculateGenerator_FIPS186_3_Unverifiable(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    new-instance v1, Lorg/spongycastle/crypto/params/DSAParameters;

    .line 198
    .line 199
    new-instance v2, Lorg/spongycastle/crypto/params/DSAValidationParameters;

    .line 200
    .line 201
    invoke-direct {v2, v3, v13}, Lorg/spongycastle/crypto/params/DSAValidationParameters;-><init>([BI)V

    .line 202
    .line 203
    .line 204
    invoke-direct {v1, v8, v9, v0, v2}, Lorg/spongycastle/crypto/params/DSAParameters;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/params/DSAValidationParameters;)V

    .line 205
    .line 206
    .line 207
    return-object v1

    .line 208
    :cond_5
    :goto_3
    add-int/lit8 v13, v13, 0x1

    .line 209
    .line 210
    const/4 v8, 0x0

    .line 211
    goto :goto_1
.end method

.method private static getDefaultN(I)I
    .locals 1

    const/16 v0, 0x400

    if-le p0, v0, :cond_0

    const/16 p0, 0x100

    return p0

    :cond_0
    const/16 p0, 0xa0

    return p0
.end method

.method private static getMinimumIterations(I)I
    .locals 1

    .line 1
    const/16 v0, 0x400

    .line 2
    .line 3
    if-gt p0, v0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x28

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    add-int/lit8 p0, p0, -0x1

    .line 9
    .line 10
    div-int/2addr p0, v0

    .line 11
    mul-int/lit8 p0, p0, 0x8

    .line 12
    .line 13
    add-int/lit8 p0, p0, 0x30

    .line 14
    .line 15
    return p0
.end method

.method private static hash(Lorg/spongycastle/crypto/Digest;[B[BI)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p1

    .line 3
    invoke-interface {p0, p1, v0, v1}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, p2, p3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static inc([B)V
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, -0x1

    .line 3
    .line 4
    :goto_0
    if-ltz v0, :cond_1

    .line 5
    .line 6
    aget-byte v1, p0, v0

    .line 7
    .line 8
    add-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    and-int/lit16 v1, v1, 0xff

    .line 11
    .line 12
    int-to-byte v1, v1

    .line 13
    aput-byte v1, p0, v0

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    :goto_1
    return-void
.end method

.method private isProbablePrime(Ljava/math/BigInteger;)Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->certainty:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/math/BigInteger;->isProbablePrime(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method


# virtual methods
.method public generateParameters()Lorg/spongycastle/crypto/params/DSAParameters;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->use186_3:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->generateParameters_FIPS186_3()Lorg/spongycastle/crypto/params/DSAParameters;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->generateParameters_FIPS186_2()Lorg/spongycastle/crypto/params/DSAParameters;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public init(IILjava/security/SecureRandom;)V
    .locals 0

    .line 127
    iput p1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->L:I

    .line 128
    invoke-static {p1}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->getDefaultN(I)I

    move-result p1

    iput p1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->N:I

    .line 129
    iput p2, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->certainty:I

    .line 130
    iget p1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->L:I

    invoke-static {p1}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->getMinimumIterations(I)I

    move-result p1

    add-int/lit8 p2, p2, 0x1

    div-int/lit8 p2, p2, 0x2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->iterations:I

    .line 131
    iput-object p3, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->random:Ljava/security/SecureRandom;

    const/4 p1, 0x0

    .line 132
    iput-boolean p1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->use186_3:Z

    const/4 p1, -0x1

    .line 133
    iput p1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->usageIndex:I

    return-void
.end method

.method public init(Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->getL()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->getN()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/16 v2, 0x400

    .line 10
    .line 11
    if-lt v0, v2, :cond_7

    .line 12
    .line 13
    const/16 v3, 0xc00

    .line 14
    .line 15
    if-gt v0, v3, :cond_7

    .line 16
    .line 17
    rem-int/lit16 v4, v0, 0x400

    .line 18
    .line 19
    if-nez v4, :cond_7

    .line 20
    .line 21
    if-ne v0, v2, :cond_1

    .line 22
    .line 23
    const/16 v2, 0xa0

    .line 24
    .line 25
    if-ne v1, v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p0, "N must be 160 for L = 1024"

    .line 29
    .line 30
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    :goto_0
    const/16 v2, 0x800

    .line 35
    .line 36
    const/16 v4, 0x100

    .line 37
    .line 38
    if-ne v0, v2, :cond_3

    .line 39
    .line 40
    const/16 v2, 0xe0

    .line 41
    .line 42
    if-eq v1, v2, :cond_3

    .line 43
    .line 44
    if-ne v1, v4, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const-string p0, "N must be 224 or 256 for L = 2048"

    .line 48
    .line 49
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    :goto_1
    if-ne v0, v3, :cond_5

    .line 54
    .line 55
    if-ne v1, v4, :cond_4

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_4
    const-string p0, "N must be 256 for L = 3072"

    .line 59
    .line 60
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_5
    :goto_2
    iget-object v2, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 65
    .line 66
    invoke-interface {v2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    mul-int/lit8 v2, v2, 0x8

    .line 71
    .line 72
    if-lt v2, v1, :cond_6

    .line 73
    .line 74
    iput v0, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->L:I

    .line 75
    .line 76
    iput v1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->N:I

    .line 77
    .line 78
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->getCertainty()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    iput v1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->certainty:I

    .line 83
    .line 84
    invoke-static {v0}, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->getMinimumIterations(I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iget v1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->certainty:I

    .line 89
    .line 90
    const/4 v2, 0x1

    .line 91
    add-int/2addr v1, v2

    .line 92
    div-int/lit8 v1, v1, 0x2

    .line 93
    .line 94
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->iterations:I

    .line 99
    .line 100
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->getRandom()Ljava/security/SecureRandom;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->random:Ljava/security/SecureRandom;

    .line 105
    .line 106
    iput-boolean v2, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->use186_3:Z

    .line 107
    .line 108
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/DSAParameterGenerationParameters;->getUsageIndex()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iput p1, p0, Lorg/spongycastle/crypto/generators/DSAParametersGenerator;->usageIndex:I

    .line 113
    .line 114
    return-void

    .line 115
    :cond_6
    const-string p0, "Digest output size too small for value of N"

    .line 116
    .line 117
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_7
    const-string p0, "L values must be between 1024 and 3072 and a multiple of 1024"

    .line 122
    .line 123
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

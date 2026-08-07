.class public abstract Lorg/spongycastle/math/Primes;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/math/Primes$STOutput;,
        Lorg/spongycastle/math/Primes$MROutput;
    }
.end annotation


# static fields
.field private static final ONE:Ljava/math/BigInteger;

.field public static final SMALL_FACTOR_LIMIT:I = 0xd3

.field private static final THREE:Ljava/math/BigInteger;

.field private static final TWO:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 8
    .line 9
    const-wide/16 v0, 0x2

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 16
    .line 17
    const-wide/16 v0, 0x3

    .line 18
    .line 19
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lorg/spongycastle/math/Primes;->THREE:Ljava/math/BigInteger;

    .line 24
    .line 25
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

.method private static checkCandidate(Ljava/math/BigInteger;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-lt v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 v0, 0x2

    .line 15
    if-lt p0, v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p0, "\'"

    .line 19
    .line 20
    const-string v0, "\' must be non-null and >= 2"

    .line 21
    .line 22
    invoke-static {p0, p1, v0}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static enhancedMRProbablePrimeTest(Ljava/math/BigInteger;Ljava/security/SecureRandom;I)Lorg/spongycastle/math/Primes$MROutput;
    .locals 11

    .line 1
    const-string v0, "candidate"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lorg/spongycastle/math/Primes;->checkCandidate(Ljava/math/BigInteger;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_d

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-lt p2, v1, :cond_c

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x2

    .line 17
    if-ne v0, v2, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lorg/spongycastle/math/Primes$MROutput;->access$000()Lorg/spongycastle/math/Primes$MROutput;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->testBit(I)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    sget-object p0, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 32
    .line 33
    invoke-static {p0}, Lorg/spongycastle/math/Primes$MROutput;->access$100(Ljava/math/BigInteger;)Lorg/spongycastle/math/Primes$MROutput;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    sget-object v2, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget-object v3, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 45
    .line 46
    invoke-virtual {p0, v3}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v2}, Ljava/math/BigInteger;->getLowestSetBit()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    move v6, v0

    .line 59
    :goto_0
    if-ge v6, p2, :cond_b

    .line 60
    .line 61
    sget-object v7, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 62
    .line 63
    invoke-static {v7, v3, p1}, Lorg/spongycastle/util/BigIntegers;->createRandomInRange(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {v7, p0}, Ljava/math/BigInteger;->gcd(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 68
    .line 69
    .line 70
    move-result-object v8

    .line 71
    sget-object v9, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 72
    .line 73
    invoke-virtual {v8, v9}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 74
    .line 75
    .line 76
    move-result v10

    .line 77
    if-lez v10, :cond_2

    .line 78
    .line 79
    invoke-static {v8}, Lorg/spongycastle/math/Primes$MROutput;->access$100(Ljava/math/BigInteger;)Lorg/spongycastle/math/Primes$MROutput;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_2
    invoke-virtual {v7, v5, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    invoke-virtual {v7, v9}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    if-nez v8, :cond_a

    .line 93
    .line 94
    invoke-virtual {v7, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v8

    .line 98
    if-eqz v8, :cond_3

    .line 99
    .line 100
    goto :goto_4

    .line 101
    :cond_3
    move v8, v1

    .line 102
    :goto_1
    if-ge v8, v4, :cond_6

    .line 103
    .line 104
    sget-object v9, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 105
    .line 106
    invoke-virtual {v7, v9, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 107
    .line 108
    .line 109
    move-result-object v9

    .line 110
    invoke-virtual {v9, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v10

    .line 114
    if-eqz v10, :cond_4

    .line 115
    .line 116
    move v8, v1

    .line 117
    goto :goto_2

    .line 118
    :cond_4
    sget-object v10, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 119
    .line 120
    invoke-virtual {v9, v10}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v10

    .line 124
    if-eqz v10, :cond_5

    .line 125
    .line 126
    move v8, v0

    .line 127
    goto :goto_2

    .line 128
    :cond_5
    add-int/lit8 v8, v8, 0x1

    .line 129
    .line 130
    move-object v7, v9

    .line 131
    goto :goto_1

    .line 132
    :cond_6
    move v8, v0

    .line 133
    move-object v9, v7

    .line 134
    :goto_2
    if-nez v8, :cond_a

    .line 135
    .line 136
    sget-object p1, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 137
    .line 138
    invoke-virtual {v9, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    if-nez p2, :cond_8

    .line 143
    .line 144
    sget-object p2, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 145
    .line 146
    invoke-virtual {v9, p2, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    invoke-virtual {v7, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    if-nez p2, :cond_7

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_7
    move-object v7, v9

    .line 158
    :cond_8
    :goto_3
    invoke-virtual {v7, p1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {p2, p0}, Ljava/math/BigInteger;->gcd(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-lez p1, :cond_9

    .line 171
    .line 172
    invoke-static {p0}, Lorg/spongycastle/math/Primes$MROutput;->access$100(Ljava/math/BigInteger;)Lorg/spongycastle/math/Primes$MROutput;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    return-object p0

    .line 177
    :cond_9
    invoke-static {}, Lorg/spongycastle/math/Primes$MROutput;->access$200()Lorg/spongycastle/math/Primes$MROutput;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    return-object p0

    .line 182
    :cond_a
    :goto_4
    add-int/lit8 v6, v6, 0x1

    .line 183
    .line 184
    goto :goto_0

    .line 185
    :cond_b
    invoke-static {}, Lorg/spongycastle/math/Primes$MROutput;->access$000()Lorg/spongycastle/math/Primes$MROutput;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    return-object p0

    .line 190
    :cond_c
    const-string p0, "\'iterations\' must be > 0"

    .line 191
    .line 192
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-object v0

    .line 196
    :cond_d
    const-string p0, "\'random\' cannot be null"

    .line 197
    .line 198
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    return-object v0
.end method

.method private static extract32([B)I
    .locals 5

    .line 1
    const/4 v0, 0x4

    .line 2
    array-length v1, p0

    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v1, v0, :cond_0

    .line 10
    .line 11
    array-length v3, p0

    .line 12
    add-int/lit8 v4, v1, 0x1

    .line 13
    .line 14
    sub-int/2addr v3, v4

    .line 15
    aget-byte v3, p0, v3

    .line 16
    .line 17
    and-int/lit16 v3, v3, 0xff

    .line 18
    .line 19
    mul-int/lit8 v1, v1, 0x8

    .line 20
    .line 21
    shl-int v1, v3, v1

    .line 22
    .line 23
    or-int/2addr v2, v1

    .line 24
    move v1, v4

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return v2
.end method

.method public static generateSTRandomPrime(Lorg/spongycastle/crypto/Digest;I[B)Lorg/spongycastle/math/Primes$STOutput;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-lt p1, v1, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    array-length v1, p2

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-static {p2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/Primes;->implSTRandomPrime(Lorg/spongycastle/crypto/Digest;I[B)Lorg/spongycastle/math/Primes$STOutput;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    const-string p0, "\'inputSeed\' cannot be null or empty"

    .line 22
    .line 23
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    const-string p0, "\'length\' must be >= 2"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object v0

    .line 33
    :cond_2
    const-string p0, "\'hash\' cannot be null"

    .line 34
    .line 35
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method public static hasAnySmallFactors(Ljava/math/BigInteger;)Z
    .locals 1

    .line 1
    const-string v0, "candidate"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lorg/spongycastle/math/Primes;->checkCandidate(Ljava/math/BigInteger;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lorg/spongycastle/math/Primes;->implHasAnySmallFactors(Ljava/math/BigInteger;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
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

.method private static hashGen(Lorg/spongycastle/crypto/Digest;[BI)Ljava/math/BigInteger;
    .locals 5

    .line 1
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-int v1, p2, v0

    .line 6
    .line 7
    new-array v2, v1, [B

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    :goto_0
    const/4 v4, 0x1

    .line 11
    if-ge v3, p2, :cond_0

    .line 12
    .line 13
    sub-int/2addr v1, v0

    .line 14
    invoke-static {p0, p1, v2, v1}, Lorg/spongycastle/math/Primes;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, v4}, Lorg/spongycastle/math/Primes;->inc([BI)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    new-instance p0, Ljava/math/BigInteger;

    .line 24
    .line 25
    invoke-direct {p0, v4, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method private static implHasAnySmallFactors(Ljava/math/BigInteger;)Z
    .locals 3

    .line 1
    const-wide/32 v0, 0xd4c2086

    .line 2
    .line 3
    .line 4
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    rem-int/lit8 v1, v0, 0x2

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz v1, :cond_a

    .line 20
    .line 21
    rem-int/lit8 v1, v0, 0x3

    .line 22
    .line 23
    if-eqz v1, :cond_a

    .line 24
    .line 25
    rem-int/lit8 v1, v0, 0x5

    .line 26
    .line 27
    if-eqz v1, :cond_a

    .line 28
    .line 29
    rem-int/lit8 v1, v0, 0x7

    .line 30
    .line 31
    if-eqz v1, :cond_a

    .line 32
    .line 33
    rem-int/lit8 v1, v0, 0xb

    .line 34
    .line 35
    if-eqz v1, :cond_a

    .line 36
    .line 37
    rem-int/lit8 v1, v0, 0xd

    .line 38
    .line 39
    if-eqz v1, :cond_a

    .line 40
    .line 41
    rem-int/lit8 v1, v0, 0x11

    .line 42
    .line 43
    if-eqz v1, :cond_a

    .line 44
    .line 45
    rem-int/lit8 v1, v0, 0x13

    .line 46
    .line 47
    if-eqz v1, :cond_a

    .line 48
    .line 49
    rem-int/lit8 v0, v0, 0x17

    .line 50
    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :cond_0
    const-wide/32 v0, 0x37ed0ed

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    rem-int/lit8 v1, v0, 0x1d

    .line 71
    .line 72
    if-eqz v1, :cond_a

    .line 73
    .line 74
    rem-int/lit8 v1, v0, 0x1f

    .line 75
    .line 76
    if-eqz v1, :cond_a

    .line 77
    .line 78
    rem-int/lit8 v1, v0, 0x25

    .line 79
    .line 80
    if-eqz v1, :cond_a

    .line 81
    .line 82
    rem-int/lit8 v1, v0, 0x29

    .line 83
    .line 84
    if-eqz v1, :cond_a

    .line 85
    .line 86
    rem-int/lit8 v0, v0, 0x2b

    .line 87
    .line 88
    if-nez v0, :cond_1

    .line 89
    .line 90
    goto/16 :goto_0

    .line 91
    .line 92
    :cond_1
    const-wide/32 v0, 0x23cd611f

    .line 93
    .line 94
    .line 95
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    rem-int/lit8 v1, v0, 0x2f

    .line 108
    .line 109
    if-eqz v1, :cond_a

    .line 110
    .line 111
    rem-int/lit8 v1, v0, 0x35

    .line 112
    .line 113
    if-eqz v1, :cond_a

    .line 114
    .line 115
    rem-int/lit8 v1, v0, 0x3b

    .line 116
    .line 117
    if-eqz v1, :cond_a

    .line 118
    .line 119
    rem-int/lit8 v1, v0, 0x3d

    .line 120
    .line 121
    if-eqz v1, :cond_a

    .line 122
    .line 123
    rem-int/lit8 v0, v0, 0x43

    .line 124
    .line 125
    if-nez v0, :cond_2

    .line 126
    .line 127
    goto/16 :goto_0

    .line 128
    .line 129
    :cond_2
    const-wide/32 v0, 0x20691a3

    .line 130
    .line 131
    .line 132
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    rem-int/lit8 v1, v0, 0x47

    .line 145
    .line 146
    if-eqz v1, :cond_a

    .line 147
    .line 148
    rem-int/lit8 v1, v0, 0x49

    .line 149
    .line 150
    if-eqz v1, :cond_a

    .line 151
    .line 152
    rem-int/lit8 v1, v0, 0x4f

    .line 153
    .line 154
    if-eqz v1, :cond_a

    .line 155
    .line 156
    rem-int/lit8 v0, v0, 0x53

    .line 157
    .line 158
    if-nez v0, :cond_3

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_3
    const-wide/32 v0, 0x55a60cb

    .line 163
    .line 164
    .line 165
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    rem-int/lit8 v1, v0, 0x59

    .line 178
    .line 179
    if-eqz v1, :cond_a

    .line 180
    .line 181
    rem-int/lit8 v1, v0, 0x61

    .line 182
    .line 183
    if-eqz v1, :cond_a

    .line 184
    .line 185
    rem-int/lit8 v1, v0, 0x65

    .line 186
    .line 187
    if-eqz v1, :cond_a

    .line 188
    .line 189
    rem-int/lit8 v0, v0, 0x67

    .line 190
    .line 191
    if-nez v0, :cond_4

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :cond_4
    const-wide/32 v0, 0x9f9f361

    .line 196
    .line 197
    .line 198
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    rem-int/lit8 v1, v0, 0x6b

    .line 211
    .line 212
    if-eqz v1, :cond_a

    .line 213
    .line 214
    rem-int/lit8 v1, v0, 0x6d

    .line 215
    .line 216
    if-eqz v1, :cond_a

    .line 217
    .line 218
    rem-int/lit8 v1, v0, 0x71

    .line 219
    .line 220
    if-eqz v1, :cond_a

    .line 221
    .line 222
    rem-int/lit8 v0, v0, 0x7f

    .line 223
    .line 224
    if-nez v0, :cond_5

    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :cond_5
    const-wide/32 v0, 0x1627b25d

    .line 229
    .line 230
    .line 231
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    rem-int/lit16 v1, v0, 0x83

    .line 244
    .line 245
    if-eqz v1, :cond_a

    .line 246
    .line 247
    rem-int/lit16 v1, v0, 0x89

    .line 248
    .line 249
    if-eqz v1, :cond_a

    .line 250
    .line 251
    rem-int/lit16 v1, v0, 0x8b

    .line 252
    .line 253
    if-eqz v1, :cond_a

    .line 254
    .line 255
    rem-int/lit16 v0, v0, 0x95

    .line 256
    .line 257
    if-nez v0, :cond_6

    .line 258
    .line 259
    goto :goto_0

    .line 260
    :cond_6
    const-wide/32 v0, 0x2676ed77

    .line 261
    .line 262
    .line 263
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    rem-int/lit16 v1, v0, 0x97

    .line 276
    .line 277
    if-eqz v1, :cond_a

    .line 278
    .line 279
    rem-int/lit16 v1, v0, 0x9d

    .line 280
    .line 281
    if-eqz v1, :cond_a

    .line 282
    .line 283
    rem-int/lit16 v1, v0, 0xa3

    .line 284
    .line 285
    if-eqz v1, :cond_a

    .line 286
    .line 287
    rem-int/lit16 v0, v0, 0xa7

    .line 288
    .line 289
    if-nez v0, :cond_7

    .line 290
    .line 291
    goto :goto_0

    .line 292
    :cond_7
    const-wide/32 v0, 0x3fcf739d

    .line 293
    .line 294
    .line 295
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    rem-int/lit16 v1, v0, 0xad

    .line 308
    .line 309
    if-eqz v1, :cond_a

    .line 310
    .line 311
    rem-int/lit16 v1, v0, 0xb3

    .line 312
    .line 313
    if-eqz v1, :cond_a

    .line 314
    .line 315
    rem-int/lit16 v1, v0, 0xb5

    .line 316
    .line 317
    if-eqz v1, :cond_a

    .line 318
    .line 319
    rem-int/lit16 v0, v0, 0xbf

    .line 320
    .line 321
    if-nez v0, :cond_8

    .line 322
    .line 323
    goto :goto_0

    .line 324
    :cond_8
    const-wide/32 v0, 0x5f281a99

    .line 325
    .line 326
    .line 327
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    .line 336
    .line 337
    .line 338
    move-result p0

    .line 339
    rem-int/lit16 v0, p0, 0xc1

    .line 340
    .line 341
    if-eqz v0, :cond_a

    .line 342
    .line 343
    rem-int/lit16 v0, p0, 0xc5

    .line 344
    .line 345
    if-eqz v0, :cond_a

    .line 346
    .line 347
    rem-int/lit16 v0, p0, 0xc7

    .line 348
    .line 349
    if-eqz v0, :cond_a

    .line 350
    .line 351
    rem-int/lit16 p0, p0, 0xd3

    .line 352
    .line 353
    if-nez p0, :cond_9

    .line 354
    .line 355
    goto :goto_0

    .line 356
    :cond_9
    const/4 p0, 0x0

    .line 357
    return p0

    .line 358
    :cond_a
    :goto_0
    return v2
.end method

.method private static implMRProbablePrimeToBase(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;ILjava/math/BigInteger;)Z
    .locals 3

    .line 1
    invoke-virtual {p4, p2, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget-object p4, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 6
    .line 7
    invoke-virtual {p2, p4}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    const/4 v0, 0x1

    .line 12
    if-nez p4, :cond_4

    .line 13
    .line 14
    invoke-virtual {p2, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p4

    .line 18
    if-eqz p4, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    move p4, v0

    .line 22
    :goto_0
    const/4 v1, 0x0

    .line 23
    if-ge p4, p3, :cond_3

    .line 24
    .line 25
    sget-object v2, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 26
    .line 27
    invoke-virtual {p2, v2, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    return v0

    .line 38
    :cond_1
    sget-object v2, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 39
    .line 40
    invoke-virtual {p2, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    return v1

    .line 47
    :cond_2
    add-int/lit8 p4, p4, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    return v1

    .line 51
    :cond_4
    :goto_1
    return v0
.end method

.method private static implSTRandomPrime(Lorg/spongycastle/crypto/Digest;I[B)Lorg/spongycastle/math/Primes$STOutput;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/16 v4, 0x21

    .line 12
    .line 13
    const-string v5, "Too many iterations in Shawe-Taylor Random_Prime Routine"

    .line 14
    .line 15
    const/4 v6, 0x0

    .line 16
    const/4 v7, 0x0

    .line 17
    const/4 v8, 0x1

    .line 18
    if-ge v1, v4, :cond_2

    .line 19
    .line 20
    new-array v4, v3, [B

    .line 21
    .line 22
    new-array v3, v3, [B

    .line 23
    .line 24
    move v9, v7

    .line 25
    :goto_0
    invoke-static {v0, v2, v4, v7}, Lorg/spongycastle/math/Primes;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 26
    .line 27
    .line 28
    invoke-static {v2, v8}, Lorg/spongycastle/math/Primes;->inc([BI)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v2, v3, v7}, Lorg/spongycastle/math/Primes;->hash(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 32
    .line 33
    .line 34
    invoke-static {v2, v8}, Lorg/spongycastle/math/Primes;->inc([BI)V

    .line 35
    .line 36
    .line 37
    invoke-static {v4}, Lorg/spongycastle/math/Primes;->extract32([B)I

    .line 38
    .line 39
    .line 40
    move-result v10

    .line 41
    invoke-static {v3}, Lorg/spongycastle/math/Primes;->extract32([B)I

    .line 42
    .line 43
    .line 44
    move-result v11

    .line 45
    xor-int/2addr v10, v11

    .line 46
    rsub-int/lit8 v11, v1, 0x20

    .line 47
    .line 48
    const/4 v12, -0x1

    .line 49
    ushr-int v11, v12, v11

    .line 50
    .line 51
    and-int/2addr v10, v11

    .line 52
    add-int/lit8 v11, v1, -0x1

    .line 53
    .line 54
    shl-int v11, v8, v11

    .line 55
    .line 56
    or-int/2addr v11, v8

    .line 57
    or-int/2addr v10, v11

    .line 58
    add-int/2addr v9, v8

    .line 59
    int-to-long v10, v10

    .line 60
    const-wide v12, 0xffffffffL

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    and-long/2addr v10, v12

    .line 66
    invoke-static {v10, v11}, Lorg/spongycastle/math/Primes;->isPrime32(J)Z

    .line 67
    .line 68
    .line 69
    move-result v12

    .line 70
    if-eqz v12, :cond_0

    .line 71
    .line 72
    new-instance v0, Lorg/spongycastle/math/Primes$STOutput;

    .line 73
    .line 74
    invoke-static {v10, v11}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-direct {v0, v1, v2, v9, v6}, Lorg/spongycastle/math/Primes$STOutput;-><init>(Ljava/math/BigInteger;[BILorg/spongycastle/math/Primes$1;)V

    .line 79
    .line 80
    .line 81
    return-object v0

    .line 82
    :cond_0
    mul-int/lit8 v10, v1, 0x4

    .line 83
    .line 84
    if-gt v9, v10, :cond_1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    invoke-static {v5}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-object v6

    .line 91
    :cond_2
    add-int/lit8 v4, v1, 0x3

    .line 92
    .line 93
    div-int/lit8 v4, v4, 0x2

    .line 94
    .line 95
    invoke-static {v0, v4, v2}, Lorg/spongycastle/math/Primes;->implSTRandomPrime(Lorg/spongycastle/crypto/Digest;I[B)Lorg/spongycastle/math/Primes$STOutput;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Lorg/spongycastle/math/Primes$STOutput;->getPrime()Ljava/math/BigInteger;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-virtual {v2}, Lorg/spongycastle/math/Primes$STOutput;->getPrimeSeed()[B

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    invoke-virtual {v2}, Lorg/spongycastle/math/Primes$STOutput;->getPrimeGenCounter()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    mul-int/lit8 v3, v3, 0x8

    .line 112
    .line 113
    add-int/lit8 v10, v1, -0x1

    .line 114
    .line 115
    div-int v3, v10, v3

    .line 116
    .line 117
    add-int/2addr v3, v8

    .line 118
    invoke-static {v0, v9, v3}, Lorg/spongycastle/math/Primes;->hashGen(Lorg/spongycastle/crypto/Digest;[BI)Ljava/math/BigInteger;

    .line 119
    .line 120
    .line 121
    move-result-object v11

    .line 122
    sget-object v12, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 123
    .line 124
    invoke-virtual {v12, v10}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 125
    .line 126
    .line 127
    move-result-object v13

    .line 128
    invoke-virtual {v11, v13}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 129
    .line 130
    .line 131
    move-result-object v11

    .line 132
    invoke-virtual {v11, v10}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    .line 133
    .line 134
    .line 135
    move-result-object v11

    .line 136
    invoke-virtual {v4, v8}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 137
    .line 138
    .line 139
    move-result-object v13

    .line 140
    invoke-virtual {v11, v12}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 141
    .line 142
    .line 143
    move-result-object v11

    .line 144
    invoke-virtual {v11, v13}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 145
    .line 146
    .line 147
    move-result-object v11

    .line 148
    invoke-virtual {v11, v12}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 149
    .line 150
    .line 151
    move-result-object v11

    .line 152
    invoke-virtual {v11, v8}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 153
    .line 154
    .line 155
    move-result-object v11

    .line 156
    invoke-virtual {v11, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 157
    .line 158
    .line 159
    move-result-object v14

    .line 160
    invoke-virtual {v14, v12}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 161
    .line 162
    .line 163
    move-result-object v12

    .line 164
    move v14, v2

    .line 165
    move v15, v7

    .line 166
    :goto_1
    invoke-virtual {v12}, Ljava/math/BigInteger;->bitLength()I

    .line 167
    .line 168
    .line 169
    move-result v7

    .line 170
    if-le v7, v1, :cond_3

    .line 171
    .line 172
    sget-object v7, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 173
    .line 174
    invoke-virtual {v7, v10}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 175
    .line 176
    .line 177
    move-result-object v11

    .line 178
    invoke-virtual {v11, v7}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 179
    .line 180
    .line 181
    move-result-object v11

    .line 182
    invoke-virtual {v11, v13}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 183
    .line 184
    .line 185
    move-result-object v11

    .line 186
    invoke-virtual {v11, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 187
    .line 188
    .line 189
    move-result-object v11

    .line 190
    invoke-virtual {v11, v8}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    .line 191
    .line 192
    .line 193
    move-result-object v11

    .line 194
    invoke-virtual {v11, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 195
    .line 196
    .line 197
    move-result-object v12

    .line 198
    invoke-virtual {v12, v7}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 199
    .line 200
    .line 201
    move-result-object v12

    .line 202
    :cond_3
    add-int/2addr v14, v8

    .line 203
    invoke-static {v12}, Lorg/spongycastle/math/Primes;->implHasAnySmallFactors(Ljava/math/BigInteger;)Z

    .line 204
    .line 205
    .line 206
    move-result v7

    .line 207
    if-nez v7, :cond_5

    .line 208
    .line 209
    invoke-static {v0, v9, v3}, Lorg/spongycastle/math/Primes;->hashGen(Lorg/spongycastle/crypto/Digest;[BI)Ljava/math/BigInteger;

    .line 210
    .line 211
    .line 212
    move-result-object v7

    .line 213
    sget-object v8, Lorg/spongycastle/math/Primes;->THREE:Ljava/math/BigInteger;

    .line 214
    .line 215
    invoke-virtual {v12, v8}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 216
    .line 217
    .line 218
    move-result-object v8

    .line 219
    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 220
    .line 221
    .line 222
    move-result-object v7

    .line 223
    sget-object v8, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 224
    .line 225
    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 226
    .line 227
    .line 228
    move-result-object v7

    .line 229
    move-object/from16 p2, v7

    .line 230
    .line 231
    int-to-long v6, v15

    .line 232
    invoke-static {v6, v7}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 233
    .line 234
    .line 235
    move-result-object v6

    .line 236
    invoke-virtual {v11, v6}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 237
    .line 238
    .line 239
    move-result-object v6

    .line 240
    move-object/from16 v7, p2

    .line 241
    .line 242
    invoke-virtual {v7, v6, v12}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 243
    .line 244
    .line 245
    move-result-object v7

    .line 246
    sget-object v11, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 247
    .line 248
    invoke-virtual {v7, v11}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 249
    .line 250
    .line 251
    move-result-object v15

    .line 252
    invoke-virtual {v12, v15}, Ljava/math/BigInteger;->gcd(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 253
    .line 254
    .line 255
    move-result-object v15

    .line 256
    invoke-virtual {v15, v11}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v15

    .line 260
    if-eqz v15, :cond_4

    .line 261
    .line 262
    invoke-virtual {v7, v4, v12}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 263
    .line 264
    .line 265
    move-result-object v7

    .line 266
    invoke-virtual {v7, v11}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v7

    .line 270
    if-eqz v7, :cond_4

    .line 271
    .line 272
    new-instance v0, Lorg/spongycastle/math/Primes$STOutput;

    .line 273
    .line 274
    const/4 v8, 0x0

    .line 275
    invoke-direct {v0, v12, v9, v14, v8}, Lorg/spongycastle/math/Primes$STOutput;-><init>(Ljava/math/BigInteger;[BILorg/spongycastle/math/Primes$1;)V

    .line 276
    .line 277
    .line 278
    return-object v0

    .line 279
    :cond_4
    move-object v11, v6

    .line 280
    const/4 v15, 0x0

    .line 281
    goto :goto_2

    .line 282
    :cond_5
    invoke-static {v9, v3}, Lorg/spongycastle/math/Primes;->inc([BI)V

    .line 283
    .line 284
    .line 285
    :goto_2
    mul-int/lit8 v6, v1, 0x4

    .line 286
    .line 287
    add-int/2addr v6, v2

    .line 288
    if-ge v14, v6, :cond_6

    .line 289
    .line 290
    add-int/lit8 v15, v15, 0x2

    .line 291
    .line 292
    invoke-virtual {v12, v13}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 293
    .line 294
    .line 295
    move-result-object v12

    .line 296
    const/4 v6, 0x0

    .line 297
    const/4 v8, 0x1

    .line 298
    goto/16 :goto_1

    .line 299
    .line 300
    :cond_6
    invoke-static {v5}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    const/4 v8, 0x0

    .line 304
    return-object v8
.end method

.method private static inc([BI)V
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    :goto_0
    if-lez p1, :cond_0

    .line 3
    .line 4
    add-int/lit8 v0, v0, -0x1

    .line 5
    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    aget-byte v1, p0, v0

    .line 9
    .line 10
    and-int/lit16 v1, v1, 0xff

    .line 11
    .line 12
    add-int/2addr p1, v1

    .line 13
    int-to-byte v1, p1

    .line 14
    aput-byte v1, p0, v0

    .line 15
    .line 16
    ushr-int/lit8 p1, p1, 0x8

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method public static isMRProbablePrime(Ljava/math/BigInteger;Ljava/security/SecureRandom;I)Z
    .locals 8

    .line 1
    const-string v0, "candidate"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lorg/spongycastle/math/Primes;->checkCandidate(Ljava/math/BigInteger;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_5

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-lt p2, v1, :cond_4

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x2

    .line 17
    if-ne v2, v3, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->testBit(I)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    sget-object v2, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget-object v3, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 34
    .line 35
    invoke-virtual {p0, v3}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2}, Ljava/math/BigInteger;->getLowestSetBit()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-virtual {v2, v4}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    move v6, v0

    .line 48
    :goto_0
    if-ge v6, p2, :cond_3

    .line 49
    .line 50
    sget-object v7, Lorg/spongycastle/math/Primes;->TWO:Ljava/math/BigInteger;

    .line 51
    .line 52
    invoke-static {v7, v3, p1}, Lorg/spongycastle/util/BigIntegers;->createRandomInRange(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    invoke-static {p0, v2, v5, v4, v7}, Lorg/spongycastle/math/Primes;->implMRProbablePrimeToBase(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;ILjava/math/BigInteger;)Z

    .line 57
    .line 58
    .line 59
    move-result v7

    .line 60
    if-nez v7, :cond_2

    .line 61
    .line 62
    return v0

    .line 63
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    return v1

    .line 67
    :cond_4
    const-string p0, "\'iterations\' must be > 0"

    .line 68
    .line 69
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return v0

    .line 73
    :cond_5
    const-string p0, "\'random\' cannot be null"

    .line 74
    .line 75
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return v0
.end method

.method public static isMRProbablePrimeToBase(Ljava/math/BigInteger;Ljava/math/BigInteger;)Z
    .locals 3

    .line 1
    const-string v0, "candidate"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lorg/spongycastle/math/Primes;->checkCandidate(Ljava/math/BigInteger;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "base"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lorg/spongycastle/math/Primes;->checkCandidate(Ljava/math/BigInteger;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lorg/spongycastle/math/Primes;->ONE:Ljava/math/BigInteger;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-gez v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x2

    .line 28
    if-ne v1, v2, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/math/BigInteger;->getLowestSetBit()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {p0, v0, v2, v1, p1}, Lorg/spongycastle/math/Primes;->implMRProbablePrimeToBase(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;ILjava/math/BigInteger;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_1
    const-string p0, "\'base\' must be < (\'candidate\' - 1)"

    .line 50
    .line 51
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method private static isPrime32(J)Z
    .locals 13

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    ushr-long v0, p0, v0

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_9

    .line 11
    .line 12
    const-wide/16 v4, 0x5

    .line 13
    .line 14
    cmp-long v0, p0, v4

    .line 15
    .line 16
    const-wide/16 v6, 0x3

    .line 17
    .line 18
    const/4 v8, 0x1

    .line 19
    if-gtz v0, :cond_2

    .line 20
    .line 21
    const-wide/16 v2, 0x2

    .line 22
    .line 23
    cmp-long v2, p0, v2

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    cmp-long p0, p0, v6

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return v1

    .line 35
    :cond_1
    :goto_0
    return v8

    .line 36
    :cond_2
    const-wide/16 v9, 0x1

    .line 37
    .line 38
    and-long/2addr v9, p0

    .line 39
    cmp-long v0, v9, v2

    .line 40
    .line 41
    if-eqz v0, :cond_8

    .line 42
    .line 43
    rem-long v6, p0, v6

    .line 44
    .line 45
    cmp-long v0, v6, v2

    .line 46
    .line 47
    if-eqz v0, :cond_8

    .line 48
    .line 49
    rem-long v4, p0, v4

    .line 50
    .line 51
    cmp-long v0, v4, v2

    .line 52
    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_3
    const/16 v0, 0x8

    .line 57
    .line 58
    new-array v4, v0, [J

    .line 59
    .line 60
    fill-array-data v4, :array_0

    .line 61
    .line 62
    .line 63
    move-wide v6, v2

    .line 64
    move v5, v8

    .line 65
    :goto_1
    const-wide/16 v9, 0x1e

    .line 66
    .line 67
    if-ge v5, v0, :cond_6

    .line 68
    .line 69
    aget-wide v11, v4, v5

    .line 70
    .line 71
    add-long/2addr v11, v6

    .line 72
    rem-long v11, p0, v11

    .line 73
    .line 74
    cmp-long v11, v11, v2

    .line 75
    .line 76
    if-nez v11, :cond_5

    .line 77
    .line 78
    cmp-long p0, p0, v9

    .line 79
    .line 80
    if-gez p0, :cond_4

    .line 81
    .line 82
    return v8

    .line 83
    :cond_4
    return v1

    .line 84
    :cond_5
    add-int/lit8 v5, v5, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_6
    add-long/2addr v6, v9

    .line 88
    mul-long v9, v6, v6

    .line 89
    .line 90
    cmp-long v5, v9, p0

    .line 91
    .line 92
    if-ltz v5, :cond_7

    .line 93
    .line 94
    return v8

    .line 95
    :cond_7
    move v5, v1

    .line 96
    goto :goto_1

    .line 97
    :cond_8
    :goto_2
    return v1

    .line 98
    :cond_9
    const-string p0, "Size limit exceeded"

    .line 99
    .line 100
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return v1

    .line 104
    nop

    .line 105
    :array_0
    .array-data 8
        0x1
        0x7
        0xb
        0xd
        0x11
        0x13
        0x17
        0x1d
    .end array-data
.end method

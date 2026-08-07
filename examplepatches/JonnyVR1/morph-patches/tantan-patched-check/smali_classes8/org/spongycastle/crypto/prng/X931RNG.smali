.class public Lorg/spongycastle/crypto/prng/X931RNG;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final BLOCK128_MAX_BITS_REQUEST:I = 0x40000

.field private static final BLOCK128_RESEED_MAX:J = 0x800000L

.field private static final BLOCK64_MAX_BITS_REQUEST:I = 0x1000

.field private static final BLOCK64_RESEED_MAX:J = 0x8000L


# instance fields
.field private final DT:[B

.field private final I:[B

.field private final R:[B

.field private V:[B

.field private final engine:Lorg/spongycastle/crypto/BlockCipher;

.field private final entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

.field private reseedCounter:J


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;[BLorg/spongycastle/crypto/prng/EntropySource;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->reseedCounter:J

    .line 7
    .line 8
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 9
    .line 10
    iput-object p3, p0, Lorg/spongycastle/crypto/prng/X931RNG;->entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    .line 11
    .line 12
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    new-array p3, p3, [B

    .line 17
    .line 18
    iput-object p3, p0, Lorg/spongycastle/crypto/prng/X931RNG;->DT:[B

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    array-length v1, p3

    .line 22
    invoke-static {p2, v0, p3, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    new-array p2, p2, [B

    .line 30
    .line 31
    iput-object p2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->I:[B

    .line 32
    .line 33
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    new-array p1, p1, [B

    .line 38
    .line 39
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 40
    .line 41
    return-void
.end method

.method private increment([B)V
    .locals 1

    .line 1
    array-length p0, p1

    .line 2
    add-int/lit8 p0, p0, -0x1

    .line 3
    .line 4
    :goto_0
    if-ltz p0, :cond_1

    .line 5
    .line 6
    aget-byte v0, p1, p0

    .line 7
    .line 8
    add-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    int-to-byte v0, v0

    .line 11
    aput-byte v0, p1, p0

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    add-int/lit8 p0, p0, -0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    :goto_1
    return-void
.end method

.method private static isTooLarge([BI)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    if-le p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private process([B[B[B)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    array-length v2, p1

    .line 4
    if-eq v1, v2, :cond_0

    .line 5
    .line 6
    aget-byte v2, p2, v1

    .line 7
    .line 8
    aget-byte v3, p3, v1

    .line 9
    .line 10
    xor-int/2addr v2, v3

    .line 11
    int-to-byte v2, v2

    .line 12
    aput-byte v2, p1, v1

    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 18
    .line 19
    invoke-interface {p0, p1, v0, p1, v0}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public generate([BZ)I
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget-wide v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->reseedCounter:J

    .line 5
    .line 6
    const/4 v3, -0x1

    .line 7
    const/4 v4, 0x0

    .line 8
    const/16 v5, 0x8

    .line 9
    .line 10
    if-ne v0, v5, :cond_2

    .line 11
    .line 12
    const-wide/32 v5, 0x8000

    .line 13
    .line 14
    .line 15
    cmp-long v0, v1, v5

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    return v3

    .line 20
    :cond_0
    const/16 v0, 0x200

    .line 21
    .line 22
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/prng/X931RNG;->isTooLarge([BI)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string p0, "Number of bits per request limited to 4096"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return v4

    .line 35
    :cond_2
    const-wide/32 v5, 0x800000

    .line 36
    .line 37
    .line 38
    cmp-long v0, v1, v5

    .line 39
    .line 40
    if-lez v0, :cond_3

    .line 41
    .line 42
    return v3

    .line 43
    :cond_3
    const v0, 0x8000

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/prng/X931RNG;->isTooLarge([BI)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_9

    .line 51
    .line 52
    :goto_0
    if-nez p2, :cond_4

    .line 53
    .line 54
    iget-object p2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->V:[B

    .line 55
    .line 56
    if-nez p2, :cond_5

    .line 57
    .line 58
    :cond_4
    iget-object p2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    .line 59
    .line 60
    invoke-interface {p2}, Lorg/spongycastle/crypto/prng/EntropySource;->getEntropy()[B

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iput-object p2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->V:[B

    .line 65
    .line 66
    array-length p2, p2

    .line 67
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 68
    .line 69
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-ne p2, v0, :cond_8

    .line 74
    .line 75
    :cond_5
    array-length p2, p1

    .line 76
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 77
    .line 78
    array-length v0, v0

    .line 79
    div-int/2addr p2, v0

    .line 80
    move v0, v4

    .line 81
    :goto_1
    if-ge v0, p2, :cond_6

    .line 82
    .line 83
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 84
    .line 85
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->DT:[B

    .line 86
    .line 87
    iget-object v3, p0, Lorg/spongycastle/crypto/prng/X931RNG;->I:[B

    .line 88
    .line 89
    invoke-interface {v1, v2, v4, v3, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 93
    .line 94
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->I:[B

    .line 95
    .line 96
    iget-object v3, p0, Lorg/spongycastle/crypto/prng/X931RNG;->V:[B

    .line 97
    .line 98
    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/prng/X931RNG;->process([B[B[B)V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->V:[B

    .line 102
    .line 103
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 104
    .line 105
    iget-object v3, p0, Lorg/spongycastle/crypto/prng/X931RNG;->I:[B

    .line 106
    .line 107
    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/prng/X931RNG;->process([B[B[B)V

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 111
    .line 112
    array-length v2, v1

    .line 113
    mul-int/2addr v2, v0

    .line 114
    array-length v3, v1

    .line 115
    invoke-static {v1, v4, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->DT:[B

    .line 119
    .line 120
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/prng/X931RNG;->increment([B)V

    .line 121
    .line 122
    .line 123
    add-int/lit8 v0, v0, 0x1

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_6
    array-length v0, p1

    .line 127
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 128
    .line 129
    array-length v1, v1

    .line 130
    mul-int/2addr v1, p2

    .line 131
    sub-int/2addr v0, v1

    .line 132
    if-lez v0, :cond_7

    .line 133
    .line 134
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 135
    .line 136
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->DT:[B

    .line 137
    .line 138
    iget-object v3, p0, Lorg/spongycastle/crypto/prng/X931RNG;->I:[B

    .line 139
    .line 140
    invoke-interface {v1, v2, v4, v3, v4}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 141
    .line 142
    .line 143
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 144
    .line 145
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->I:[B

    .line 146
    .line 147
    iget-object v3, p0, Lorg/spongycastle/crypto/prng/X931RNG;->V:[B

    .line 148
    .line 149
    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/prng/X931RNG;->process([B[B[B)V

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->V:[B

    .line 153
    .line 154
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 155
    .line 156
    iget-object v3, p0, Lorg/spongycastle/crypto/prng/X931RNG;->I:[B

    .line 157
    .line 158
    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/prng/X931RNG;->process([B[B[B)V

    .line 159
    .line 160
    .line 161
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->R:[B

    .line 162
    .line 163
    array-length v2, v1

    .line 164
    mul-int/2addr p2, v2

    .line 165
    invoke-static {v1, v4, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 166
    .line 167
    .line 168
    iget-object p2, p0, Lorg/spongycastle/crypto/prng/X931RNG;->DT:[B

    .line 169
    .line 170
    invoke-direct {p0, p2}, Lorg/spongycastle/crypto/prng/X931RNG;->increment([B)V

    .line 171
    .line 172
    .line 173
    :cond_7
    iget-wide v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->reseedCounter:J

    .line 174
    .line 175
    const-wide/16 v2, 0x1

    .line 176
    .line 177
    add-long/2addr v0, v2

    .line 178
    iput-wide v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->reseedCounter:J

    .line 179
    .line 180
    array-length p0, p1

    .line 181
    return p0

    .line 182
    :cond_8
    const-string p0, "Insufficient entropy returned"

    .line 183
    .line 184
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    return v4

    .line 188
    :cond_9
    const-string p0, "Number of bits per request limited to 262144"

    .line 189
    .line 190
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    return v4
.end method

.method public getEntropySource()Lorg/spongycastle/crypto/prng/EntropySource;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    .line 2
    .line 3
    return-object p0
.end method

.method public reseed()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->entropySource:Lorg/spongycastle/crypto/prng/EntropySource;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/prng/EntropySource;->getEntropy()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->V:[B

    .line 8
    .line 9
    array-length v0, v0

    .line 10
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/X931RNG;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 11
    .line 12
    invoke-interface {v1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    const-wide/16 v0, 0x1

    .line 19
    .line 20
    iput-wide v0, p0, Lorg/spongycastle/crypto/prng/X931RNG;->reseedCounter:J

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "Insufficient entropy returned"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

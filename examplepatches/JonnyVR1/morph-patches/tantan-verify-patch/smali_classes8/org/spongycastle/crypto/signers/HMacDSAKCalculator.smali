.class public Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/signers/DSAKCalculator;


# static fields
.field private static final ZERO:Ljava/math/BigInteger;


# instance fields
.field private final K:[B

.field private final V:[B

.field private final hMac:Lorg/spongycastle/crypto/macs/HMac;

.field private n:Ljava/math/BigInteger;


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
    sput-object v0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->ZERO:Ljava/math/BigInteger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/crypto/macs/HMac;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/macs/HMac;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    new-array p1, p1, [B

    .line 16
    .line 17
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 18
    .line 19
    invoke-virtual {v0}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    new-array p1, p1, [B

    .line 24
    .line 25
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 26
    .line 27
    return-void
.end method

.method private bitsToInt([B)Ljava/math/BigInteger;
    .locals 3

    .line 1
    new-instance v0, Ljava/math/BigInteger;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 5
    .line 6
    .line 7
    array-length v1, p1

    .line 8
    mul-int/lit8 v1, v1, 0x8

    .line 9
    .line 10
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->n:Ljava/math/BigInteger;

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/math/BigInteger;->bitLength()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-le v1, v2, :cond_0

    .line 17
    .line 18
    array-length p1, p1

    .line 19
    mul-int/lit8 p1, p1, 0x8

    .line 20
    .line 21
    iget-object p0, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->n:Ljava/math/BigInteger;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    sub-int/2addr p1, p0

    .line 28
    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    return-object v0
.end method


# virtual methods
.method public init(Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V
    .locals 6

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->n:Ljava/math/BigInteger;

    .line 2
    .line 3
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v0, v2}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/lit8 v0, v0, 0x7

    .line 20
    .line 21
    div-int/lit8 v0, v0, 0x8

    .line 22
    .line 23
    new-array v3, v0, [B

    .line 24
    .line 25
    invoke-static {p2}, Lorg/spongycastle/util/BigIntegers;->asUnsignedByteArray(Ljava/math/BigInteger;)[B

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    array-length v4, p2

    .line 30
    sub-int v4, v0, v4

    .line 31
    .line 32
    array-length v5, p2

    .line 33
    invoke-static {p2, v2, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    add-int/lit8 p2, p2, 0x7

    .line 41
    .line 42
    div-int/lit8 p2, p2, 0x8

    .line 43
    .line 44
    new-array v4, p2, [B

    .line 45
    .line 46
    invoke-direct {p0, p3}, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->bitsToInt([B)Ljava/math/BigInteger;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p3, p1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-ltz v5, :cond_0

    .line 55
    .line 56
    invoke-virtual {p3, p1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    :cond_0
    invoke-static {p3}, Lorg/spongycastle/util/BigIntegers;->asUnsignedByteArray(Ljava/math/BigInteger;)[B

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    array-length p3, p1

    .line 65
    sub-int p3, p2, p3

    .line 66
    .line 67
    array-length v5, p1

    .line 68
    invoke-static {p1, v2, v4, p3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 72
    .line 73
    new-instance p3, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 74
    .line 75
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 76
    .line 77
    invoke-direct {p3, v5}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, p3}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 84
    .line 85
    iget-object p3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 86
    .line 87
    array-length v5, p3

    .line 88
    invoke-virtual {p1, p3, v2, v5}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 92
    .line 93
    invoke-virtual {p1, v2}, Lorg/spongycastle/crypto/macs/HMac;->update(B)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 97
    .line 98
    invoke-virtual {p1, v3, v2, v0}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 102
    .line 103
    invoke-virtual {p1, v4, v2, p2}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 107
    .line 108
    iget-object p3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 109
    .line 110
    invoke-virtual {p1, p3, v2}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 114
    .line 115
    new-instance p3, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 116
    .line 117
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 118
    .line 119
    invoke-direct {p3, v5}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p3}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 126
    .line 127
    iget-object p3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 128
    .line 129
    array-length v5, p3

    .line 130
    invoke-virtual {p1, p3, v2, v5}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 134
    .line 135
    iget-object p3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 136
    .line 137
    invoke-virtual {p1, p3, v2}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 141
    .line 142
    iget-object p3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 143
    .line 144
    array-length v5, p3

    .line 145
    invoke-virtual {p1, p3, v2, v5}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 149
    .line 150
    invoke-virtual {p1, v1}, Lorg/spongycastle/crypto/macs/HMac;->update(B)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 154
    .line 155
    invoke-virtual {p1, v3, v2, v0}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 159
    .line 160
    invoke-virtual {p1, v4, v2, p2}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 164
    .line 165
    iget-object p2, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 166
    .line 167
    invoke-virtual {p1, p2, v2}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 171
    .line 172
    new-instance p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 173
    .line 174
    iget-object p3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 175
    .line 176
    invoke-direct {p2, p3}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, p2}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 180
    .line 181
    .line 182
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 183
    .line 184
    iget-object p2, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 185
    .line 186
    array-length p3, p2

    .line 187
    invoke-virtual {p1, p2, v2, p3}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 191
    .line 192
    iget-object p0, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 193
    .line 194
    invoke-virtual {p1, p0, v2}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 195
    .line 196
    .line 197
    return-void
.end method

.method public init(Ljava/math/BigInteger;Ljava/security/SecureRandom;)V
    .locals 0

    .line 198
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Operation not supported"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public isDeterministic()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public nextK()Ljava/math/BigInteger;
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->n:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, 0x7

    .line 8
    .line 9
    div-int/lit8 v0, v0, 0x8

    .line 10
    .line 11
    new-array v1, v0, [B

    .line 12
    .line 13
    :goto_0
    const/4 v2, 0x0

    .line 14
    move v3, v2

    .line 15
    :goto_1
    if-ge v3, v0, :cond_0

    .line 16
    .line 17
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 18
    .line 19
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 20
    .line 21
    array-length v6, v5

    .line 22
    invoke-virtual {v4, v5, v2, v6}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 23
    .line 24
    .line 25
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 26
    .line 27
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 28
    .line 29
    invoke-virtual {v4, v5, v2}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 30
    .line 31
    .line 32
    sub-int v4, v0, v3

    .line 33
    .line 34
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 35
    .line 36
    array-length v5, v5

    .line 37
    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 42
    .line 43
    invoke-static {v5, v2, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    add-int/2addr v3, v4

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->bitsToInt([B)Ljava/math/BigInteger;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    sget-object v4, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->ZERO:Ljava/math/BigInteger;

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-lez v4, :cond_1

    .line 59
    .line 60
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->n:Ljava/math/BigInteger;

    .line 61
    .line 62
    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-gez v4, :cond_1

    .line 67
    .line 68
    return-object v3

    .line 69
    :cond_1
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 70
    .line 71
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 72
    .line 73
    array-length v5, v4

    .line 74
    invoke-virtual {v3, v4, v2, v5}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 78
    .line 79
    invoke-virtual {v3, v2}, Lorg/spongycastle/crypto/macs/HMac;->update(B)V

    .line 80
    .line 81
    .line 82
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 83
    .line 84
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 85
    .line 86
    invoke-virtual {v3, v4, v2}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 90
    .line 91
    new-instance v4, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 92
    .line 93
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->K:[B

    .line 94
    .line 95
    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v4}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 102
    .line 103
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 104
    .line 105
    array-length v5, v4

    .line 106
    invoke-virtual {v3, v4, v2, v5}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->hMac:Lorg/spongycastle/crypto/macs/HMac;

    .line 110
    .line 111
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;->V:[B

    .line 112
    .line 113
    invoke-virtual {v3, v4, v2}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 114
    .line 115
    .line 116
    goto :goto_0
.end method

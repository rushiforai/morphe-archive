.class public Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/AsymmetricBlockCipher;


# static fields
.field private static final SIX:Ljava/math/BigInteger;

.field private static final SIXTEEN:Ljava/math/BigInteger;

.field private static inverse:[B

.field private static shadows:[B


# instance fields
.field private bitSize:I

.field private engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

.field private forEncryption:Z

.field private modulus:Ljava/math/BigInteger;

.field private padBits:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x10

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->SIXTEEN:Ljava/math/BigInteger;

    .line 8
    .line 9
    const-wide/16 v0, 0x6

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->SIX:Ljava/math/BigInteger;

    .line 16
    .line 17
    const/16 v0, 0x10

    .line 18
    .line 19
    new-array v1, v0, [B

    .line 20
    .line 21
    fill-array-data v1, :array_0

    .line 22
    .line 23
    .line 24
    sput-object v1, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->shadows:[B

    .line 25
    .line 26
    new-array v0, v0, [B

    .line 27
    .line 28
    fill-array-data v0, :array_1

    .line 29
    .line 30
    .line 31
    sput-object v0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->inverse:[B

    .line 32
    .line 33
    return-void

    .line 34
    nop

    .line 35
    :array_0
    .array-data 1
        0xet
        0x3t
        0x5t
        0x8t
        0x9t
        0x4t
        0x2t
        0xft
        0x0t
        0xdt
        0xbt
        0x6t
        0x7t
        0xat
        0xct
        0x1t
    .end array-data

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    :array_1
    .array-data 1
        0x8t
        0xft
        0x6t
        0x1t
        0x5t
        0x2t
        0xbt
        0xct
        0x3t
        0x4t
        0xdt
        0xat
        0xet
        0x9t
        0x0t
        0x7t
    .end array-data
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->padBits:I

    .line 6
    .line 7
    iput-object p1, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 8
    .line 9
    return-void
.end method

.method private static convertOutputDecryptOnly(Ljava/math/BigInteger;)[B
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    aget-byte v1, p0, v0

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    array-length v1, p0

    .line 11
    const/4 v2, 0x1

    .line 12
    sub-int/2addr v1, v2

    .line 13
    new-array v3, v1, [B

    .line 14
    .line 15
    invoke-static {p0, v2, v3, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    return-object v3

    .line 19
    :cond_0
    return-object p0
.end method

.method private decodeBlock([BII)[B
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget p2, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->bitSize:I

    .line 8
    .line 9
    add-int/lit8 p2, p2, 0xd

    .line 10
    .line 11
    div-int/lit8 p2, p2, 0x10

    .line 12
    .line 13
    new-instance p3, Ljava/math/BigInteger;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-direct {p3, v0, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->SIXTEEN:Ljava/math/BigInteger;

    .line 20
    .line 21
    invoke-virtual {p3, p1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget-object v2, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->SIX:Ljava/math/BigInteger;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v3, 0x0

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->modulus:Ljava/math/BigInteger;

    .line 36
    .line 37
    invoke-virtual {v1, p3}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, p1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_6

    .line 50
    .line 51
    iget-object p1, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->modulus:Ljava/math/BigInteger;

    .line 52
    .line 53
    invoke-virtual {p1, p3}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    :goto_0
    invoke-static {p3}, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->convertOutputDecryptOnly(Ljava/math/BigInteger;)[B

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    array-length p3, p1

    .line 62
    sub-int/2addr p3, v0

    .line 63
    aget-byte p3, p1, p3

    .line 64
    .line 65
    and-int/lit8 p3, p3, 0xf

    .line 66
    .line 67
    const/4 v1, 0x6

    .line 68
    if-ne p3, v1, :cond_5

    .line 69
    .line 70
    array-length p3, p1

    .line 71
    sub-int/2addr p3, v0

    .line 72
    array-length v1, p1

    .line 73
    sub-int/2addr v1, v0

    .line 74
    aget-byte v1, p1, v1

    .line 75
    .line 76
    and-int/lit16 v1, v1, 0xff

    .line 77
    .line 78
    ushr-int/lit8 v1, v1, 0x4

    .line 79
    .line 80
    sget-object v2, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->inverse:[B

    .line 81
    .line 82
    array-length v4, p1

    .line 83
    add-int/lit8 v4, v4, -0x2

    .line 84
    .line 85
    aget-byte v4, p1, v4

    .line 86
    .line 87
    and-int/lit16 v4, v4, 0xff

    .line 88
    .line 89
    shr-int/lit8 v4, v4, 0x4

    .line 90
    .line 91
    aget-byte v2, v2, v4

    .line 92
    .line 93
    shl-int/lit8 v2, v2, 0x4

    .line 94
    .line 95
    or-int/2addr v1, v2

    .line 96
    int-to-byte v1, v1

    .line 97
    aput-byte v1, p1, p3

    .line 98
    .line 99
    sget-object p3, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->shadows:[B

    .line 100
    .line 101
    aget-byte v1, p1, v0

    .line 102
    .line 103
    and-int/lit16 v2, v1, 0xff

    .line 104
    .line 105
    ushr-int/lit8 v2, v2, 0x4

    .line 106
    .line 107
    aget-byte v2, p3, v2

    .line 108
    .line 109
    shl-int/lit8 v2, v2, 0x4

    .line 110
    .line 111
    and-int/lit8 v1, v1, 0xf

    .line 112
    .line 113
    aget-byte p3, p3, v1

    .line 114
    .line 115
    or-int/2addr p3, v2

    .line 116
    int-to-byte p3, p3

    .line 117
    const/4 v1, 0x0

    .line 118
    aput-byte p3, p1, v1

    .line 119
    .line 120
    array-length p3, p1

    .line 121
    sub-int/2addr p3, v0

    .line 122
    move v5, v0

    .line 123
    move v2, v1

    .line 124
    move v4, v2

    .line 125
    :goto_1
    array-length v6, p1

    .line 126
    mul-int/lit8 v7, p2, 0x2

    .line 127
    .line 128
    sub-int/2addr v6, v7

    .line 129
    if-lt p3, v6, :cond_3

    .line 130
    .line 131
    sget-object v6, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->shadows:[B

    .line 132
    .line 133
    aget-byte v7, p1, p3

    .line 134
    .line 135
    and-int/lit16 v8, v7, 0xff

    .line 136
    .line 137
    ushr-int/lit8 v8, v8, 0x4

    .line 138
    .line 139
    aget-byte v8, v6, v8

    .line 140
    .line 141
    shl-int/lit8 v8, v8, 0x4

    .line 142
    .line 143
    and-int/lit8 v7, v7, 0xf

    .line 144
    .line 145
    aget-byte v6, v6, v7

    .line 146
    .line 147
    or-int/2addr v6, v8

    .line 148
    add-int/lit8 v7, p3, -0x1

    .line 149
    .line 150
    aget-byte v8, p1, v7

    .line 151
    .line 152
    xor-int v9, v8, v6

    .line 153
    .line 154
    and-int/lit16 v9, v9, 0xff

    .line 155
    .line 156
    if-eqz v9, :cond_2

    .line 157
    .line 158
    if-nez v4, :cond_1

    .line 159
    .line 160
    xor-int v2, v8, v6

    .line 161
    .line 162
    and-int/lit16 v5, v2, 0xff

    .line 163
    .line 164
    move v4, v0

    .line 165
    move v2, v7

    .line 166
    goto :goto_2

    .line 167
    :cond_1
    const-string p0, "invalid tsums in block"

    .line 168
    .line 169
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    return-object v3

    .line 173
    :cond_2
    :goto_2
    add-int/lit8 p3, p3, -0x2

    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_3
    aput-byte v1, p1, v2

    .line 177
    .line 178
    array-length p2, p1

    .line 179
    sub-int/2addr p2, v2

    .line 180
    div-int/lit8 p2, p2, 0x2

    .line 181
    .line 182
    new-array p3, p2, [B

    .line 183
    .line 184
    :goto_3
    if-ge v1, p2, :cond_4

    .line 185
    .line 186
    mul-int/lit8 v3, v1, 0x2

    .line 187
    .line 188
    add-int/2addr v3, v2

    .line 189
    add-int/2addr v3, v0

    .line 190
    aget-byte v3, p1, v3

    .line 191
    .line 192
    aput-byte v3, p3, v1

    .line 193
    .line 194
    add-int/lit8 v1, v1, 0x1

    .line 195
    .line 196
    goto :goto_3

    .line 197
    :cond_4
    sub-int/2addr v5, v0

    .line 198
    iput v5, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->padBits:I

    .line 199
    .line 200
    return-object p3

    .line 201
    :cond_5
    const-string p0, "invalid forcing byte in block"

    .line 202
    .line 203
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    return-object v3

    .line 207
    :cond_6
    const-string p0, "resulting integer iS or (modulus - iS) is not congruent to 6 mod 16"

    .line 208
    .line 209
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    return-object v3
.end method

.method private encodeBlock([BII)[B
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->bitSize:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x7

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    div-int/2addr v1, v2

    .line 8
    new-array v3, v1, [B

    .line 9
    .line 10
    iget v4, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->padBits:I

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    add-int/2addr v4, v5

    .line 14
    add-int/lit8 v0, v0, 0xd

    .line 15
    .line 16
    div-int/lit8 v0, v0, 0x10

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    move v7, v6

    .line 20
    :goto_0
    if-ge v7, v0, :cond_1

    .line 21
    .line 22
    sub-int v8, v0, p3

    .line 23
    .line 24
    if-le v7, v8, :cond_0

    .line 25
    .line 26
    add-int v8, p2, p3

    .line 27
    .line 28
    sub-int v9, v0, v7

    .line 29
    .line 30
    sub-int/2addr v8, v9

    .line 31
    sub-int v10, v1, v0

    .line 32
    .line 33
    invoke-static {p1, v8, v3, v10, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    add-int v8, v7, p3

    .line 38
    .line 39
    sub-int v8, v1, v8

    .line 40
    .line 41
    invoke-static {p1, p2, v3, v8, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    .line 43
    .line 44
    :goto_1
    add-int/2addr v7, p3

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    mul-int/lit8 p1, v0, 0x2

    .line 47
    .line 48
    sub-int p1, v1, p1

    .line 49
    .line 50
    :goto_2
    if-eq p1, v1, :cond_2

    .line 51
    .line 52
    sub-int p2, v1, v0

    .line 53
    .line 54
    div-int/lit8 v7, p1, 0x2

    .line 55
    .line 56
    add-int/2addr p2, v7

    .line 57
    aget-byte p2, v3, p2

    .line 58
    .line 59
    sget-object v7, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->shadows:[B

    .line 60
    .line 61
    and-int/lit16 v8, p2, 0xff

    .line 62
    .line 63
    ushr-int/lit8 v8, v8, 0x4

    .line 64
    .line 65
    aget-byte v8, v7, v8

    .line 66
    .line 67
    shl-int/lit8 v8, v8, 0x4

    .line 68
    .line 69
    and-int/lit8 v9, p2, 0xf

    .line 70
    .line 71
    aget-byte v7, v7, v9

    .line 72
    .line 73
    or-int/2addr v7, v8

    .line 74
    int-to-byte v7, v7

    .line 75
    aput-byte v7, v3, p1

    .line 76
    .line 77
    add-int/lit8 v7, p1, 0x1

    .line 78
    .line 79
    aput-byte p2, v3, v7

    .line 80
    .line 81
    add-int/lit8 p1, p1, 0x2

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    mul-int/lit8 p3, p3, 0x2

    .line 85
    .line 86
    sub-int p1, v1, p3

    .line 87
    .line 88
    aget-byte p2, v3, p1

    .line 89
    .line 90
    xor-int/2addr p2, v4

    .line 91
    int-to-byte p2, p2

    .line 92
    aput-byte p2, v3, p1

    .line 93
    .line 94
    add-int/lit8 p1, v1, -0x1

    .line 95
    .line 96
    aget-byte p2, v3, p1

    .line 97
    .line 98
    shl-int/lit8 p2, p2, 0x4

    .line 99
    .line 100
    or-int/lit8 p2, p2, 0x6

    .line 101
    .line 102
    int-to-byte p2, p2

    .line 103
    aput-byte p2, v3, p1

    .line 104
    .line 105
    iget p1, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->bitSize:I

    .line 106
    .line 107
    sub-int/2addr p1, v5

    .line 108
    rem-int/2addr p1, v2

    .line 109
    rsub-int/lit8 p1, p1, 0x8

    .line 110
    .line 111
    const/16 p2, 0x80

    .line 112
    .line 113
    if-eq p1, v2, :cond_3

    .line 114
    .line 115
    aget-byte p3, v3, v6

    .line 116
    .line 117
    const/16 v0, 0xff

    .line 118
    .line 119
    ushr-int/2addr v0, p1

    .line 120
    and-int/2addr p3, v0

    .line 121
    int-to-byte p3, p3

    .line 122
    aput-byte p3, v3, v6

    .line 123
    .line 124
    ushr-int p1, p2, p1

    .line 125
    .line 126
    or-int/2addr p1, p3

    .line 127
    int-to-byte p1, p1

    .line 128
    aput-byte p1, v3, v6

    .line 129
    .line 130
    move v5, v6

    .line 131
    goto :goto_3

    .line 132
    :cond_3
    aput-byte v6, v3, v6

    .line 133
    .line 134
    aget-byte p1, v3, v5

    .line 135
    .line 136
    or-int/2addr p1, p2

    .line 137
    int-to-byte p1, p1

    .line 138
    aput-byte p1, v3, v5

    .line 139
    .line 140
    :goto_3
    iget-object p0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 141
    .line 142
    sub-int/2addr v1, v5

    .line 143
    invoke-interface {p0, v3, v5, v1}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    return-object p0
.end method


# virtual methods
.method public getInputBlockSize()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->getInputBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean p0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->forEncryption:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    div-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    :cond_0
    return v0
.end method

.method public getOutputBlockSize()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->getOutputBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean p0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->forEncryption:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    div-int/lit8 v0, v0, 0x2

    .line 15
    .line 16
    return v0
.end method

.method public getPadBits()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->padBits:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/AsymmetricBlockCipher;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 2

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v0, p2

    .line 16
    check-cast v0, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 17
    .line 18
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->engine:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 19
    .line 20
    invoke-interface {v1, p1, p2}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/RSAKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iput-object p2, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->modulus:Ljava/math/BigInteger;

    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/math/BigInteger;->bitLength()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iput p2, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->bitSize:I

    .line 34
    .line 35
    iput-boolean p1, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->forEncryption:Z

    .line 36
    .line 37
    return-void
.end method

.method public processBlock([BII)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->forEncryption:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->encodeBlock([BII)[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->decodeBlock([BII)[B

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public setPadBits(I)V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    if-gt p1, v0, :cond_0

    .line 3
    .line 4
    iput p1, p0, Lorg/spongycastle/crypto/encodings/ISO9796d1Encoding;->padBits:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const-string p0, "padBits > 7"

    .line 8
    .line 9
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

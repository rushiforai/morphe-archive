.class public Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;
.super Lorg/spongycastle/crypto/PBEParametersGenerator;
.source "SourceFile"


# static fields
.field public static final IV_MATERIAL:I = 0x2

.field public static final KEY_MATERIAL:I = 0x1

.field public static final MAC_MATERIAL:I = 0x3


# instance fields
.field private digest:Lorg/spongycastle/crypto/Digest;

.field private u:I

.field private v:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/PBEParametersGenerator;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 5
    .line 6
    instance-of v0, p1, Lorg/spongycastle/crypto/ExtendedDigest;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->u:I

    .line 15
    .line 16
    check-cast p1, Lorg/spongycastle/crypto/ExtendedDigest;

    .line 17
    .line 18
    invoke-interface {p1}, Lorg/spongycastle/crypto/ExtendedDigest;->getByteLength()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->v:I

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-interface {p1}, Lorg/spongycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, " unsupported"

    .line 30
    .line 31
    const-string v0, "Digest "

    .line 32
    .line 33
    invoke-static {v0, p0, p1}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    throw p0
.end method

.method private adjust([BI[B)V
    .locals 4

    .line 1
    array-length p0, p3

    .line 2
    add-int/lit8 p0, p0, -0x1

    .line 3
    .line 4
    aget-byte p0, p3, p0

    .line 5
    .line 6
    and-int/lit16 p0, p0, 0xff

    .line 7
    .line 8
    array-length v0, p3

    .line 9
    add-int/2addr v0, p2

    .line 10
    add-int/lit8 v0, v0, -0x1

    .line 11
    .line 12
    aget-byte v0, p1, v0

    .line 13
    .line 14
    and-int/lit16 v0, v0, 0xff

    .line 15
    .line 16
    add-int/2addr p0, v0

    .line 17
    add-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    array-length v0, p3

    .line 20
    add-int/2addr v0, p2

    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    int-to-byte v1, p0

    .line 24
    aput-byte v1, p1, v0

    .line 25
    .line 26
    ushr-int/lit8 p0, p0, 0x8

    .line 27
    .line 28
    array-length v0, p3

    .line 29
    add-int/lit8 v0, v0, -0x2

    .line 30
    .line 31
    :goto_0
    if-ltz v0, :cond_0

    .line 32
    .line 33
    aget-byte v1, p3, v0

    .line 34
    .line 35
    and-int/lit16 v1, v1, 0xff

    .line 36
    .line 37
    add-int v2, p2, v0

    .line 38
    .line 39
    aget-byte v3, p1, v2

    .line 40
    .line 41
    and-int/lit16 v3, v3, 0xff

    .line 42
    .line 43
    add-int/2addr v1, v3

    .line 44
    add-int/2addr p0, v1

    .line 45
    int-to-byte v1, p0

    .line 46
    aput-byte v1, p1, v2

    .line 47
    .line 48
    ushr-int/lit8 p0, p0, 0x8

    .line 49
    .line 50
    add-int/lit8 v0, v0, -0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    return-void
.end method

.method private generateDerivedKey(II)[B
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    iget v2, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->v:I

    .line 6
    .line 7
    new-array v3, v2, [B

    .line 8
    .line 9
    new-array v4, v1, [B

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    move v6, v5

    .line 13
    :goto_0
    if-eq v6, v2, :cond_0

    .line 14
    .line 15
    move/from16 v7, p1

    .line 16
    .line 17
    int-to-byte v8, v7

    .line 18
    aput-byte v8, v3, v6

    .line 19
    .line 20
    add-int/lit8 v6, v6, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v6, v0, Lorg/spongycastle/crypto/PBEParametersGenerator;->salt:[B

    .line 24
    .line 25
    const/4 v7, 0x1

    .line 26
    if-eqz v6, :cond_1

    .line 27
    .line 28
    array-length v8, v6

    .line 29
    if-eqz v8, :cond_1

    .line 30
    .line 31
    iget v8, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->v:I

    .line 32
    .line 33
    array-length v6, v6

    .line 34
    add-int/2addr v6, v8

    .line 35
    sub-int/2addr v6, v7

    .line 36
    div-int/2addr v6, v8

    .line 37
    mul-int/2addr v8, v6

    .line 38
    new-array v6, v8, [B

    .line 39
    .line 40
    move v9, v5

    .line 41
    :goto_1
    if-eq v9, v8, :cond_2

    .line 42
    .line 43
    iget-object v10, v0, Lorg/spongycastle/crypto/PBEParametersGenerator;->salt:[B

    .line 44
    .line 45
    array-length v11, v10

    .line 46
    rem-int v11, v9, v11

    .line 47
    .line 48
    aget-byte v10, v10, v11

    .line 49
    .line 50
    aput-byte v10, v6, v9

    .line 51
    .line 52
    add-int/lit8 v9, v9, 0x1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    new-array v6, v5, [B

    .line 56
    .line 57
    :cond_2
    iget-object v8, v0, Lorg/spongycastle/crypto/PBEParametersGenerator;->password:[B

    .line 58
    .line 59
    if-eqz v8, :cond_3

    .line 60
    .line 61
    array-length v9, v8

    .line 62
    if-eqz v9, :cond_3

    .line 63
    .line 64
    iget v9, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->v:I

    .line 65
    .line 66
    array-length v8, v8

    .line 67
    add-int/2addr v8, v9

    .line 68
    sub-int/2addr v8, v7

    .line 69
    div-int/2addr v8, v9

    .line 70
    mul-int/2addr v9, v8

    .line 71
    new-array v8, v9, [B

    .line 72
    .line 73
    move v10, v5

    .line 74
    :goto_2
    if-eq v10, v9, :cond_4

    .line 75
    .line 76
    iget-object v11, v0, Lorg/spongycastle/crypto/PBEParametersGenerator;->password:[B

    .line 77
    .line 78
    array-length v12, v11

    .line 79
    rem-int v12, v10, v12

    .line 80
    .line 81
    aget-byte v11, v11, v12

    .line 82
    .line 83
    aput-byte v11, v8, v10

    .line 84
    .line 85
    add-int/lit8 v10, v10, 0x1

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_3
    new-array v8, v5, [B

    .line 89
    .line 90
    :cond_4
    array-length v9, v6

    .line 91
    array-length v10, v8

    .line 92
    add-int/2addr v9, v10

    .line 93
    new-array v10, v9, [B

    .line 94
    .line 95
    array-length v11, v6

    .line 96
    invoke-static {v6, v5, v10, v5, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 97
    .line 98
    .line 99
    array-length v6, v6

    .line 100
    array-length v11, v8

    .line 101
    invoke-static {v8, v5, v10, v6, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 102
    .line 103
    .line 104
    iget v6, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->v:I

    .line 105
    .line 106
    new-array v8, v6, [B

    .line 107
    .line 108
    iget v11, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->u:I

    .line 109
    .line 110
    add-int v12, v1, v11

    .line 111
    .line 112
    sub-int/2addr v12, v7

    .line 113
    div-int/2addr v12, v11

    .line 114
    new-array v13, v11, [B

    .line 115
    .line 116
    move v14, v7

    .line 117
    :goto_3
    if-gt v14, v12, :cond_9

    .line 118
    .line 119
    iget-object v15, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 120
    .line 121
    invoke-interface {v15, v3, v5, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 122
    .line 123
    .line 124
    iget-object v15, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 125
    .line 126
    invoke-interface {v15, v10, v5, v9}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 127
    .line 128
    .line 129
    iget-object v15, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 130
    .line 131
    invoke-interface {v15, v13, v5}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 132
    .line 133
    .line 134
    move v15, v7

    .line 135
    :goto_4
    iget v7, v0, Lorg/spongycastle/crypto/PBEParametersGenerator;->iterationCount:I

    .line 136
    .line 137
    if-ge v15, v7, :cond_5

    .line 138
    .line 139
    iget-object v7, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 140
    .line 141
    invoke-interface {v7, v13, v5, v11}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 142
    .line 143
    .line 144
    iget-object v7, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 145
    .line 146
    invoke-interface {v7, v13, v5}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 147
    .line 148
    .line 149
    add-int/lit8 v15, v15, 0x1

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_5
    move v7, v5

    .line 153
    :goto_5
    if-eq v7, v6, :cond_6

    .line 154
    .line 155
    rem-int v15, v7, v11

    .line 156
    .line 157
    aget-byte v15, v13, v15

    .line 158
    .line 159
    aput-byte v15, v8, v7

    .line 160
    .line 161
    add-int/lit8 v7, v7, 0x1

    .line 162
    .line 163
    goto :goto_5

    .line 164
    :cond_6
    move v7, v5

    .line 165
    :goto_6
    iget v15, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->v:I

    .line 166
    .line 167
    div-int v5, v9, v15

    .line 168
    .line 169
    if-eq v7, v5, :cond_7

    .line 170
    .line 171
    mul-int/2addr v15, v7

    .line 172
    invoke-direct {v0, v10, v15, v8}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->adjust([BI[B)V

    .line 173
    .line 174
    .line 175
    add-int/lit8 v7, v7, 0x1

    .line 176
    .line 177
    const/4 v5, 0x0

    .line 178
    goto :goto_6

    .line 179
    :cond_7
    iget v5, v0, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->u:I

    .line 180
    .line 181
    if-ne v14, v12, :cond_8

    .line 182
    .line 183
    add-int/lit8 v7, v14, -0x1

    .line 184
    .line 185
    mul-int v15, v7, v5

    .line 186
    .line 187
    mul-int/2addr v7, v5

    .line 188
    sub-int v5, v1, v7

    .line 189
    .line 190
    const/4 v7, 0x0

    .line 191
    invoke-static {v13, v7, v4, v15, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 192
    .line 193
    .line 194
    goto :goto_7

    .line 195
    :cond_8
    const/4 v7, 0x0

    .line 196
    add-int/lit8 v15, v14, -0x1

    .line 197
    .line 198
    mul-int/2addr v15, v5

    .line 199
    invoke-static {v13, v7, v4, v15, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    .line 201
    .line 202
    :goto_7
    add-int/lit8 v14, v14, 0x1

    .line 203
    .line 204
    move v5, v7

    .line 205
    const/4 v7, 0x1

    .line 206
    goto :goto_3

    .line 207
    :cond_9
    return-object v4
.end method


# virtual methods
.method public generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;
    .locals 2

    .line 1
    div-int/lit8 p1, p1, 0x8

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->generateDerivedKey(II)[B

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, p0, v1, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public generateDerivedParameters(I)Lorg/spongycastle/crypto/CipherParameters;
    .locals 2

    .line 27
    div-int/lit8 p1, p1, 0x8

    const/4 v0, 0x1

    .line 28
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->generateDerivedKey(II)[B

    move-result-object p0

    .line 29
    new-instance v0, Lorg/spongycastle/crypto/params/KeyParameter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    return-object v0
.end method

.method public generateDerivedParameters(II)Lorg/spongycastle/crypto/CipherParameters;
    .locals 4

    .line 1
    div-int/lit8 p1, p1, 0x8

    .line 2
    .line 3
    div-int/lit8 p2, p2, 0x8

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->generateDerivedKey(II)[B

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const/4 v1, 0x2

    .line 11
    invoke-direct {p0, v1, p2}, Lorg/spongycastle/crypto/generators/PKCS12ParametersGenerator;->generateDerivedKey(II)[B

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 16
    .line 17
    new-instance v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-direct {v2, v0, v3, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v1, v2, p0, v3, p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[BII)V

    .line 24
    .line 25
    .line 26
    return-object v1
.end method

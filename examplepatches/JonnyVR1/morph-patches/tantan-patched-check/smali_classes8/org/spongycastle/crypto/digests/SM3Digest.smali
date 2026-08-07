.class public Lorg/spongycastle/crypto/digests/SM3Digest;
.super Lorg/spongycastle/crypto/digests/GeneralDigest;
.source "SourceFile"


# static fields
.field private static final BLOCK_SIZE:I = 0x10

.field private static final DIGEST_LENGTH:I = 0x20

.field private static final T:[I


# instance fields
.field private V:[I

.field private W:[I

.field private W1:[I

.field private inwords:[I

.field private xOff:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    sput-object v1, Lorg/spongycastle/crypto/digests/SM3Digest;->T:[I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    const/16 v2, 0x10

    .line 9
    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    sget-object v2, Lorg/spongycastle/crypto/digests/SM3Digest;->T:[I

    .line 13
    .line 14
    const v3, 0x79cc4519

    .line 15
    .line 16
    .line 17
    shl-int v4, v3, v1

    .line 18
    .line 19
    rsub-int/lit8 v5, v1, 0x20

    .line 20
    .line 21
    ushr-int/2addr v3, v5

    .line 22
    or-int/2addr v3, v4

    .line 23
    aput v3, v2, v1

    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    :goto_1
    if-ge v2, v0, :cond_1

    .line 29
    .line 30
    rem-int/lit8 v1, v2, 0x20

    .line 31
    .line 32
    sget-object v3, Lorg/spongycastle/crypto/digests/SM3Digest;->T:[I

    .line 33
    .line 34
    const v4, 0x7a879d8a

    .line 35
    .line 36
    .line 37
    shl-int v5, v4, v1

    .line 38
    .line 39
    rsub-int/lit8 v1, v1, 0x20

    .line 40
    .line 41
    ushr-int v1, v4, v1

    .line 42
    .line 43
    or-int/2addr v1, v5

    .line 44
    aput v1, v3, v2

    .line 45
    .line 46
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 9
    .line 10
    const/16 v0, 0x10

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->inwords:[I

    .line 15
    .line 16
    const/16 v0, 0x44

    .line 17
    .line 18
    new-array v0, v0, [I

    .line 19
    .line 20
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->W:[I

    .line 21
    .line 22
    const/16 v0, 0x40

    .line 23
    .line 24
    new-array v0, v0, [I

    .line 25
    .line 26
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->W1:[I

    .line 27
    .line 28
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SM3Digest;->reset()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/SM3Digest;)V
    .locals 1

    .line 32
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    const/16 v0, 0x8

    .line 33
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    const/16 v0, 0x10

    .line 34
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->inwords:[I

    const/16 v0, 0x44

    .line 35
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->W:[I

    const/16 v0, 0x40

    .line 36
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->W1:[I

    .line 37
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/SM3Digest;->copyIn(Lorg/spongycastle/crypto/digests/SM3Digest;)V

    return-void
.end method

.method private FF0(III)I
    .locals 0

    xor-int p0, p1, p2

    xor-int/2addr p0, p3

    return p0
.end method

.method private FF1(III)I
    .locals 0

    or-int p0, p2, p3

    and-int/2addr p0, p1

    and-int p1, p2, p3

    or-int/2addr p0, p1

    return p0
.end method

.method private GG0(III)I
    .locals 0

    xor-int p0, p1, p2

    xor-int/2addr p0, p3

    return p0
.end method

.method private GG1(III)I
    .locals 0

    and-int p0, p1, p2

    not-int p1, p1

    and-int/2addr p1, p3

    or-int/2addr p0, p1

    return p0
.end method

.method private P0(I)I
    .locals 2

    shl-int/lit8 p0, p1, 0x9

    ushr-int/lit8 v0, p1, 0x17

    or-int/2addr p0, v0

    shl-int/lit8 v0, p1, 0x11

    ushr-int/lit8 v1, p1, 0xf

    or-int/2addr v0, v1

    xor-int/2addr p0, p1

    xor-int/2addr p0, v0

    return p0
.end method

.method private P1(I)I
    .locals 2

    shl-int/lit8 p0, p1, 0xf

    ushr-int/lit8 v0, p1, 0x11

    or-int/2addr p0, v0

    shl-int/lit8 v0, p1, 0x17

    ushr-int/lit8 v1, p1, 0x9

    or-int/2addr v0, v1

    xor-int/2addr p0, p1

    xor-int/2addr p0, v0

    return p0
.end method

.method private copyIn(Lorg/spongycastle/crypto/digests/SM3Digest;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/SM3Digest;->inwords:[I

    .line 11
    .line 12
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->inwords:[I

    .line 13
    .line 14
    array-length v2, v1

    .line 15
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    iget p1, p1, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 19
    .line 20
    iput p1, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public copy()Lorg/spongycastle/util/Memoable;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/digests/SM3Digest;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/digests/SM3Digest;-><init>(Lorg/spongycastle/crypto/digests/SM3Digest;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public doFinal([BI)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/GeneralDigest;->finish()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aget v0, v0, v1

    .line 8
    .line 9
    invoke-static {v0, p1, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    aget v0, v0, v1

    .line 16
    .line 17
    add-int/lit8 v1, p2, 0x4

    .line 18
    .line 19
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    aget v0, v0, v1

    .line 26
    .line 27
    add-int/lit8 v1, p2, 0x8

    .line 28
    .line 29
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    aget v0, v0, v1

    .line 36
    .line 37
    add-int/lit8 v1, p2, 0xc

    .line 38
    .line 39
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    aget v0, v0, v1

    .line 46
    .line 47
    add-int/lit8 v1, p2, 0x10

    .line 48
    .line 49
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    aget v0, v0, v1

    .line 56
    .line 57
    add-int/lit8 v1, p2, 0x14

    .line 58
    .line 59
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    aget v0, v0, v1

    .line 66
    .line 67
    add-int/lit8 v1, p2, 0x18

    .line 68
    .line 69
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    aget v0, v0, v1

    .line 76
    .line 77
    add-int/lit8 p2, p2, 0x1c

    .line 78
    .line 79
    invoke-static {v0, p1, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SM3Digest;->reset()V

    .line 83
    .line 84
    .line 85
    const/16 p0, 0x20

    .line 86
    .line 87
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "SM3"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDigestSize()I
    .locals 0

    const/16 p0, 0x20

    return p0
.end method

.method public processBlock()V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    const/16 v3, 0x10

    .line 6
    .line 7
    if-ge v2, v3, :cond_0

    .line 8
    .line 9
    iget-object v3, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W:[I

    .line 10
    .line 11
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->inwords:[I

    .line 12
    .line 13
    aget v4, v4, v2

    .line 14
    .line 15
    aput v4, v3, v2

    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v2, v3

    .line 21
    :goto_1
    const/16 v4, 0x44

    .line 22
    .line 23
    if-ge v2, v4, :cond_1

    .line 24
    .line 25
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W:[I

    .line 26
    .line 27
    add-int/lit8 v5, v2, -0x3

    .line 28
    .line 29
    aget v5, v4, v5

    .line 30
    .line 31
    shl-int/lit8 v6, v5, 0xf

    .line 32
    .line 33
    ushr-int/lit8 v5, v5, 0x11

    .line 34
    .line 35
    or-int/2addr v5, v6

    .line 36
    add-int/lit8 v6, v2, -0xd

    .line 37
    .line 38
    aget v6, v4, v6

    .line 39
    .line 40
    shl-int/lit8 v7, v6, 0x7

    .line 41
    .line 42
    ushr-int/lit8 v6, v6, 0x19

    .line 43
    .line 44
    or-int/2addr v6, v7

    .line 45
    add-int/lit8 v7, v2, -0x10

    .line 46
    .line 47
    aget v7, v4, v7

    .line 48
    .line 49
    add-int/lit8 v8, v2, -0x9

    .line 50
    .line 51
    aget v8, v4, v8

    .line 52
    .line 53
    xor-int/2addr v7, v8

    .line 54
    xor-int/2addr v5, v7

    .line 55
    invoke-direct {v0, v5}, Lorg/spongycastle/crypto/digests/SM3Digest;->P1(I)I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    xor-int/2addr v5, v6

    .line 60
    iget-object v6, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W:[I

    .line 61
    .line 62
    add-int/lit8 v7, v2, -0x6

    .line 63
    .line 64
    aget v6, v6, v7

    .line 65
    .line 66
    xor-int/2addr v5, v6

    .line 67
    aput v5, v4, v2

    .line 68
    .line 69
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    move v2, v1

    .line 73
    :goto_2
    const/16 v4, 0x40

    .line 74
    .line 75
    if-ge v2, v4, :cond_2

    .line 76
    .line 77
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W1:[I

    .line 78
    .line 79
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W:[I

    .line 80
    .line 81
    aget v6, v5, v2

    .line 82
    .line 83
    add-int/lit8 v7, v2, 0x4

    .line 84
    .line 85
    aget v5, v5, v7

    .line 86
    .line 87
    xor-int/2addr v5, v6

    .line 88
    aput v5, v4, v2

    .line 89
    .line 90
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    iget-object v2, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 94
    .line 95
    aget v5, v2, v1

    .line 96
    .line 97
    const/4 v6, 0x1

    .line 98
    aget v7, v2, v6

    .line 99
    .line 100
    const/4 v8, 0x2

    .line 101
    aget v9, v2, v8

    .line 102
    .line 103
    const/4 v10, 0x3

    .line 104
    aget v11, v2, v10

    .line 105
    .line 106
    const/4 v12, 0x4

    .line 107
    aget v13, v2, v12

    .line 108
    .line 109
    const/4 v14, 0x5

    .line 110
    aget v15, v2, v14

    .line 111
    .line 112
    const/16 v16, 0x6

    .line 113
    .line 114
    aget v17, v2, v16

    .line 115
    .line 116
    const/16 v18, 0x7

    .line 117
    .line 118
    aget v2, v2, v18

    .line 119
    .line 120
    move/from16 v19, v17

    .line 121
    .line 122
    move/from16 v17, v6

    .line 123
    .line 124
    move/from16 v6, v19

    .line 125
    .line 126
    move/from16 v19, v8

    .line 127
    .line 128
    move v8, v1

    .line 129
    :goto_3
    if-ge v8, v3, :cond_3

    .line 130
    .line 131
    shl-int/lit8 v20, v5, 0xc

    .line 132
    .line 133
    ushr-int/lit8 v21, v5, 0x14

    .line 134
    .line 135
    or-int v20, v20, v21

    .line 136
    .line 137
    add-int v21, v20, v13

    .line 138
    .line 139
    sget-object v22, Lorg/spongycastle/crypto/digests/SM3Digest;->T:[I

    .line 140
    .line 141
    aget v22, v22, v8

    .line 142
    .line 143
    add-int v21, v21, v22

    .line 144
    .line 145
    shl-int/lit8 v22, v21, 0x7

    .line 146
    .line 147
    ushr-int/lit8 v21, v21, 0x19

    .line 148
    .line 149
    or-int v21, v22, v21

    .line 150
    .line 151
    xor-int v20, v21, v20

    .line 152
    .line 153
    invoke-direct {v0, v5, v7, v9}, Lorg/spongycastle/crypto/digests/SM3Digest;->FF0(III)I

    .line 154
    .line 155
    .line 156
    move-result v22

    .line 157
    add-int v22, v22, v11

    .line 158
    .line 159
    add-int v22, v22, v20

    .line 160
    .line 161
    iget-object v11, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W1:[I

    .line 162
    .line 163
    aget v11, v11, v8

    .line 164
    .line 165
    add-int v11, v22, v11

    .line 166
    .line 167
    invoke-direct {v0, v13, v15, v6}, Lorg/spongycastle/crypto/digests/SM3Digest;->GG0(III)I

    .line 168
    .line 169
    .line 170
    move-result v20

    .line 171
    add-int v20, v20, v2

    .line 172
    .line 173
    add-int v20, v20, v21

    .line 174
    .line 175
    iget-object v2, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W:[I

    .line 176
    .line 177
    aget v2, v2, v8

    .line 178
    .line 179
    add-int v2, v20, v2

    .line 180
    .line 181
    shl-int/lit8 v20, v7, 0x9

    .line 182
    .line 183
    ushr-int/lit8 v7, v7, 0x17

    .line 184
    .line 185
    or-int v7, v20, v7

    .line 186
    .line 187
    shl-int/lit8 v20, v15, 0x13

    .line 188
    .line 189
    ushr-int/lit8 v15, v15, 0xd

    .line 190
    .line 191
    or-int v15, v20, v15

    .line 192
    .line 193
    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/digests/SM3Digest;->P0(I)I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    add-int/lit8 v8, v8, 0x1

    .line 198
    .line 199
    move/from16 v23, v13

    .line 200
    .line 201
    move v13, v2

    .line 202
    move v2, v6

    .line 203
    move v6, v15

    .line 204
    move/from16 v15, v23

    .line 205
    .line 206
    move/from16 v23, v7

    .line 207
    .line 208
    move v7, v5

    .line 209
    move v5, v11

    .line 210
    move v11, v9

    .line 211
    move/from16 v9, v23

    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_3
    move/from16 v23, v3

    .line 215
    .line 216
    move v3, v2

    .line 217
    move v2, v6

    .line 218
    move v6, v5

    .line 219
    move/from16 v5, v23

    .line 220
    .line 221
    :goto_4
    if-ge v5, v4, :cond_4

    .line 222
    .line 223
    shl-int/lit8 v8, v6, 0xc

    .line 224
    .line 225
    ushr-int/lit8 v20, v6, 0x14

    .line 226
    .line 227
    or-int v8, v8, v20

    .line 228
    .line 229
    add-int v20, v8, v13

    .line 230
    .line 231
    sget-object v21, Lorg/spongycastle/crypto/digests/SM3Digest;->T:[I

    .line 232
    .line 233
    aget v21, v21, v5

    .line 234
    .line 235
    add-int v20, v20, v21

    .line 236
    .line 237
    shl-int/lit8 v21, v20, 0x7

    .line 238
    .line 239
    ushr-int/lit8 v20, v20, 0x19

    .line 240
    .line 241
    or-int v20, v21, v20

    .line 242
    .line 243
    xor-int v8, v20, v8

    .line 244
    .line 245
    invoke-direct {v0, v6, v7, v9}, Lorg/spongycastle/crypto/digests/SM3Digest;->FF1(III)I

    .line 246
    .line 247
    .line 248
    move-result v21

    .line 249
    add-int v21, v21, v11

    .line 250
    .line 251
    add-int v21, v21, v8

    .line 252
    .line 253
    iget-object v8, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W1:[I

    .line 254
    .line 255
    aget v8, v8, v5

    .line 256
    .line 257
    add-int v8, v21, v8

    .line 258
    .line 259
    invoke-direct {v0, v13, v15, v2}, Lorg/spongycastle/crypto/digests/SM3Digest;->GG1(III)I

    .line 260
    .line 261
    .line 262
    move-result v11

    .line 263
    add-int/2addr v11, v3

    .line 264
    add-int v11, v11, v20

    .line 265
    .line 266
    iget-object v3, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->W:[I

    .line 267
    .line 268
    aget v3, v3, v5

    .line 269
    .line 270
    add-int/2addr v11, v3

    .line 271
    shl-int/lit8 v3, v7, 0x9

    .line 272
    .line 273
    ushr-int/lit8 v7, v7, 0x17

    .line 274
    .line 275
    or-int/2addr v3, v7

    .line 276
    shl-int/lit8 v7, v15, 0x13

    .line 277
    .line 278
    ushr-int/lit8 v15, v15, 0xd

    .line 279
    .line 280
    or-int/2addr v7, v15

    .line 281
    invoke-direct {v0, v11}, Lorg/spongycastle/crypto/digests/SM3Digest;->P0(I)I

    .line 282
    .line 283
    .line 284
    move-result v11

    .line 285
    add-int/lit8 v5, v5, 0x1

    .line 286
    .line 287
    move v15, v13

    .line 288
    move v13, v11

    .line 289
    move v11, v9

    .line 290
    move v9, v3

    .line 291
    move v3, v2

    .line 292
    move v2, v7

    .line 293
    move v7, v6

    .line 294
    move v6, v8

    .line 295
    goto :goto_4

    .line 296
    :cond_4
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 297
    .line 298
    aget v5, v4, v1

    .line 299
    .line 300
    xor-int/2addr v5, v6

    .line 301
    aput v5, v4, v1

    .line 302
    .line 303
    aget v5, v4, v17

    .line 304
    .line 305
    xor-int/2addr v5, v7

    .line 306
    aput v5, v4, v17

    .line 307
    .line 308
    aget v5, v4, v19

    .line 309
    .line 310
    xor-int/2addr v5, v9

    .line 311
    aput v5, v4, v19

    .line 312
    .line 313
    aget v5, v4, v10

    .line 314
    .line 315
    xor-int/2addr v5, v11

    .line 316
    aput v5, v4, v10

    .line 317
    .line 318
    aget v5, v4, v12

    .line 319
    .line 320
    xor-int/2addr v5, v13

    .line 321
    aput v5, v4, v12

    .line 322
    .line 323
    aget v5, v4, v14

    .line 324
    .line 325
    xor-int/2addr v5, v15

    .line 326
    aput v5, v4, v14

    .line 327
    .line 328
    aget v5, v4, v16

    .line 329
    .line 330
    xor-int/2addr v2, v5

    .line 331
    aput v2, v4, v16

    .line 332
    .line 333
    aget v2, v4, v18

    .line 334
    .line 335
    xor-int/2addr v2, v3

    .line 336
    aput v2, v4, v18

    .line 337
    .line 338
    iput v1, v0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 339
    .line 340
    return-void
.end method

.method public processLength(J)V
    .locals 6

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/16 v2, 0xe

    .line 5
    .line 6
    if-le v0, v2, :cond_0

    .line 7
    .line 8
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->inwords:[I

    .line 9
    .line 10
    aput v1, v3, v0

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SM3Digest;->processBlock()V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 20
    .line 21
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->inwords:[I

    .line 22
    .line 23
    if-ge v0, v2, :cond_1

    .line 24
    .line 25
    aput v1, v3, v0

    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    iput v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    add-int/lit8 v1, v0, 0x1

    .line 33
    .line 34
    iput v1, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 35
    .line 36
    const/16 v2, 0x20

    .line 37
    .line 38
    ushr-long v4, p1, v2

    .line 39
    .line 40
    long-to-int v2, v4

    .line 41
    aput v2, v3, v0

    .line 42
    .line 43
    add-int/lit8 v0, v0, 0x2

    .line 44
    .line 45
    iput v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 46
    .line 47
    long-to-int p0, p1

    .line 48
    aput p0, v3, v1

    .line 49
    .line 50
    return-void
.end method

.method public processWord([BI)V
    .locals 3

    .line 1
    aget-byte v0, p1, p2

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xff

    .line 4
    .line 5
    shl-int/lit8 v0, v0, 0x18

    .line 6
    .line 7
    add-int/lit8 v1, p2, 0x1

    .line 8
    .line 9
    aget-byte v1, p1, v1

    .line 10
    .line 11
    and-int/lit16 v1, v1, 0xff

    .line 12
    .line 13
    const/16 v2, 0x10

    .line 14
    .line 15
    shl-int/2addr v1, v2

    .line 16
    or-int/2addr v0, v1

    .line 17
    add-int/lit8 v1, p2, 0x2

    .line 18
    .line 19
    aget-byte v1, p1, v1

    .line 20
    .line 21
    and-int/lit16 v1, v1, 0xff

    .line 22
    .line 23
    shl-int/lit8 v1, v1, 0x8

    .line 24
    .line 25
    or-int/2addr v0, v1

    .line 26
    add-int/lit8 p2, p2, 0x3

    .line 27
    .line 28
    aget-byte p1, p1, p2

    .line 29
    .line 30
    and-int/lit16 p1, p1, 0xff

    .line 31
    .line 32
    or-int/2addr p1, v0

    .line 33
    iget-object p2, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->inwords:[I

    .line 34
    .line 35
    iget v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 36
    .line 37
    aput p1, p2, v0

    .line 38
    .line 39
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    iput v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 42
    .line 43
    if-lt v0, v2, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SM3Digest;->processBlock()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    invoke-super {p0}, Lorg/spongycastle/crypto/digests/GeneralDigest;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->V:[I

    .line 5
    .line 6
    const v1, 0x7380166f

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput v1, v0, v2

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const v3, 0x4914b2b9

    .line 14
    .line 15
    .line 16
    aput v3, v0, v1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    const v3, 0x172442d7

    .line 20
    .line 21
    .line 22
    aput v3, v0, v1

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    const v3, -0x2575fa00

    .line 26
    .line 27
    .line 28
    aput v3, v0, v1

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    const v3, -0x5690cf44

    .line 32
    .line 33
    .line 34
    aput v3, v0, v1

    .line 35
    .line 36
    const/4 v1, 0x5

    .line 37
    const v3, 0x163138aa

    .line 38
    .line 39
    .line 40
    aput v3, v0, v1

    .line 41
    .line 42
    const/4 v1, 0x6

    .line 43
    const v3, -0x1c7211b3

    .line 44
    .line 45
    .line 46
    aput v3, v0, v1

    .line 47
    .line 48
    const/4 v1, 0x7

    .line 49
    const v3, -0x4f04f1b2

    .line 50
    .line 51
    .line 52
    aput v3, v0, v1

    .line 53
    .line 54
    iput v2, p0, Lorg/spongycastle/crypto/digests/SM3Digest;->xOff:I

    .line 55
    .line 56
    return-void
.end method

.method public reset(Lorg/spongycastle/util/Memoable;)V
    .locals 0

    .line 57
    check-cast p1, Lorg/spongycastle/crypto/digests/SM3Digest;

    .line 58
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;->copyIn(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    .line 59
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/SM3Digest;->copyIn(Lorg/spongycastle/crypto/digests/SM3Digest;)V

    return-void
.end method

.class public Lorg/spongycastle/crypto/digests/MD4Digest;
.super Lorg/spongycastle/crypto/digests/GeneralDigest;
.source "SourceFile"


# static fields
.field private static final DIGEST_LENGTH:I = 0x10

.field private static final S11:I = 0x3

.field private static final S12:I = 0x7

.field private static final S13:I = 0xb

.field private static final S14:I = 0x13

.field private static final S21:I = 0x3

.field private static final S22:I = 0x5

.field private static final S23:I = 0x9

.field private static final S24:I = 0xd

.field private static final S31:I = 0x3

.field private static final S32:I = 0x9

.field private static final S33:I = 0xb

.field private static final S34:I = 0xf


# instance fields
.field private H1:I

.field private H2:I

.field private H3:I

.field private H4:I

.field private X:[I

.field private xOff:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/MD4Digest;->reset()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/MD4Digest;)V
    .locals 1

    .line 14
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    const/16 v0, 0x10

    .line 15
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 16
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/MD4Digest;->copyIn(Lorg/spongycastle/crypto/digests/MD4Digest;)V

    return-void
.end method

.method private F(III)I
    .locals 0

    and-int p0, p1, p2

    not-int p1, p1

    and-int/2addr p1, p3

    or-int/2addr p0, p1

    return p0
.end method

.method private G(III)I
    .locals 0

    or-int p0, p2, p3

    and-int/2addr p0, p1

    and-int p1, p2, p3

    or-int/2addr p0, p1

    return p0
.end method

.method private H(III)I
    .locals 0

    xor-int p0, p1, p2

    xor-int/2addr p0, p3

    return p0
.end method

.method private copyIn(Lorg/spongycastle/crypto/digests/MD4Digest;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;->copyIn(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lorg/spongycastle/crypto/digests/MD4Digest;->H1:I

    .line 5
    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H1:I

    .line 7
    .line 8
    iget v0, p1, Lorg/spongycastle/crypto/digests/MD4Digest;->H2:I

    .line 9
    .line 10
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H2:I

    .line 11
    .line 12
    iget v0, p1, Lorg/spongycastle/crypto/digests/MD4Digest;->H3:I

    .line 13
    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H3:I

    .line 15
    .line 16
    iget v0, p1, Lorg/spongycastle/crypto/digests/MD4Digest;->H4:I

    .line 17
    .line 18
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H4:I

    .line 19
    .line 20
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 21
    .line 22
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 23
    .line 24
    array-length v2, v0

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    iget p1, p1, Lorg/spongycastle/crypto/digests/MD4Digest;->xOff:I

    .line 30
    .line 31
    iput p1, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->xOff:I

    .line 32
    .line 33
    return-void
.end method

.method private rotateLeft(II)I
    .locals 0

    shl-int p0, p1, p2

    rsub-int/lit8 p2, p2, 0x20

    ushr-int/2addr p1, p2

    or-int/2addr p0, p1

    return p0
.end method

.method private unpackWord(I[BI)V
    .locals 1

    .line 1
    int-to-byte p0, p1

    .line 2
    aput-byte p0, p2, p3

    .line 3
    .line 4
    add-int/lit8 p0, p3, 0x1

    .line 5
    .line 6
    ushr-int/lit8 v0, p1, 0x8

    .line 7
    .line 8
    int-to-byte v0, v0

    .line 9
    aput-byte v0, p2, p0

    .line 10
    .line 11
    add-int/lit8 p0, p3, 0x2

    .line 12
    .line 13
    ushr-int/lit8 v0, p1, 0x10

    .line 14
    .line 15
    int-to-byte v0, v0

    .line 16
    aput-byte v0, p2, p0

    .line 17
    .line 18
    add-int/lit8 p3, p3, 0x3

    .line 19
    .line 20
    ushr-int/lit8 p0, p1, 0x18

    .line 21
    .line 22
    int-to-byte p0, p0

    .line 23
    aput-byte p0, p2, p3

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public copy()Lorg/spongycastle/util/Memoable;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/digests/MD4Digest;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/digests/MD4Digest;-><init>(Lorg/spongycastle/crypto/digests/MD4Digest;)V

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
    iget v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H1:I

    .line 5
    .line 6
    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/crypto/digests/MD4Digest;->unpackWord(I[BI)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H2:I

    .line 10
    .line 11
    add-int/lit8 v1, p2, 0x4

    .line 12
    .line 13
    invoke-direct {p0, v0, p1, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->unpackWord(I[BI)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H3:I

    .line 17
    .line 18
    add-int/lit8 v1, p2, 0x8

    .line 19
    .line 20
    invoke-direct {p0, v0, p1, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->unpackWord(I[BI)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H4:I

    .line 24
    .line 25
    add-int/lit8 p2, p2, 0xc

    .line 26
    .line 27
    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/crypto/digests/MD4Digest;->unpackWord(I[BI)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/MD4Digest;->reset()V

    .line 31
    .line 32
    .line 33
    const/16 p0, 0x10

    .line 34
    .line 35
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "MD4"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDigestSize()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public processBlock()V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H1:I

    .line 4
    .line 5
    iget v2, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H2:I

    .line 6
    .line 7
    iget v3, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H3:I

    .line 8
    .line 9
    iget v4, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H4:I

    .line 10
    .line 11
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    add-int/2addr v1, v5

    .line 16
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    aget v5, v5, v6

    .line 20
    .line 21
    add-int/2addr v1, v5

    .line 22
    const/4 v5, 0x3

    .line 23
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 28
    .line 29
    .line 30
    move-result v7

    .line 31
    add-int/2addr v4, v7

    .line 32
    iget-object v7, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 33
    .line 34
    const/4 v8, 0x1

    .line 35
    aget v7, v7, v8

    .line 36
    .line 37
    add-int/2addr v4, v7

    .line 38
    const/4 v7, 0x7

    .line 39
    invoke-direct {v0, v4, v7}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 44
    .line 45
    .line 46
    move-result v9

    .line 47
    add-int/2addr v3, v9

    .line 48
    iget-object v9, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 49
    .line 50
    const/4 v10, 0x2

    .line 51
    aget v9, v9, v10

    .line 52
    .line 53
    add-int/2addr v3, v9

    .line 54
    const/16 v9, 0xb

    .line 55
    .line 56
    invoke-direct {v0, v3, v9}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    add-int/2addr v2, v11

    .line 65
    iget-object v11, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 66
    .line 67
    aget v11, v11, v5

    .line 68
    .line 69
    add-int/2addr v2, v11

    .line 70
    const/16 v11, 0x13

    .line 71
    .line 72
    invoke-direct {v0, v2, v11}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 77
    .line 78
    .line 79
    move-result v12

    .line 80
    add-int/2addr v1, v12

    .line 81
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 82
    .line 83
    const/4 v13, 0x4

    .line 84
    aget v12, v12, v13

    .line 85
    .line 86
    add-int/2addr v1, v12

    .line 87
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 92
    .line 93
    .line 94
    move-result v12

    .line 95
    add-int/2addr v4, v12

    .line 96
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 97
    .line 98
    const/4 v14, 0x5

    .line 99
    aget v12, v12, v14

    .line 100
    .line 101
    add-int/2addr v4, v12

    .line 102
    invoke-direct {v0, v4, v7}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 107
    .line 108
    .line 109
    move-result v12

    .line 110
    add-int/2addr v3, v12

    .line 111
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 112
    .line 113
    const/4 v15, 0x6

    .line 114
    aget v12, v12, v15

    .line 115
    .line 116
    add-int/2addr v3, v12

    .line 117
    invoke-direct {v0, v3, v9}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 122
    .line 123
    .line 124
    move-result v12

    .line 125
    add-int/2addr v2, v12

    .line 126
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 127
    .line 128
    aget v12, v12, v7

    .line 129
    .line 130
    add-int/2addr v2, v12

    .line 131
    invoke-direct {v0, v2, v11}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 136
    .line 137
    .line 138
    move-result v12

    .line 139
    add-int/2addr v1, v12

    .line 140
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 141
    .line 142
    const/16 v16, 0x8

    .line 143
    .line 144
    aget v12, v12, v16

    .line 145
    .line 146
    add-int/2addr v1, v12

    .line 147
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 152
    .line 153
    .line 154
    move-result v12

    .line 155
    add-int/2addr v4, v12

    .line 156
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 157
    .line 158
    move/from16 v17, v8

    .line 159
    .line 160
    const/16 v8, 0x9

    .line 161
    .line 162
    aget v12, v12, v8

    .line 163
    .line 164
    add-int/2addr v4, v12

    .line 165
    invoke-direct {v0, v4, v7}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 170
    .line 171
    .line 172
    move-result v12

    .line 173
    add-int/2addr v3, v12

    .line 174
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 175
    .line 176
    const/16 v18, 0xa

    .line 177
    .line 178
    aget v12, v12, v18

    .line 179
    .line 180
    add-int/2addr v3, v12

    .line 181
    invoke-direct {v0, v3, v9}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 186
    .line 187
    .line 188
    move-result v12

    .line 189
    add-int/2addr v2, v12

    .line 190
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 191
    .line 192
    aget v12, v12, v9

    .line 193
    .line 194
    add-int/2addr v2, v12

    .line 195
    invoke-direct {v0, v2, v11}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 200
    .line 201
    .line 202
    move-result v12

    .line 203
    add-int/2addr v1, v12

    .line 204
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 205
    .line 206
    const/16 v19, 0xc

    .line 207
    .line 208
    aget v12, v12, v19

    .line 209
    .line 210
    add-int/2addr v1, v12

    .line 211
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 216
    .line 217
    .line 218
    move-result v12

    .line 219
    add-int/2addr v4, v12

    .line 220
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 221
    .line 222
    move/from16 v20, v10

    .line 223
    .line 224
    const/16 v10, 0xd

    .line 225
    .line 226
    aget v12, v12, v10

    .line 227
    .line 228
    add-int/2addr v4, v12

    .line 229
    invoke-direct {v0, v4, v7}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 234
    .line 235
    .line 236
    move-result v12

    .line 237
    add-int/2addr v3, v12

    .line 238
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 239
    .line 240
    const/16 v21, 0xe

    .line 241
    .line 242
    aget v12, v12, v21

    .line 243
    .line 244
    add-int/2addr v3, v12

    .line 245
    invoke-direct {v0, v3, v9}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->F(III)I

    .line 250
    .line 251
    .line 252
    move-result v12

    .line 253
    add-int/2addr v2, v12

    .line 254
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 255
    .line 256
    move/from16 v22, v7

    .line 257
    .line 258
    const/16 v7, 0xf

    .line 259
    .line 260
    aget v12, v12, v7

    .line 261
    .line 262
    add-int/2addr v2, v12

    .line 263
    invoke-direct {v0, v2, v11}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 268
    .line 269
    .line 270
    move-result v11

    .line 271
    add-int/2addr v1, v11

    .line 272
    iget-object v11, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 273
    .line 274
    aget v11, v11, v6

    .line 275
    .line 276
    add-int/2addr v1, v11

    .line 277
    const v11, 0x5a827999

    .line 278
    .line 279
    .line 280
    add-int/2addr v1, v11

    .line 281
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 286
    .line 287
    .line 288
    move-result v12

    .line 289
    add-int/2addr v4, v12

    .line 290
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 291
    .line 292
    aget v12, v12, v13

    .line 293
    .line 294
    add-int/2addr v4, v12

    .line 295
    add-int/2addr v4, v11

    .line 296
    invoke-direct {v0, v4, v14}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 301
    .line 302
    .line 303
    move-result v12

    .line 304
    add-int/2addr v3, v12

    .line 305
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 306
    .line 307
    aget v12, v12, v16

    .line 308
    .line 309
    add-int/2addr v3, v12

    .line 310
    add-int/2addr v3, v11

    .line 311
    invoke-direct {v0, v3, v8}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 312
    .line 313
    .line 314
    move-result v3

    .line 315
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 316
    .line 317
    .line 318
    move-result v12

    .line 319
    add-int/2addr v2, v12

    .line 320
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 321
    .line 322
    aget v12, v12, v19

    .line 323
    .line 324
    add-int/2addr v2, v12

    .line 325
    add-int/2addr v2, v11

    .line 326
    invoke-direct {v0, v2, v10}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 327
    .line 328
    .line 329
    move-result v2

    .line 330
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 331
    .line 332
    .line 333
    move-result v12

    .line 334
    add-int/2addr v1, v12

    .line 335
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 336
    .line 337
    aget v12, v12, v17

    .line 338
    .line 339
    add-int/2addr v1, v12

    .line 340
    add-int/2addr v1, v11

    .line 341
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 342
    .line 343
    .line 344
    move-result v1

    .line 345
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 346
    .line 347
    .line 348
    move-result v12

    .line 349
    add-int/2addr v4, v12

    .line 350
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 351
    .line 352
    aget v12, v12, v14

    .line 353
    .line 354
    add-int/2addr v4, v12

    .line 355
    add-int/2addr v4, v11

    .line 356
    invoke-direct {v0, v4, v14}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 357
    .line 358
    .line 359
    move-result v4

    .line 360
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 361
    .line 362
    .line 363
    move-result v12

    .line 364
    add-int/2addr v3, v12

    .line 365
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 366
    .line 367
    aget v12, v12, v8

    .line 368
    .line 369
    add-int/2addr v3, v12

    .line 370
    add-int/2addr v3, v11

    .line 371
    invoke-direct {v0, v3, v8}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 372
    .line 373
    .line 374
    move-result v3

    .line 375
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 376
    .line 377
    .line 378
    move-result v12

    .line 379
    add-int/2addr v2, v12

    .line 380
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 381
    .line 382
    aget v12, v12, v10

    .line 383
    .line 384
    add-int/2addr v2, v12

    .line 385
    add-int/2addr v2, v11

    .line 386
    invoke-direct {v0, v2, v10}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 387
    .line 388
    .line 389
    move-result v2

    .line 390
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 391
    .line 392
    .line 393
    move-result v12

    .line 394
    add-int/2addr v1, v12

    .line 395
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 396
    .line 397
    aget v12, v12, v20

    .line 398
    .line 399
    add-int/2addr v1, v12

    .line 400
    add-int/2addr v1, v11

    .line 401
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 406
    .line 407
    .line 408
    move-result v12

    .line 409
    add-int/2addr v4, v12

    .line 410
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 411
    .line 412
    aget v12, v12, v15

    .line 413
    .line 414
    add-int/2addr v4, v12

    .line 415
    add-int/2addr v4, v11

    .line 416
    invoke-direct {v0, v4, v14}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 417
    .line 418
    .line 419
    move-result v4

    .line 420
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 421
    .line 422
    .line 423
    move-result v12

    .line 424
    add-int/2addr v3, v12

    .line 425
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 426
    .line 427
    aget v12, v12, v18

    .line 428
    .line 429
    add-int/2addr v3, v12

    .line 430
    add-int/2addr v3, v11

    .line 431
    invoke-direct {v0, v3, v8}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 432
    .line 433
    .line 434
    move-result v3

    .line 435
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 436
    .line 437
    .line 438
    move-result v12

    .line 439
    add-int/2addr v2, v12

    .line 440
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 441
    .line 442
    aget v12, v12, v21

    .line 443
    .line 444
    add-int/2addr v2, v12

    .line 445
    add-int/2addr v2, v11

    .line 446
    invoke-direct {v0, v2, v10}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 447
    .line 448
    .line 449
    move-result v2

    .line 450
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 451
    .line 452
    .line 453
    move-result v12

    .line 454
    add-int/2addr v1, v12

    .line 455
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 456
    .line 457
    aget v12, v12, v5

    .line 458
    .line 459
    add-int/2addr v1, v12

    .line 460
    add-int/2addr v1, v11

    .line 461
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 462
    .line 463
    .line 464
    move-result v1

    .line 465
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 466
    .line 467
    .line 468
    move-result v12

    .line 469
    add-int/2addr v4, v12

    .line 470
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 471
    .line 472
    aget v12, v12, v22

    .line 473
    .line 474
    add-int/2addr v4, v12

    .line 475
    add-int/2addr v4, v11

    .line 476
    invoke-direct {v0, v4, v14}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 477
    .line 478
    .line 479
    move-result v4

    .line 480
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 481
    .line 482
    .line 483
    move-result v12

    .line 484
    add-int/2addr v3, v12

    .line 485
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 486
    .line 487
    aget v12, v12, v9

    .line 488
    .line 489
    add-int/2addr v3, v12

    .line 490
    add-int/2addr v3, v11

    .line 491
    invoke-direct {v0, v3, v8}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 492
    .line 493
    .line 494
    move-result v3

    .line 495
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->G(III)I

    .line 496
    .line 497
    .line 498
    move-result v12

    .line 499
    add-int/2addr v2, v12

    .line 500
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 501
    .line 502
    aget v12, v12, v7

    .line 503
    .line 504
    add-int/2addr v2, v12

    .line 505
    add-int/2addr v2, v11

    .line 506
    invoke-direct {v0, v2, v10}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 507
    .line 508
    .line 509
    move-result v2

    .line 510
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 511
    .line 512
    .line 513
    move-result v11

    .line 514
    add-int/2addr v1, v11

    .line 515
    iget-object v11, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 516
    .line 517
    aget v11, v11, v6

    .line 518
    .line 519
    add-int/2addr v1, v11

    .line 520
    const v11, 0x6ed9eba1

    .line 521
    .line 522
    .line 523
    add-int/2addr v1, v11

    .line 524
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 525
    .line 526
    .line 527
    move-result v1

    .line 528
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 529
    .line 530
    .line 531
    move-result v12

    .line 532
    add-int/2addr v4, v12

    .line 533
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 534
    .line 535
    aget v12, v12, v16

    .line 536
    .line 537
    add-int/2addr v4, v12

    .line 538
    add-int/2addr v4, v11

    .line 539
    invoke-direct {v0, v4, v8}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 540
    .line 541
    .line 542
    move-result v4

    .line 543
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 544
    .line 545
    .line 546
    move-result v12

    .line 547
    add-int/2addr v3, v12

    .line 548
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 549
    .line 550
    aget v12, v12, v13

    .line 551
    .line 552
    add-int/2addr v3, v12

    .line 553
    add-int/2addr v3, v11

    .line 554
    invoke-direct {v0, v3, v9}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 555
    .line 556
    .line 557
    move-result v3

    .line 558
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 559
    .line 560
    .line 561
    move-result v12

    .line 562
    add-int/2addr v2, v12

    .line 563
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 564
    .line 565
    aget v12, v12, v19

    .line 566
    .line 567
    add-int/2addr v2, v12

    .line 568
    add-int/2addr v2, v11

    .line 569
    invoke-direct {v0, v2, v7}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 570
    .line 571
    .line 572
    move-result v2

    .line 573
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 574
    .line 575
    .line 576
    move-result v12

    .line 577
    add-int/2addr v1, v12

    .line 578
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 579
    .line 580
    aget v12, v12, v20

    .line 581
    .line 582
    add-int/2addr v1, v12

    .line 583
    add-int/2addr v1, v11

    .line 584
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 585
    .line 586
    .line 587
    move-result v1

    .line 588
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 589
    .line 590
    .line 591
    move-result v12

    .line 592
    add-int/2addr v4, v12

    .line 593
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 594
    .line 595
    aget v12, v12, v18

    .line 596
    .line 597
    add-int/2addr v4, v12

    .line 598
    add-int/2addr v4, v11

    .line 599
    invoke-direct {v0, v4, v8}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 600
    .line 601
    .line 602
    move-result v4

    .line 603
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 604
    .line 605
    .line 606
    move-result v12

    .line 607
    add-int/2addr v3, v12

    .line 608
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 609
    .line 610
    aget v12, v12, v15

    .line 611
    .line 612
    add-int/2addr v3, v12

    .line 613
    add-int/2addr v3, v11

    .line 614
    invoke-direct {v0, v3, v9}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 615
    .line 616
    .line 617
    move-result v3

    .line 618
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 619
    .line 620
    .line 621
    move-result v12

    .line 622
    add-int/2addr v2, v12

    .line 623
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 624
    .line 625
    aget v12, v12, v21

    .line 626
    .line 627
    add-int/2addr v2, v12

    .line 628
    add-int/2addr v2, v11

    .line 629
    invoke-direct {v0, v2, v7}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 630
    .line 631
    .line 632
    move-result v2

    .line 633
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 634
    .line 635
    .line 636
    move-result v12

    .line 637
    add-int/2addr v1, v12

    .line 638
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 639
    .line 640
    aget v12, v12, v17

    .line 641
    .line 642
    add-int/2addr v1, v12

    .line 643
    add-int/2addr v1, v11

    .line 644
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 645
    .line 646
    .line 647
    move-result v1

    .line 648
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 649
    .line 650
    .line 651
    move-result v12

    .line 652
    add-int/2addr v4, v12

    .line 653
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 654
    .line 655
    aget v12, v12, v8

    .line 656
    .line 657
    add-int/2addr v4, v12

    .line 658
    add-int/2addr v4, v11

    .line 659
    invoke-direct {v0, v4, v8}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 660
    .line 661
    .line 662
    move-result v4

    .line 663
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 664
    .line 665
    .line 666
    move-result v12

    .line 667
    add-int/2addr v3, v12

    .line 668
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 669
    .line 670
    aget v12, v12, v14

    .line 671
    .line 672
    add-int/2addr v3, v12

    .line 673
    add-int/2addr v3, v11

    .line 674
    invoke-direct {v0, v3, v9}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 675
    .line 676
    .line 677
    move-result v3

    .line 678
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 679
    .line 680
    .line 681
    move-result v12

    .line 682
    add-int/2addr v2, v12

    .line 683
    iget-object v12, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 684
    .line 685
    aget v10, v12, v10

    .line 686
    .line 687
    add-int/2addr v2, v10

    .line 688
    add-int/2addr v2, v11

    .line 689
    invoke-direct {v0, v2, v7}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 690
    .line 691
    .line 692
    move-result v2

    .line 693
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 694
    .line 695
    .line 696
    move-result v10

    .line 697
    add-int/2addr v1, v10

    .line 698
    iget-object v10, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 699
    .line 700
    aget v10, v10, v5

    .line 701
    .line 702
    add-int/2addr v1, v10

    .line 703
    add-int/2addr v1, v11

    .line 704
    invoke-direct {v0, v1, v5}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 705
    .line 706
    .line 707
    move-result v1

    .line 708
    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 709
    .line 710
    .line 711
    move-result v5

    .line 712
    add-int/2addr v4, v5

    .line 713
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 714
    .line 715
    aget v5, v5, v9

    .line 716
    .line 717
    add-int/2addr v4, v5

    .line 718
    add-int/2addr v4, v11

    .line 719
    invoke-direct {v0, v4, v8}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 720
    .line 721
    .line 722
    move-result v4

    .line 723
    invoke-direct {v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 724
    .line 725
    .line 726
    move-result v5

    .line 727
    add-int/2addr v3, v5

    .line 728
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 729
    .line 730
    aget v5, v5, v22

    .line 731
    .line 732
    add-int/2addr v3, v5

    .line 733
    add-int/2addr v3, v11

    .line 734
    invoke-direct {v0, v3, v9}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 735
    .line 736
    .line 737
    move-result v3

    .line 738
    invoke-direct {v0, v3, v4, v1}, Lorg/spongycastle/crypto/digests/MD4Digest;->H(III)I

    .line 739
    .line 740
    .line 741
    move-result v5

    .line 742
    add-int/2addr v2, v5

    .line 743
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 744
    .line 745
    aget v5, v5, v7

    .line 746
    .line 747
    add-int/2addr v2, v5

    .line 748
    add-int/2addr v2, v11

    .line 749
    invoke-direct {v0, v2, v7}, Lorg/spongycastle/crypto/digests/MD4Digest;->rotateLeft(II)I

    .line 750
    .line 751
    .line 752
    move-result v2

    .line 753
    iget v5, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H1:I

    .line 754
    .line 755
    add-int/2addr v5, v1

    .line 756
    iput v5, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H1:I

    .line 757
    .line 758
    iget v1, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H2:I

    .line 759
    .line 760
    add-int/2addr v1, v2

    .line 761
    iput v1, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H2:I

    .line 762
    .line 763
    iget v1, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H3:I

    .line 764
    .line 765
    add-int/2addr v1, v3

    .line 766
    iput v1, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H3:I

    .line 767
    .line 768
    iget v1, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H4:I

    .line 769
    .line 770
    add-int/2addr v1, v4

    .line 771
    iput v1, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->H4:I

    .line 772
    .line 773
    iput v6, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->xOff:I

    .line 774
    .line 775
    move v1, v6

    .line 776
    :goto_0
    iget-object v2, v0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 777
    .line 778
    array-length v3, v2

    .line 779
    if-eq v1, v3, :cond_0

    .line 780
    .line 781
    aput v6, v2, v1

    .line 782
    .line 783
    add-int/lit8 v1, v1, 0x1

    .line 784
    .line 785
    goto :goto_0

    .line 786
    :cond_0
    return-void
.end method

.method public processLength(J)V
    .locals 2

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->xOff:I

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/MD4Digest;->processBlock()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 11
    .line 12
    long-to-int v0, p1

    .line 13
    aput v0, p0, v1

    .line 14
    .line 15
    const/16 v0, 0x20

    .line 16
    .line 17
    ushr-long/2addr p1, v0

    .line 18
    long-to-int p1, p1

    .line 19
    const/16 p2, 0xf

    .line 20
    .line 21
    aput p1, p0, p2

    .line 22
    .line 23
    return-void
.end method

.method public processWord([BI)V
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->xOff:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->xOff:I

    .line 8
    .line 9
    aget-byte v3, p1, p2

    .line 10
    .line 11
    and-int/lit16 v3, v3, 0xff

    .line 12
    .line 13
    add-int/lit8 v4, p2, 0x1

    .line 14
    .line 15
    aget-byte v4, p1, v4

    .line 16
    .line 17
    and-int/lit16 v4, v4, 0xff

    .line 18
    .line 19
    shl-int/lit8 v4, v4, 0x8

    .line 20
    .line 21
    or-int/2addr v3, v4

    .line 22
    add-int/lit8 v4, p2, 0x2

    .line 23
    .line 24
    aget-byte v4, p1, v4

    .line 25
    .line 26
    and-int/lit16 v4, v4, 0xff

    .line 27
    .line 28
    const/16 v5, 0x10

    .line 29
    .line 30
    shl-int/2addr v4, v5

    .line 31
    or-int/2addr v3, v4

    .line 32
    add-int/lit8 p2, p2, 0x3

    .line 33
    .line 34
    aget-byte p1, p1, p2

    .line 35
    .line 36
    and-int/lit16 p1, p1, 0xff

    .line 37
    .line 38
    shl-int/lit8 p1, p1, 0x18

    .line 39
    .line 40
    or-int/2addr p1, v3

    .line 41
    aput p1, v0, v1

    .line 42
    .line 43
    if-ne v2, v5, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/MD4Digest;->processBlock()V

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
    const v0, 0x67452301

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H1:I

    .line 8
    .line 9
    const v0, -0x10325477

    .line 10
    .line 11
    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H2:I

    .line 13
    .line 14
    const v0, -0x67452302

    .line 15
    .line 16
    .line 17
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H3:I

    .line 18
    .line 19
    const v0, 0x10325476

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->H4:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->xOff:I

    .line 26
    .line 27
    move v1, v0

    .line 28
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/MD4Digest;->X:[I

    .line 29
    .line 30
    array-length v3, v2

    .line 31
    if-eq v1, v3, :cond_0

    .line 32
    .line 33
    aput v0, v2, v1

    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void
.end method

.method public reset(Lorg/spongycastle/util/Memoable;)V
    .locals 0

    .line 39
    check-cast p1, Lorg/spongycastle/crypto/digests/MD4Digest;

    .line 40
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/MD4Digest;->copyIn(Lorg/spongycastle/crypto/digests/MD4Digest;)V

    return-void
.end method

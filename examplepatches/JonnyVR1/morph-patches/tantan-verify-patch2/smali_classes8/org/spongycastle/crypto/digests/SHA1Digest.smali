.class public Lorg/spongycastle/crypto/digests/SHA1Digest;
.super Lorg/spongycastle/crypto/digests/GeneralDigest;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/digests/EncodableDigest;


# static fields
.field private static final DIGEST_LENGTH:I = 0x14

.field private static final Y1:I = 0x5a827999

.field private static final Y2:I = 0x6ed9eba1

.field private static final Y3:I = -0x70e44324

.field private static final Y4:I = -0x359d3e2a


# instance fields
.field private H1:I

.field private H2:I

.field private H3:I

.field private H4:I

.field private H5:I

.field private X:[I

.field private xOff:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 82
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>()V

    const/16 v0, 0x50

    .line 83
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 84
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHA1Digest;->reset()V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/SHA1Digest;)V
    .locals 1

    .line 79
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    const/16 v0, 0x50

    .line 80
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 81
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/SHA1Digest;->copyIn(Lorg/spongycastle/crypto/digests/SHA1Digest;)V

    return-void
.end method

.method public constructor <init>([B)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>([B)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x50

    .line 5
    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 9
    .line 10
    const/16 v0, 0x10

    .line 11
    .line 12
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 17
    .line 18
    const/16 v0, 0x14

    .line 19
    .line 20
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 25
    .line 26
    const/16 v0, 0x18

    .line 27
    .line 28
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 33
    .line 34
    const/16 v0, 0x1c

    .line 35
    .line 36
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 41
    .line 42
    const/16 v0, 0x20

    .line 43
    .line 44
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 49
    .line 50
    const/16 v0, 0x24

    .line 51
    .line 52
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    :goto_0
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 60
    .line 61
    if-eq v0, v1, :cond_0

    .line 62
    .line 63
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 64
    .line 65
    mul-int/lit8 v2, v0, 0x4

    .line 66
    .line 67
    add-int/lit8 v2, v2, 0x28

    .line 68
    .line 69
    invoke-static {p1, v2}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    aput v2, v1, v0

    .line 74
    .line 75
    add-int/lit8 v0, v0, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    return-void
.end method

.method private copyIn(Lorg/spongycastle/crypto/digests/SHA1Digest;)V
    .locals 4

    .line 1
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 2
    .line 3
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 4
    .line 5
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 6
    .line 7
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 8
    .line 9
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 10
    .line 11
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 12
    .line 13
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 14
    .line 15
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 16
    .line 17
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 18
    .line 19
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 20
    .line 21
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 22
    .line 23
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 24
    .line 25
    array-length v2, v0

    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 28
    .line 29
    .line 30
    iget p1, p1, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 31
    .line 32
    iput p1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 33
    .line 34
    return-void
.end method

.method private f(III)I
    .locals 0

    and-int p0, p1, p2

    not-int p1, p1

    and-int/2addr p1, p3

    or-int/2addr p0, p1

    return p0
.end method

.method private g(III)I
    .locals 0

    or-int p0, p2, p3

    and-int/2addr p0, p1

    and-int p1, p2, p3

    or-int/2addr p0, p1

    return p0
.end method

.method private h(III)I
    .locals 0

    xor-int p0, p1, p2

    xor-int/2addr p0, p3

    return p0
.end method


# virtual methods
.method public copy()Lorg/spongycastle/util/Memoable;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA1Digest;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>(Lorg/spongycastle/crypto/digests/SHA1Digest;)V

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
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 5
    .line 6
    invoke-static {v0, p1, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 10
    .line 11
    add-int/lit8 v1, p2, 0x4

    .line 12
    .line 13
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 17
    .line 18
    add-int/lit8 v1, p2, 0x8

    .line 19
    .line 20
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 24
    .line 25
    add-int/lit8 v1, p2, 0xc

    .line 26
    .line 27
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 28
    .line 29
    .line 30
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 31
    .line 32
    add-int/lit8 p2, p2, 0x10

    .line 33
    .line 34
    invoke-static {v0, p1, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHA1Digest;->reset()V

    .line 38
    .line 39
    .line 40
    const/16 p0, 0x14

    .line 41
    .line 42
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "SHA-1"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDigestSize()I
    .locals 0

    const/16 p0, 0x14

    return p0
.end method

.method public getEncodedState()[B
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x28

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    invoke-super {p0, v0}, Lorg/spongycastle/crypto/digests/GeneralDigest;->populateState([B)V

    .line 10
    .line 11
    .line 12
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 13
    .line 14
    const/16 v2, 0x10

    .line 15
    .line 16
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 20
    .line 21
    const/16 v2, 0x14

    .line 22
    .line 23
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 24
    .line 25
    .line 26
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 27
    .line 28
    const/16 v2, 0x18

    .line 29
    .line 30
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 31
    .line 32
    .line 33
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 34
    .line 35
    const/16 v2, 0x1c

    .line 36
    .line 37
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 38
    .line 39
    .line 40
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 41
    .line 42
    const/16 v2, 0x20

    .line 43
    .line 44
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 45
    .line 46
    .line 47
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 48
    .line 49
    const/16 v2, 0x24

    .line 50
    .line 51
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 52
    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    :goto_0
    iget v2, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 56
    .line 57
    if-eq v1, v2, :cond_0

    .line 58
    .line 59
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 60
    .line 61
    aget v2, v2, v1

    .line 62
    .line 63
    mul-int/lit8 v3, v1, 0x4

    .line 64
    .line 65
    add-int/lit8 v3, v3, 0x28

    .line 66
    .line 67
    invoke-static {v2, v0, v3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 v1, v1, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    return-object v0
.end method

.method public processBlock()V
    .locals 15

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    move v1, v0

    .line 4
    :goto_0
    const/16 v2, 0x50

    .line 5
    .line 6
    if-ge v1, v2, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 9
    .line 10
    add-int/lit8 v3, v1, -0x3

    .line 11
    .line 12
    aget v3, v2, v3

    .line 13
    .line 14
    add-int/lit8 v4, v1, -0x8

    .line 15
    .line 16
    aget v4, v2, v4

    .line 17
    .line 18
    xor-int/2addr v3, v4

    .line 19
    add-int/lit8 v4, v1, -0xe

    .line 20
    .line 21
    aget v4, v2, v4

    .line 22
    .line 23
    xor-int/2addr v3, v4

    .line 24
    add-int/lit8 v4, v1, -0x10

    .line 25
    .line 26
    aget v4, v2, v4

    .line 27
    .line 28
    xor-int/2addr v3, v4

    .line 29
    shl-int/lit8 v4, v3, 0x1

    .line 30
    .line 31
    ushr-int/lit8 v3, v3, 0x1f

    .line 32
    .line 33
    or-int/2addr v3, v4

    .line 34
    aput v3, v2, v1

    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 40
    .line 41
    iget v2, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 42
    .line 43
    iget v3, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 44
    .line 45
    iget v4, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 46
    .line 47
    iget v5, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    move v7, v6

    .line 51
    move v8, v7

    .line 52
    :goto_1
    const/4 v9, 0x4

    .line 53
    if-ge v7, v9, :cond_1

    .line 54
    .line 55
    shl-int/lit8 v9, v1, 0x5

    .line 56
    .line 57
    ushr-int/lit8 v10, v1, 0x1b

    .line 58
    .line 59
    or-int/2addr v9, v10

    .line 60
    invoke-direct {p0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/SHA1Digest;->f(III)I

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    add-int/2addr v9, v10

    .line 65
    iget-object v10, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 66
    .line 67
    add-int/lit8 v11, v8, 0x1

    .line 68
    .line 69
    aget v10, v10, v8

    .line 70
    .line 71
    add-int/2addr v9, v10

    .line 72
    const v10, 0x5a827999

    .line 73
    .line 74
    .line 75
    add-int/2addr v9, v10

    .line 76
    add-int/2addr v5, v9

    .line 77
    shl-int/lit8 v9, v2, 0x1e

    .line 78
    .line 79
    ushr-int/lit8 v2, v2, 0x2

    .line 80
    .line 81
    or-int/2addr v2, v9

    .line 82
    shl-int/lit8 v9, v5, 0x5

    .line 83
    .line 84
    ushr-int/lit8 v12, v5, 0x1b

    .line 85
    .line 86
    or-int/2addr v9, v12

    .line 87
    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/SHA1Digest;->f(III)I

    .line 88
    .line 89
    .line 90
    move-result v12

    .line 91
    add-int/2addr v9, v12

    .line 92
    iget-object v12, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 93
    .line 94
    add-int/lit8 v13, v8, 0x2

    .line 95
    .line 96
    aget v11, v12, v11

    .line 97
    .line 98
    add-int/2addr v9, v11

    .line 99
    add-int/2addr v9, v10

    .line 100
    add-int/2addr v4, v9

    .line 101
    shl-int/lit8 v9, v1, 0x1e

    .line 102
    .line 103
    ushr-int/lit8 v1, v1, 0x2

    .line 104
    .line 105
    or-int/2addr v1, v9

    .line 106
    shl-int/lit8 v9, v4, 0x5

    .line 107
    .line 108
    ushr-int/lit8 v11, v4, 0x1b

    .line 109
    .line 110
    or-int/2addr v9, v11

    .line 111
    invoke-direct {p0, v5, v1, v2}, Lorg/spongycastle/crypto/digests/SHA1Digest;->f(III)I

    .line 112
    .line 113
    .line 114
    move-result v11

    .line 115
    add-int/2addr v9, v11

    .line 116
    iget-object v11, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 117
    .line 118
    add-int/lit8 v12, v8, 0x3

    .line 119
    .line 120
    aget v11, v11, v13

    .line 121
    .line 122
    add-int/2addr v9, v11

    .line 123
    add-int/2addr v9, v10

    .line 124
    add-int/2addr v3, v9

    .line 125
    shl-int/lit8 v9, v5, 0x1e

    .line 126
    .line 127
    ushr-int/lit8 v5, v5, 0x2

    .line 128
    .line 129
    or-int/2addr v5, v9

    .line 130
    shl-int/lit8 v9, v3, 0x5

    .line 131
    .line 132
    ushr-int/lit8 v11, v3, 0x1b

    .line 133
    .line 134
    or-int/2addr v9, v11

    .line 135
    invoke-direct {p0, v4, v5, v1}, Lorg/spongycastle/crypto/digests/SHA1Digest;->f(III)I

    .line 136
    .line 137
    .line 138
    move-result v11

    .line 139
    add-int/2addr v9, v11

    .line 140
    iget-object v11, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 141
    .line 142
    add-int/lit8 v13, v8, 0x4

    .line 143
    .line 144
    aget v11, v11, v12

    .line 145
    .line 146
    add-int/2addr v9, v11

    .line 147
    add-int/2addr v9, v10

    .line 148
    add-int/2addr v2, v9

    .line 149
    shl-int/lit8 v9, v4, 0x1e

    .line 150
    .line 151
    ushr-int/lit8 v4, v4, 0x2

    .line 152
    .line 153
    or-int/2addr v4, v9

    .line 154
    shl-int/lit8 v9, v2, 0x5

    .line 155
    .line 156
    ushr-int/lit8 v11, v2, 0x1b

    .line 157
    .line 158
    or-int/2addr v9, v11

    .line 159
    invoke-direct {p0, v3, v4, v5}, Lorg/spongycastle/crypto/digests/SHA1Digest;->f(III)I

    .line 160
    .line 161
    .line 162
    move-result v11

    .line 163
    add-int/2addr v9, v11

    .line 164
    iget-object v11, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 165
    .line 166
    add-int/lit8 v8, v8, 0x5

    .line 167
    .line 168
    aget v11, v11, v13

    .line 169
    .line 170
    add-int/2addr v9, v11

    .line 171
    add-int/2addr v9, v10

    .line 172
    add-int/2addr v1, v9

    .line 173
    shl-int/lit8 v9, v3, 0x1e

    .line 174
    .line 175
    ushr-int/lit8 v3, v3, 0x2

    .line 176
    .line 177
    or-int/2addr v3, v9

    .line 178
    add-int/lit8 v7, v7, 0x1

    .line 179
    .line 180
    goto/16 :goto_1

    .line 181
    .line 182
    :cond_1
    move v7, v6

    .line 183
    :goto_2
    if-ge v7, v9, :cond_2

    .line 184
    .line 185
    shl-int/lit8 v10, v1, 0x5

    .line 186
    .line 187
    ushr-int/lit8 v11, v1, 0x1b

    .line 188
    .line 189
    or-int/2addr v10, v11

    .line 190
    invoke-direct {p0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 191
    .line 192
    .line 193
    move-result v11

    .line 194
    add-int/2addr v10, v11

    .line 195
    iget-object v11, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 196
    .line 197
    add-int/lit8 v12, v8, 0x1

    .line 198
    .line 199
    aget v11, v11, v8

    .line 200
    .line 201
    add-int/2addr v10, v11

    .line 202
    const v11, 0x6ed9eba1

    .line 203
    .line 204
    .line 205
    add-int/2addr v10, v11

    .line 206
    add-int/2addr v5, v10

    .line 207
    shl-int/lit8 v10, v2, 0x1e

    .line 208
    .line 209
    ushr-int/lit8 v2, v2, 0x2

    .line 210
    .line 211
    or-int/2addr v2, v10

    .line 212
    shl-int/lit8 v10, v5, 0x5

    .line 213
    .line 214
    ushr-int/lit8 v13, v5, 0x1b

    .line 215
    .line 216
    or-int/2addr v10, v13

    .line 217
    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 218
    .line 219
    .line 220
    move-result v13

    .line 221
    add-int/2addr v10, v13

    .line 222
    iget-object v13, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 223
    .line 224
    add-int/lit8 v14, v8, 0x2

    .line 225
    .line 226
    aget v12, v13, v12

    .line 227
    .line 228
    add-int/2addr v10, v12

    .line 229
    add-int/2addr v10, v11

    .line 230
    add-int/2addr v4, v10

    .line 231
    shl-int/lit8 v10, v1, 0x1e

    .line 232
    .line 233
    ushr-int/lit8 v1, v1, 0x2

    .line 234
    .line 235
    or-int/2addr v1, v10

    .line 236
    shl-int/lit8 v10, v4, 0x5

    .line 237
    .line 238
    ushr-int/lit8 v12, v4, 0x1b

    .line 239
    .line 240
    or-int/2addr v10, v12

    .line 241
    invoke-direct {p0, v5, v1, v2}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 242
    .line 243
    .line 244
    move-result v12

    .line 245
    add-int/2addr v10, v12

    .line 246
    iget-object v12, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 247
    .line 248
    add-int/lit8 v13, v8, 0x3

    .line 249
    .line 250
    aget v12, v12, v14

    .line 251
    .line 252
    add-int/2addr v10, v12

    .line 253
    add-int/2addr v10, v11

    .line 254
    add-int/2addr v3, v10

    .line 255
    shl-int/lit8 v10, v5, 0x1e

    .line 256
    .line 257
    ushr-int/lit8 v5, v5, 0x2

    .line 258
    .line 259
    or-int/2addr v5, v10

    .line 260
    shl-int/lit8 v10, v3, 0x5

    .line 261
    .line 262
    ushr-int/lit8 v12, v3, 0x1b

    .line 263
    .line 264
    or-int/2addr v10, v12

    .line 265
    invoke-direct {p0, v4, v5, v1}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 266
    .line 267
    .line 268
    move-result v12

    .line 269
    add-int/2addr v10, v12

    .line 270
    iget-object v12, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 271
    .line 272
    add-int/lit8 v14, v8, 0x4

    .line 273
    .line 274
    aget v12, v12, v13

    .line 275
    .line 276
    add-int/2addr v10, v12

    .line 277
    add-int/2addr v10, v11

    .line 278
    add-int/2addr v2, v10

    .line 279
    shl-int/lit8 v10, v4, 0x1e

    .line 280
    .line 281
    ushr-int/lit8 v4, v4, 0x2

    .line 282
    .line 283
    or-int/2addr v4, v10

    .line 284
    shl-int/lit8 v10, v2, 0x5

    .line 285
    .line 286
    ushr-int/lit8 v12, v2, 0x1b

    .line 287
    .line 288
    or-int/2addr v10, v12

    .line 289
    invoke-direct {p0, v3, v4, v5}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 290
    .line 291
    .line 292
    move-result v12

    .line 293
    add-int/2addr v10, v12

    .line 294
    iget-object v12, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 295
    .line 296
    add-int/lit8 v8, v8, 0x5

    .line 297
    .line 298
    aget v12, v12, v14

    .line 299
    .line 300
    add-int/2addr v10, v12

    .line 301
    add-int/2addr v10, v11

    .line 302
    add-int/2addr v1, v10

    .line 303
    shl-int/lit8 v10, v3, 0x1e

    .line 304
    .line 305
    ushr-int/lit8 v3, v3, 0x2

    .line 306
    .line 307
    or-int/2addr v3, v10

    .line 308
    add-int/lit8 v7, v7, 0x1

    .line 309
    .line 310
    goto :goto_2

    .line 311
    :cond_2
    move v7, v6

    .line 312
    :goto_3
    if-ge v7, v9, :cond_3

    .line 313
    .line 314
    shl-int/lit8 v10, v1, 0x5

    .line 315
    .line 316
    ushr-int/lit8 v11, v1, 0x1b

    .line 317
    .line 318
    or-int/2addr v10, v11

    .line 319
    invoke-direct {p0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/SHA1Digest;->g(III)I

    .line 320
    .line 321
    .line 322
    move-result v11

    .line 323
    add-int/2addr v10, v11

    .line 324
    iget-object v11, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 325
    .line 326
    add-int/lit8 v12, v8, 0x1

    .line 327
    .line 328
    aget v11, v11, v8

    .line 329
    .line 330
    add-int/2addr v10, v11

    .line 331
    const v11, -0x70e44324

    .line 332
    .line 333
    .line 334
    add-int/2addr v10, v11

    .line 335
    add-int/2addr v5, v10

    .line 336
    shl-int/lit8 v10, v2, 0x1e

    .line 337
    .line 338
    ushr-int/lit8 v2, v2, 0x2

    .line 339
    .line 340
    or-int/2addr v2, v10

    .line 341
    shl-int/lit8 v10, v5, 0x5

    .line 342
    .line 343
    ushr-int/lit8 v13, v5, 0x1b

    .line 344
    .line 345
    or-int/2addr v10, v13

    .line 346
    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/SHA1Digest;->g(III)I

    .line 347
    .line 348
    .line 349
    move-result v13

    .line 350
    add-int/2addr v10, v13

    .line 351
    iget-object v13, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 352
    .line 353
    add-int/lit8 v14, v8, 0x2

    .line 354
    .line 355
    aget v12, v13, v12

    .line 356
    .line 357
    add-int/2addr v10, v12

    .line 358
    add-int/2addr v10, v11

    .line 359
    add-int/2addr v4, v10

    .line 360
    shl-int/lit8 v10, v1, 0x1e

    .line 361
    .line 362
    ushr-int/lit8 v1, v1, 0x2

    .line 363
    .line 364
    or-int/2addr v1, v10

    .line 365
    shl-int/lit8 v10, v4, 0x5

    .line 366
    .line 367
    ushr-int/lit8 v12, v4, 0x1b

    .line 368
    .line 369
    or-int/2addr v10, v12

    .line 370
    invoke-direct {p0, v5, v1, v2}, Lorg/spongycastle/crypto/digests/SHA1Digest;->g(III)I

    .line 371
    .line 372
    .line 373
    move-result v12

    .line 374
    add-int/2addr v10, v12

    .line 375
    iget-object v12, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 376
    .line 377
    add-int/lit8 v13, v8, 0x3

    .line 378
    .line 379
    aget v12, v12, v14

    .line 380
    .line 381
    add-int/2addr v10, v12

    .line 382
    add-int/2addr v10, v11

    .line 383
    add-int/2addr v3, v10

    .line 384
    shl-int/lit8 v10, v5, 0x1e

    .line 385
    .line 386
    ushr-int/lit8 v5, v5, 0x2

    .line 387
    .line 388
    or-int/2addr v5, v10

    .line 389
    shl-int/lit8 v10, v3, 0x5

    .line 390
    .line 391
    ushr-int/lit8 v12, v3, 0x1b

    .line 392
    .line 393
    or-int/2addr v10, v12

    .line 394
    invoke-direct {p0, v4, v5, v1}, Lorg/spongycastle/crypto/digests/SHA1Digest;->g(III)I

    .line 395
    .line 396
    .line 397
    move-result v12

    .line 398
    add-int/2addr v10, v12

    .line 399
    iget-object v12, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 400
    .line 401
    add-int/lit8 v14, v8, 0x4

    .line 402
    .line 403
    aget v12, v12, v13

    .line 404
    .line 405
    add-int/2addr v10, v12

    .line 406
    add-int/2addr v10, v11

    .line 407
    add-int/2addr v2, v10

    .line 408
    shl-int/lit8 v10, v4, 0x1e

    .line 409
    .line 410
    ushr-int/lit8 v4, v4, 0x2

    .line 411
    .line 412
    or-int/2addr v4, v10

    .line 413
    shl-int/lit8 v10, v2, 0x5

    .line 414
    .line 415
    ushr-int/lit8 v12, v2, 0x1b

    .line 416
    .line 417
    or-int/2addr v10, v12

    .line 418
    invoke-direct {p0, v3, v4, v5}, Lorg/spongycastle/crypto/digests/SHA1Digest;->g(III)I

    .line 419
    .line 420
    .line 421
    move-result v12

    .line 422
    add-int/2addr v10, v12

    .line 423
    iget-object v12, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 424
    .line 425
    add-int/lit8 v8, v8, 0x5

    .line 426
    .line 427
    aget v12, v12, v14

    .line 428
    .line 429
    add-int/2addr v10, v12

    .line 430
    add-int/2addr v10, v11

    .line 431
    add-int/2addr v1, v10

    .line 432
    shl-int/lit8 v10, v3, 0x1e

    .line 433
    .line 434
    ushr-int/lit8 v3, v3, 0x2

    .line 435
    .line 436
    or-int/2addr v3, v10

    .line 437
    add-int/lit8 v7, v7, 0x1

    .line 438
    .line 439
    goto :goto_3

    .line 440
    :cond_3
    move v7, v6

    .line 441
    :goto_4
    const/4 v9, 0x3

    .line 442
    if-gt v7, v9, :cond_4

    .line 443
    .line 444
    shl-int/lit8 v9, v1, 0x5

    .line 445
    .line 446
    ushr-int/lit8 v10, v1, 0x1b

    .line 447
    .line 448
    or-int/2addr v9, v10

    .line 449
    invoke-direct {p0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 450
    .line 451
    .line 452
    move-result v10

    .line 453
    add-int/2addr v9, v10

    .line 454
    iget-object v10, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 455
    .line 456
    add-int/lit8 v11, v8, 0x1

    .line 457
    .line 458
    aget v10, v10, v8

    .line 459
    .line 460
    add-int/2addr v9, v10

    .line 461
    const v10, -0x359d3e2a    # -3715189.5f

    .line 462
    .line 463
    .line 464
    add-int/2addr v9, v10

    .line 465
    add-int/2addr v5, v9

    .line 466
    shl-int/lit8 v9, v2, 0x1e

    .line 467
    .line 468
    ushr-int/lit8 v2, v2, 0x2

    .line 469
    .line 470
    or-int/2addr v2, v9

    .line 471
    shl-int/lit8 v9, v5, 0x5

    .line 472
    .line 473
    ushr-int/lit8 v12, v5, 0x1b

    .line 474
    .line 475
    or-int/2addr v9, v12

    .line 476
    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 477
    .line 478
    .line 479
    move-result v12

    .line 480
    add-int/2addr v9, v12

    .line 481
    iget-object v12, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 482
    .line 483
    add-int/lit8 v13, v8, 0x2

    .line 484
    .line 485
    aget v11, v12, v11

    .line 486
    .line 487
    add-int/2addr v9, v11

    .line 488
    add-int/2addr v9, v10

    .line 489
    add-int/2addr v4, v9

    .line 490
    shl-int/lit8 v9, v1, 0x1e

    .line 491
    .line 492
    ushr-int/lit8 v1, v1, 0x2

    .line 493
    .line 494
    or-int/2addr v1, v9

    .line 495
    shl-int/lit8 v9, v4, 0x5

    .line 496
    .line 497
    ushr-int/lit8 v11, v4, 0x1b

    .line 498
    .line 499
    or-int/2addr v9, v11

    .line 500
    invoke-direct {p0, v5, v1, v2}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 501
    .line 502
    .line 503
    move-result v11

    .line 504
    add-int/2addr v9, v11

    .line 505
    iget-object v11, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 506
    .line 507
    add-int/lit8 v12, v8, 0x3

    .line 508
    .line 509
    aget v11, v11, v13

    .line 510
    .line 511
    add-int/2addr v9, v11

    .line 512
    add-int/2addr v9, v10

    .line 513
    add-int/2addr v3, v9

    .line 514
    shl-int/lit8 v9, v5, 0x1e

    .line 515
    .line 516
    ushr-int/lit8 v5, v5, 0x2

    .line 517
    .line 518
    or-int/2addr v5, v9

    .line 519
    shl-int/lit8 v9, v3, 0x5

    .line 520
    .line 521
    ushr-int/lit8 v11, v3, 0x1b

    .line 522
    .line 523
    or-int/2addr v9, v11

    .line 524
    invoke-direct {p0, v4, v5, v1}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 525
    .line 526
    .line 527
    move-result v11

    .line 528
    add-int/2addr v9, v11

    .line 529
    iget-object v11, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 530
    .line 531
    add-int/lit8 v13, v8, 0x4

    .line 532
    .line 533
    aget v11, v11, v12

    .line 534
    .line 535
    add-int/2addr v9, v11

    .line 536
    add-int/2addr v9, v10

    .line 537
    add-int/2addr v2, v9

    .line 538
    shl-int/lit8 v9, v4, 0x1e

    .line 539
    .line 540
    ushr-int/lit8 v4, v4, 0x2

    .line 541
    .line 542
    or-int/2addr v4, v9

    .line 543
    shl-int/lit8 v9, v2, 0x5

    .line 544
    .line 545
    ushr-int/lit8 v11, v2, 0x1b

    .line 546
    .line 547
    or-int/2addr v9, v11

    .line 548
    invoke-direct {p0, v3, v4, v5}, Lorg/spongycastle/crypto/digests/SHA1Digest;->h(III)I

    .line 549
    .line 550
    .line 551
    move-result v11

    .line 552
    add-int/2addr v9, v11

    .line 553
    iget-object v11, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 554
    .line 555
    add-int/lit8 v8, v8, 0x5

    .line 556
    .line 557
    aget v11, v11, v13

    .line 558
    .line 559
    add-int/2addr v9, v11

    .line 560
    add-int/2addr v9, v10

    .line 561
    add-int/2addr v1, v9

    .line 562
    shl-int/lit8 v9, v3, 0x1e

    .line 563
    .line 564
    ushr-int/lit8 v3, v3, 0x2

    .line 565
    .line 566
    or-int/2addr v3, v9

    .line 567
    add-int/lit8 v7, v7, 0x1

    .line 568
    .line 569
    goto/16 :goto_4

    .line 570
    .line 571
    :cond_4
    iget v7, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 572
    .line 573
    add-int/2addr v7, v1

    .line 574
    iput v7, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 575
    .line 576
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 577
    .line 578
    add-int/2addr v1, v2

    .line 579
    iput v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 580
    .line 581
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 582
    .line 583
    add-int/2addr v1, v3

    .line 584
    iput v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 585
    .line 586
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 587
    .line 588
    add-int/2addr v1, v4

    .line 589
    iput v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 590
    .line 591
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 592
    .line 593
    add-int/2addr v1, v5

    .line 594
    iput v1, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 595
    .line 596
    iput v6, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 597
    .line 598
    move v1, v6

    .line 599
    :goto_5
    if-ge v1, v0, :cond_5

    .line 600
    .line 601
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 602
    .line 603
    aput v6, v2, v1

    .line 604
    .line 605
    add-int/lit8 v1, v1, 0x1

    .line 606
    .line 607
    goto :goto_5

    .line 608
    :cond_5
    return-void
.end method

.method public processLength(J)V
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHA1Digest;->processBlock()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 11
    .line 12
    const/16 v0, 0x20

    .line 13
    .line 14
    ushr-long v2, p1, v0

    .line 15
    .line 16
    long-to-int v0, v2

    .line 17
    aput v0, p0, v1

    .line 18
    .line 19
    const/16 v0, 0xf

    .line 20
    .line 21
    long-to-int p1, p1

    .line 22
    aput p1, p0, v0

    .line 23
    .line 24
    return-void
.end method

.method public processWord([BI)V
    .locals 3

    .line 1
    aget-byte v0, p1, p2

    .line 2
    .line 3
    shl-int/lit8 v0, v0, 0x18

    .line 4
    .line 5
    add-int/lit8 v1, p2, 0x1

    .line 6
    .line 7
    aget-byte v1, p1, v1

    .line 8
    .line 9
    and-int/lit16 v1, v1, 0xff

    .line 10
    .line 11
    const/16 v2, 0x10

    .line 12
    .line 13
    shl-int/2addr v1, v2

    .line 14
    or-int/2addr v0, v1

    .line 15
    add-int/lit8 v1, p2, 0x2

    .line 16
    .line 17
    aget-byte v1, p1, v1

    .line 18
    .line 19
    and-int/lit16 v1, v1, 0xff

    .line 20
    .line 21
    shl-int/lit8 v1, v1, 0x8

    .line 22
    .line 23
    or-int/2addr v0, v1

    .line 24
    add-int/lit8 p2, p2, 0x3

    .line 25
    .line 26
    aget-byte p1, p1, p2

    .line 27
    .line 28
    and-int/lit16 p1, p1, 0xff

    .line 29
    .line 30
    or-int/2addr p1, v0

    .line 31
    iget-object p2, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 32
    .line 33
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 34
    .line 35
    aput p1, p2, v0

    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 40
    .line 41
    if-ne v0, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHA1Digest;->processBlock()V

    .line 44
    .line 45
    .line 46
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
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H1:I

    .line 8
    .line 9
    const v0, -0x10325477

    .line 10
    .line 11
    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H2:I

    .line 13
    .line 14
    const v0, -0x67452302

    .line 15
    .line 16
    .line 17
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H3:I

    .line 18
    .line 19
    const v0, 0x10325476

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H4:I

    .line 23
    .line 24
    const v0, -0x3c2d1e10

    .line 25
    .line 26
    .line 27
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->H5:I

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->xOff:I

    .line 31
    .line 32
    move v1, v0

    .line 33
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHA1Digest;->X:[I

    .line 34
    .line 35
    array-length v3, v2

    .line 36
    if-eq v1, v3, :cond_0

    .line 37
    .line 38
    aput v0, v2, v1

    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method public reset(Lorg/spongycastle/util/Memoable;)V
    .locals 0

    .line 44
    check-cast p1, Lorg/spongycastle/crypto/digests/SHA1Digest;

    .line 45
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;->copyIn(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    .line 46
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/SHA1Digest;->copyIn(Lorg/spongycastle/crypto/digests/SHA1Digest;)V

    return-void
.end method

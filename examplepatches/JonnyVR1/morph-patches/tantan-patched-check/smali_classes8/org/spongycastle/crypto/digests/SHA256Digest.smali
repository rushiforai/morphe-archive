.class public Lorg/spongycastle/crypto/digests/SHA256Digest;
.super Lorg/spongycastle/crypto/digests/GeneralDigest;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/digests/EncodableDigest;


# static fields
.field private static final DIGEST_LENGTH:I = 0x20

.field static final K:[I


# instance fields
.field private H1:I

.field private H2:I

.field private H3:I

.field private H4:I

.field private H5:I

.field private H6:I

.field private H7:I

.field private H8:I

.field private X:[I

.field private xOff:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->K:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x428a2f98
        0x71374491
        -0x4a3f0431
        -0x164a245b
        0x3956c25b
        0x59f111f1
        -0x6dc07d5c    # -6.043E-28f
        -0x54e3a12b
        -0x27f85568
        0x12835b01
        0x243185be
        0x550c7dc3
        0x72be5d74
        -0x7f214e02
        -0x6423f959
        -0x3e640e8c
        -0x1b64963f
        -0x1041b87a
        0xfc19dc6
        0x240ca1cc
        0x2de92c6f
        0x4a7484aa    # 4006186.5f
        0x5cb0a9dc
        0x76f988da
        -0x67c1aeae
        -0x57ce3993
        -0x4ffcd838
        -0x40a68039
        -0x391ff40d
        -0x2a586eb9
        0x6ca6351
        0x14292967
        0x27b70a85
        0x2e1b2138
        0x4d2c6dfc    # 1.8080557E8f
        0x53380d13
        0x650a7354
        0x766a0abb
        -0x7e3d36d2
        -0x6d8dd37b
        -0x5d40175f
        -0x57e599b5
        -0x3db47490
        -0x3893ae5d
        -0x2e6d17e7
        -0x2966f9dc
        -0xbf1ca7b
        0x106aa070
        0x19a4c116
        0x1e376c08
        0x2748774c
        0x34b0bcb5
        0x391c0cb3
        0x4ed8aa4a    # 1.8175194E9f
        0x5b9cca4f
        0x682e6ff3
        0x748f82ee
        0x78a5636f
        -0x7b3787ec
        -0x7338fdf8
        -0x6f410006
        -0x5baf9315
        -0x41065c09
        -0x398e870e
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 106
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>()V

    const/16 v0, 0x40

    .line 107
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 108
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHA256Digest;->reset()V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/SHA256Digest;)V
    .locals 1

    .line 103
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    const/16 v0, 0x40

    .line 104
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 105
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/SHA256Digest;->copyIn(Lorg/spongycastle/crypto/digests/SHA256Digest;)V

    return-void
.end method

.method public constructor <init>([B)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>([B)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x40

    .line 5
    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

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
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

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
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

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
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

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
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

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
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

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
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 57
    .line 58
    const/16 v0, 0x28

    .line 59
    .line 60
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 65
    .line 66
    const/16 v0, 0x2c

    .line 67
    .line 68
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 73
    .line 74
    const/16 v0, 0x30

    .line 75
    .line 76
    invoke-static {p1, v0}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 81
    .line 82
    const/4 v0, 0x0

    .line 83
    :goto_0
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 84
    .line 85
    if-eq v0, v1, :cond_0

    .line 86
    .line 87
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 88
    .line 89
    mul-int/lit8 v2, v0, 0x4

    .line 90
    .line 91
    add-int/lit8 v2, v2, 0x34

    .line 92
    .line 93
    invoke-static {p1, v2}, Lorg/spongycastle/util/Pack;->bigEndianToInt([BI)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    aput v2, v1, v0

    .line 98
    .line 99
    add-int/lit8 v0, v0, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    return-void
.end method

.method private Ch(III)I
    .locals 0

    and-int p0, p1, p2

    not-int p1, p1

    and-int/2addr p1, p3

    xor-int/2addr p0, p1

    return p0
.end method

.method private Maj(III)I
    .locals 0

    and-int p0, p1, p2

    and-int/2addr p1, p3

    xor-int/2addr p0, p1

    and-int p1, p2, p3

    xor-int/2addr p0, p1

    return p0
.end method

.method private Sum0(I)I
    .locals 2

    ushr-int/lit8 p0, p1, 0x2

    shl-int/lit8 v0, p1, 0x1e

    or-int/2addr p0, v0

    ushr-int/lit8 v0, p1, 0xd

    shl-int/lit8 v1, p1, 0x13

    or-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 v0, p1, 0x16

    shl-int/lit8 p1, p1, 0xa

    or-int/2addr p1, v0

    xor-int/2addr p0, p1

    return p0
.end method

.method private Sum1(I)I
    .locals 2

    ushr-int/lit8 p0, p1, 0x6

    shl-int/lit8 v0, p1, 0x1a

    or-int/2addr p0, v0

    ushr-int/lit8 v0, p1, 0xb

    shl-int/lit8 v1, p1, 0x15

    or-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 v0, p1, 0x19

    shl-int/lit8 p1, p1, 0x7

    or-int/2addr p1, v0

    xor-int/2addr p0, p1

    return p0
.end method

.method private Theta0(I)I
    .locals 2

    ushr-int/lit8 p0, p1, 0x7

    shl-int/lit8 v0, p1, 0x19

    or-int/2addr p0, v0

    ushr-int/lit8 v0, p1, 0x12

    shl-int/lit8 v1, p1, 0xe

    or-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 p1, p1, 0x3

    xor-int/2addr p0, p1

    return p0
.end method

.method private Theta1(I)I
    .locals 2

    ushr-int/lit8 p0, p1, 0x11

    shl-int/lit8 v0, p1, 0xf

    or-int/2addr p0, v0

    ushr-int/lit8 v0, p1, 0x13

    shl-int/lit8 v1, p1, 0xd

    or-int/2addr v0, v1

    xor-int/2addr p0, v0

    ushr-int/lit8 p1, p1, 0xa

    xor-int/2addr p0, p1

    return p0
.end method

.method private copyIn(Lorg/spongycastle/crypto/digests/SHA256Digest;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;->copyIn(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

    .line 5
    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

    .line 7
    .line 8
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

    .line 9
    .line 10
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

    .line 11
    .line 12
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

    .line 13
    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

    .line 15
    .line 16
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

    .line 17
    .line 18
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

    .line 19
    .line 20
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

    .line 21
    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

    .line 23
    .line 24
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 25
    .line 26
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 27
    .line 28
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 29
    .line 30
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 31
    .line 32
    iget v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 33
    .line 34
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 35
    .line 36
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 37
    .line 38
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 39
    .line 40
    array-length v2, v0

    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    .line 44
    .line 45
    iget p1, p1, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 46
    .line 47
    iput p1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public copy()Lorg/spongycastle/util/Memoable;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA256Digest;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>(Lorg/spongycastle/crypto/digests/SHA256Digest;)V

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
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

    .line 5
    .line 6
    invoke-static {v0, p1, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

    .line 10
    .line 11
    add-int/lit8 v1, p2, 0x4

    .line 12
    .line 13
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

    .line 17
    .line 18
    add-int/lit8 v1, p2, 0x8

    .line 19
    .line 20
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

    .line 24
    .line 25
    add-int/lit8 v1, p2, 0xc

    .line 26
    .line 27
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 28
    .line 29
    .line 30
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

    .line 31
    .line 32
    add-int/lit8 v1, p2, 0x10

    .line 33
    .line 34
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 38
    .line 39
    add-int/lit8 v1, p2, 0x14

    .line 40
    .line 41
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 42
    .line 43
    .line 44
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 45
    .line 46
    add-int/lit8 v1, p2, 0x18

    .line 47
    .line 48
    invoke-static {v0, p1, v1}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 52
    .line 53
    add-int/lit8 p2, p2, 0x1c

    .line 54
    .line 55
    invoke-static {v0, p1, p2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHA256Digest;->reset()V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0x20

    .line 62
    .line 63
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "SHA-256"

    .line 2
    .line 3
    return-object p0
.end method

.method public getDigestSize()I
    .locals 0

    const/16 p0, 0x20

    return p0
.end method

.method public getEncodedState()[B
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x34

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    invoke-super {p0, v0}, Lorg/spongycastle/crypto/digests/GeneralDigest;->populateState([B)V

    .line 10
    .line 11
    .line 12
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

    .line 13
    .line 14
    const/16 v2, 0x10

    .line 15
    .line 16
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

    .line 20
    .line 21
    const/16 v2, 0x14

    .line 22
    .line 23
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 24
    .line 25
    .line 26
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

    .line 27
    .line 28
    const/16 v2, 0x18

    .line 29
    .line 30
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 31
    .line 32
    .line 33
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

    .line 34
    .line 35
    const/16 v2, 0x1c

    .line 36
    .line 37
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 38
    .line 39
    .line 40
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

    .line 41
    .line 42
    const/16 v2, 0x20

    .line 43
    .line 44
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 45
    .line 46
    .line 47
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 48
    .line 49
    const/16 v2, 0x24

    .line 50
    .line 51
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 52
    .line 53
    .line 54
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 55
    .line 56
    const/16 v2, 0x28

    .line 57
    .line 58
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 59
    .line 60
    .line 61
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 62
    .line 63
    const/16 v2, 0x2c

    .line 64
    .line 65
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 69
    .line 70
    const/16 v2, 0x30

    .line 71
    .line 72
    invoke-static {v1, v0, v2}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 73
    .line 74
    .line 75
    const/4 v1, 0x0

    .line 76
    :goto_0
    iget v2, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 77
    .line 78
    if-eq v1, v2, :cond_0

    .line 79
    .line 80
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 81
    .line 82
    aget v2, v2, v1

    .line 83
    .line 84
    mul-int/lit8 v3, v1, 0x4

    .line 85
    .line 86
    add-int/lit8 v3, v3, 0x34

    .line 87
    .line 88
    invoke-static {v2, v0, v3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 89
    .line 90
    .line 91
    add-int/lit8 v1, v1, 0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    return-object v0
.end method

.method public processBlock()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v2, 0x10

    .line 4
    .line 5
    :goto_0
    const/16 v3, 0x3f

    .line 6
    .line 7
    if-gt v2, v3, :cond_0

    .line 8
    .line 9
    iget-object v3, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 10
    .line 11
    add-int/lit8 v4, v2, -0x2

    .line 12
    .line 13
    aget v4, v3, v4

    .line 14
    .line 15
    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Theta1(I)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 20
    .line 21
    add-int/lit8 v6, v2, -0x7

    .line 22
    .line 23
    aget v6, v5, v6

    .line 24
    .line 25
    add-int/2addr v4, v6

    .line 26
    add-int/lit8 v6, v2, -0xf

    .line 27
    .line 28
    aget v5, v5, v6

    .line 29
    .line 30
    invoke-direct {v0, v5}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Theta0(I)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    add-int/2addr v4, v5

    .line 35
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 36
    .line 37
    add-int/lit8 v6, v2, -0x10

    .line 38
    .line 39
    aget v5, v5, v6

    .line 40
    .line 41
    add-int/2addr v4, v5

    .line 42
    aput v4, v3, v2

    .line 43
    .line 44
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget v2, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

    .line 48
    .line 49
    iget v3, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

    .line 50
    .line 51
    iget v4, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

    .line 52
    .line 53
    iget v5, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

    .line 54
    .line 55
    iget v6, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

    .line 56
    .line 57
    iget v7, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 58
    .line 59
    iget v8, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 60
    .line 61
    iget v9, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 62
    .line 63
    const/4 v10, 0x0

    .line 64
    move v11, v10

    .line 65
    move v12, v11

    .line 66
    :goto_1
    const/16 v13, 0x8

    .line 67
    .line 68
    if-ge v11, v13, :cond_1

    .line 69
    .line 70
    invoke-direct {v0, v6}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum1(I)I

    .line 71
    .line 72
    .line 73
    move-result v14

    .line 74
    invoke-direct {v0, v6, v7, v8}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Ch(III)I

    .line 75
    .line 76
    .line 77
    move-result v15

    .line 78
    add-int/2addr v14, v15

    .line 79
    sget-object v15, Lorg/spongycastle/crypto/digests/SHA256Digest;->K:[I

    .line 80
    .line 81
    aget v16, v15, v12

    .line 82
    .line 83
    add-int v14, v14, v16

    .line 84
    .line 85
    move/from16 v16, v13

    .line 86
    .line 87
    iget-object v13, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 88
    .line 89
    aget v13, v13, v12

    .line 90
    .line 91
    add-int/2addr v14, v13

    .line 92
    add-int/2addr v9, v14

    .line 93
    add-int/2addr v5, v9

    .line 94
    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum0(I)I

    .line 95
    .line 96
    .line 97
    move-result v13

    .line 98
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Maj(III)I

    .line 99
    .line 100
    .line 101
    move-result v14

    .line 102
    add-int/2addr v13, v14

    .line 103
    add-int/2addr v9, v13

    .line 104
    add-int/lit8 v13, v12, 0x1

    .line 105
    .line 106
    invoke-direct {v0, v5}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum1(I)I

    .line 107
    .line 108
    .line 109
    move-result v14

    .line 110
    invoke-direct {v0, v5, v6, v7}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Ch(III)I

    .line 111
    .line 112
    .line 113
    move-result v17

    .line 114
    add-int v14, v14, v17

    .line 115
    .line 116
    aget v17, v15, v13

    .line 117
    .line 118
    add-int v14, v14, v17

    .line 119
    .line 120
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 121
    .line 122
    aget v1, v1, v13

    .line 123
    .line 124
    add-int/2addr v14, v1

    .line 125
    add-int/2addr v8, v14

    .line 126
    add-int/2addr v4, v8

    .line 127
    invoke-direct {v0, v9}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum0(I)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    invoke-direct {v0, v9, v2, v3}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Maj(III)I

    .line 132
    .line 133
    .line 134
    move-result v13

    .line 135
    add-int/2addr v1, v13

    .line 136
    add-int/2addr v8, v1

    .line 137
    add-int/lit8 v1, v12, 0x2

    .line 138
    .line 139
    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum1(I)I

    .line 140
    .line 141
    .line 142
    move-result v13

    .line 143
    invoke-direct {v0, v4, v5, v6}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Ch(III)I

    .line 144
    .line 145
    .line 146
    move-result v14

    .line 147
    add-int/2addr v13, v14

    .line 148
    aget v14, v15, v1

    .line 149
    .line 150
    add-int/2addr v13, v14

    .line 151
    iget-object v14, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 152
    .line 153
    aget v1, v14, v1

    .line 154
    .line 155
    add-int/2addr v13, v1

    .line 156
    add-int/2addr v7, v13

    .line 157
    add-int/2addr v3, v7

    .line 158
    invoke-direct {v0, v8}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum0(I)I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    invoke-direct {v0, v8, v9, v2}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Maj(III)I

    .line 163
    .line 164
    .line 165
    move-result v13

    .line 166
    add-int/2addr v1, v13

    .line 167
    add-int/2addr v7, v1

    .line 168
    add-int/lit8 v1, v12, 0x3

    .line 169
    .line 170
    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum1(I)I

    .line 171
    .line 172
    .line 173
    move-result v13

    .line 174
    invoke-direct {v0, v3, v4, v5}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Ch(III)I

    .line 175
    .line 176
    .line 177
    move-result v14

    .line 178
    add-int/2addr v13, v14

    .line 179
    aget v14, v15, v1

    .line 180
    .line 181
    add-int/2addr v13, v14

    .line 182
    iget-object v14, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 183
    .line 184
    aget v1, v14, v1

    .line 185
    .line 186
    add-int/2addr v13, v1

    .line 187
    add-int/2addr v6, v13

    .line 188
    add-int/2addr v2, v6

    .line 189
    invoke-direct {v0, v7}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum0(I)I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    invoke-direct {v0, v7, v8, v9}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Maj(III)I

    .line 194
    .line 195
    .line 196
    move-result v13

    .line 197
    add-int/2addr v1, v13

    .line 198
    add-int/2addr v6, v1

    .line 199
    add-int/lit8 v1, v12, 0x4

    .line 200
    .line 201
    invoke-direct {v0, v2}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum1(I)I

    .line 202
    .line 203
    .line 204
    move-result v13

    .line 205
    invoke-direct {v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Ch(III)I

    .line 206
    .line 207
    .line 208
    move-result v14

    .line 209
    add-int/2addr v13, v14

    .line 210
    aget v14, v15, v1

    .line 211
    .line 212
    add-int/2addr v13, v14

    .line 213
    iget-object v14, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 214
    .line 215
    aget v1, v14, v1

    .line 216
    .line 217
    add-int/2addr v13, v1

    .line 218
    add-int/2addr v5, v13

    .line 219
    add-int/2addr v9, v5

    .line 220
    invoke-direct {v0, v6}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum0(I)I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    invoke-direct {v0, v6, v7, v8}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Maj(III)I

    .line 225
    .line 226
    .line 227
    move-result v13

    .line 228
    add-int/2addr v1, v13

    .line 229
    add-int/2addr v5, v1

    .line 230
    add-int/lit8 v1, v12, 0x5

    .line 231
    .line 232
    invoke-direct {v0, v9}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum1(I)I

    .line 233
    .line 234
    .line 235
    move-result v13

    .line 236
    invoke-direct {v0, v9, v2, v3}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Ch(III)I

    .line 237
    .line 238
    .line 239
    move-result v14

    .line 240
    add-int/2addr v13, v14

    .line 241
    aget v14, v15, v1

    .line 242
    .line 243
    add-int/2addr v13, v14

    .line 244
    iget-object v14, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 245
    .line 246
    aget v1, v14, v1

    .line 247
    .line 248
    add-int/2addr v13, v1

    .line 249
    add-int/2addr v4, v13

    .line 250
    add-int/2addr v8, v4

    .line 251
    invoke-direct {v0, v5}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum0(I)I

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    invoke-direct {v0, v5, v6, v7}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Maj(III)I

    .line 256
    .line 257
    .line 258
    move-result v13

    .line 259
    add-int/2addr v1, v13

    .line 260
    add-int/2addr v4, v1

    .line 261
    add-int/lit8 v1, v12, 0x6

    .line 262
    .line 263
    invoke-direct {v0, v8}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum1(I)I

    .line 264
    .line 265
    .line 266
    move-result v13

    .line 267
    invoke-direct {v0, v8, v9, v2}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Ch(III)I

    .line 268
    .line 269
    .line 270
    move-result v14

    .line 271
    add-int/2addr v13, v14

    .line 272
    aget v14, v15, v1

    .line 273
    .line 274
    add-int/2addr v13, v14

    .line 275
    iget-object v14, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 276
    .line 277
    aget v1, v14, v1

    .line 278
    .line 279
    add-int/2addr v13, v1

    .line 280
    add-int/2addr v3, v13

    .line 281
    add-int/2addr v7, v3

    .line 282
    invoke-direct {v0, v4}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum0(I)I

    .line 283
    .line 284
    .line 285
    move-result v1

    .line 286
    invoke-direct {v0, v4, v5, v6}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Maj(III)I

    .line 287
    .line 288
    .line 289
    move-result v13

    .line 290
    add-int/2addr v1, v13

    .line 291
    add-int/2addr v3, v1

    .line 292
    add-int/lit8 v1, v12, 0x7

    .line 293
    .line 294
    invoke-direct {v0, v7}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum1(I)I

    .line 295
    .line 296
    .line 297
    move-result v13

    .line 298
    invoke-direct {v0, v7, v8, v9}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Ch(III)I

    .line 299
    .line 300
    .line 301
    move-result v14

    .line 302
    add-int/2addr v13, v14

    .line 303
    aget v14, v15, v1

    .line 304
    .line 305
    add-int/2addr v13, v14

    .line 306
    iget-object v14, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 307
    .line 308
    aget v1, v14, v1

    .line 309
    .line 310
    add-int/2addr v13, v1

    .line 311
    add-int/2addr v2, v13

    .line 312
    add-int/2addr v6, v2

    .line 313
    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Sum0(I)I

    .line 314
    .line 315
    .line 316
    move-result v1

    .line 317
    invoke-direct {v0, v3, v4, v5}, Lorg/spongycastle/crypto/digests/SHA256Digest;->Maj(III)I

    .line 318
    .line 319
    .line 320
    move-result v13

    .line 321
    add-int/2addr v1, v13

    .line 322
    add-int/2addr v2, v1

    .line 323
    add-int/lit8 v12, v12, 0x8

    .line 324
    .line 325
    add-int/lit8 v11, v11, 0x1

    .line 326
    .line 327
    goto/16 :goto_1

    .line 328
    .line 329
    :cond_1
    iget v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

    .line 330
    .line 331
    add-int/2addr v1, v2

    .line 332
    iput v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

    .line 333
    .line 334
    iget v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

    .line 335
    .line 336
    add-int/2addr v1, v3

    .line 337
    iput v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

    .line 338
    .line 339
    iget v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

    .line 340
    .line 341
    add-int/2addr v1, v4

    .line 342
    iput v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

    .line 343
    .line 344
    iget v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

    .line 345
    .line 346
    add-int/2addr v1, v5

    .line 347
    iput v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

    .line 348
    .line 349
    iget v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

    .line 350
    .line 351
    add-int/2addr v1, v6

    .line 352
    iput v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

    .line 353
    .line 354
    iget v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 355
    .line 356
    add-int/2addr v1, v7

    .line 357
    iput v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 358
    .line 359
    iget v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 360
    .line 361
    add-int/2addr v1, v8

    .line 362
    iput v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 363
    .line 364
    iget v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 365
    .line 366
    add-int/2addr v1, v9

    .line 367
    iput v1, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 368
    .line 369
    iput v10, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 370
    .line 371
    move v1, v10

    .line 372
    const/16 v2, 0x10

    .line 373
    .line 374
    :goto_2
    if-ge v1, v2, :cond_2

    .line 375
    .line 376
    iget-object v3, v0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 377
    .line 378
    aput v10, v3, v1

    .line 379
    .line 380
    add-int/lit8 v1, v1, 0x1

    .line 381
    .line 382
    goto :goto_2

    .line 383
    :cond_2
    return-void
.end method

.method public processLength(J)V
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHA256Digest;->processBlock()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

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
    iget-object p2, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 32
    .line 33
    iget v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 34
    .line 35
    aput p1, p2, v0

    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 40
    .line 41
    if-ne v0, v2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/SHA256Digest;->processBlock()V

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
    const v0, 0x6a09e667

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H1:I

    .line 8
    .line 9
    const v0, -0x4498517b

    .line 10
    .line 11
    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H2:I

    .line 13
    .line 14
    const v0, 0x3c6ef372

    .line 15
    .line 16
    .line 17
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H3:I

    .line 18
    .line 19
    const v0, -0x5ab00ac6

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H4:I

    .line 23
    .line 24
    const v0, 0x510e527f

    .line 25
    .line 26
    .line 27
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H5:I

    .line 28
    .line 29
    const v0, -0x64fa9774

    .line 30
    .line 31
    .line 32
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H6:I

    .line 33
    .line 34
    const v0, 0x1f83d9ab

    .line 35
    .line 36
    .line 37
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H7:I

    .line 38
    .line 39
    const v0, 0x5be0cd19

    .line 40
    .line 41
    .line 42
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->H8:I

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput v0, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->xOff:I

    .line 46
    .line 47
    move v1, v0

    .line 48
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/SHA256Digest;->X:[I

    .line 49
    .line 50
    array-length v3, v2

    .line 51
    if-eq v1, v3, :cond_0

    .line 52
    .line 53
    aput v0, v2, v1

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method

.method public reset(Lorg/spongycastle/util/Memoable;)V
    .locals 0

    .line 59
    check-cast p1, Lorg/spongycastle/crypto/digests/SHA256Digest;

    .line 60
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/SHA256Digest;->copyIn(Lorg/spongycastle/crypto/digests/SHA256Digest;)V

    return-void
.end method

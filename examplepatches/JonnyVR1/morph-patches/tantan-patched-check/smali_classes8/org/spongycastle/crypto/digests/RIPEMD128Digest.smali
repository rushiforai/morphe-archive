.class public Lorg/spongycastle/crypto/digests/RIPEMD128Digest;
.super Lorg/spongycastle/crypto/digests/GeneralDigest;
.source "SourceFile"


# static fields
.field private static final DIGEST_LENGTH:I = 0x10


# instance fields
.field private H0:I

.field private H1:I

.field private H2:I

.field private H3:I

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
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->reset()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/RIPEMD128Digest;)V
    .locals 1

    .line 14
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;-><init>(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    const/16 v0, 0x10

    .line 15
    new-array v0, v0, [I

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    .line 16
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->copyIn(Lorg/spongycastle/crypto/digests/RIPEMD128Digest;)V

    return-void
.end method

.method private F1(IIIIII)I
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->f1(III)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    add-int/2addr p1, p2

    .line 6
    add-int/2addr p1, p5

    .line 7
    invoke-direct {p0, p1, p6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->RL(II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private F2(IIIIII)I
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->f2(III)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    add-int/2addr p1, p2

    .line 6
    add-int/2addr p1, p5

    .line 7
    const p2, 0x5a827999

    .line 8
    .line 9
    .line 10
    add-int/2addr p1, p2

    .line 11
    invoke-direct {p0, p1, p6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->RL(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private F3(IIIIII)I
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->f3(III)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    add-int/2addr p1, p2

    .line 6
    add-int/2addr p1, p5

    .line 7
    const p2, 0x6ed9eba1

    .line 8
    .line 9
    .line 10
    add-int/2addr p1, p2

    .line 11
    invoke-direct {p0, p1, p6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->RL(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private F4(IIIIII)I
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->f4(III)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    add-int/2addr p1, p2

    .line 6
    add-int/2addr p1, p5

    .line 7
    const p2, -0x70e44324

    .line 8
    .line 9
    .line 10
    add-int/2addr p1, p2

    .line 11
    invoke-direct {p0, p1, p6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->RL(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private FF1(IIIIII)I
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->f1(III)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    add-int/2addr p1, p2

    .line 6
    add-int/2addr p1, p5

    .line 7
    invoke-direct {p0, p1, p6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->RL(II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private FF2(IIIIII)I
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->f2(III)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    add-int/2addr p1, p2

    .line 6
    add-int/2addr p1, p5

    .line 7
    const p2, 0x6d703ef3

    .line 8
    .line 9
    .line 10
    add-int/2addr p1, p2

    .line 11
    invoke-direct {p0, p1, p6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->RL(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private FF3(IIIIII)I
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->f3(III)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    add-int/2addr p1, p2

    .line 6
    add-int/2addr p1, p5

    .line 7
    const p2, 0x5c4dd124

    .line 8
    .line 9
    .line 10
    add-int/2addr p1, p2

    .line 11
    invoke-direct {p0, p1, p6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->RL(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private FF4(IIIIII)I
    .locals 0

    .line 1
    invoke-direct {p0, p2, p3, p4}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->f4(III)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    add-int/2addr p1, p2

    .line 6
    add-int/2addr p1, p5

    .line 7
    const p2, 0x50a28be6

    .line 8
    .line 9
    .line 10
    add-int/2addr p1, p2

    .line 11
    invoke-direct {p0, p1, p6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->RL(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private RL(II)I
    .locals 0

    shl-int p0, p1, p2

    rsub-int/lit8 p2, p2, 0x20

    ushr-int/2addr p1, p2

    or-int/2addr p0, p1

    return p0
.end method

.method private copyIn(Lorg/spongycastle/crypto/digests/RIPEMD128Digest;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lorg/spongycastle/crypto/digests/GeneralDigest;->copyIn(Lorg/spongycastle/crypto/digests/GeneralDigest;)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H0:I

    .line 5
    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H0:I

    .line 7
    .line 8
    iget v0, p1, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H1:I

    .line 9
    .line 10
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H1:I

    .line 11
    .line 12
    iget v0, p1, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H2:I

    .line 13
    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H2:I

    .line 15
    .line 16
    iget v0, p1, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H3:I

    .line 17
    .line 18
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H3:I

    .line 19
    .line 20
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    .line 21
    .line 22
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

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
    iget p1, p1, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->xOff:I

    .line 30
    .line 31
    iput p1, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->xOff:I

    .line 32
    .line 33
    return-void
.end method

.method private f1(III)I
    .locals 0

    xor-int p0, p1, p2

    xor-int/2addr p0, p3

    return p0
.end method

.method private f2(III)I
    .locals 0

    and-int p0, p1, p2

    not-int p1, p1

    and-int/2addr p1, p3

    or-int/2addr p0, p1

    return p0
.end method

.method private f3(III)I
    .locals 0

    not-int p0, p2

    or-int/2addr p0, p1

    xor-int/2addr p0, p3

    return p0
.end method

.method private f4(III)I
    .locals 0

    and-int p0, p1, p3

    not-int p1, p3

    and-int/2addr p1, p2

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
    new-instance v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;-><init>(Lorg/spongycastle/crypto/digests/RIPEMD128Digest;)V

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
    iget v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H0:I

    .line 5
    .line 6
    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->unpackWord(I[BI)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H1:I

    .line 10
    .line 11
    add-int/lit8 v1, p2, 0x4

    .line 12
    .line 13
    invoke-direct {p0, v0, p1, v1}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->unpackWord(I[BI)V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H2:I

    .line 17
    .line 18
    add-int/lit8 v1, p2, 0x8

    .line 19
    .line 20
    invoke-direct {p0, v0, p1, v1}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->unpackWord(I[BI)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H3:I

    .line 24
    .line 25
    add-int/lit8 p2, p2, 0xc

    .line 26
    .line 27
    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->unpackWord(I[BI)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->reset()V

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
    const-string p0, "RIPEMD128"

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
    .locals 32

    move-object/from16 v0, p0

    .line 1
    iget v1, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H0:I

    .line 2
    iget v2, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H1:I

    .line 3
    iget v3, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H2:I

    .line 4
    iget v4, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H3:I

    .line 5
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/4 v7, 0x0

    aget v5, v5, v7

    const/16 v6, 0xb

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v5

    move v8, v1

    move v1, v2

    .line 6
    iget-object v2, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/4 v9, 0x1

    aget v2, v2, v9

    const/16 v6, 0xe

    move/from16 v31, v3

    move v3, v1

    move v1, v4

    move/from16 v4, v31

    move/from16 v31, v5

    move v5, v2

    move/from16 v2, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v5

    move v10, v1

    move v1, v3

    move v3, v4

    .line 7
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/4 v11, 0x2

    aget v4, v4, v11

    const/16 v6, 0xf

    move/from16 v31, v4

    move v4, v1

    move v1, v3

    move v3, v2

    move v2, v5

    move/from16 v5, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v5

    move v12, v3

    move v3, v2

    move v2, v12

    move v12, v1

    move v1, v4

    .line 8
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/4 v13, 0x3

    aget v4, v4, v13

    const/16 v6, 0xc

    move/from16 v31, v4

    move v4, v2

    move v2, v5

    move/from16 v5, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v5

    move v14, v1

    move v1, v2

    move v2, v4

    .line 9
    iget-object v4, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/4 v15, 0x4

    aget v4, v4, v15

    const/4 v6, 0x5

    move/from16 v31, v3

    move v3, v1

    move v1, v2

    move v2, v5

    move v5, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 10
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v16, 0x5

    aget v5, v5, v16

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 11
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v17, 0x6

    aget v5, v5, v17

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    .line 12
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v18, 0x7

    aget v5, v5, v18

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 13
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v19, 0x8

    aget v5, v5, v19

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 14
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v20, 0x9

    aget v5, v5, v20

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    .line 15
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v21, 0xa

    aget v5, v5, v21

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 16
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v22, 0xb

    aget v5, v5, v22

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 17
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v23, 0xc

    aget v5, v5, v23

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    .line 18
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v24, 0xd

    aget v5, v5, v24

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 19
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v25, 0xe

    aget v5, v5, v25

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 20
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    const/16 v26, 0xf

    aget v5, v5, v26

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F1(IIIIII)I

    move-result v1

    .line 21
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v18

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 22
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v15

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 23
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v24

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    .line 24
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v9

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 25
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v21

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 26
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v17

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    .line 27
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v26

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 28
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v13

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 29
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v23

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    .line 30
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v7

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 31
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v20

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 32
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v16

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    .line 33
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v11

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 34
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v25

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 35
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v22

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    .line 36
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v19

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 37
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v13

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 38
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v21

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    .line 39
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v25

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 40
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v15

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 41
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v20

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    .line 42
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v26

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 43
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v19

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 44
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v9

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    .line 45
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v11

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 46
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v18

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 47
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v7

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    .line 48
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v17

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 49
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v24

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 50
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v22

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    .line 51
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v16

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 52
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v23

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 53
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v9

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    .line 54
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v20

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 55
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v22

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 56
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v21

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    .line 57
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v7

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 58
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v19

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 59
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v23

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    .line 60
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v15

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 61
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v24

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 62
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v13

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    .line 63
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v18

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 64
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v26

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 65
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v25

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    .line 66
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v16

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 67
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v17

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 68
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v11

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->F4(IIIIII)I

    move-result v27

    move/from16 v30, v2

    move/from16 v29, v3

    move/from16 v28, v4

    .line 69
    iget-object v1, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v1, v16

    const/16 v6, 0x8

    move v1, v8

    move v4, v10

    move v3, v12

    move v2, v14

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    .line 70
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v25

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 71
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v18

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 72
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v7

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    .line 73
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v20

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 74
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v11

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 75
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v22

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    .line 76
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v15

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 77
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v24

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 78
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v17

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    .line 79
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v26

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 80
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v19

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 81
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v9

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    .line 82
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v21

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 83
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v13

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 84
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v23

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF4(IIIIII)I

    move-result v1

    .line 85
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v17

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 86
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v22

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 87
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v13

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    .line 88
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v18

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 89
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v7

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 90
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v24

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    .line 91
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v16

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 92
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v21

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 93
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v25

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    .line 94
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v26

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 95
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v19

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 96
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v23

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    .line 97
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v15

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 98
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v20

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 99
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v9

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    .line 100
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v11

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF3(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 101
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v26

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 102
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v16

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    .line 103
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v9

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 104
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v13

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 105
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v18

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    .line 106
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v25

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 107
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v17

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 108
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v20

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    .line 109
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v22

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 110
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v19

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 111
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v23

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    .line 112
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v11

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 113
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v21

    const/16 v6, 0xd

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 114
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v7

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    .line 115
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v15

    const/4 v6, 0x7

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 116
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v24

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF2(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 117
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v19

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    .line 118
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v17

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 119
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v15

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 120
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v9

    const/16 v6, 0xb

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    .line 121
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v13

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 122
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v22

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 123
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v26

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    .line 124
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v7

    const/16 v6, 0xe

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 125
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v16

    const/4 v6, 0x6

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 126
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v23

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    .line 127
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v11

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 128
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v24

    const/16 v6, 0x9

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 129
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v20

    const/16 v6, 0xc

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    .line 130
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v18

    const/4 v6, 0x5

    move/from16 v31, v2

    move v2, v1

    move v1, v4

    move v4, v3

    move/from16 v3, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v4

    move v4, v2

    move v2, v3

    move/from16 v3, v31

    .line 131
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v21

    const/16 v6, 0xf

    move/from16 v31, v2

    move v2, v1

    move v1, v3

    move v3, v4

    move/from16 v4, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    move/from16 v31, v3

    move v3, v2

    move v2, v4

    move/from16 v4, v31

    .line 132
    iget-object v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    aget v5, v5, v25

    const/16 v6, 0x8

    move/from16 v31, v2

    move v2, v1

    move/from16 v1, v31

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->FF1(IIIIII)I

    move-result v1

    .line 133
    iget v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H1:I

    add-int v5, v30, v5

    add-int/2addr v3, v5

    .line 134
    iget v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H2:I

    add-int v5, v5, v29

    add-int/2addr v5, v4

    iput v5, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H1:I

    .line 135
    iget v4, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H3:I

    add-int v4, v4, v28

    add-int/2addr v4, v1

    iput v4, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H2:I

    .line 136
    iget v1, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H0:I

    add-int v1, v1, v27

    add-int/2addr v1, v2

    iput v1, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H3:I

    .line 137
    iput v3, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H0:I

    .line 138
    iput v7, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->xOff:I

    move v1, v7

    .line 139
    :goto_0
    iget-object v2, v0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    array-length v3, v2

    if-eq v1, v3, :cond_0

    .line 140
    aput v7, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public processLength(J)V
    .locals 2

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->xOff:I

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    if-le v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->processBlock()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

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
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->xOff:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->xOff:I

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
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->processBlock()V

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
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H0:I

    .line 8
    .line 9
    const v0, -0x10325477

    .line 10
    .line 11
    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H1:I

    .line 13
    .line 14
    const v0, -0x67452302

    .line 15
    .line 16
    .line 17
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H2:I

    .line 18
    .line 19
    const v0, 0x10325476

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->H3:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->xOff:I

    .line 26
    .line 27
    move v1, v0

    .line 28
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->X:[I

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
    check-cast p1, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;

    .line 40
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/RIPEMD128Digest;->copyIn(Lorg/spongycastle/crypto/digests/RIPEMD128Digest;)V

    return-void
.end method

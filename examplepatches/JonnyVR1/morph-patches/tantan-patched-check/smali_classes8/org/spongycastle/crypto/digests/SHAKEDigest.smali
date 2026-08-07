.class public Lorg/spongycastle/crypto/digests/SHAKEDigest;
.super Lorg/spongycastle/crypto/digests/KeccakDigest;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Xof;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x80

    .line 9
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/SHAKEDigest;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->checkBitLength(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;-><init>(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/SHAKEDigest;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;-><init>(Lorg/spongycastle/crypto/digests/KeccakDigest;)V

    return-void
.end method

.method private static checkBitLength(I)I
    .locals 2

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x100

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "\'bitLength\' "

    .line 11
    .line 12
    const-string v1, " not supported for SHAKE"

    .line 13
    .line 14
    invoke-static {v0, p0, v1}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    :cond_1
    :goto_0
    return p0
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 1

    .line 67
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->getDigestSize()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->doFinal([BII)I

    move-result p0

    return p0
.end method

.method public doFinal([BIBI)I
    .locals 6

    .line 66
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->getDigestSize()I

    move-result v3

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/digests/SHAKEDigest;->doFinal([BIIBI)I

    move-result p0

    return p0
.end method

.method public doFinal([BII)I
    .locals 4

    const/4 v0, 0x1

    .line 63
    new-array v0, v0, [B

    const/4 v1, 0x0

    const/16 v2, 0xf

    aput-byte v2, v0, v1

    const-wide/16 v2, 0x4

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    int-to-long v0, p3

    const-wide/16 v2, 0x8

    mul-long/2addr v0, v2

    .line 64
    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeeze([BIJ)V

    .line 65
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->reset()V

    return p3
.end method

.method public doFinal([BIIBI)I
    .locals 7

    .line 1
    if-ltz p5, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    if-gt p5, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    shl-int v1, v0, p5

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    and-int/2addr p4, v1

    .line 11
    const/16 v0, 0xf

    .line 12
    .line 13
    shl-int/2addr v0, p5

    .line 14
    or-int/2addr p4, v0

    .line 15
    add-int/lit8 v0, p5, 0x4

    .line 16
    .line 17
    const-wide/16 v1, 0x8

    .line 18
    .line 19
    const/16 v3, 0x8

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-lt v0, v3, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 25
    .line 26
    int-to-byte v3, p4

    .line 27
    aput-byte v3, v0, v4

    .line 28
    .line 29
    invoke-virtual {p0, v0, v4, v1, v2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 v0, p5, -0x4

    .line 33
    .line 34
    ushr-int/lit8 p4, p4, 0x8

    .line 35
    .line 36
    :cond_0
    if-lez v0, :cond_1

    .line 37
    .line 38
    iget-object p5, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 39
    .line 40
    int-to-byte p4, p4

    .line 41
    aput-byte p4, p5, v4

    .line 42
    .line 43
    int-to-long v5, v0

    .line 44
    invoke-virtual {p0, p5, v4, v5, v6}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 45
    .line 46
    .line 47
    :cond_1
    int-to-long p4, p3

    .line 48
    mul-long/2addr p4, v1

    .line 49
    invoke-virtual {p0, p1, p2, p4, p5}, Lorg/spongycastle/crypto/digests/KeccakDigest;->squeeze([BIJ)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->reset()V

    .line 53
    .line 54
    .line 55
    return p3

    .line 56
    :cond_2
    const-string p0, "\'partialBits\' must be in the range [0,7]"

    .line 57
    .line 58
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const/4 p0, 0x0

    .line 62
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SHAKE"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->fixedOutputLength:I

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

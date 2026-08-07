.class public Lorg/spongycastle/crypto/digests/SHA3Digest;
.super Lorg/spongycastle/crypto/digests/KeccakDigest;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x100

    .line 9
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/SHA3Digest;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/spongycastle/crypto/digests/SHA3Digest;->checkBitLength(I)I

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

.method public constructor <init>(Lorg/spongycastle/crypto/digests/SHA3Digest;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/KeccakDigest;-><init>(Lorg/spongycastle/crypto/digests/KeccakDigest;)V

    return-void
.end method

.method private static checkBitLength(I)I
    .locals 2

    .line 1
    const/16 v0, 0xe0

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x100

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x180

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    const/16 v0, 0x200

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v0, "\'bitLength\' "

    .line 19
    .line 20
    const-string v1, " not supported for SHA-3"

    .line 21
    .line 22
    invoke-static {v0, p0, v1}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    :cond_1
    :goto_0
    return p0
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 4

    const/4 v0, 0x1

    .line 48
    new-array v0, v0, [B

    const/4 v1, 0x0

    const/4 v2, 0x2

    aput-byte v2, v0, v1

    const-wide/16 v2, 0x2

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 49
    invoke-super {p0, p1, p2}, Lorg/spongycastle/crypto/digests/KeccakDigest;->doFinal([BI)I

    move-result p0

    return p0
.end method

.method public doFinal([BIBI)I
    .locals 5

    .line 1
    if-ltz p4, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    if-gt p4, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    shl-int v1, v0, p4

    .line 8
    .line 9
    sub-int/2addr v1, v0

    .line 10
    and-int/2addr p3, v1

    .line 11
    const/4 v0, 0x2

    .line 12
    shl-int/2addr v0, p4

    .line 13
    or-int/2addr p3, v0

    .line 14
    add-int/lit8 v0, p4, 0x2

    .line 15
    .line 16
    const/16 v1, 0x8

    .line 17
    .line 18
    if-lt v0, v1, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/KeccakDigest;->oneByte:[B

    .line 21
    .line 22
    int-to-byte v1, p3

    .line 23
    const/4 v2, 0x0

    .line 24
    aput-byte v1, v0, v2

    .line 25
    .line 26
    const-wide/16 v3, 0x8

    .line 27
    .line 28
    invoke-virtual {p0, v0, v2, v3, v4}, Lorg/spongycastle/crypto/digests/KeccakDigest;->absorb([BIJ)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v0, p4, -0x6

    .line 32
    .line 33
    ushr-int/lit8 p3, p3, 0x8

    .line 34
    .line 35
    :cond_0
    int-to-byte p3, p3

    .line 36
    invoke-super {p0, p1, p2, p3, v0}, Lorg/spongycastle/crypto/digests/KeccakDigest;->doFinal([BIBI)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_1
    const-string p0, "\'partialBits\' must be in the range [0,7]"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SHA3-"

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

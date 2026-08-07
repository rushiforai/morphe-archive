.class public Lorg/spongycastle/crypto/prng/drbg/DualECPoints;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final cofactor:I

.field private final p:Lorg/spongycastle/math/ec/ECPoint;

.field private final q:Lorg/spongycastle/math/ec/ECPoint;

.field private final securityStrength:I


# direct methods
.method public constructor <init>(ILorg/spongycastle/math/ec/ECPoint;Lorg/spongycastle/math/ec/ECPoint;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p3}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECCurve;->equals(Lorg/spongycastle/math/ec/ECCurve;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iput p1, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->securityStrength:I

    .line 19
    .line 20
    iput-object p2, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->p:Lorg/spongycastle/math/ec/ECPoint;

    .line 21
    .line 22
    iput-object p3, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 23
    .line 24
    iput p4, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->cofactor:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "points need to be on the same curve"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    throw p0
.end method

.method private static log2(I)I
    .locals 1

    const/4 v0, 0x0

    :goto_0
    shr-int/lit8 p0, p0, 0x1

    if-eqz p0, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method


# virtual methods
.method public getCofactor()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->cofactor:I

    .line 2
    .line 3
    return p0
.end method

.method public getMaxOutlen()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->p:Lorg/spongycastle/math/ec/ECPoint;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget p0, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->cofactor:I

    .line 12
    .line 13
    invoke-static {p0}, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->log2(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/lit8 p0, p0, 0xd

    .line 18
    .line 19
    sub-int/2addr v0, p0

    .line 20
    div-int/lit8 v0, v0, 0x8

    .line 21
    .line 22
    mul-int/lit8 v0, v0, 0x8

    .line 23
    .line 24
    return v0
.end method

.method public getP()Lorg/spongycastle/math/ec/ECPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->p:Lorg/spongycastle/math/ec/ECPoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public getQ()Lorg/spongycastle/math/ec/ECPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->q:Lorg/spongycastle/math/ec/ECPoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSecurityStrength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->securityStrength:I

    .line 2
    .line 3
    return p0
.end method

.method public getSeedLen()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/prng/drbg/DualECPoints;->p:Lorg/spongycastle/math/ec/ECPoint;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

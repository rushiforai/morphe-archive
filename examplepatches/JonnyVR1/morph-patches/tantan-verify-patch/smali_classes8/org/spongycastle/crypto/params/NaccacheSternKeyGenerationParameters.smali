.class public Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;
.super Lorg/spongycastle/crypto/KeyGenerationParameters;
.source "SourceFile"


# instance fields
.field private certainty:I

.field private cntSmallPrimes:I

.field private debug:Z


# direct methods
.method public constructor <init>(Ljava/security/SecureRandom;III)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 37
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;-><init>(Ljava/security/SecureRandom;IIIZ)V

    return-void
.end method

.method public constructor <init>(Ljava/security/SecureRandom;IIIZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/crypto/KeyGenerationParameters;-><init>(Ljava/security/SecureRandom;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;->debug:Z

    .line 6
    .line 7
    iput p3, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;->certainty:I

    .line 8
    .line 9
    rem-int/lit8 p1, p4, 0x2

    .line 10
    .line 11
    const/4 p2, 0x1

    .line 12
    if-eq p1, p2, :cond_1

    .line 13
    .line 14
    const/16 p1, 0x1e

    .line 15
    .line 16
    if-lt p4, p1, :cond_0

    .line 17
    .line 18
    iput p4, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;->cntSmallPrimes:I

    .line 19
    .line 20
    iput-boolean p5, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;->debug:Z

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "cntSmallPrimes must be >= 30 for security reasons"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    throw p0

    .line 30
    :cond_1
    const-string p0, "cntSmallPrimes must be a multiple of 2"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    throw p0
.end method


# virtual methods
.method public getCertainty()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;->certainty:I

    .line 2
    .line 3
    return p0
.end method

.method public getCntSmallPrimes()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;->cntSmallPrimes:I

    .line 2
    .line 3
    return p0
.end method

.method public isDebug()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyGenerationParameters;->debug:Z

    .line 2
    .line 3
    return p0
.end method

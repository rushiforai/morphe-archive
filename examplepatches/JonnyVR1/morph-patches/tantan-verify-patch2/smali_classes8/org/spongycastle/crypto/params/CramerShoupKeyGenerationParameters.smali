.class public Lorg/spongycastle/crypto/params/CramerShoupKeyGenerationParameters;
.super Lorg/spongycastle/crypto/KeyGenerationParameters;
.source "SourceFile"


# instance fields
.field private params:Lorg/spongycastle/crypto/params/CramerShoupParameters;


# direct methods
.method public constructor <init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/params/CramerShoupParameters;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lorg/spongycastle/crypto/params/CramerShoupKeyGenerationParameters;->getStrength(Lorg/spongycastle/crypto/params/CramerShoupParameters;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/KeyGenerationParameters;-><init>(Ljava/security/SecureRandom;I)V

    .line 6
    .line 7
    .line 8
    iput-object p2, p0, Lorg/spongycastle/crypto/params/CramerShoupKeyGenerationParameters;->params:Lorg/spongycastle/crypto/params/CramerShoupParameters;

    .line 9
    .line 10
    return-void
.end method

.method public static getStrength(Lorg/spongycastle/crypto/params/CramerShoupParameters;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/CramerShoupParameters;->getP()Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method


# virtual methods
.method public getParameters()Lorg/spongycastle/crypto/params/CramerShoupParameters;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/CramerShoupKeyGenerationParameters;->params:Lorg/spongycastle/crypto/params/CramerShoupParameters;

    .line 2
    .line 3
    return-object p0
.end method

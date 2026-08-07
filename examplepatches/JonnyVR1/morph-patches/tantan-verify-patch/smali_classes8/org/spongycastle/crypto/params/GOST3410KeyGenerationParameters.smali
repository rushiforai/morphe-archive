.class public Lorg/spongycastle/crypto/params/GOST3410KeyGenerationParameters;
.super Lorg/spongycastle/crypto/KeyGenerationParameters;
.source "SourceFile"


# instance fields
.field private params:Lorg/spongycastle/crypto/params/GOST3410Parameters;


# direct methods
.method public constructor <init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/params/GOST3410Parameters;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/GOST3410Parameters;->getP()Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/KeyGenerationParameters;-><init>(Ljava/security/SecureRandom;I)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Lorg/spongycastle/crypto/params/GOST3410KeyGenerationParameters;->params:Lorg/spongycastle/crypto/params/GOST3410Parameters;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getParameters()Lorg/spongycastle/crypto/params/GOST3410Parameters;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/GOST3410KeyGenerationParameters;->params:Lorg/spongycastle/crypto/params/GOST3410Parameters;

    .line 2
    .line 3
    return-object p0
.end method

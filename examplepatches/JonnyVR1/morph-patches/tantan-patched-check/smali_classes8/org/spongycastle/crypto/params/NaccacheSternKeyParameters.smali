.class public Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;
.super Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
.source "SourceFile"


# instance fields
.field private g:Ljava/math/BigInteger;

.field lowerSigmaBound:I

.field private n:Ljava/math/BigInteger;


# direct methods
.method public constructor <init>(ZLjava/math/BigInteger;Ljava/math/BigInteger;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;-><init>(Z)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->g:Ljava/math/BigInteger;

    .line 5
    .line 6
    iput-object p3, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->n:Ljava/math/BigInteger;

    .line 7
    .line 8
    iput p4, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->lowerSigmaBound:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getG()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->g:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLowerSigmaBound()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->lowerSigmaBound:I

    .line 2
    .line 3
    return p0
.end method

.method public getModulus()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/params/NaccacheSternKeyParameters;->n:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.class public Lorg/spongycastle/crypto/tls/TlsDSSSigner;
.super Lorg/spongycastle/crypto/tls/TlsDSASigner;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/TlsDSASigner;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createDSAImpl(S)Lorg/spongycastle/crypto/DSA;
    .locals 1

    .line 1
    new-instance p0, Lorg/spongycastle/crypto/signers/DSASigner;

    .line 2
    .line 3
    new-instance v0, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;

    .line 4
    .line 5
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/signers/HMacDSAKCalculator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/DSASigner;-><init>(Lorg/spongycastle/crypto/signers/DSAKCalculator;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public getSignatureAlgorithm()S
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public isValidPublicKey(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lorg/spongycastle/crypto/params/DSAPublicKeyParameters;

    .line 2
    .line 3
    return p0
.end method

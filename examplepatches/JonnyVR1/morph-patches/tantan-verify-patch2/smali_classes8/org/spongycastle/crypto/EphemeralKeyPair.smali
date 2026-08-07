.class public Lorg/spongycastle/crypto/EphemeralKeyPair;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private keyPair:Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

.field private publicKeyEncoder:Lorg/spongycastle/crypto/KeyEncoder;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;Lorg/spongycastle/crypto/KeyEncoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/EphemeralKeyPair;->keyPair:Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/EphemeralKeyPair;->publicKeyEncoder:Lorg/spongycastle/crypto/KeyEncoder;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getEncodedPublicKey()[B
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/EphemeralKeyPair;->publicKeyEncoder:Lorg/spongycastle/crypto/KeyEncoder;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/crypto/EphemeralKeyPair;->keyPair:Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->getPublic()Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Lorg/spongycastle/crypto/KeyEncoder;->getEncoded(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/EphemeralKeyPair;->keyPair:Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    .line 2
    .line 3
    return-object p0
.end method

.class public Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private gen:Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;

.field private keyEncoder:Lorg/spongycastle/crypto/KeyEncoder;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;Lorg/spongycastle/crypto/KeyEncoder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;->gen:Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;->keyEncoder:Lorg/spongycastle/crypto/KeyEncoder;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public generate()Lorg/spongycastle/crypto/EphemeralKeyPair;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;->gen:Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/AsymmetricCipherKeyPairGenerator;->generateKeyPair()Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lorg/spongycastle/crypto/EphemeralKeyPair;

    .line 8
    .line 9
    iget-object p0, p0, Lorg/spongycastle/crypto/generators/EphemeralKeyPairGenerator;->keyEncoder:Lorg/spongycastle/crypto/KeyEncoder;

    .line 10
    .line 11
    invoke-direct {v1, v0, p0}, Lorg/spongycastle/crypto/EphemeralKeyPair;-><init>(Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;Lorg/spongycastle/crypto/KeyEncoder;)V

    .line 12
    .line 13
    .line 14
    return-object v1
.end method

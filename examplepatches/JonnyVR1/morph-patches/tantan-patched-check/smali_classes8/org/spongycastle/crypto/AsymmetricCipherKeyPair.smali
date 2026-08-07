.class public Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private privateParam:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

.field private publicParam:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/CipherParameters;Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 5
    .line 6
    iput-object p1, p0, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->publicParam:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 7
    .line 8
    check-cast p2, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 9
    .line 10
    iput-object p2, p0, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->privateParam:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->publicParam:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 15
    iput-object p2, p0, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->privateParam:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    return-void
.end method


# virtual methods
.method public getPrivate()Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->privateParam:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPublic()Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/AsymmetricCipherKeyPair;->publicParam:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 2
    .line 3
    return-object p0
.end method

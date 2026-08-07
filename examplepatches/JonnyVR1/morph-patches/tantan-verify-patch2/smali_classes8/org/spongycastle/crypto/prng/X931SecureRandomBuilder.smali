.class public Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private dateTimeVector:[B

.field private entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

.field private random:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 14
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;-><init>(Ljava/security/SecureRandom;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/security/SecureRandom;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 5
    .line 6
    new-instance v0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    .line 7
    .line 8
    invoke-direct {v0, p1, p2}, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;-><init>(Ljava/security/SecureRandom;Z)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/prng/EntropySourceProvider;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 17
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    return-void
.end method


# virtual methods
.method public build(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/params/KeyParameter;Z)Lorg/spongycastle/crypto/prng/X931SecureRandom;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->dateTimeVector:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    new-array v0, v0, [B

    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->dateTimeVector:[B

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->dateTimeVector:[B

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-static {v0, v1, v2, v3}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x1

    .line 24
    invoke-interface {p1, v0, p2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 25
    .line 26
    .line 27
    new-instance p2, Lorg/spongycastle/crypto/prng/X931SecureRandom;

    .line 28
    .line 29
    iget-object v0, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 30
    .line 31
    new-instance v1, Lorg/spongycastle/crypto/prng/X931RNG;

    .line 32
    .line 33
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->dateTimeVector:[B

    .line 34
    .line 35
    iget-object p0, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    .line 36
    .line 37
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    mul-int/lit8 v3, v3, 0x8

    .line 42
    .line 43
    invoke-interface {p0, v3}, Lorg/spongycastle/crypto/prng/EntropySourceProvider;->get(I)Lorg/spongycastle/crypto/prng/EntropySource;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v1, p1, v2, p0}, Lorg/spongycastle/crypto/prng/X931RNG;-><init>(Lorg/spongycastle/crypto/BlockCipher;[BLorg/spongycastle/crypto/prng/EntropySource;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p2, v0, v1, p3}, Lorg/spongycastle/crypto/prng/X931SecureRandom;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/prng/X931RNG;Z)V

    .line 51
    .line 52
    .line 53
    return-object p2
.end method

.method public setDateTimeVector([B)Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/X931SecureRandomBuilder;->dateTimeVector:[B

    .line 2
    .line 3
    return-object p0
.end method

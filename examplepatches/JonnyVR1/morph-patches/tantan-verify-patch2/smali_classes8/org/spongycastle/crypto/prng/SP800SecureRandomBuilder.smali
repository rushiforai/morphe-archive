.class public Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$CTRDRBGProvider;,
        Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HMacDRBGProvider;,
        Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;,
        Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$DualECDRBGProvider;,
        Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;
    }
.end annotation


# instance fields
.field private entropyBitsRequired:I

.field private final entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

.field private personalizationString:[B

.field private final random:Ljava/security/SecureRandom;

.field private securityStrength:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 20
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;-><init>(Ljava/security/SecureRandom;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/security/SecureRandom;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x100

    .line 5
    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->securityStrength:I

    .line 7
    .line 8
    iput v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropyBitsRequired:I

    .line 9
    .line 10
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 11
    .line 12
    new-instance v0, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2}, Lorg/spongycastle/crypto/prng/BasicEntropySourceProvider;-><init>(Ljava/security/SecureRandom;Z)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/prng/EntropySourceProvider;)V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->securityStrength:I

    .line 23
    iput v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropyBitsRequired:I

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 25
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    return-void
.end method


# virtual methods
.method public buildCTR(Lorg/spongycastle/crypto/BlockCipher;I[BZ)Lorg/spongycastle/crypto/prng/SP800SecureRandom;
    .locals 9

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    .line 6
    .line 7
    iget v3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropyBitsRequired:I

    .line 8
    .line 9
    invoke-interface {v2, v3}, Lorg/spongycastle/crypto/prng/EntropySourceProvider;->get(I)Lorg/spongycastle/crypto/prng/EntropySource;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$CTRDRBGProvider;

    .line 14
    .line 15
    iget-object v7, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->personalizationString:[B

    .line 16
    .line 17
    iget v8, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->securityStrength:I

    .line 18
    .line 19
    move-object v4, p1

    .line 20
    move v5, p2

    .line 21
    move-object v6, p3

    .line 22
    invoke-direct/range {v3 .. v8}, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$CTRDRBGProvider;-><init>(Lorg/spongycastle/crypto/BlockCipher;I[B[BI)V

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, v1, v2, v3, p4}, Lorg/spongycastle/crypto/prng/SP800SecureRandom;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/prng/EntropySource;Lorg/spongycastle/crypto/prng/DRBGProvider;Z)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public buildDualEC(Lorg/spongycastle/crypto/Digest;[BZ)Lorg/spongycastle/crypto/prng/SP800SecureRandom;
    .locals 5

    .line 29
    new-instance v0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;

    iget-object v1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    iget-object v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    iget v3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropyBitsRequired:I

    invoke-interface {v2, v3}, Lorg/spongycastle/crypto/prng/EntropySourceProvider;->get(I)Lorg/spongycastle/crypto/prng/EntropySource;

    move-result-object v2

    new-instance v3, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$DualECDRBGProvider;

    iget-object v4, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->personalizationString:[B

    iget p0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->securityStrength:I

    invoke-direct {v3, p1, p2, v4, p0}, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$DualECDRBGProvider;-><init>(Lorg/spongycastle/crypto/Digest;[B[BI)V

    invoke-direct {v0, v1, v2, v3, p3}, Lorg/spongycastle/crypto/prng/SP800SecureRandom;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/prng/EntropySource;Lorg/spongycastle/crypto/prng/DRBGProvider;Z)V

    return-object v0
.end method

.method public buildDualEC([Lorg/spongycastle/crypto/prng/drbg/DualECPoints;Lorg/spongycastle/crypto/Digest;[BZ)Lorg/spongycastle/crypto/prng/SP800SecureRandom;
    .locals 9

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    .line 6
    .line 7
    iget v3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropyBitsRequired:I

    .line 8
    .line 9
    invoke-interface {v2, v3}, Lorg/spongycastle/crypto/prng/EntropySourceProvider;->get(I)Lorg/spongycastle/crypto/prng/EntropySource;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;

    .line 14
    .line 15
    iget-object v7, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->personalizationString:[B

    .line 16
    .line 17
    iget v8, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->securityStrength:I

    .line 18
    .line 19
    move-object v4, p1

    .line 20
    move-object v5, p2

    .line 21
    move-object v6, p3

    .line 22
    invoke-direct/range {v3 .. v8}, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider;-><init>([Lorg/spongycastle/crypto/prng/drbg/DualECPoints;Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, v1, v2, v3, p4}, Lorg/spongycastle/crypto/prng/SP800SecureRandom;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/prng/EntropySource;Lorg/spongycastle/crypto/prng/DRBGProvider;Z)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public buildHMAC(Lorg/spongycastle/crypto/Mac;[BZ)Lorg/spongycastle/crypto/prng/SP800SecureRandom;
    .locals 5

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    .line 6
    .line 7
    iget v3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropyBitsRequired:I

    .line 8
    .line 9
    invoke-interface {v2, v3}, Lorg/spongycastle/crypto/prng/EntropySourceProvider;->get(I)Lorg/spongycastle/crypto/prng/EntropySource;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HMacDRBGProvider;

    .line 14
    .line 15
    iget-object v4, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->personalizationString:[B

    .line 16
    .line 17
    iget p0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->securityStrength:I

    .line 18
    .line 19
    invoke-direct {v3, p1, p2, v4, p0}, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HMacDRBGProvider;-><init>(Lorg/spongycastle/crypto/Mac;[B[BI)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1, v2, v3, p3}, Lorg/spongycastle/crypto/prng/SP800SecureRandom;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/prng/EntropySource;Lorg/spongycastle/crypto/prng/DRBGProvider;Z)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public buildHash(Lorg/spongycastle/crypto/Digest;[BZ)Lorg/spongycastle/crypto/prng/SP800SecureRandom;
    .locals 5

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/prng/SP800SecureRandom;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->random:Ljava/security/SecureRandom;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropySourceProvider:Lorg/spongycastle/crypto/prng/EntropySourceProvider;

    .line 6
    .line 7
    iget v3, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropyBitsRequired:I

    .line 8
    .line 9
    invoke-interface {v2, v3}, Lorg/spongycastle/crypto/prng/EntropySourceProvider;->get(I)Lorg/spongycastle/crypto/prng/EntropySource;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;

    .line 14
    .line 15
    iget-object v4, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->personalizationString:[B

    .line 16
    .line 17
    iget p0, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->securityStrength:I

    .line 18
    .line 19
    invoke-direct {v3, p1, p2, v4, p0}, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider;-><init>(Lorg/spongycastle/crypto/Digest;[B[BI)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1, v2, v3, p3}, Lorg/spongycastle/crypto/prng/SP800SecureRandom;-><init>(Ljava/security/SecureRandom;Lorg/spongycastle/crypto/prng/EntropySource;Lorg/spongycastle/crypto/prng/DRBGProvider;Z)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public setEntropyBitsRequired(I)Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->entropyBitsRequired:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setPersonalizationString([B)Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->personalizationString:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public setSecurityStrength(I)Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/crypto/prng/SP800SecureRandomBuilder;->securityStrength:I

    .line 2
    .line 3
    return-object p0
.end method

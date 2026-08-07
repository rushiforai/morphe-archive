.class public Lorg/spongycastle/crypto/agreement/srp/SRP6Server;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected A:Ljava/math/BigInteger;

.field protected B:Ljava/math/BigInteger;

.field protected Key:Ljava/math/BigInteger;

.field protected M1:Ljava/math/BigInteger;

.field protected M2:Ljava/math/BigInteger;

.field protected N:Ljava/math/BigInteger;

.field protected S:Ljava/math/BigInteger;

.field protected b:Ljava/math/BigInteger;

.field protected digest:Lorg/spongycastle/crypto/Digest;

.field protected g:Ljava/math/BigInteger;

.field protected random:Ljava/security/SecureRandom;

.field protected u:Ljava/math/BigInteger;

.field protected v:Ljava/math/BigInteger;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private calculateS()Ljava/math/BigInteger;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->v:Ljava/math/BigInteger;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->u:Ljava/math/BigInteger;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->A:Ljava/math/BigInteger;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->b:Ljava/math/BigInteger;

    .line 24
    .line 25
    iget-object p0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 26
    .line 27
    invoke-virtual {v0, v1, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method


# virtual methods
.method public calculateSecret(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/agreement/srp/SRP6Util;->validatePublicValue(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->A:Ljava/math/BigInteger;

    .line 8
    .line 9
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->digest:Lorg/spongycastle/crypto/Digest;

    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 12
    .line 13
    iget-object v2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->B:Ljava/math/BigInteger;

    .line 14
    .line 15
    invoke-static {v0, v1, p1, v2}, Lorg/spongycastle/crypto/agreement/srp/SRP6Util;->calculateU(Lorg/spongycastle/crypto/Digest;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->u:Ljava/math/BigInteger;

    .line 20
    .line 21
    invoke-direct {p0}, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->calculateS()Ljava/math/BigInteger;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->S:Ljava/math/BigInteger;

    .line 26
    .line 27
    return-object p1
.end method

.method public calculateServerEvidenceMessage()Ljava/math/BigInteger;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->A:Ljava/math/BigInteger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->M1:Ljava/math/BigInteger;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->S:Ljava/math/BigInteger;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-object v3, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->digest:Lorg/spongycastle/crypto/Digest;

    .line 14
    .line 15
    iget-object v4, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 16
    .line 17
    invoke-static {v3, v4, v0, v1, v2}, Lorg/spongycastle/crypto/agreement/srp/SRP6Util;->calculateM2(Lorg/spongycastle/crypto/Digest;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->M2:Ljava/math/BigInteger;

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    new-instance p0, Lorg/spongycastle/crypto/CryptoException;

    .line 25
    .line 26
    const-string v0, "Impossible to compute M2: some data are missing from the previous operations (A,M1,S)"

    .line 27
    .line 28
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/CryptoException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p0
.end method

.method public calculateSessionKey()Ljava/math/BigInteger;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->S:Ljava/math/BigInteger;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->M1:Ljava/math/BigInteger;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->M2:Ljava/math/BigInteger;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->digest:Lorg/spongycastle/crypto/Digest;

    .line 14
    .line 15
    iget-object v2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Lorg/spongycastle/crypto/agreement/srp/SRP6Util;->calculateKey(Lorg/spongycastle/crypto/Digest;Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->Key:Ljava/math/BigInteger;

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    new-instance p0, Lorg/spongycastle/crypto/CryptoException;

    .line 25
    .line 26
    const-string v0, "Impossible to compute Key: some data are missing from the previous operations (S,M1,M2)"

    .line 27
    .line 28
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/CryptoException;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    throw p0
.end method

.method public generateServerCredentials()Ljava/math/BigInteger;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->g:Ljava/math/BigInteger;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/agreement/srp/SRP6Util;->calculateK(Lorg/spongycastle/crypto/Digest;Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->selectPrivateValue()Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->b:Ljava/math/BigInteger;

    .line 16
    .line 17
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->v:Ljava/math/BigInteger;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->g:Ljava/math/BigInteger;

    .line 30
    .line 31
    iget-object v2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->b:Ljava/math/BigInteger;

    .line 32
    .line 33
    iget-object v3, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 34
    .line 35
    invoke-virtual {v1, v2, v3}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->B:Ljava/math/BigInteger;

    .line 50
    .line 51
    return-object v0
.end method

.method public init(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/Digest;Ljava/security/SecureRandom;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 18
    iput-object p2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->g:Ljava/math/BigInteger;

    .line 19
    iput-object p3, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->v:Ljava/math/BigInteger;

    .line 20
    iput-object p5, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->random:Ljava/security/SecureRandom;

    .line 21
    iput-object p4, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->digest:Lorg/spongycastle/crypto/Digest;

    return-void
.end method

.method public init(Lorg/spongycastle/crypto/params/SRP6GroupParameters;Ljava/math/BigInteger;Lorg/spongycastle/crypto/Digest;Ljava/security/SecureRandom;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/SRP6GroupParameters;->getN()Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/SRP6GroupParameters;->getG()Ljava/math/BigInteger;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    move-object v0, p0

    .line 10
    move-object v3, p2

    .line 11
    move-object v4, p3

    .line 12
    move-object v5, p4

    .line 13
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->init(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/spongycastle/crypto/Digest;Ljava/security/SecureRandom;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public selectPrivateValue()Ljava/math/BigInteger;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->g:Ljava/math/BigInteger;

    .line 6
    .line 7
    iget-object p0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->random:Ljava/security/SecureRandom;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lorg/spongycastle/crypto/agreement/srp/SRP6Util;->generatePrivateValue(Lorg/spongycastle/crypto/Digest;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/security/SecureRandom;)Ljava/math/BigInteger;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public verifyClientEvidenceMessage(Ljava/math/BigInteger;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->A:Ljava/math/BigInteger;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->B:Ljava/math/BigInteger;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-object v2, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->S:Ljava/math/BigInteger;

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    iget-object v3, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->digest:Lorg/spongycastle/crypto/Digest;

    .line 14
    .line 15
    iget-object v4, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->N:Ljava/math/BigInteger;

    .line 16
    .line 17
    invoke-static {v3, v4, v0, v1, v2}, Lorg/spongycastle/crypto/agreement/srp/SRP6Util;->calculateM1(Lorg/spongycastle/crypto/Digest;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/srp/SRP6Server;->M1:Ljava/math/BigInteger;

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_1
    new-instance p0, Lorg/spongycastle/crypto/CryptoException;

    .line 34
    .line 35
    const-string p1, "Impossible to compute and verify M1: some data are missing from the previous operations (A,B,S)"

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/CryptoException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0
.end method

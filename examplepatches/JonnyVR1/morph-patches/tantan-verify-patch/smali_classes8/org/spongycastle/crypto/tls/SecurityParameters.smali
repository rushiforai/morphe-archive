.class public Lorg/spongycastle/crypto/tls/SecurityParameters;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field cipherSuite:I

.field clientRandom:[B

.field compressionAlgorithm:S

.field encryptThenMAC:Z

.field entity:I

.field extendedMasterSecret:Z

.field masterSecret:[B

.field maxFragmentLength:S

.field prfAlgorithm:I

.field pskIdentity:[B

.field serverRandom:[B

.field sessionHash:[B

.field srpIdentity:[B

.field truncatedHMac:Z

.field verifyDataLength:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->entity:I

    .line 6
    .line 7
    iput v0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->cipherSuite:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-short v1, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->compressionAlgorithm:S

    .line 11
    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->prfAlgorithm:I

    .line 13
    .line 14
    iput v0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->verifyDataLength:I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->masterSecret:[B

    .line 18
    .line 19
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->clientRandom:[B

    .line 20
    .line 21
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->serverRandom:[B

    .line 22
    .line 23
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->sessionHash:[B

    .line 24
    .line 25
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->pskIdentity:[B

    .line 26
    .line 27
    iput-object v2, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->srpIdentity:[B

    .line 28
    .line 29
    iput-short v0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->maxFragmentLength:S

    .line 30
    .line 31
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->truncatedHMac:Z

    .line 32
    .line 33
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->encryptThenMAC:Z

    .line 34
    .line 35
    iput-boolean v1, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->masterSecret:[B

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->masterSecret:[B

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public getCipherSuite()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->cipherSuite:I

    .line 2
    .line 3
    return p0
.end method

.method public getClientRandom()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->clientRandom:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getCompressionAlgorithm()S
    .locals 0

    .line 1
    iget-short p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->compressionAlgorithm:S

    .line 2
    .line 3
    return p0
.end method

.method public getEntity()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->entity:I

    .line 2
    .line 3
    return p0
.end method

.method public getMasterSecret()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->masterSecret:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getPSKIdentity()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->pskIdentity:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrfAlgorithm()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->prfAlgorithm:I

    .line 2
    .line 3
    return p0
.end method

.method public getPskIdentity()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->pskIdentity:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getSRPIdentity()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->srpIdentity:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getServerRandom()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->serverRandom:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getSessionHash()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->sessionHash:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getVerifyDataLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/SecurityParameters;->verifyDataLength:I

    .line 2
    .line 3
    return p0
.end method

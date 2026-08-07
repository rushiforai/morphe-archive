.class public final Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/tls/SessionParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private cipherSuite:I

.field private compressionAlgorithm:S

.field private encodedServerExtensions:[B

.field private masterSecret:[B

.field private peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

.field private pskIdentity:[B

.field private srpIdentity:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->cipherSuite:I

    .line 6
    .line 7
    iput-short v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->compressionAlgorithm:S

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->masterSecret:[B

    .line 11
    .line 12
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 13
    .line 14
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->pskIdentity:[B

    .line 15
    .line 16
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->srpIdentity:[B

    .line 17
    .line 18
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->encodedServerExtensions:[B

    .line 19
    .line 20
    return-void
.end method

.method private validate(ZLjava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const-string p0, "Required session parameter \'"

    .line 5
    .line 6
    const-string p1, "\' not configured"

    .line 7
    .line 8
    invoke-static {p0, p2, p1}, Ll/wmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public build()Lorg/spongycastle/crypto/tls/SessionParameters;
    .locals 11

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->cipherSuite:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    const-string v3, "cipherSuite"

    .line 11
    .line 12
    invoke-direct {p0, v0, v3}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->validate(ZLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->compressionAlgorithm:S

    .line 16
    .line 17
    if-ltz v0, :cond_1

    .line 18
    .line 19
    move v0, v2

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move v0, v1

    .line 22
    :goto_1
    const-string v3, "compressionAlgorithm"

    .line 23
    .line 24
    invoke-direct {p0, v0, v3}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->validate(ZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->masterSecret:[B

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    move v1, v2

    .line 32
    :cond_2
    const-string v0, "masterSecret"

    .line 33
    .line 34
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->validate(ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Lorg/spongycastle/crypto/tls/SessionParameters;

    .line 38
    .line 39
    iget v3, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->cipherSuite:I

    .line 40
    .line 41
    iget-short v4, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->compressionAlgorithm:S

    .line 42
    .line 43
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->masterSecret:[B

    .line 44
    .line 45
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 46
    .line 47
    iget-object v7, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->pskIdentity:[B

    .line 48
    .line 49
    iget-object v8, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->srpIdentity:[B

    .line 50
    .line 51
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->encodedServerExtensions:[B

    .line 52
    .line 53
    const/4 v10, 0x0

    .line 54
    invoke-direct/range {v2 .. v10}, Lorg/spongycastle/crypto/tls/SessionParameters;-><init>(IS[BLorg/spongycastle/crypto/tls/Certificate;[B[B[BLorg/spongycastle/crypto/tls/SessionParameters$1;)V

    .line 55
    .line 56
    .line 57
    return-object v2
.end method

.method public setCipherSuite(I)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->cipherSuite:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setCompressionAlgorithm(S)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
    .locals 0

    .line 1
    iput-short p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->compressionAlgorithm:S

    .line 2
    .line 3
    return-object p0
.end method

.method public setMasterSecret([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->masterSecret:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public setPSKIdentity([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->pskIdentity:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public setPeerCertificate(Lorg/spongycastle/crypto/tls/Certificate;)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->peerCertificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPskIdentity([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->pskIdentity:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public setSRPIdentity([B)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->srpIdentity:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public setServerExtensions(Ljava/util/Hashtable;)Lorg/spongycastle/crypto/tls/SessionParameters$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->encodedServerExtensions:[B

    .line 5
    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsProtocol;->writeExtensions(Ljava/io/OutputStream;Ljava/util/Hashtable;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/SessionParameters$Builder;->encodedServerExtensions:[B

    .line 20
    .line 21
    return-object p0
.end method

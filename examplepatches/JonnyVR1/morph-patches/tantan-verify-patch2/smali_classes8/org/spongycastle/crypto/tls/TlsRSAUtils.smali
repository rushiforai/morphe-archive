.class public Lorg/spongycastle/crypto/tls/TlsRSAUtils;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static generateEncryptedPreMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/params/RSAKeyParameters;Ljava/io/OutputStream;)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x30

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecureRandom()Ljava/security/SecureRandom;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-static {v2, v1, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;[BI)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;

    .line 21
    .line 22
    new-instance v4, Lorg/spongycastle/crypto/engines/RSABlindedEngine;

    .line 23
    .line 24
    invoke-direct {v4}, Lorg/spongycastle/crypto/engines/RSABlindedEngine;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-direct {v2, v4}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;)V

    .line 28
    .line 29
    .line 30
    new-instance v4, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 31
    .line 32
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecureRandom()Ljava/security/SecureRandom;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-direct {v4, p1, v5}, Lorg/spongycastle/crypto/params/ParametersWithRandom;-><init>(Lorg/spongycastle/crypto/CipherParameters;Ljava/security/SecureRandom;)V

    .line 37
    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-virtual {v2, p1, v4}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 41
    .line 42
    .line 43
    :try_start_0
    invoke-virtual {v2, v1, v3, v0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->processBlock([BII)[B

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    invoke-virtual {p2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 54
    .line 55
    .line 56
    return-object v1

    .line 57
    :cond_0
    invoke-static {p1, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeOpaque16([BLjava/io/OutputStream;)V
    :try_end_0
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-object v1

    .line 61
    :catch_0
    move-exception p0

    .line 62
    new-instance p1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    .line 63
    .line 64
    const/16 p2, 0x50

    .line 65
    .line 66
    invoke-direct {p1, p2, p0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    throw p1
.end method

.method public static safeDecryptPreMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/params/RSAKeyParameters;[B)[B
    .locals 7

    .line 1
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getClientVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x30

    .line 6
    .line 7
    new-array v2, v1, [B

    .line 8
    .line 9
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecureRandom()Ljava/security/SecureRandom;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 14
    .line 15
    .line 16
    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    const/4 v4, 0x0

    .line 21
    :try_start_0
    new-instance v5, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;

    .line 22
    .line 23
    new-instance v6, Lorg/spongycastle/crypto/engines/RSABlindedEngine;

    .line 24
    .line 25
    invoke-direct {v6}, Lorg/spongycastle/crypto/engines/RSABlindedEngine;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-direct {v5, v6, v2}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;[B)V

    .line 29
    .line 30
    .line 31
    new-instance v6, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 32
    .line 33
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecureRandom()Ljava/security/SecureRandom;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-direct {v6, p1, p0}, Lorg/spongycastle/crypto/params/ParametersWithRandom;-><init>(Lorg/spongycastle/crypto/CipherParameters;Ljava/security/SecureRandom;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v5, v4, v6}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 41
    .line 42
    .line 43
    array-length p0, p2

    .line 44
    invoke-virtual {v5, p2, v4, p0}, Lorg/spongycastle/crypto/encodings/PKCS1Encoding;->processBlock([BII)[B

    .line 45
    .line 46
    .line 47
    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    :catch_0
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    aget-byte p1, v3, v4

    .line 53
    .line 54
    and-int/lit16 p1, p1, 0xff

    .line 55
    .line 56
    xor-int/2addr p0, p1

    .line 57
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMinorVersion()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    const/4 p2, 0x1

    .line 62
    aget-byte v0, v3, p2

    .line 63
    .line 64
    and-int/lit16 v0, v0, 0xff

    .line 65
    .line 66
    xor-int/2addr p1, v0

    .line 67
    or-int/2addr p0, p1

    .line 68
    shr-int/lit8 p1, p0, 0x1

    .line 69
    .line 70
    or-int/2addr p0, p1

    .line 71
    shr-int/lit8 p1, p0, 0x2

    .line 72
    .line 73
    or-int/2addr p0, p1

    .line 74
    shr-int/lit8 p1, p0, 0x4

    .line 75
    .line 76
    or-int/2addr p0, p1

    .line 77
    and-int/2addr p0, p2

    .line 78
    sub-int/2addr p0, p2

    .line 79
    not-int p0, p0

    .line 80
    :goto_0
    if-ge v4, v1, :cond_0

    .line 81
    .line 82
    aget-byte p1, v3, v4

    .line 83
    .line 84
    not-int p2, p0

    .line 85
    and-int/2addr p1, p2

    .line 86
    aget-byte p2, v2, v4

    .line 87
    .line 88
    and-int/2addr p2, p0

    .line 89
    or-int/2addr p1, p2

    .line 90
    int-to-byte p1, p1

    .line 91
    aput-byte p1, v3, v4

    .line 92
    .line 93
    add-int/lit8 v4, v4, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    return-object v3
.end method

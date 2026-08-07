.class public Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;
.super Lorg/spongycastle/crypto/tls/AbstractTlsSignerCredentials;
.source "SourceFile"


# instance fields
.field protected certificate:Lorg/spongycastle/crypto/tls/Certificate;

.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected privateKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

.field protected signatureAndHashAlgorithm:Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

.field protected signer:Lorg/spongycastle/crypto/tls/TlsSigner;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/Certificate;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;)V
    .locals 1

    const/4 v0, 0x0

    .line 127
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/Certificate;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/Certificate;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsSignerCredentials;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p2, :cond_8

    .line 6
    .line 7
    invoke-virtual {p2}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_7

    .line 12
    .line 13
    if-eqz p3, :cond_6

    .line 14
    .line 15
    invoke-virtual {p3}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;->isPrivate()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_5

    .line 20
    .line 21
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    if-eqz p4, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p0, "\'signatureAndHashAlgorithm\' cannot be null for (D)TLS 1.2+"

    .line 31
    .line 32
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw v0

    .line 36
    :cond_1
    :goto_0
    instance-of v1, p3, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsRSASigner;

    .line 41
    .line 42
    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsRSASigner;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->signer:Lorg/spongycastle/crypto/tls/TlsSigner;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    instance-of v1, p3, Lorg/spongycastle/crypto/params/DSAPrivateKeyParameters;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsDSSSigner;

    .line 53
    .line 54
    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsDSSSigner;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->signer:Lorg/spongycastle/crypto/tls/TlsSigner;

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    instance-of v1, p3, Lorg/spongycastle/crypto/params/ECPrivateKeyParameters;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsECDSASigner;

    .line 65
    .line 66
    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsECDSASigner;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->signer:Lorg/spongycastle/crypto/tls/TlsSigner;

    .line 70
    .line 71
    :goto_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->signer:Lorg/spongycastle/crypto/tls/TlsSigner;

    .line 72
    .line 73
    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/tls/TlsSigner;->init(Lorg/spongycastle/crypto/tls/TlsContext;)V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 77
    .line 78
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->certificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 79
    .line 80
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->privateKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 81
    .line 82
    iput-object p4, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->signatureAndHashAlgorithm:Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string p1, "\'privateKey\' type not supported: "

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw v0

    .line 103
    :cond_5
    const-string p0, "\'privateKey\' must be private"

    .line 104
    .line 105
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    throw v0

    .line 109
    :cond_6
    const-string p0, "\'privateKey\' cannot be null"

    .line 110
    .line 111
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    throw v0

    .line 115
    :cond_7
    const-string p0, "\'certificate\' cannot be empty"

    .line 116
    .line 117
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    throw v0

    .line 121
    :cond_8
    const-string p0, "\'certificate\' cannot be null"

    .line 122
    .line 123
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    throw v0
.end method


# virtual methods
.method public generateCertificateSignature([B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    .line 4
    .line 5
    .line 6
    move-result v0
    :try_end_0
    .catch Lorg/spongycastle/crypto/CryptoException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->signer:Lorg/spongycastle/crypto/tls/TlsSigner;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->signatureAndHashAlgorithm:Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    .line 12
    .line 13
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->privateKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 14
    .line 15
    invoke-interface {v1, v0, p0, p1}, Lorg/spongycastle/crypto/tls/TlsSigner;->generateRawSignature(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;[B)[B

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->privateKey:Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    .line 21
    .line 22
    invoke-interface {v1, p0, p1}, Lorg/spongycastle/crypto/tls/TlsSigner;->generateRawSignature(Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;[B)[B

    .line 23
    .line 24
    .line 25
    move-result-object p0
    :try_end_1
    .catch Lorg/spongycastle/crypto/CryptoException; {:try_start_1 .. :try_end_1} :catch_0

    .line 26
    return-object p0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    new-instance p1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    .line 29
    .line 30
    const/16 v0, 0x50

    .line 31
    .line 32
    invoke-direct {p1, v0, p0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    throw p1
.end method

.method public getCertificate()Lorg/spongycastle/crypto/tls/Certificate;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->certificate:Lorg/spongycastle/crypto/tls/Certificate;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSignatureAndHashAlgorithm()Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSignerCredentials;->signatureAndHashAlgorithm:Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    .line 2
    .line 3
    return-object p0
.end method

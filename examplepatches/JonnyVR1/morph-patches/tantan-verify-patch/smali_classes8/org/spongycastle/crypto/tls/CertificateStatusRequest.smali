.class public Lorg/spongycastle/crypto/tls/CertificateStatusRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected request:Ljava/lang/Object;

.field protected statusType:S


# direct methods
.method public constructor <init>(SLjava/lang/Object;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->isCorrectType(SLjava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-short p1, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->statusType:S

    .line 11
    .line 12
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->request:Ljava/lang/Object;

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "\'request\' is not an instance of the correct type"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    throw p0
.end method

.method public static isCorrectType(SLjava/lang/Object;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    instance-of p0, p1, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    const-string p0, "\'statusType\' is an unsupported value"

    .line 8
    .line 9
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public static parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/CertificateStatusRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/OCSPStatusRequest;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v1, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;

    .line 13
    .line 14
    invoke-direct {v1, v0, p0}, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;-><init>(SLjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    const/16 p0, 0x32

    .line 19
    .line 20
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method


# virtual methods
.method public encode(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->statusType:S

    .line 2
    .line 3
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 4
    .line 5
    .line 6
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->statusType:S

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->request:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;->encode(Ljava/io/OutputStream;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/16 p0, 0x50

    .line 20
    .line 21
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public getOCSPStatusRequest()Lorg/spongycastle/crypto/tls/OCSPStatusRequest;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->request:Ljava/lang/Object;

    .line 3
    .line 4
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->isCorrectType(SLjava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->request:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Lorg/spongycastle/crypto/tls/OCSPStatusRequest;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "\'request\' is not an OCSPStatusRequest"

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public getRequest()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->request:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStatusType()S
    .locals 0

    .line 1
    iget-short p0, p0, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->statusType:S

    .line 2
    .line 3
    return p0
.end method

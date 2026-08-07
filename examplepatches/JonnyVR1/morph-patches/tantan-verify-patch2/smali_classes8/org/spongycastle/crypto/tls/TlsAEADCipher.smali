.class public Lorg/spongycastle/crypto/tls/TlsAEADCipher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsCipher;


# instance fields
.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected decryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

.field protected decryptImplicitNonce:[B

.field protected encryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

.field protected encryptImplicitNonce:[B

.field protected macSize:I

.field protected nonce_explicit_length:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/modes/AEADBlockCipher;Lorg/spongycastle/crypto/modes/AEADBlockCipher;II)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/16 v1, 0x50

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 13
    .line 14
    iput p5, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->macSize:I

    .line 15
    .line 16
    const/16 v0, 0x8

    .line 17
    .line 18
    iput v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 19
    .line 20
    mul-int/lit8 v2, p4, 0x2

    .line 21
    .line 22
    add-int/2addr v2, v0

    .line 23
    invoke-static {p1, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateKeyBlock(Lorg/spongycastle/crypto/tls/TlsContext;I)[B

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    new-instance v4, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    invoke-direct {v4, v3, v5, p4}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 31
    .line 32
    .line 33
    new-instance v6, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 34
    .line 35
    invoke-direct {v6, v3, p4, p4}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 36
    .line 37
    .line 38
    add-int/2addr p4, p4

    .line 39
    add-int/lit8 v7, p4, 0x4

    .line 40
    .line 41
    invoke-static {v3, p4, v7}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    add-int/2addr p4, v0

    .line 46
    invoke-static {v3, v7, p4}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    if-ne p4, v2, :cond_1

    .line 51
    .line 52
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 59
    .line 60
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 61
    .line 62
    iput-object v3, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptImplicitNonce:[B

    .line 63
    .line 64
    iput-object v8, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptImplicitNonce:[B

    .line 65
    .line 66
    move-object v9, v6

    .line 67
    move-object v6, v4

    .line 68
    move-object v4, v9

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 71
    .line 72
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 73
    .line 74
    iput-object v8, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptImplicitNonce:[B

    .line 75
    .line 76
    iput-object v3, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptImplicitNonce:[B

    .line 77
    .line 78
    :goto_0
    iget p1, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 79
    .line 80
    add-int/lit8 p1, p1, 0x4

    .line 81
    .line 82
    new-array p1, p1, [B

    .line 83
    .line 84
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 85
    .line 86
    new-instance p3, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 87
    .line 88
    mul-int/2addr p5, v0

    .line 89
    invoke-direct {p3, v4, p5, p1}, Lorg/spongycastle/crypto/params/AEADParameters;-><init>(Lorg/spongycastle/crypto/params/KeyParameter;I[B)V

    .line 90
    .line 91
    .line 92
    const/4 p4, 0x1

    .line 93
    invoke-interface {p2, p4, p3}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 97
    .line 98
    new-instance p2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 99
    .line 100
    invoke-direct {p2, v6, p5, p1}, Lorg/spongycastle/crypto/params/AEADParameters;-><init>(Lorg/spongycastle/crypto/params/KeyParameter;I[B)V

    .line 101
    .line 102
    .line 103
    invoke-interface {p0, v5, p2}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    invoke-static {v1}, Ll/f1j0;->a(I)V

    .line 108
    .line 109
    .line 110
    const/4 p0, 0x0

    .line 111
    throw p0

    .line 112
    :cond_2
    invoke-static {v1}, Ll/f1j0;->a(I)V

    .line 113
    .line 114
    .line 115
    const/4 p0, 0x0

    .line 116
    throw p0
.end method


# virtual methods
.method public decodeCiphertext(JS[BII)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p6}, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->getPlaintextLimit(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptImplicitNonce:[B

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    iget v2, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 11
    .line 12
    add-int/2addr v1, v2

    .line 13
    new-array v1, v1, [B

    .line 14
    .line 15
    array-length v2, v0

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptImplicitNonce:[B

    .line 21
    .line 22
    array-length v0, v0

    .line 23
    iget v2, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 24
    .line 25
    invoke-static {p4, p5, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 29
    .line 30
    add-int/2addr p5, v0

    .line 31
    sub-int/2addr p6, v0

    .line 32
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 33
    .line 34
    invoke-interface {v0, p6}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getOutputSize(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    move v2, p3

    .line 39
    move p3, p5

    .line 40
    new-array p5, v0, [B

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2, v2, v0}, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->getAdditionalData(JSI)[B

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance p2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 47
    .line 48
    iget v2, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->macSize:I

    .line 49
    .line 50
    mul-int/lit8 v2, v2, 0x8

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    invoke-direct {p2, v4, v2, v1, p1}, Lorg/spongycastle/crypto/params/AEADParameters;-><init>(Lorg/spongycastle/crypto/params/KeyParameter;I[B[B)V

    .line 54
    .line 55
    .line 56
    :try_start_0
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 57
    .line 58
    invoke-interface {p1, v3, p2}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 62
    .line 63
    move-object p2, p4

    .line 64
    move p4, p6

    .line 65
    const/4 p6, 0x0

    .line 66
    invoke-interface/range {p1 .. p6}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->processBytes([BII[BI)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->decryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 71
    .line 72
    invoke-interface {p0, p5, p1}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->doFinal([BI)I

    .line 73
    .line 74
    .line 75
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    add-int/2addr p1, p0

    .line 77
    if-ne p1, v0, :cond_0

    .line 78
    .line 79
    return-object p5

    .line 80
    :cond_0
    const/16 p0, 0x50

    .line 81
    .line 82
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 83
    .line 84
    .line 85
    :goto_0
    const/4 p0, 0x0

    .line 86
    return-object p0

    .line 87
    :catch_0
    move-exception v0

    .line 88
    move-object p0, v0

    .line 89
    new-instance p1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    .line 90
    .line 91
    const/16 p2, 0x14

    .line 92
    .line 93
    invoke-direct {p1, p2, p0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    throw p1

    .line 97
    :cond_1
    const/16 p0, 0x32

    .line 98
    .line 99
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 100
    .line 101
    .line 102
    goto :goto_0
.end method

.method public encodePlaintext(JS[BII)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptImplicitNonce:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget v2, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 5
    .line 6
    add-int/2addr v1, v2

    .line 7
    new-array v1, v1, [B

    .line 8
    .line 9
    array-length v2, v0

    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptImplicitNonce:[B

    .line 15
    .line 16
    array-length v0, v0

    .line 17
    invoke-static {p1, p2, v1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint64(J[BI)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 21
    .line 22
    invoke-interface {v0, p6}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getOutputSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget v2, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 27
    .line 28
    add-int/2addr v0, v2

    .line 29
    move v4, p3

    .line 30
    move p3, p5

    .line 31
    new-array p5, v0, [B

    .line 32
    .line 33
    iget-object v5, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptImplicitNonce:[B

    .line 34
    .line 35
    array-length v5, v5

    .line 36
    invoke-static {v1, v5, p5, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    .line 38
    .line 39
    move-wide v2, p1

    .line 40
    move-object p2, p4

    .line 41
    move p4, p6

    .line 42
    iget p6, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 43
    .line 44
    invoke-virtual {p0, v2, v3, v4, p4}, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->getAdditionalData(JSI)[B

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v2, Lorg/spongycastle/crypto/params/AEADParameters;

    .line 49
    .line 50
    iget v3, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->macSize:I

    .line 51
    .line 52
    mul-int/lit8 v3, v3, 0x8

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    invoke-direct {v2, v4, v3, v1, p1}, Lorg/spongycastle/crypto/params/AEADParameters;-><init>(Lorg/spongycastle/crypto/params/KeyParameter;I[B[B)V

    .line 56
    .line 57
    .line 58
    const/16 v1, 0x50

    .line 59
    .line 60
    :try_start_0
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 61
    .line 62
    const/4 v3, 0x1

    .line 63
    invoke-interface {p1, v3, v2}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 67
    .line 68
    invoke-interface/range {p1 .. p6}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->processBytes([BII[BI)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    add-int/2addr p6, p1

    .line 73
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->encryptCipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 74
    .line 75
    invoke-interface {p0, p5, p6}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->doFinal([BI)I

    .line 76
    .line 77
    .line 78
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    add-int/2addr p6, p0

    .line 80
    if-ne p6, v0, :cond_0

    .line 81
    .line 82
    return-object p5

    .line 83
    :cond_0
    invoke-static {v1}, Ll/f1j0;->a(I)V

    .line 84
    .line 85
    .line 86
    const/4 p0, 0x0

    .line 87
    return-object p0

    .line 88
    :catch_0
    move-exception v0

    .line 89
    move-object p0, v0

    .line 90
    new-instance p1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    .line 91
    .line 92
    invoke-direct {p1, v1, p0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    throw p1
.end method

.method public getAdditionalData(JSI)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {p1, p2, v0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint64(J[BI)V

    .line 7
    .line 8
    .line 9
    const/16 p1, 0x8

    .line 10
    .line 11
    invoke-static {p3, v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(S[BI)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 15
    .line 16
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/16 p1, 0x9

    .line 21
    .line 22
    invoke-static {p0, v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;[BI)V

    .line 23
    .line 24
    .line 25
    const/16 p0, 0xb

    .line 26
    .line 27
    invoke-static {p4, v0, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public getPlaintextLimit(I)I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->macSize:I

    .line 2
    .line 3
    sub-int/2addr p1, v0

    .line 4
    iget p0, p0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;->nonce_explicit_length:I

    .line 5
    .line 6
    sub-int/2addr p1, p0

    .line 7
    return p1
.end method

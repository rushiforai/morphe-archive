.class public Lorg/spongycastle/crypto/tls/Chacha20Poly1305;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsCipher;


# instance fields
.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected decryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

.field protected encryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;)V
    .locals 6
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
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 11
    .line 12
    const/16 v0, 0x40

    .line 13
    .line 14
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateKeyBlock(Lorg/spongycastle/crypto/tls/TlsContext;I)[B

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/16 v3, 0x20

    .line 22
    .line 23
    invoke-direct {v1, v0, v2, v3}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 24
    .line 25
    .line 26
    new-instance v4, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 27
    .line 28
    invoke-direct {v4, v0, v3, v3}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 32
    .line 33
    const/16 v3, 0x14

    .line 34
    .line 35
    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/engines/ChaChaEngine;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->encryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 39
    .line 40
    new-instance v0, Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 41
    .line 42
    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/engines/ChaChaEngine;-><init>(I)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->decryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 46
    .line 47
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    move-object v5, v4

    .line 54
    move-object v4, v1

    .line 55
    move-object v1, v5

    .line 56
    :cond_0
    const/16 p1, 0x8

    .line 57
    .line 58
    new-array p1, p1, [B

    .line 59
    .line 60
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->encryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 61
    .line 62
    new-instance v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 63
    .line 64
    invoke-direct {v3, v1, p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 65
    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    invoke-virtual {v0, v1, v3}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->decryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 72
    .line 73
    new-instance v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 74
    .line 75
    invoke-direct {v0, v4, p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v2, v0}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    const/16 p0, 0x50

    .line 83
    .line 84
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 85
    .line 86
    .line 87
    const/4 p0, 0x0

    .line 88
    throw p0
.end method


# virtual methods
.method public calculateRecordMAC(Lorg/spongycastle/crypto/params/KeyParameter;[B[BII)[B
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/macs/Poly1305;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/crypto/macs/Poly1305;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/Mac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 7
    .line 8
    .line 9
    array-length p1, p2

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, p2, v1, p1}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->updateRecordMAC(Lorg/spongycastle/crypto/Mac;[BII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, p3, p4, p5}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->updateRecordMAC(Lorg/spongycastle/crypto/Mac;[BII)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    new-array p0, p0, [B

    .line 22
    .line 23
    invoke-interface {v0, p0, v1}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public decodeCiphertext(JS[BII)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p6}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->getPlaintextLimit(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    move v0, p3

    .line 8
    move-object p3, p4

    .line 9
    move p4, p5

    .line 10
    add-int/lit8 p5, p6, -0x10

    .line 11
    .line 12
    add-int v1, p4, p5

    .line 13
    .line 14
    add-int/2addr p6, p4

    .line 15
    invoke-static {p3, v1, p6}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 16
    .line 17
    .line 18
    move-result-object p6

    .line 19
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->decryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {p0, v1, v2, p1, p2}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->initRecordMAC(Lorg/spongycastle/crypto/engines/ChaChaEngine;ZJ)Lorg/spongycastle/crypto/params/KeyParameter;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, p1, p2, v0, p5}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->getAdditionalData(JSI)[B

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    move-object p1, v1

    .line 31
    invoke-virtual/range {p0 .. p5}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->calculateRecordMAC(Lorg/spongycastle/crypto/params/KeyParameter;[B[BII)[B

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1, p6}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    move p2, p4

    .line 42
    new-array p4, p5, [B

    .line 43
    .line 44
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->decryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 45
    .line 46
    move p6, p5

    .line 47
    const/4 p5, 0x0

    .line 48
    move-object p1, p3

    .line 49
    move p3, p6

    .line 50
    invoke-virtual/range {p0 .. p5}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->processBytes([BII[BI)I

    .line 51
    .line 52
    .line 53
    return-object p4

    .line 54
    :cond_0
    const/16 p0, 0x14

    .line 55
    .line 56
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 57
    .line 58
    .line 59
    :goto_0
    const/4 p0, 0x0

    .line 60
    return-object p0

    .line 61
    :cond_1
    const/16 p0, 0x32

    .line 62
    .line 63
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 64
    .line 65
    .line 66
    goto :goto_0
.end method

.method public encodePlaintext(JS[BII)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    add-int/lit8 v0, p6, 0x10

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->encryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {p0, v1, v2, p1, p2}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->initRecordMAC(Lorg/spongycastle/crypto/engines/ChaChaEngine;ZJ)Lorg/spongycastle/crypto/params/KeyParameter;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-array v6, v0, [B

    .line 11
    .line 12
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->encryptCipher:Lorg/spongycastle/crypto/engines/ChaChaEngine;

    .line 13
    .line 14
    const/4 v7, 0x0

    .line 15
    move-object v3, p4

    .line 16
    move v4, p5

    .line 17
    move v5, p6

    .line 18
    invoke-virtual/range {v2 .. v7}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->processBytes([BII[BI)I

    .line 19
    .line 20
    .line 21
    move p5, v5

    .line 22
    invoke-virtual {p0, p1, p2, p3, p5}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->getAdditionalData(JSI)[B

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    const/4 p4, 0x0

    .line 27
    move-object p1, v1

    .line 28
    move-object p3, v6

    .line 29
    invoke-virtual/range {p0 .. p5}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->calculateRecordMAC(Lorg/spongycastle/crypto/params/KeyParameter;[B[BII)[B

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    array-length p2, p0

    .line 35
    invoke-static {p0, p1, v6, p5, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    .line 37
    .line 38
    return-object v6
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
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;->context:Lorg/spongycastle/crypto/tls/TlsContext;

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
    .locals 0

    add-int/lit8 p1, p1, -0x10

    return p1
.end method

.method public initRecordMAC(Lorg/spongycastle/crypto/engines/ChaChaEngine;ZJ)Lorg/spongycastle/crypto/params/KeyParameter;
    .locals 7

    .line 1
    const/16 p0, 0x8

    .line 2
    .line 3
    new-array p0, p0, [B

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p3, p4, p0, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint64(J[BI)V

    .line 7
    .line 8
    .line 9
    new-instance p3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 10
    .line 11
    const/4 p4, 0x0

    .line 12
    invoke-direct {p3, p4, p0}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2, p3}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 16
    .line 17
    .line 18
    const/16 v4, 0x40

    .line 19
    .line 20
    new-array v2, v4, [B

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    const/4 v6, 0x0

    .line 24
    move-object v5, v2

    .line 25
    move-object v1, p1

    .line 26
    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->processBytes([BII[BI)I

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x20

    .line 30
    .line 31
    const/16 p1, 0x10

    .line 32
    .line 33
    invoke-static {v2, v0, v2, p0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    new-instance p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 37
    .line 38
    invoke-direct {p2, v2, p1, p0}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->clamp([B)V

    .line 46
    .line 47
    .line 48
    return-object p2
.end method

.method public updateRecordMAC(Lorg/spongycastle/crypto/Mac;[BII)V
    .locals 2

    .line 1
    invoke-interface {p1, p2, p3, p4}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 2
    .line 3
    .line 4
    int-to-long p2, p4

    .line 5
    const-wide v0, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr p2, v0

    .line 11
    invoke-static {p2, p3}, Lorg/spongycastle/util/Pack;->longToLittleEndian(J)[B

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p2, 0x0

    .line 16
    array-length p3, p0

    .line 17
    invoke-interface {p1, p0, p2, p3}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

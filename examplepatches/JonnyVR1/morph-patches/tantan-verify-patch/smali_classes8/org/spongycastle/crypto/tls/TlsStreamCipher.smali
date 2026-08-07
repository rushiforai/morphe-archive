.class public Lorg/spongycastle/crypto/tls/TlsStreamCipher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsCipher;


# instance fields
.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected decryptCipher:Lorg/spongycastle/crypto/StreamCipher;

.field protected encryptCipher:Lorg/spongycastle/crypto/StreamCipher;

.field protected readMac:Lorg/spongycastle/crypto/tls/TlsMac;

.field protected usesNonce:Z

.field protected writeMac:Lorg/spongycastle/crypto/tls/TlsMac;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/StreamCipher;Lorg/spongycastle/crypto/StreamCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;IZ)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v6, p2

    .line 2
    .line 3
    move-object/from16 v7, p3

    .line 4
    .line 5
    move/from16 v8, p6

    .line 6
    .line 7
    move/from16 v9, p7

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    .line 13
    .line 14
    .line 15
    move-result v10

    .line 16
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 17
    .line 18
    iput-boolean v9, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->usesNonce:Z

    .line 19
    .line 20
    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->encryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 21
    .line 22
    iput-object v7, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->decryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 23
    .line 24
    mul-int/lit8 v0, v8, 0x2

    .line 25
    .line 26
    invoke-interface/range {p4 .. p4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    add-int/2addr v0, v2

    .line 31
    invoke-interface/range {p5 .. p5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    add-int v11, v0, v2

    .line 36
    .line 37
    invoke-static {p1, v11}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateKeyBlock(Lorg/spongycastle/crypto/tls/TlsContext;I)[B

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsMac;

    .line 42
    .line 43
    invoke-interface/range {p4 .. p4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    const/4 v4, 0x0

    .line 48
    move-object v1, p1

    .line 49
    move-object/from16 v2, p4

    .line 50
    .line 51
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsMac;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V

    .line 52
    .line 53
    .line 54
    move-object v12, v0

    .line 55
    invoke-interface/range {p4 .. p4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsMac;

    .line 60
    .line 61
    invoke-interface/range {p5 .. p5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    move-object/from16 v2, p5

    .line 66
    .line 67
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsMac;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V

    .line 68
    .line 69
    .line 70
    invoke-interface/range {p5 .. p5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    add-int/2addr v4, v1

    .line 75
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 76
    .line 77
    invoke-direct {v1, v3, v4, v8}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 78
    .line 79
    .line 80
    add-int/2addr v4, v8

    .line 81
    new-instance v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 82
    .line 83
    invoke-direct {v2, v3, v4, v8}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 84
    .line 85
    .line 86
    add-int/2addr v4, v8

    .line 87
    if-ne v4, v11, :cond_2

    .line 88
    .line 89
    if-eqz v10, :cond_0

    .line 90
    .line 91
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 92
    .line 93
    iput-object v12, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 94
    .line 95
    iput-object v7, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->encryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 96
    .line 97
    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->decryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 98
    .line 99
    move-object v13, v2

    .line 100
    move-object v2, v1

    .line 101
    move-object v1, v13

    .line 102
    goto :goto_0

    .line 103
    :cond_0
    iput-object v12, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 104
    .line 105
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 106
    .line 107
    iput-object v6, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->encryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 108
    .line 109
    iput-object v7, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->decryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 110
    .line 111
    :goto_0
    if-eqz v9, :cond_1

    .line 112
    .line 113
    const/16 v0, 0x8

    .line 114
    .line 115
    new-array v0, v0, [B

    .line 116
    .line 117
    new-instance v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 118
    .line 119
    invoke-direct {v3, v1, v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 120
    .line 121
    .line 122
    new-instance v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 123
    .line 124
    invoke-direct {v1, v2, v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 125
    .line 126
    .line 127
    move-object v2, v1

    .line 128
    move-object v1, v3

    .line 129
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->encryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 130
    .line 131
    const/4 v3, 0x1

    .line 132
    invoke-interface {v0, v3, v1}, Lorg/spongycastle/crypto/StreamCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->decryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 136
    .line 137
    const/4 v0, 0x0

    .line 138
    invoke-interface {p0, v0, v2}, Lorg/spongycastle/crypto/StreamCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_2
    const/16 p0, 0x50

    .line 143
    .line 144
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 145
    .line 146
    .line 147
    const/4 p0, 0x0

    .line 148
    throw p0
.end method


# virtual methods
.method public checkMAC(JS[BII[BII)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static/range {p4 .. p6}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 6
    .line 7
    move-wide v1, p1

    .line 8
    move v3, p3

    .line 9
    move-object v4, p7

    .line 10
    move v5, p8

    .line 11
    move/from16 v6, p9

    .line 12
    .line 13
    invoke-virtual/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p4, p0}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/16 p0, 0x14

    .line 25
    .line 26
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public decodeCiphertext(JS[BII)[B
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move/from16 v3, p6

    .line 2
    .line 3
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->usesNonce:Z

    .line 4
    .line 5
    const/4 v10, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->decryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v10, p1, p2}, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->updateIV(Lorg/spongycastle/crypto/StreamCipher;ZJ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 14
    .line 15
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lt v3, v0, :cond_1

    .line 20
    .line 21
    sub-int v6, v3, v0

    .line 22
    .line 23
    new-array v4, v3, [B

    .line 24
    .line 25
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->decryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    move-object v1, p4

    .line 29
    move/from16 v2, p5

    .line 30
    .line 31
    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/crypto/StreamCipher;->processBytes([BII[BI)I

    .line 32
    .line 33
    .line 34
    const/4 v8, 0x0

    .line 35
    move-object v7, v4

    .line 36
    move v9, v6

    .line 37
    move-object v0, p0

    .line 38
    move-wide v1, p1

    .line 39
    move v3, p3

    .line 40
    move v5, v6

    .line 41
    move/from16 v6, p6

    .line 42
    .line 43
    invoke-virtual/range {v0 .. v9}, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->checkMAC(JS[BII[BII)V

    .line 44
    .line 45
    .line 46
    invoke-static {v4, v10, v5}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    const/16 p0, 0x32

    .line 52
    .line 53
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method public encodePlaintext(JS[BII)[B
    .locals 12

    .line 1
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->usesNonce:Z

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->encryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {p0, v1, v2, p1, p2}, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->updateIV(Lorg/spongycastle/crypto/StreamCipher;ZJ)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 12
    .line 13
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int v1, p6, v1

    .line 18
    .line 19
    new-array v10, v1, [B

    .line 20
    .line 21
    iget-object v6, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->encryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 22
    .line 23
    const/4 v11, 0x0

    .line 24
    move-object/from16 v7, p4

    .line 25
    .line 26
    move/from16 v8, p5

    .line 27
    .line 28
    move/from16 v9, p6

    .line 29
    .line 30
    invoke-interface/range {v6 .. v11}, Lorg/spongycastle/crypto/StreamCipher;->processBytes([BII[BI)I

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 34
    .line 35
    move-wide v4, p1

    .line 36
    move v6, p3

    .line 37
    invoke-virtual/range {v3 .. v9}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->encryptCipher:Lorg/spongycastle/crypto/StreamCipher;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    array-length v3, v1

    .line 45
    move/from16 p5, p6

    .line 46
    .line 47
    move-object p0, v0

    .line 48
    move-object p1, v1

    .line 49
    move p2, v2

    .line 50
    move p3, v3

    .line 51
    move-object/from16 p4, v10

    .line 52
    .line 53
    invoke-interface/range {p0 .. p5}, Lorg/spongycastle/crypto/StreamCipher;->processBytes([BII[BI)I

    .line 54
    .line 55
    .line 56
    return-object v10
.end method

.method public getPlaintextLimit(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sub-int/2addr p1, p0

    .line 8
    return p1
.end method

.method public updateIV(Lorg/spongycastle/crypto/StreamCipher;ZJ)V
    .locals 1

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
    invoke-interface {p1, p2, p3}, Lorg/spongycastle/crypto/StreamCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

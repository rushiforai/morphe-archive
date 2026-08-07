.class public Lorg/spongycastle/crypto/tls/TlsMac;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected digestBlockSize:I

.field protected digestOverhead:I

.field protected mac:Lorg/spongycastle/crypto/Mac;

.field protected macLength:I

.field protected secret:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsMac;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 5
    .line 6
    new-instance v0, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 7
    .line 8
    invoke-direct {v0, p3, p4, p5}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-static {p3}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsMac;->secret:[B

    .line 20
    .line 21
    instance-of p3, p2, Lorg/spongycastle/crypto/digests/LongDigest;

    .line 22
    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    const/16 p3, 0x80

    .line 26
    .line 27
    iput p3, p0, Lorg/spongycastle/crypto/tls/TlsMac;->digestBlockSize:I

    .line 28
    .line 29
    const/16 p3, 0x10

    .line 30
    .line 31
    iput p3, p0, Lorg/spongycastle/crypto/tls/TlsMac;->digestOverhead:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/16 p3, 0x40

    .line 35
    .line 36
    iput p3, p0, Lorg/spongycastle/crypto/tls/TlsMac;->digestBlockSize:I

    .line 37
    .line 38
    const/16 p3, 0x8

    .line 39
    .line 40
    iput p3, p0, Lorg/spongycastle/crypto/tls/TlsMac;->digestOverhead:I

    .line 41
    .line 42
    :goto_0
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-eqz p3, :cond_1

    .line 47
    .line 48
    new-instance p3, Lorg/spongycastle/crypto/tls/SSL3Mac;

    .line 49
    .line 50
    invoke-direct {p3, p2}, Lorg/spongycastle/crypto/tls/SSL3Mac;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 51
    .line 52
    .line 53
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 54
    .line 55
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    const/16 p3, 0x14

    .line 60
    .line 61
    if-ne p2, p3, :cond_2

    .line 62
    .line 63
    const/4 p2, 0x4

    .line 64
    iput p2, p0, Lorg/spongycastle/crypto/tls/TlsMac;->digestOverhead:I

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    new-instance p3, Lorg/spongycastle/crypto/macs/HMac;

    .line 68
    .line 69
    invoke-direct {p3, p2}, Lorg/spongycastle/crypto/macs/HMac;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 70
    .line 71
    .line 72
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 73
    .line 74
    :cond_2
    :goto_1
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 75
    .line 76
    invoke-interface {p2, v0}, Lorg/spongycastle/crypto/Mac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 80
    .line 81
    invoke-interface {p2}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    iput p2, p0, Lorg/spongycastle/crypto/tls/TlsMac;->macLength:I

    .line 86
    .line 87
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-boolean p1, p1, Lorg/spongycastle/crypto/tls/SecurityParameters;->truncatedHMac:Z

    .line 92
    .line 93
    if-eqz p1, :cond_3

    .line 94
    .line 95
    iget p1, p0, Lorg/spongycastle/crypto/tls/TlsMac;->macLength:I

    .line 96
    .line 97
    const/16 p2, 0xa

    .line 98
    .line 99
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iput p1, p0, Lorg/spongycastle/crypto/tls/TlsMac;->macLength:I

    .line 104
    .line 105
    :cond_3
    return-void
.end method


# virtual methods
.method public calculateMac(JS[BII)[B
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsMac;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isSSL()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const/16 v2, 0xb

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/16 v2, 0xd

    .line 17
    .line 18
    :goto_0
    new-array v3, v2, [B

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-static {p1, p2, v3, v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint64(J[BI)V

    .line 22
    .line 23
    .line 24
    const/16 p1, 0x8

    .line 25
    .line 26
    invoke-static {p3, v3, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(S[BI)V

    .line 27
    .line 28
    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    const/16 p1, 0x9

    .line 32
    .line 33
    invoke-static {v0, v3, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;[BI)V

    .line 34
    .line 35
    .line 36
    :cond_1
    add-int/lit8 p1, v2, -0x2

    .line 37
    .line 38
    invoke-static {p6, v3, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 42
    .line 43
    invoke-interface {p1, v3, v4, v2}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 47
    .line 48
    invoke-interface {p1, p4, p5, p6}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 52
    .line 53
    invoke-interface {p1}, Lorg/spongycastle/crypto/Mac;->getMacSize()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    new-array p1, p1, [B

    .line 58
    .line 59
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 60
    .line 61
    invoke-interface {p2, p1, v4}, Lorg/spongycastle/crypto/Mac;->doFinal([BI)I

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/tls/TlsMac;->truncate([B)[B

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public calculateMacConstantTime(JS[BIII[B)[B
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/TlsMac;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 6
    .line 7
    invoke-static {p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const/16 p2, 0xb

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/16 p2, 0xd

    .line 17
    .line 18
    :goto_0
    add-int/2addr p7, p2

    .line 19
    invoke-virtual {p0, p7}, Lorg/spongycastle/crypto/tls/TlsMac;->getDigestBlockCount(I)I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    add-int/2addr p2, p6

    .line 24
    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/TlsMac;->getDigestBlockCount(I)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    sub-int/2addr p3, p2

    .line 29
    :goto_1
    add-int/lit8 p3, p3, -0x1

    .line 30
    .line 31
    iget-object p2, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 32
    .line 33
    const/4 p4, 0x0

    .line 34
    if-ltz p3, :cond_1

    .line 35
    .line 36
    iget p5, p0, Lorg/spongycastle/crypto/tls/TlsMac;->digestBlockSize:I

    .line 37
    .line 38
    invoke-interface {p2, p8, p4, p5}, Lorg/spongycastle/crypto/Mac;->update([BII)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    aget-byte p3, p8, p4

    .line 43
    .line 44
    invoke-interface {p2, p3}, Lorg/spongycastle/crypto/Mac;->update(B)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsMac;->mac:Lorg/spongycastle/crypto/Mac;

    .line 48
    .line 49
    invoke-interface {p0}, Lorg/spongycastle/crypto/Mac;->reset()V

    .line 50
    .line 51
    .line 52
    return-object p1
.end method

.method public getDigestBlockCount(I)I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/tls/TlsMac;->digestOverhead:I

    .line 2
    .line 3
    add-int/2addr p1, v0

    .line 4
    iget p0, p0, Lorg/spongycastle/crypto/tls/TlsMac;->digestBlockSize:I

    .line 5
    .line 6
    div-int/2addr p1, p0

    .line 7
    return p1
.end method

.method public getMACSecret()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsMac;->secret:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/TlsMac;->macLength:I

    .line 2
    .line 3
    return p0
.end method

.method public truncate([B)[B
    .locals 1

    .line 1
    array-length v0, p1

    .line 2
    iget p0, p0, Lorg/spongycastle/crypto/tls/TlsMac;->macLength:I

    .line 3
    .line 4
    if-gt v0, p0, :cond_0

    .line 5
    .line 6
    return-object p1

    .line 7
    :cond_0
    invoke-static {p1, p0}, Lorg/spongycastle/util/Arrays;->copyOf([BI)[B

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

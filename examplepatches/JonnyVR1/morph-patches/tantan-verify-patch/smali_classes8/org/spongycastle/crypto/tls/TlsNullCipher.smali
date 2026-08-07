.class public Lorg/spongycastle/crypto/tls/TlsNullCipher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsCipher;


# instance fields
.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected readMac:Lorg/spongycastle/crypto/tls/TlsMac;

.field protected writeMac:Lorg/spongycastle/crypto/tls/TlsMac;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;)V
    .locals 0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    const/4 p1, 0x0

    .line 100
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 101
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;)V
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
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    move v2, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v2, v0

    .line 11
    :goto_0
    if-nez p3, :cond_1

    .line 12
    .line 13
    move v0, v1

    .line 14
    :cond_1
    const/4 v1, 0x0

    .line 15
    const/16 v3, 0x50

    .line 16
    .line 17
    if-ne v2, v0, :cond_5

    .line 18
    .line 19
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 20
    .line 21
    if-eqz p2, :cond_3

    .line 22
    .line 23
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    add-int/2addr v0, v2

    .line 32
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateKeyBlock(Lorg/spongycastle/crypto/tls/TlsContext;I)[B

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    new-instance v4, Lorg/spongycastle/crypto/tls/TlsMac;

    .line 37
    .line 38
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    const/4 v8, 0x0

    .line 43
    move-object v5, p1

    .line 44
    move-object v6, p2

    .line 45
    invoke-direct/range {v4 .. v9}, Lorg/spongycastle/crypto/tls/TlsMac;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V

    .line 46
    .line 47
    .line 48
    move-object p1, v4

    .line 49
    invoke-interface {v6}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    new-instance v4, Lorg/spongycastle/crypto/tls/TlsMac;

    .line 54
    .line 55
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 56
    .line 57
    .line 58
    move-result v9

    .line 59
    move-object v6, p3

    .line 60
    invoke-direct/range {v4 .. v9}, Lorg/spongycastle/crypto/tls/TlsMac;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v6}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    add-int/2addr v8, p2

    .line 68
    if-ne v8, v0, :cond_2

    .line 69
    .line 70
    move-object v1, p1

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    invoke-static {v3}, Ll/f1j0;->a(I)V

    .line 73
    .line 74
    .line 75
    throw v1

    .line 76
    :cond_3
    move-object v5, p1

    .line 77
    move-object v4, v1

    .line 78
    :goto_1
    invoke-interface {v5}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_4

    .line 83
    .line 84
    iput-object v4, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 85
    .line 86
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 90
    .line 91
    iput-object v4, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 92
    .line 93
    return-void

    .line 94
    :cond_5
    invoke-static {v3}, Ll/f1j0;->a(I)V

    .line 95
    .line 96
    .line 97
    throw v1
.end method


# virtual methods
.method public decodeCiphertext(JS[BII)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    add-int/2addr p6, p5

    .line 6
    invoke-static {p4, p5, p6}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lt p6, v0, :cond_2

    .line 16
    .line 17
    sub-int v0, p6, v0

    .line 18
    .line 19
    add-int v1, p5, v0

    .line 20
    .line 21
    add-int/2addr p6, p5

    .line 22
    invoke-static {p4, v1, p6}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 27
    .line 28
    move p6, v0

    .line 29
    invoke-virtual/range {p0 .. p6}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v2, p0}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    invoke-static {p4, p5, v1}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    const/16 p0, 0x14

    .line 45
    .line 46
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0

    .line 51
    :cond_2
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
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    add-int/2addr p6, p5

    .line 6
    invoke-static {p4, p5, p6}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual/range {p0 .. p6}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    array-length p1, p0

    .line 16
    add-int/2addr p1, p6

    .line 17
    new-array p1, p1, [B

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-static {p4, p5, p1, p2, p6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    array-length p3, p0

    .line 24
    invoke-static {p0, p2, p1, p6, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    return-object p1
.end method

.method public getPlaintextLimit(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsNullCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr p1, p0

    .line 10
    :cond_0
    return p1
.end method

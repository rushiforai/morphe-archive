.class public Lorg/spongycastle/crypto/signers/PSSSigner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Signer;


# static fields
.field public static final TRAILER_IMPLICIT:B = -0x44t


# instance fields
.field private block:[B

.field private cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

.field private contentDigest:Lorg/spongycastle/crypto/Digest;

.field private emBits:I

.field private hLen:I

.field private mDash:[B

.field private mgfDigest:Lorg/spongycastle/crypto/Digest;

.field private mgfhLen:I

.field private random:Ljava/security/SecureRandom;

.field private sLen:I

.field private sSet:Z

.field private salt:[B

.field private trailer:B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;I)V
    .locals 1

    const/16 v0, -0x44

    .line 45
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/spongycastle/crypto/signers/PSSSigner;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;IB)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;IB)V
    .locals 6

    move-object v3, p2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    move v5, p4

    .line 44
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/signers/PSSSigner;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;IB)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;I)V
    .locals 6

    const/16 v5, -0x44

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 43
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/signers/PSSSigner;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;IB)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;IB)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 9
    .line 10
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 15
    .line 16
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfhLen:I

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sSet:Z

    .line 24
    .line 25
    iput p4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 26
    .line 27
    new-array p1, p4, [B

    .line 28
    .line 29
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->salt:[B

    .line 30
    .line 31
    add-int/lit8 p4, p4, 0x8

    .line 32
    .line 33
    iget p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 34
    .line 35
    add-int/2addr p4, p1

    .line 36
    new-array p1, p4, [B

    .line 37
    .line 38
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 39
    .line 40
    iput-byte p5, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->trailer:B

    .line 41
    .line 42
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;[B)V
    .locals 6

    const/16 v5, -0x44

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 47
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/signers/PSSSigner;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;[BB)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;[BB)V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 50
    iput-object p2, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 51
    iput-object p3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 52
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result p1

    iput p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 53
    invoke-interface {p3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result p1

    iput p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfhLen:I

    const/4 p1, 0x1

    .line 54
    iput-boolean p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sSet:Z

    .line 55
    array-length p1, p4

    iput p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 56
    iput-object p4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->salt:[B

    add-int/lit8 p1, p1, 0x8

    .line 57
    iget p2, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    add-int/2addr p1, p2

    new-array p1, p1, [B

    iput-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 58
    iput-byte p5, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->trailer:B

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;[B)V
    .locals 6

    const/16 v5, -0x44

    move-object v3, p2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    .line 46
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/signers/PSSSigner;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;[BB)V

    return-void
.end method

.method private ItoOSP(I[B)V
    .locals 1

    .line 1
    ushr-int/lit8 p0, p1, 0x18

    .line 2
    .line 3
    int-to-byte p0, p0

    .line 4
    const/4 v0, 0x0

    .line 5
    aput-byte p0, p2, v0

    .line 6
    .line 7
    ushr-int/lit8 p0, p1, 0x10

    .line 8
    .line 9
    int-to-byte p0, p0

    .line 10
    const/4 v0, 0x1

    .line 11
    aput-byte p0, p2, v0

    .line 12
    .line 13
    ushr-int/lit8 p0, p1, 0x8

    .line 14
    .line 15
    int-to-byte p0, p0

    .line 16
    const/4 v0, 0x2

    .line 17
    aput-byte p0, p2, v0

    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    int-to-byte p1, p1

    .line 21
    aput-byte p1, p2, p0

    .line 22
    .line 23
    return-void
.end method

.method private clearBlock([B)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    array-length v1, p1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    aput-byte p0, p1, v0

    .line 7
    .line 8
    add-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return-void
.end method

.method private maskGeneratorFunction1([BIII)[B
    .locals 8

    .line 1
    new-array v0, p4, [B

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfhLen:I

    .line 4
    .line 5
    new-array v1, v1, [B

    .line 6
    .line 7
    const/4 v2, 0x4

    .line 8
    new-array v3, v2, [B

    .line 9
    .line 10
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 11
    .line 12
    invoke-interface {v4}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 13
    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    move v5, v4

    .line 17
    :goto_0
    iget v6, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfhLen:I

    .line 18
    .line 19
    div-int v7, p4, v6

    .line 20
    .line 21
    if-ge v5, v7, :cond_0

    .line 22
    .line 23
    invoke-direct {p0, v5, v3}, Lorg/spongycastle/crypto/signers/PSSSigner;->ItoOSP(I[B)V

    .line 24
    .line 25
    .line 26
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 27
    .line 28
    invoke-interface {v6, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 29
    .line 30
    .line 31
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 32
    .line 33
    invoke-interface {v6, v3, v4, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 34
    .line 35
    .line 36
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 37
    .line 38
    invoke-interface {v6, v1, v4}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 39
    .line 40
    .line 41
    iget v6, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfhLen:I

    .line 42
    .line 43
    mul-int v7, v5, v6

    .line 44
    .line 45
    invoke-static {v1, v4, v0, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 46
    .line 47
    .line 48
    add-int/lit8 v5, v5, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    mul-int/2addr v6, v5

    .line 52
    if-ge v6, p4, :cond_1

    .line 53
    .line 54
    invoke-direct {p0, v5, v3}, Lorg/spongycastle/crypto/signers/PSSSigner;->ItoOSP(I[B)V

    .line 55
    .line 56
    .line 57
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 58
    .line 59
    invoke-interface {v6, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 63
    .line 64
    invoke-interface {p1, v3, v4, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfDigest:Lorg/spongycastle/crypto/Digest;

    .line 68
    .line 69
    invoke-interface {p1, v1, v4}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 70
    .line 71
    .line 72
    iget p0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mgfhLen:I

    .line 73
    .line 74
    mul-int p1, v5, p0

    .line 75
    .line 76
    mul-int/2addr v5, p0

    .line 77
    sub-int/2addr p4, v5

    .line 78
    invoke-static {v1, v4, v0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-object v0
.end method


# virtual methods
.method public generateSignature()[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;,
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    iget v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 7
    .line 8
    sub-int/2addr v2, v3

    .line 9
    iget v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 10
    .line 11
    sub-int/2addr v2, v3

    .line 12
    invoke-interface {v0, v1, v2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 13
    .line 14
    .line 15
    iget v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-boolean v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sSet:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->random:Ljava/security/SecureRandom;

    .line 25
    .line 26
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->salt:[B

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->salt:[B

    .line 32
    .line 33
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 34
    .line 35
    array-length v3, v2

    .line 36
    iget v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 37
    .line 38
    sub-int/2addr v3, v4

    .line 39
    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 43
    .line 44
    new-array v2, v0, [B

    .line 45
    .line 46
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 47
    .line 48
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 49
    .line 50
    array-length v5, v4

    .line 51
    invoke-interface {v3, v4, v1, v5}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 55
    .line 56
    invoke-interface {v3, v2, v1}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 57
    .line 58
    .line 59
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 60
    .line 61
    array-length v4, v3

    .line 62
    iget v5, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 63
    .line 64
    sub-int/2addr v4, v5

    .line 65
    const/4 v6, 0x1

    .line 66
    sub-int/2addr v4, v6

    .line 67
    iget v7, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 68
    .line 69
    sub-int/2addr v4, v7

    .line 70
    sub-int/2addr v4, v6

    .line 71
    aput-byte v6, v3, v4

    .line 72
    .line 73
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->salt:[B

    .line 74
    .line 75
    array-length v8, v3

    .line 76
    sub-int/2addr v8, v5

    .line 77
    sub-int/2addr v8, v7

    .line 78
    sub-int/2addr v8, v6

    .line 79
    invoke-static {v4, v1, v3, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    .line 81
    .line 82
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 83
    .line 84
    array-length v3, v3

    .line 85
    iget v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 86
    .line 87
    sub-int/2addr v3, v4

    .line 88
    sub-int/2addr v3, v6

    .line 89
    invoke-direct {p0, v2, v1, v0, v3}, Lorg/spongycastle/crypto/signers/PSSSigner;->maskGeneratorFunction1([BIII)[B

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    move v3, v1

    .line 94
    :goto_0
    array-length v4, v0

    .line 95
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 96
    .line 97
    if-eq v3, v4, :cond_2

    .line 98
    .line 99
    aget-byte v4, v5, v3

    .line 100
    .line 101
    aget-byte v7, v0, v3

    .line 102
    .line 103
    xor-int/2addr v4, v7

    .line 104
    int-to-byte v4, v4

    .line 105
    aput-byte v4, v5, v3

    .line 106
    .line 107
    add-int/lit8 v3, v3, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    aget-byte v0, v5, v1

    .line 111
    .line 112
    array-length v3, v5

    .line 113
    mul-int/lit8 v3, v3, 0x8

    .line 114
    .line 115
    iget v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->emBits:I

    .line 116
    .line 117
    sub-int/2addr v3, v4

    .line 118
    const/16 v4, 0xff

    .line 119
    .line 120
    shr-int v3, v4, v3

    .line 121
    .line 122
    and-int/2addr v0, v3

    .line 123
    int-to-byte v0, v0

    .line 124
    aput-byte v0, v5, v1

    .line 125
    .line 126
    array-length v0, v5

    .line 127
    iget v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 128
    .line 129
    sub-int/2addr v0, v3

    .line 130
    sub-int/2addr v0, v6

    .line 131
    invoke-static {v2, v1, v5, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 135
    .line 136
    array-length v2, v0

    .line 137
    sub-int/2addr v2, v6

    .line 138
    iget-byte v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->trailer:B

    .line 139
    .line 140
    aput-byte v3, v0, v2

    .line 141
    .line 142
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 143
    .line 144
    array-length v3, v0

    .line 145
    invoke-interface {v2, v0, v1, v3}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 150
    .line 151
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/PSSSigner;->clearBlock([B)V

    .line 152
    .line 153
    .line 154
    return-object v0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 2

    .line 1
    instance-of v0, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->random:Ljava/security/SecureRandom;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    if-eqz p1, :cond_1

    .line 20
    .line 21
    new-instance v0, Ljava/security/SecureRandom;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->random:Ljava/security/SecureRandom;

    .line 27
    .line 28
    :cond_1
    move-object v1, p2

    .line 29
    :goto_0
    instance-of v0, v1, Lorg/spongycastle/crypto/params/RSABlindingParameters;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    check-cast v1, Lorg/spongycastle/crypto/params/RSABlindingParameters;

    .line 34
    .line 35
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/RSABlindingParameters;->getPublicKey()Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 40
    .line 41
    invoke-interface {v1, p1, p2}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    move-object v0, v1

    .line 46
    check-cast v0, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 47
    .line 48
    iget-object p2, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 49
    .line 50
    invoke-interface {p2, p1, v1}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 51
    .line 52
    .line 53
    :goto_1
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/RSAKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    add-int/lit8 p2, p1, -0x1

    .line 62
    .line 63
    iput p2, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->emBits:I

    .line 64
    .line 65
    iget v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 66
    .line 67
    mul-int/lit8 v0, v0, 0x8

    .line 68
    .line 69
    iget v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 70
    .line 71
    mul-int/lit8 v1, v1, 0x8

    .line 72
    .line 73
    add-int/2addr v0, v1

    .line 74
    add-int/lit8 v0, v0, 0x9

    .line 75
    .line 76
    if-lt p2, v0, :cond_3

    .line 77
    .line 78
    add-int/lit8 p1, p1, 0x6

    .line 79
    .line 80
    div-int/lit8 p1, p1, 0x8

    .line 81
    .line 82
    new-array p1, p1, [B

    .line 83
    .line 84
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 85
    .line 86
    invoke-virtual {p0}, Lorg/spongycastle/crypto/signers/PSSSigner;->reset()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_3
    const-string p0, "key too small for specified hash and salt lengths"

    .line 91
    .line 92
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public update(B)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lorg/spongycastle/crypto/Digest;->update(B)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public update([BII)V
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {p0, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    return-void
.end method

.method public verifySignature([B)Z
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    iget v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 7
    .line 8
    sub-int/2addr v2, v3

    .line 9
    iget v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 10
    .line 11
    sub-int/2addr v2, v3

    .line 12
    invoke-interface {v0, v1, v2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :try_start_0
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 17
    .line 18
    array-length v2, p1

    .line 19
    invoke-interface {v1, p1, v0, v2}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 24
    .line 25
    array-length v2, v1

    .line 26
    array-length v3, p1

    .line 27
    sub-int/2addr v2, v3

    .line 28
    array-length v3, p1

    .line 29
    invoke-static {p1, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 33
    .line 34
    array-length v1, p1

    .line 35
    const/4 v2, 0x1

    .line 36
    sub-int/2addr v1, v2

    .line 37
    aget-byte v1, p1, v1

    .line 38
    .line 39
    iget-byte v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->trailer:B

    .line 40
    .line 41
    if-eq v1, v3, :cond_0

    .line 42
    .line 43
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/signers/PSSSigner;->clearBlock([B)V

    .line 44
    .line 45
    .line 46
    return v0

    .line 47
    :cond_0
    array-length v1, p1

    .line 48
    iget v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 49
    .line 50
    sub-int/2addr v1, v3

    .line 51
    sub-int/2addr v1, v2

    .line 52
    array-length v4, p1

    .line 53
    sub-int/2addr v4, v3

    .line 54
    sub-int/2addr v4, v2

    .line 55
    invoke-direct {p0, p1, v1, v3, v4}, Lorg/spongycastle/crypto/signers/PSSSigner;->maskGeneratorFunction1([BIII)[B

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    move v1, v0

    .line 60
    :goto_0
    array-length v3, p1

    .line 61
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 62
    .line 63
    if-eq v1, v3, :cond_1

    .line 64
    .line 65
    aget-byte v3, v4, v1

    .line 66
    .line 67
    aget-byte v5, p1, v1

    .line 68
    .line 69
    xor-int/2addr v3, v5

    .line 70
    int-to-byte v3, v3

    .line 71
    aput-byte v3, v4, v1

    .line 72
    .line 73
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    aget-byte p1, v4, v0

    .line 77
    .line 78
    array-length v1, v4

    .line 79
    mul-int/lit8 v1, v1, 0x8

    .line 80
    .line 81
    iget v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->emBits:I

    .line 82
    .line 83
    sub-int/2addr v1, v3

    .line 84
    const/16 v3, 0xff

    .line 85
    .line 86
    shr-int v1, v3, v1

    .line 87
    .line 88
    and-int/2addr p1, v1

    .line 89
    int-to-byte p1, p1

    .line 90
    aput-byte p1, v4, v0

    .line 91
    .line 92
    move p1, v0

    .line 93
    :goto_1
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 94
    .line 95
    array-length v3, v1

    .line 96
    iget v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 97
    .line 98
    sub-int/2addr v3, v4

    .line 99
    iget v5, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sLen:I

    .line 100
    .line 101
    sub-int/2addr v3, v5

    .line 102
    add-int/lit8 v3, v3, -0x2

    .line 103
    .line 104
    if-eq p1, v3, :cond_3

    .line 105
    .line 106
    aget-byte v3, v1, p1

    .line 107
    .line 108
    if-eqz v3, :cond_2

    .line 109
    .line 110
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/PSSSigner;->clearBlock([B)V

    .line 111
    .line 112
    .line 113
    return v0

    .line 114
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    array-length p1, v1

    .line 118
    sub-int/2addr p1, v4

    .line 119
    sub-int/2addr p1, v5

    .line 120
    add-int/lit8 p1, p1, -0x2

    .line 121
    .line 122
    aget-byte p1, v1, p1

    .line 123
    .line 124
    if-eq p1, v2, :cond_4

    .line 125
    .line 126
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/PSSSigner;->clearBlock([B)V

    .line 127
    .line 128
    .line 129
    return v0

    .line 130
    :cond_4
    iget-boolean p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->sSet:Z

    .line 131
    .line 132
    if-eqz p1, :cond_5

    .line 133
    .line 134
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->salt:[B

    .line 135
    .line 136
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 137
    .line 138
    array-length v3, v1

    .line 139
    sub-int/2addr v3, v5

    .line 140
    invoke-static {p1, v0, v1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_5
    array-length p1, v1

    .line 145
    sub-int/2addr p1, v5

    .line 146
    sub-int/2addr p1, v4

    .line 147
    sub-int/2addr p1, v2

    .line 148
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 149
    .line 150
    array-length v4, v3

    .line 151
    sub-int/2addr v4, v5

    .line 152
    invoke-static {v1, p1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 153
    .line 154
    .line 155
    :goto_2
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 156
    .line 157
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 158
    .line 159
    array-length v3, v1

    .line 160
    invoke-interface {p1, v1, v0, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->contentDigest:Lorg/spongycastle/crypto/Digest;

    .line 164
    .line 165
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 166
    .line 167
    array-length v3, v1

    .line 168
    iget v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 169
    .line 170
    sub-int/2addr v3, v4

    .line 171
    invoke-interface {p1, v1, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 175
    .line 176
    array-length p1, p1

    .line 177
    iget v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->hLen:I

    .line 178
    .line 179
    sub-int/2addr p1, v1

    .line 180
    sub-int/2addr p1, v2

    .line 181
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 182
    .line 183
    array-length v3, v3

    .line 184
    sub-int/2addr v3, v1

    .line 185
    :goto_3
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->mDash:[B

    .line 186
    .line 187
    array-length v4, v1

    .line 188
    if-eq v3, v4, :cond_7

    .line 189
    .line 190
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 191
    .line 192
    aget-byte v4, v4, p1

    .line 193
    .line 194
    aget-byte v5, v1, v3

    .line 195
    .line 196
    xor-int/2addr v4, v5

    .line 197
    if-eqz v4, :cond_6

    .line 198
    .line 199
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/PSSSigner;->clearBlock([B)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 203
    .line 204
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/signers/PSSSigner;->clearBlock([B)V

    .line 205
    .line 206
    .line 207
    return v0

    .line 208
    :cond_6
    add-int/lit8 p1, p1, 0x1

    .line 209
    .line 210
    add-int/lit8 v3, v3, 0x1

    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_7
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/PSSSigner;->clearBlock([B)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/PSSSigner;->block:[B

    .line 217
    .line 218
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/signers/PSSSigner;->clearBlock([B)V

    .line 219
    .line 220
    .line 221
    return v2

    .line 222
    :catch_0
    return v0
.end method

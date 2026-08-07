.class public Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/SignerWithRecovery;


# static fields
.field public static final TRAILER_IMPLICIT:I = 0xbc

.field public static final TRAILER_RIPEMD128:I = 0x32cc

.field public static final TRAILER_RIPEMD160:I = 0x31cc

.field public static final TRAILER_SHA1:I = 0x33cc

.field public static final TRAILER_SHA256:I = 0x34cc

.field public static final TRAILER_SHA384:I = 0x36cc

.field public static final TRAILER_SHA512:I = 0x35cc

.field public static final TRAILER_WHIRLPOOL:I = 0x37cc


# instance fields
.field private block:[B

.field private cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

.field private digest:Lorg/spongycastle/crypto/Digest;

.field private fullMessage:Z

.field private hLen:I

.field private keyBits:I

.field private mBuf:[B

.field private messageLength:I

.field private preBlock:[B

.field private preMStart:I

.field private preSig:[B

.field private preTLength:I

.field private random:Ljava/security/SecureRandom;

.field private recoveredMessage:[B

.field private saltLength:I

.field private standardSalt:[B

.field private trailer:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;I)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;-><init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;IZ)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/AsymmetricBlockCipher;Lorg/spongycastle/crypto/Digest;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 7
    .line 8
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

    .line 13
    .line 14
    iput p3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->saltLength:I

    .line 15
    .line 16
    if-eqz p4, :cond_0

    .line 17
    .line 18
    const/16 p1, 0xbc

    .line 19
    .line 20
    iput p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->trailer:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {p2}, Lorg/spongycastle/crypto/signers/ISOTrailers;->getTrailer(Lorg/spongycastle/crypto/Digest;)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->trailer:I

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const-string p0, "no valid trailer for digest: "

    .line 37
    .line 38
    invoke-interface {p2}, Lorg/spongycastle/crypto/Digest;->getAlgorithmName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p0, p1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    throw p0
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

.method private LtoOSP(J[B)V
    .locals 2

    .line 1
    const/16 p0, 0x38

    .line 2
    .line 3
    ushr-long v0, p1, p0

    .line 4
    .line 5
    long-to-int p0, v0

    .line 6
    int-to-byte p0, p0

    .line 7
    const/4 v0, 0x0

    .line 8
    aput-byte p0, p3, v0

    .line 9
    .line 10
    const/16 p0, 0x30

    .line 11
    .line 12
    ushr-long v0, p1, p0

    .line 13
    .line 14
    long-to-int p0, v0

    .line 15
    int-to-byte p0, p0

    .line 16
    const/4 v0, 0x1

    .line 17
    aput-byte p0, p3, v0

    .line 18
    .line 19
    const/16 p0, 0x28

    .line 20
    .line 21
    ushr-long v0, p1, p0

    .line 22
    .line 23
    long-to-int p0, v0

    .line 24
    int-to-byte p0, p0

    .line 25
    const/4 v0, 0x2

    .line 26
    aput-byte p0, p3, v0

    .line 27
    .line 28
    const/16 p0, 0x20

    .line 29
    .line 30
    ushr-long v0, p1, p0

    .line 31
    .line 32
    long-to-int p0, v0

    .line 33
    int-to-byte p0, p0

    .line 34
    const/4 v0, 0x3

    .line 35
    aput-byte p0, p3, v0

    .line 36
    .line 37
    const/16 p0, 0x18

    .line 38
    .line 39
    ushr-long v0, p1, p0

    .line 40
    .line 41
    long-to-int p0, v0

    .line 42
    int-to-byte p0, p0

    .line 43
    const/4 v0, 0x4

    .line 44
    aput-byte p0, p3, v0

    .line 45
    .line 46
    const/16 p0, 0x10

    .line 47
    .line 48
    ushr-long v0, p1, p0

    .line 49
    .line 50
    long-to-int p0, v0

    .line 51
    int-to-byte p0, p0

    .line 52
    const/4 v0, 0x5

    .line 53
    aput-byte p0, p3, v0

    .line 54
    .line 55
    const/16 p0, 0x8

    .line 56
    .line 57
    ushr-long v0, p1, p0

    .line 58
    .line 59
    long-to-int p0, v0

    .line 60
    int-to-byte p0, p0

    .line 61
    const/4 v0, 0x6

    .line 62
    aput-byte p0, p3, v0

    .line 63
    .line 64
    long-to-int p0, p1

    .line 65
    int-to-byte p0, p0

    .line 66
    const/4 p1, 0x7

    .line 67
    aput-byte p0, p3, p1

    .line 68
    .line 69
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

.method private isSameAs([B[B)Z
    .locals 4

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 2
    .line 3
    array-length v0, p2

    .line 4
    const/4 v1, 0x0

    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    move p0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x1

    .line 10
    :goto_0
    move v0, v1

    .line 11
    :goto_1
    array-length v2, p2

    .line 12
    if-eq v0, v2, :cond_2

    .line 13
    .line 14
    aget-byte v2, p1, v0

    .line 15
    .line 16
    aget-byte v3, p2, v0

    .line 17
    .line 18
    if-eq v2, v3, :cond_1

    .line 19
    .line 20
    move p0, v1

    .line 21
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_2
    return p0
.end method

.method private maskGeneratorFunction1([BIII)[B
    .locals 8

    .line 1
    new-array v0, p4, [B

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

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
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

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
    iget v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

    .line 18
    .line 19
    div-int v7, p4, v6

    .line 20
    .line 21
    if-ge v5, v7, :cond_0

    .line 22
    .line 23
    invoke-direct {p0, v5, v3}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->ItoOSP(I[B)V

    .line 24
    .line 25
    .line 26
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 27
    .line 28
    invoke-interface {v6, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 29
    .line 30
    .line 31
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 32
    .line 33
    invoke-interface {v6, v3, v4, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 34
    .line 35
    .line 36
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 37
    .line 38
    invoke-interface {v6, v1, v4}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 39
    .line 40
    .line 41
    iget v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

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
    invoke-direct {p0, v5, v3}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->ItoOSP(I[B)V

    .line 55
    .line 56
    .line 57
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 58
    .line 59
    invoke-interface {v6, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 63
    .line 64
    invoke-interface {p1, v3, v4, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 68
    .line 69
    invoke-interface {p1, v1, v4}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 70
    .line 71
    .line 72
    iget p0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

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
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/CryptoException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-array v1, v0, [B

    .line 8
    .line 9
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-interface {v2, v1, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 13
    .line 14
    .line 15
    const/16 v2, 0x8

    .line 16
    .line 17
    new-array v4, v2, [B

    .line 18
    .line 19
    iget v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 20
    .line 21
    mul-int/2addr v5, v2

    .line 22
    int-to-long v5, v5

    .line 23
    invoke-direct {p0, v5, v6, v4}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->LtoOSP(J[B)V

    .line 24
    .line 25
    .line 26
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 27
    .line 28
    invoke-interface {v5, v4, v3, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 32
    .line 33
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 34
    .line 35
    iget v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 36
    .line 37
    invoke-interface {v2, v4, v3, v5}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 41
    .line 42
    invoke-interface {v2, v1, v3, v0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->standardSalt:[B

    .line 46
    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->saltLength:I

    .line 51
    .line 52
    new-array v0, v0, [B

    .line 53
    .line 54
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->random:Ljava/security/SecureRandom;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 60
    .line 61
    array-length v2, v0

    .line 62
    invoke-interface {v1, v0, v3, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 66
    .line 67
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    new-array v2, v1, [B

    .line 72
    .line 73
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 74
    .line 75
    invoke-interface {v4, v2, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 76
    .line 77
    .line 78
    iget v4, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->trailer:I

    .line 79
    .line 80
    const/16 v5, 0xbc

    .line 81
    .line 82
    const/4 v6, 0x2

    .line 83
    const/4 v7, 0x1

    .line 84
    if-ne v4, v5, :cond_1

    .line 85
    .line 86
    move v4, v7

    .line 87
    goto :goto_1

    .line 88
    :cond_1
    move v4, v6

    .line 89
    :goto_1
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->block:[B

    .line 90
    .line 91
    array-length v9, v8

    .line 92
    iget v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 93
    .line 94
    sub-int/2addr v9, v10

    .line 95
    array-length v11, v0

    .line 96
    sub-int/2addr v9, v11

    .line 97
    iget v11, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

    .line 98
    .line 99
    sub-int/2addr v9, v11

    .line 100
    sub-int/2addr v9, v4

    .line 101
    add-int/lit8 v11, v9, -0x1

    .line 102
    .line 103
    aput-byte v7, v8, v11

    .line 104
    .line 105
    iget-object v11, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 106
    .line 107
    invoke-static {v11, v3, v8, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    .line 109
    .line 110
    iget-object v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->block:[B

    .line 111
    .line 112
    iget v10, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 113
    .line 114
    add-int/2addr v9, v10

    .line 115
    array-length v10, v0

    .line 116
    invoke-static {v0, v3, v8, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->block:[B

    .line 120
    .line 121
    array-length v0, v0

    .line 122
    iget v8, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

    .line 123
    .line 124
    sub-int/2addr v0, v8

    .line 125
    sub-int/2addr v0, v4

    .line 126
    invoke-direct {p0, v2, v3, v1, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->maskGeneratorFunction1([BIII)[B

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    move v1, v3

    .line 131
    :goto_2
    array-length v8, v0

    .line 132
    iget-object v9, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->block:[B

    .line 133
    .line 134
    if-eq v1, v8, :cond_2

    .line 135
    .line 136
    aget-byte v8, v9, v1

    .line 137
    .line 138
    aget-byte v10, v0, v1

    .line 139
    .line 140
    xor-int/2addr v8, v10

    .line 141
    int-to-byte v8, v8

    .line 142
    aput-byte v8, v9, v1

    .line 143
    .line 144
    add-int/lit8 v1, v1, 0x1

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_2
    array-length v0, v9

    .line 148
    iget v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

    .line 149
    .line 150
    sub-int/2addr v0, v1

    .line 151
    sub-int/2addr v0, v4

    .line 152
    invoke-static {v2, v3, v9, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 153
    .line 154
    .line 155
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->trailer:I

    .line 156
    .line 157
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->block:[B

    .line 158
    .line 159
    if-ne v0, v5, :cond_3

    .line 160
    .line 161
    array-length v0, v1

    .line 162
    sub-int/2addr v0, v7

    .line 163
    const/16 v2, -0x44

    .line 164
    .line 165
    aput-byte v2, v1, v0

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_3
    array-length v2, v1

    .line 169
    sub-int/2addr v2, v6

    .line 170
    ushr-int/lit8 v4, v0, 0x8

    .line 171
    .line 172
    int-to-byte v4, v4

    .line 173
    aput-byte v4, v1, v2

    .line 174
    .line 175
    array-length v2, v1

    .line 176
    sub-int/2addr v2, v7

    .line 177
    int-to-byte v0, v0

    .line 178
    aput-byte v0, v1, v2

    .line 179
    .line 180
    :goto_3
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->block:[B

    .line 181
    .line 182
    aget-byte v1, v0, v3

    .line 183
    .line 184
    and-int/lit8 v1, v1, 0x7f

    .line 185
    .line 186
    int-to-byte v1, v1

    .line 187
    aput-byte v1, v0, v3

    .line 188
    .line 189
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 190
    .line 191
    array-length v2, v0

    .line 192
    invoke-interface {v1, v0, v3, v2}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    iget v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 197
    .line 198
    new-array v2, v1, [B

    .line 199
    .line 200
    iput-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 201
    .line 202
    iget-object v4, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 203
    .line 204
    array-length v5, v4

    .line 205
    if-gt v1, v5, :cond_4

    .line 206
    .line 207
    goto :goto_4

    .line 208
    :cond_4
    move v7, v3

    .line 209
    :goto_4
    iput-boolean v7, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->fullMessage:Z

    .line 210
    .line 211
    array-length v1, v2

    .line 212
    invoke-static {v4, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 213
    .line 214
    .line 215
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 216
    .line 217
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 218
    .line 219
    .line 220
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->block:[B

    .line 221
    .line 222
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 223
    .line 224
    .line 225
    iput v3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 226
    .line 227
    return-object v0
.end method

.method public getRecoveredMessage()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public hasFullMessage()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->fullMessage:Z

    .line 2
    .line 3
    return p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->saltLength:I

    .line 2
    .line 3
    instance-of v1, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 8
    .line 9
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 14
    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iput-object p2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->random:Ljava/security/SecureRandom;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    instance-of v1, p2, Lorg/spongycastle/crypto/params/ParametersWithSalt;

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithSalt;

    .line 29
    .line 30
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithSalt;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v1, v0

    .line 35
    check-cast v1, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 36
    .line 37
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithSalt;->getSalt()[B

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    iput-object p2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->standardSalt:[B

    .line 42
    .line 43
    array-length v0, p2

    .line 44
    array-length p2, p2

    .line 45
    iget v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->saltLength:I

    .line 46
    .line 47
    if-ne p2, v2, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const-string p0, "Fixed salt is of wrong length"

    .line 51
    .line 52
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    move-object v1, p2

    .line 57
    check-cast v1, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    .line 58
    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    new-instance p2, Ljava/security/SecureRandom;

    .line 62
    .line 63
    invoke-direct {p2}, Ljava/security/SecureRandom;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->random:Ljava/security/SecureRandom;

    .line 67
    .line 68
    :cond_3
    :goto_0
    iget-object p2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 69
    .line 70
    invoke-interface {p2, p1, v1}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/RSAKeyParameters;->getModulus()Ljava/math/BigInteger;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iput p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->keyBits:I

    .line 82
    .line 83
    add-int/lit8 p1, p1, 0x7

    .line 84
    .line 85
    div-int/lit8 p1, p1, 0x8

    .line 86
    .line 87
    new-array p1, p1, [B

    .line 88
    .line 89
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->block:[B

    .line 90
    .line 91
    iget p2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->trailer:I

    .line 92
    .line 93
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 94
    .line 95
    const/16 v2, 0xbc

    .line 96
    .line 97
    if-ne p2, v2, :cond_4

    .line 98
    .line 99
    array-length p1, p1

    .line 100
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    sub-int/2addr p1, p2

    .line 105
    sub-int/2addr p1, v0

    .line 106
    add-int/lit8 p1, p1, -0x2

    .line 107
    .line 108
    new-array p1, p1, [B

    .line 109
    .line 110
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_4
    array-length p1, p1

    .line 114
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    sub-int/2addr p1, p2

    .line 119
    sub-int/2addr p1, v0

    .line 120
    add-int/lit8 p1, p1, -0x3

    .line 121
    .line 122
    new-array p1, p1, [B

    .line 123
    .line 124
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 125
    .line 126
    :goto_1
    invoke-virtual {p0}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->reset()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 8
    .line 9
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 25
    .line 26
    :cond_1
    iput-boolean v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->fullMessage:Z

    .line 27
    .line 28
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preSig:[B

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iput-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preSig:[B

    .line 33
    .line 34
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preBlock:[B

    .line 35
    .line 36
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preBlock:[B

    .line 40
    .line 41
    :cond_2
    return-void
.end method

.method public update(B)V
    .locals 3

    .line 32
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preSig:[B

    if-nez v0, :cond_0

    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    array-length v2, v1

    if-ge v0, v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    .line 33
    iput v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    aput-byte p1, v1, v0

    return-void

    .line 34
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {p0, p1}, Lorg/spongycastle/crypto/Digest;->update(B)V

    return-void
.end method

.method public update([BII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preSig:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :goto_0
    if-lez p3, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 8
    .line 9
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 10
    .line 11
    array-length v1, v1

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    aget-byte v0, p1, p2

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->update(B)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 p2, p2, 0x1

    .line 20
    .line 21
    add-int/lit8 p3, p3, -0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    if-lez p3, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 27
    .line 28
    invoke-interface {p0, p1, p2, p3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public updateWithRecoveredMessage([B)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->cipher:Lorg/spongycastle/crypto/AsymmetricBlockCipher;

    .line 2
    .line 3
    array-length v1, p1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-interface {v0, p1, v2, v1}, Lorg/spongycastle/crypto/AsymmetricBlockCipher;->processBlock([BII)[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    array-length v1, v0

    .line 10
    iget v3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->keyBits:I

    .line 11
    .line 12
    add-int/lit8 v4, v3, 0x7

    .line 13
    .line 14
    div-int/lit8 v4, v4, 0x8

    .line 15
    .line 16
    if-ge v1, v4, :cond_0

    .line 17
    .line 18
    add-int/lit8 v3, v3, 0x7

    .line 19
    .line 20
    div-int/lit8 v3, v3, 0x8

    .line 21
    .line 22
    new-array v1, v3, [B

    .line 23
    .line 24
    array-length v4, v0

    .line 25
    sub-int/2addr v3, v4

    .line 26
    array-length v4, v0

    .line 27
    invoke-static {v0, v2, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 31
    .line 32
    .line 33
    move-object v0, v1

    .line 34
    :cond_0
    array-length v1, v0

    .line 35
    const/4 v3, 0x1

    .line 36
    sub-int/2addr v1, v3

    .line 37
    aget-byte v1, v0, v1

    .line 38
    .line 39
    and-int/lit16 v1, v1, 0xff

    .line 40
    .line 41
    xor-int/lit16 v1, v1, 0xbc

    .line 42
    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    move v4, v3

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    array-length v1, v0

    .line 48
    const/4 v4, 0x2

    .line 49
    sub-int/2addr v1, v4

    .line 50
    aget-byte v1, v0, v1

    .line 51
    .line 52
    and-int/lit16 v1, v1, 0xff

    .line 53
    .line 54
    shl-int/lit8 v1, v1, 0x8

    .line 55
    .line 56
    array-length v5, v0

    .line 57
    sub-int/2addr v5, v3

    .line 58
    aget-byte v5, v0, v5

    .line 59
    .line 60
    and-int/lit16 v5, v5, 0xff

    .line 61
    .line 62
    or-int/2addr v1, v5

    .line 63
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 64
    .line 65
    invoke-static {v5}, Lorg/spongycastle/crypto/signers/ISOTrailers;->getTrailer(Lorg/spongycastle/crypto/Digest;)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    if-eqz v5, :cond_8

    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-ne v1, v5, :cond_7

    .line 76
    .line 77
    :goto_0
    iget v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

    .line 78
    .line 79
    new-array v1, v1, [B

    .line 80
    .line 81
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 82
    .line 83
    invoke-interface {v5, v1, v2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 84
    .line 85
    .line 86
    array-length v1, v0

    .line 87
    iget v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

    .line 88
    .line 89
    sub-int/2addr v1, v5

    .line 90
    sub-int/2addr v1, v4

    .line 91
    array-length v6, v0

    .line 92
    sub-int/2addr v6, v5

    .line 93
    sub-int/2addr v6, v4

    .line 94
    invoke-direct {p0, v0, v1, v5, v6}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->maskGeneratorFunction1([BIII)[B

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    move v5, v2

    .line 99
    :goto_1
    array-length v6, v1

    .line 100
    if-eq v5, v6, :cond_2

    .line 101
    .line 102
    aget-byte v6, v0, v5

    .line 103
    .line 104
    aget-byte v7, v1, v5

    .line 105
    .line 106
    xor-int/2addr v6, v7

    .line 107
    int-to-byte v6, v6

    .line 108
    aput-byte v6, v0, v5

    .line 109
    .line 110
    add-int/lit8 v5, v5, 0x1

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_2
    aget-byte v5, v0, v2

    .line 114
    .line 115
    and-int/lit8 v5, v5, 0x7f

    .line 116
    .line 117
    int-to-byte v5, v5

    .line 118
    aput-byte v5, v0, v2

    .line 119
    .line 120
    move v5, v2

    .line 121
    :goto_2
    array-length v6, v0

    .line 122
    if-eq v5, v6, :cond_4

    .line 123
    .line 124
    aget-byte v6, v0, v5

    .line 125
    .line 126
    if-ne v6, v3, :cond_3

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_4
    :goto_3
    add-int/2addr v5, v3

    .line 133
    array-length v6, v0

    .line 134
    if-lt v5, v6, :cond_5

    .line 135
    .line 136
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 137
    .line 138
    .line 139
    :cond_5
    if-le v5, v3, :cond_6

    .line 140
    .line 141
    goto :goto_4

    .line 142
    :cond_6
    move v3, v2

    .line 143
    :goto_4
    iput-boolean v3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->fullMessage:Z

    .line 144
    .line 145
    array-length v1, v1

    .line 146
    sub-int/2addr v1, v5

    .line 147
    iget v3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->saltLength:I

    .line 148
    .line 149
    sub-int/2addr v1, v3

    .line 150
    new-array v1, v1, [B

    .line 151
    .line 152
    iput-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 153
    .line 154
    array-length v3, v1

    .line 155
    invoke-static {v0, v5, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 159
    .line 160
    iget-object v3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 161
    .line 162
    array-length v6, v1

    .line 163
    invoke-static {v1, v2, v3, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 164
    .line 165
    .line 166
    iput-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preSig:[B

    .line 167
    .line 168
    iput-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preBlock:[B

    .line 169
    .line 170
    iput v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preMStart:I

    .line 171
    .line 172
    iput v4, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preTLength:I

    .line 173
    .line 174
    return-void

    .line 175
    :cond_7
    const-string p0, "signer initialised with wrong digest for trailer "

    .line 176
    .line 177
    invoke-static {p0, v1}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_8
    const-string p0, "unrecognised hash in signature"

    .line 182
    .line 183
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public verifySignature([B)Z
    .locals 9

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->hLen:I

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-interface {v2, v1, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preSig:[B

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->updateWithRecoveredMessage([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    return v3

    .line 20
    :cond_0
    invoke-static {v2, p1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_8

    .line 25
    .line 26
    :goto_0
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preBlock:[B

    .line 27
    .line 28
    iget v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preMStart:I

    .line 29
    .line 30
    iget v4, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preTLength:I

    .line 31
    .line 32
    const/4 v5, 0x0

    .line 33
    iput-object v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preSig:[B

    .line 34
    .line 35
    iput-object v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->preBlock:[B

    .line 36
    .line 37
    const/16 v5, 0x8

    .line 38
    .line 39
    new-array v6, v5, [B

    .line 40
    .line 41
    iget-object v7, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 42
    .line 43
    array-length v7, v7

    .line 44
    mul-int/2addr v7, v5

    .line 45
    int-to-long v7, v7

    .line 46
    invoke-direct {p0, v7, v8, v6}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->LtoOSP(J[B)V

    .line 47
    .line 48
    .line 49
    iget-object v7, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 50
    .line 51
    invoke-interface {v7, v6, v3, v5}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 52
    .line 53
    .line 54
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 55
    .line 56
    array-length v6, v5

    .line 57
    if-eqz v6, :cond_1

    .line 58
    .line 59
    iget-object v6, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 60
    .line 61
    array-length v7, v5

    .line 62
    invoke-interface {v6, v5, v3, v7}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object v5, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 66
    .line 67
    invoke-interface {v5, v1, v3, v0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->standardSalt:[B

    .line 71
    .line 72
    iget-object v1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 73
    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    array-length v2, v0

    .line 77
    invoke-interface {v1, v0, v3, v2}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 82
    .line 83
    array-length v0, v0

    .line 84
    add-int/2addr v2, v0

    .line 85
    iget v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->saltLength:I

    .line 86
    .line 87
    invoke-interface {v1, p1, v2, v0}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 88
    .line 89
    .line 90
    :goto_1
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 91
    .line 92
    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    new-array v1, v0, [B

    .line 97
    .line 98
    iget-object v2, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->digest:Lorg/spongycastle/crypto/Digest;

    .line 99
    .line 100
    invoke-interface {v2, v1, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 101
    .line 102
    .line 103
    array-length v2, p1

    .line 104
    sub-int/2addr v2, v4

    .line 105
    sub-int/2addr v2, v0

    .line 106
    const/4 v4, 0x1

    .line 107
    move v5, v3

    .line 108
    move v6, v4

    .line 109
    :goto_2
    if-eq v5, v0, :cond_4

    .line 110
    .line 111
    aget-byte v7, v1, v5

    .line 112
    .line 113
    add-int v8, v2, v5

    .line 114
    .line 115
    aget-byte v8, p1, v8

    .line 116
    .line 117
    if-eq v7, v8, :cond_3

    .line 118
    .line 119
    move v6, v3

    .line 120
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_4
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 124
    .line 125
    .line 126
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 127
    .line 128
    .line 129
    if-nez v6, :cond_5

    .line 130
    .line 131
    iput-boolean v3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->fullMessage:Z

    .line 132
    .line 133
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 134
    .line 135
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 136
    .line 137
    .line 138
    return v3

    .line 139
    :cond_5
    iget p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 140
    .line 141
    if-eqz p1, :cond_7

    .line 142
    .line 143
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 144
    .line 145
    iget-object v0, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->recoveredMessage:[B

    .line 146
    .line 147
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->isSameAs([B[B)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-nez p1, :cond_6

    .line 152
    .line 153
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 154
    .line 155
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 156
    .line 157
    .line 158
    return v3

    .line 159
    :cond_6
    iput v3, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->messageLength:I

    .line 160
    .line 161
    :cond_7
    iget-object p1, p0, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->mBuf:[B

    .line 162
    .line 163
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/signers/ISO9796d2PSSSigner;->clearBlock([B)V

    .line 164
    .line 165
    .line 166
    return v4

    .line 167
    :cond_8
    const-string p0, "updateWithRecoveredMessage called on different signature"

    .line 168
    .line 169
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    return v3
.end method

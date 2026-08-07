.class public Lorg/spongycastle/crypto/engines/DESedeWrapEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Wrapper;


# static fields
.field private static final IV2:[B


# instance fields
.field digest:[B

.field private engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

.field private forWrapping:Z

.field private iv:[B

.field private param:Lorg/spongycastle/crypto/params/KeyParameter;

.field private paramPlusIV:Lorg/spongycastle/crypto/params/ParametersWithIV;

.field sha1:Lorg/spongycastle/crypto/Digest;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->IV2:[B

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 1
        0x4at
        -0x23t
        -0x5et
        0x2ct
        0x79t
        -0x18t
        0x21t
        0x5t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA1Digest;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->sha1:Lorg/spongycastle/crypto/Digest;

    .line 10
    .line 11
    const/16 v0, 0x14

    .line 12
    .line 13
    new-array v0, v0, [B

    .line 14
    .line 15
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->digest:[B

    .line 16
    .line 17
    return-void
.end method

.method private calculateCMSKeyChecksum([B)[B
    .locals 5

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->sha1:Lorg/spongycastle/crypto/Digest;

    .line 6
    .line 7
    array-length v3, p1

    .line 8
    const/4 v4, 0x0

    .line 9
    invoke-interface {v2, p1, v4, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->sha1:Lorg/spongycastle/crypto/Digest;

    .line 13
    .line 14
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->digest:[B

    .line 15
    .line 16
    invoke-interface {p1, v2, v4}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->digest:[B

    .line 20
    .line 21
    invoke-static {p0, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    return-object v1
.end method

.method private checkCMSKeyChecksum([B[B)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->calculateCMSKeyChecksum([B)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p2}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private static reverse([B)[B
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    array-length v2, p0

    .line 6
    if-ge v1, v2, :cond_0

    .line 7
    .line 8
    array-length v2, p0

    .line 9
    add-int/lit8 v3, v1, 0x1

    .line 10
    .line 11
    sub-int/2addr v2, v3

    .line 12
    aget-byte v2, p0, v2

    .line 13
    .line 14
    aput-byte v2, v0, v1

    .line 15
    .line 16
    move v1, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DESede"

    .line 2
    .line 3
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->forWrapping:Z

    .line 2
    .line 3
    new-instance p1, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 4
    .line 5
    new-instance v0, Lorg/spongycastle/crypto/engines/DESedeEngine;

    .line 6
    .line 7
    invoke-direct {v0}, Lorg/spongycastle/crypto/engines/DESedeEngine;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p1, v0}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 14
    .line 15
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 20
    .line 21
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    move-object v2, p2

    .line 30
    move-object p2, p1

    .line 31
    move-object p1, v2

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance p1, Ljava/security/SecureRandom;

    .line 34
    .line 35
    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    .line 36
    .line 37
    .line 38
    :goto_0
    instance-of v0, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 39
    .line 40
    const/16 v1, 0x8

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 45
    .line 46
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 47
    .line 48
    iget-boolean p2, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->forWrapping:Z

    .line 49
    .line 50
    if-eqz p2, :cond_4

    .line 51
    .line 52
    new-array p2, v1, [B

    .line 53
    .line 54
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->iv:[B

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 60
    .line 61
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 62
    .line 63
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->iv:[B

    .line 64
    .line 65
    invoke-direct {p1, p2, v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->paramPlusIV:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 72
    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 76
    .line 77
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->paramPlusIV:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 78
    .line 79
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->iv:[B

    .line 84
    .line 85
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->paramPlusIV:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 86
    .line 87
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 92
    .line 93
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 94
    .line 95
    iget-boolean p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->forWrapping:Z

    .line 96
    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->iv:[B

    .line 100
    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    array-length p0, p0

    .line 104
    if-ne p0, v1, :cond_2

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    const-string p0, "IV is not 8 octets"

    .line 108
    .line 109
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_3
    const-string p0, "You should not supply an IV for unwrapping"

    .line 114
    .line 115
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_4
    :goto_1
    return-void
.end method

.method public unwrap([BII)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->forWrapping:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_5

    .line 5
    .line 6
    if-eqz p1, :cond_4

    .line 7
    .line 8
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 9
    .line 10
    invoke-virtual {v0}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    rem-int v2, p3, v0

    .line 15
    .line 16
    if-nez v2, :cond_3

    .line 17
    .line 18
    new-instance v2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 19
    .line 20
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 21
    .line 22
    sget-object v4, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->IV2:[B

    .line 23
    .line 24
    invoke-direct {v2, v3, v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-virtual {v3, v4, v2}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 31
    .line 32
    .line 33
    new-array v2, p3, [B

    .line 34
    .line 35
    move v3, v4

    .line 36
    :goto_0
    if-eq v3, p3, :cond_0

    .line 37
    .line 38
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 39
    .line 40
    add-int v6, p2, v3

    .line 41
    .line 42
    invoke-virtual {v5, p1, v6, v2, v3}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 43
    .line 44
    .line 45
    add-int/2addr v3, v0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {v2}, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->reverse([B)[B

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/16 p2, 0x8

    .line 52
    .line 53
    new-array p3, p2, [B

    .line 54
    .line 55
    iput-object p3, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->iv:[B

    .line 56
    .line 57
    array-length v2, p1

    .line 58
    add-int/lit8 v3, v2, -0x8

    .line 59
    .line 60
    new-array v5, v3, [B

    .line 61
    .line 62
    invoke-static {p1, v4, p3, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    array-length p3, p1

    .line 66
    sub-int/2addr p3, p2

    .line 67
    invoke-static {p1, p2, v5, v4, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 71
    .line 72
    iget-object p3, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 73
    .line 74
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->iv:[B

    .line 75
    .line 76
    invoke-direct {p1, p3, v6}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->paramPlusIV:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 80
    .line 81
    iget-object p3, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 82
    .line 83
    invoke-virtual {p3, v4, p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 84
    .line 85
    .line 86
    new-array p1, v3, [B

    .line 87
    .line 88
    move p3, v4

    .line 89
    :goto_1
    if-eq p3, v3, :cond_1

    .line 90
    .line 91
    iget-object v6, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 92
    .line 93
    invoke-virtual {v6, v5, p3, p1, p3}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 94
    .line 95
    .line 96
    add-int/2addr p3, v0

    .line 97
    goto :goto_1

    .line 98
    :cond_1
    add-int/lit8 v2, v2, -0x10

    .line 99
    .line 100
    new-array p3, v2, [B

    .line 101
    .line 102
    new-array v0, p2, [B

    .line 103
    .line 104
    invoke-static {p1, v4, p3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    .line 106
    .line 107
    invoke-static {p1, v2, v0, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    .line 109
    .line 110
    invoke-direct {p0, p3, v0}, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->checkCMSKeyChecksum([B[B)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_2

    .line 115
    .line 116
    return-object p3

    .line 117
    :cond_2
    const-string p0, "Checksum inside ciphertext is corrupted"

    .line 118
    .line 119
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-object v1

    .line 123
    :cond_3
    new-instance p0, Lorg/spongycastle/crypto/InvalidCipherTextException;

    .line 124
    .line 125
    new-instance p1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string p2, "Ciphertext not multiple of "

    .line 128
    .line 129
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    throw p0

    .line 143
    :cond_4
    const-string p0, "Null pointer as ciphertext"

    .line 144
    .line 145
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-object v1

    .line 149
    :cond_5
    const-string p0, "Not set for unwrapping"

    .line 150
    .line 151
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-object v1
.end method

.method public wrap([BII)[B
    .locals 5

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->forWrapping:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    new-array v0, p3, [B

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p1, p2, v0, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->calculateCMSKeyChecksum([B)[B

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    array-length p2, p1

    .line 17
    add-int/2addr p2, p3

    .line 18
    new-array v3, p2, [B

    .line 19
    .line 20
    invoke-static {v0, v2, v3, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    array-length v0, p1

    .line 24
    invoke-static {p1, v2, v3, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 28
    .line 29
    invoke-virtual {p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    rem-int p3, p2, p1

    .line 34
    .line 35
    if-nez p3, :cond_2

    .line 36
    .line 37
    iget-object p3, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 38
    .line 39
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->paramPlusIV:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-virtual {p3, v1, v0}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 43
    .line 44
    .line 45
    new-array p3, p2, [B

    .line 46
    .line 47
    move v0, v2

    .line 48
    :goto_0
    if-eq v0, p2, :cond_0

    .line 49
    .line 50
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 51
    .line 52
    invoke-virtual {v4, v3, v0, p3, v0}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 53
    .line 54
    .line 55
    add-int/2addr v0, p1

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->iv:[B

    .line 58
    .line 59
    array-length v3, v0

    .line 60
    add-int/2addr v3, p2

    .line 61
    new-array v3, v3, [B

    .line 62
    .line 63
    array-length v4, v0

    .line 64
    invoke-static {v0, v2, v3, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->iv:[B

    .line 68
    .line 69
    array-length v0, v0

    .line 70
    invoke-static {p3, v2, v3, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 71
    .line 72
    .line 73
    invoke-static {v3}, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->reverse([B)[B

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    new-instance p3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 78
    .line 79
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 80
    .line 81
    sget-object v3, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->IV2:[B

    .line 82
    .line 83
    invoke-direct {p3, v0, v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 87
    .line 88
    invoke-virtual {v0, v1, p3}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 89
    .line 90
    .line 91
    :goto_1
    array-length p3, p2

    .line 92
    if-eq v2, p3, :cond_1

    .line 93
    .line 94
    iget-object p3, p0, Lorg/spongycastle/crypto/engines/DESedeWrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 95
    .line 96
    invoke-virtual {p3, p2, v2, p2, v2}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 97
    .line 98
    .line 99
    add-int/2addr v2, p1

    .line 100
    goto :goto_1

    .line 101
    :cond_1
    return-object p2

    .line 102
    :cond_2
    const-string p0, "Not multiple of block length"

    .line 103
    .line 104
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-object v1

    .line 108
    :cond_3
    const-string p0, "Not initialized for wrapping"

    .line 109
    .line 110
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v1
.end method

.class public Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Wrapper;


# instance fields
.field private engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

.field private forWrapping:Z

.field private param:Lorg/spongycastle/crypto/params/ParametersWithIV;

.field private rand:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, "/RFC3211Wrap"

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->forWrapping:Z

    .line 2
    .line 3
    instance-of v0, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 8
    .line 9
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getRandom()Ljava/security/SecureRandom;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->rand:Ljava/security/SecureRandom;

    .line 14
    .line 15
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 20
    .line 21
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->param:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    if-eqz p1, :cond_1

    .line 25
    .line 26
    new-instance p1, Ljava/security/SecureRandom;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/security/SecureRandom;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->rand:Ljava/security/SecureRandom;

    .line 32
    .line 33
    :cond_1
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 34
    .line 35
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->param:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 36
    .line 37
    return-void
.end method

.method public unwrap([BII)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->forWrapping:Z

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 6
    .line 7
    invoke-virtual {v0}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v1, v0, 0x2

    .line 12
    .line 13
    if-lt p3, v1, :cond_5

    .line 14
    .line 15
    new-array v1, p3, [B

    .line 16
    .line 17
    new-array v2, v0, [B

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-static {p1, p2, v1, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, p2, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 27
    .line 28
    new-instance p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 29
    .line 30
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->param:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 31
    .line 32
    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-direct {p2, v4, v2}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v3, p2}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 40
    .line 41
    .line 42
    move p1, v0

    .line 43
    :goto_0
    if-ge p1, p3, :cond_0

    .line 44
    .line 45
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 46
    .line 47
    invoke-virtual {p2, v1, p1, v1, p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 48
    .line 49
    .line 50
    add-int/2addr p1, v0

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    sub-int p1, p3, v0

    .line 53
    .line 54
    invoke-static {v1, p1, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 58
    .line 59
    new-instance p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 60
    .line 61
    iget-object v4, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->param:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 62
    .line 63
    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-direct {p2, v4, v2}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v3, p2}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 74
    .line 75
    invoke-virtual {p1, v1, v3, v1, v3}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 79
    .line 80
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->param:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 81
    .line 82
    invoke-virtual {p1, v3, p2}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 83
    .line 84
    .line 85
    move p1, v3

    .line 86
    :goto_1
    if-ge p1, p3, :cond_1

    .line 87
    .line 88
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 89
    .line 90
    invoke-virtual {p2, v1, p1, v1, p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 91
    .line 92
    .line 93
    add-int/2addr p1, v0

    .line 94
    goto :goto_1

    .line 95
    :cond_1
    aget-byte p0, v1, v3

    .line 96
    .line 97
    and-int/lit16 p1, p0, 0xff

    .line 98
    .line 99
    const/4 p2, 0x4

    .line 100
    sub-int/2addr p3, p2

    .line 101
    if-gt p1, p3, :cond_4

    .line 102
    .line 103
    and-int/lit16 p1, p0, 0xff

    .line 104
    .line 105
    new-array p1, p1, [B

    .line 106
    .line 107
    invoke-static {v1, p2, p1, v3, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    .line 109
    .line 110
    move p0, v3

    .line 111
    :goto_2
    const/4 p2, 0x3

    .line 112
    if-eq v3, p2, :cond_2

    .line 113
    .line 114
    add-int/lit8 p2, v3, 0x1

    .line 115
    .line 116
    aget-byte p3, v1, p2

    .line 117
    .line 118
    not-int p3, p3

    .line 119
    int-to-byte p3, p3

    .line 120
    aget-byte v0, p1, v3

    .line 121
    .line 122
    xor-int/2addr p3, v0

    .line 123
    or-int/2addr p0, p3

    .line 124
    move v3, p2

    .line 125
    goto :goto_2

    .line 126
    :cond_2
    if-nez p0, :cond_3

    .line 127
    .line 128
    return-object p1

    .line 129
    :cond_3
    const-string p0, "wrapped key fails checksum"

    .line 130
    .line 131
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :goto_3
    const/4 p0, 0x0

    .line 135
    return-object p0

    .line 136
    :cond_4
    const-string p0, "wrapped key corrupted"

    .line 137
    .line 138
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    goto :goto_3

    .line 142
    :cond_5
    const-string p0, "input too short"

    .line 143
    .line 144
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_6
    const-string p0, "not set for unwrapping"

    .line 149
    .line 150
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    goto :goto_3
.end method

.method public wrap([BII)[B
    .locals 6

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->forWrapping:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 6
    .line 7
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->param:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {v0, v2, v1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 14
    .line 15
    invoke-virtual {v0}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->getBlockSize()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/lit8 v1, p3, 0x4

    .line 20
    .line 21
    mul-int/lit8 v3, v0, 0x2

    .line 22
    .line 23
    if-ge v1, v3, :cond_0

    .line 24
    .line 25
    new-array v3, v3, [B

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    rem-int v3, v1, v0

    .line 29
    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    move v3, v1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    div-int v3, v1, v0

    .line 35
    .line 36
    add-int/2addr v3, v2

    .line 37
    mul-int/2addr v3, v0

    .line 38
    :goto_0
    new-array v3, v3, [B

    .line 39
    .line 40
    :goto_1
    int-to-byte v4, p3

    .line 41
    const/4 v5, 0x0

    .line 42
    aput-byte v4, v3, v5

    .line 43
    .line 44
    aget-byte v4, p1, p2

    .line 45
    .line 46
    not-int v4, v4

    .line 47
    int-to-byte v4, v4

    .line 48
    aput-byte v4, v3, v2

    .line 49
    .line 50
    add-int/lit8 v2, p2, 0x1

    .line 51
    .line 52
    aget-byte v2, p1, v2

    .line 53
    .line 54
    not-int v2, v2

    .line 55
    int-to-byte v2, v2

    .line 56
    const/4 v4, 0x2

    .line 57
    aput-byte v2, v3, v4

    .line 58
    .line 59
    add-int/lit8 v2, p2, 0x2

    .line 60
    .line 61
    aget-byte v2, p1, v2

    .line 62
    .line 63
    not-int v2, v2

    .line 64
    int-to-byte v2, v2

    .line 65
    const/4 v4, 0x3

    .line 66
    aput-byte v2, v3, v4

    .line 67
    .line 68
    const/4 v2, 0x4

    .line 69
    invoke-static {p1, p2, v3, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    .line 71
    .line 72
    array-length p1, v3

    .line 73
    sub-int/2addr p1, v1

    .line 74
    new-array p2, p1, [B

    .line 75
    .line 76
    iget-object p3, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->rand:Ljava/security/SecureRandom;

    .line 77
    .line 78
    invoke-virtual {p3, p2}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 79
    .line 80
    .line 81
    invoke-static {p2, v5, v3, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 82
    .line 83
    .line 84
    move p1, v5

    .line 85
    :goto_2
    array-length p2, v3

    .line 86
    if-ge p1, p2, :cond_2

    .line 87
    .line 88
    iget-object p2, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 89
    .line 90
    invoke-virtual {p2, v3, p1, v3, p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 91
    .line 92
    .line 93
    add-int/2addr p1, v0

    .line 94
    goto :goto_2

    .line 95
    :cond_2
    :goto_3
    array-length p1, v3

    .line 96
    if-ge v5, p1, :cond_3

    .line 97
    .line 98
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3211WrapEngine;->engine:Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 99
    .line 100
    invoke-virtual {p1, v3, v5, v3, v5}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;->processBlock([BI[BI)I

    .line 101
    .line 102
    .line 103
    add-int/2addr v5, v0

    .line 104
    goto :goto_3

    .line 105
    :cond_3
    return-object v3

    .line 106
    :cond_4
    const-string p0, "not set for wrapping"

    .line 107
    .line 108
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const/4 p0, 0x0

    .line 112
    return-object p0
.end method

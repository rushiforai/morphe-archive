.class public Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Wrapper;


# instance fields
.field private engine:Lorg/spongycastle/crypto/BlockCipher;

.field private forWrapping:Z

.field private iv:[B

.field private param:Lorg/spongycastle/crypto/params/KeyParameter;

.field private wrapCipherMode:Z


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 1

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;-><init>(Lorg/spongycastle/crypto/BlockCipher;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 12
    .line 13
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 14
    .line 15
    xor-int/lit8 p1, p2, 0x1

    .line 16
    .line 17
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->wrapCipherMode:Z

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 1
        -0x5at
        -0x5at
        -0x5at
        -0x5at
        -0x5at
        -0x5at
        -0x5at
        -0x5at
    .end array-data
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->forWrapping:Z

    .line 2
    .line 3
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    .line 8
    .line 9
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    :cond_0
    instance-of p1, p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    check-cast p2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 18
    .line 19
    iput-object p2, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 23
    .line 24
    if-eqz p1, :cond_3

    .line 25
    .line 26
    check-cast p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 27
    .line 28
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 33
    .line 34
    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 39
    .line 40
    iput-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 41
    .line 42
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 43
    .line 44
    array-length p0, p0

    .line 45
    const/16 p1, 0x8

    .line 46
    .line 47
    if-ne p0, p1, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const-string p0, "IV not equal to 8"

    .line 51
    .line 52
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    :goto_0
    return-void
.end method

.method public unwrap([BII)[B
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->forWrapping:Z

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    div-int/lit8 v0, p3, 0x8

    .line 6
    .line 7
    mul-int/lit8 v1, v0, 0x8

    .line 8
    .line 9
    if-ne v1, p3, :cond_4

    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 12
    .line 13
    array-length v2, v1

    .line 14
    sub-int v2, p3, v2

    .line 15
    .line 16
    new-array v2, v2, [B

    .line 17
    .line 18
    array-length v3, v1

    .line 19
    new-array v3, v3, [B

    .line 20
    .line 21
    array-length v4, v1

    .line 22
    const/16 v5, 0x8

    .line 23
    .line 24
    add-int/2addr v4, v5

    .line 25
    new-array v4, v4, [B

    .line 26
    .line 27
    array-length v1, v1

    .line 28
    const/4 v6, 0x0

    .line 29
    invoke-static {p1, p2, v3, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 33
    .line 34
    array-length v7, v1

    .line 35
    add-int/2addr p2, v7

    .line 36
    array-length v1, v1

    .line 37
    sub-int/2addr p3, v1

    .line 38
    invoke-static {p1, p2, v2, v6, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 42
    .line 43
    iget-boolean p2, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->wrapCipherMode:Z

    .line 44
    .line 45
    const/4 p3, 0x1

    .line 46
    xor-int/2addr p2, p3

    .line 47
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 48
    .line 49
    invoke-interface {p1, p2, v1}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 50
    .line 51
    .line 52
    sub-int/2addr v0, p3

    .line 53
    const/4 p1, 0x5

    .line 54
    :goto_0
    if-ltz p1, :cond_2

    .line 55
    .line 56
    move p2, v0

    .line 57
    :goto_1
    if-lt p2, p3, :cond_1

    .line 58
    .line 59
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 60
    .line 61
    array-length v1, v1

    .line 62
    invoke-static {v3, v6, v4, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    add-int/lit8 v1, p2, -0x1

    .line 66
    .line 67
    mul-int/2addr v1, v5

    .line 68
    iget-object v7, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 69
    .line 70
    array-length v7, v7

    .line 71
    invoke-static {v2, v1, v4, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    .line 73
    .line 74
    mul-int v7, v0, p1

    .line 75
    .line 76
    add-int/2addr v7, p2

    .line 77
    move v8, p3

    .line 78
    :goto_2
    if-eqz v7, :cond_0

    .line 79
    .line 80
    int-to-byte v9, v7

    .line 81
    iget-object v10, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 82
    .line 83
    array-length v10, v10

    .line 84
    sub-int/2addr v10, v8

    .line 85
    aget-byte v11, v4, v10

    .line 86
    .line 87
    xor-int/2addr v9, v11

    .line 88
    int-to-byte v9, v9

    .line 89
    aput-byte v9, v4, v10

    .line 90
    .line 91
    ushr-int/lit8 v7, v7, 0x8

    .line 92
    .line 93
    add-int/2addr v8, p3

    .line 94
    goto :goto_2

    .line 95
    :cond_0
    iget-object v7, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 96
    .line 97
    invoke-interface {v7, v4, v6, v4, v6}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 98
    .line 99
    .line 100
    invoke-static {v4, v6, v3, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 101
    .line 102
    .line 103
    invoke-static {v4, v5, v2, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    .line 105
    .line 106
    add-int/lit8 p2, p2, -0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    add-int/lit8 p1, p1, -0x1

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    iget-object p0, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 113
    .line 114
    invoke-static {v3, p0}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-eqz p0, :cond_3

    .line 119
    .line 120
    return-object v2

    .line 121
    :cond_3
    const-string p0, "checksum failed"

    .line 122
    .line 123
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :goto_3
    const/4 p0, 0x0

    .line 127
    return-object p0

    .line 128
    :cond_4
    const-string p0, "unwrap data must be a multiple of 8 bytes"

    .line 129
    .line 130
    invoke-static {p0}, Ll/psl;->a(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_5
    const-string p0, "not set for unwrapping"

    .line 135
    .line 136
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    goto :goto_3
.end method

.method public wrap([BII)[B
    .locals 11

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->forWrapping:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    div-int/lit8 v0, p3, 0x8

    .line 6
    .line 7
    mul-int/lit8 v1, v0, 0x8

    .line 8
    .line 9
    if-ne v1, p3, :cond_3

    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 12
    .line 13
    array-length v2, v1

    .line 14
    add-int/2addr v2, p3

    .line 15
    new-array v2, v2, [B

    .line 16
    .line 17
    array-length v3, v1

    .line 18
    const/16 v4, 0x8

    .line 19
    .line 20
    add-int/2addr v3, v4

    .line 21
    new-array v3, v3, [B

    .line 22
    .line 23
    array-length v5, v1

    .line 24
    const/4 v6, 0x0

    .line 25
    invoke-static {v1, v6, v2, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 29
    .line 30
    array-length v1, v1

    .line 31
    invoke-static {p1, p2, v2, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 35
    .line 36
    iget-boolean p2, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->wrapCipherMode:Z

    .line 37
    .line 38
    iget-object p3, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->param:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 39
    .line 40
    invoke-interface {p1, p2, p3}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 41
    .line 42
    .line 43
    move p1, v6

    .line 44
    :goto_0
    const/4 p2, 0x6

    .line 45
    if-eq p1, p2, :cond_2

    .line 46
    .line 47
    const/4 p2, 0x1

    .line 48
    move p3, p2

    .line 49
    :goto_1
    if-gt p3, v0, :cond_1

    .line 50
    .line 51
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 52
    .line 53
    array-length v1, v1

    .line 54
    invoke-static {v2, v6, v3, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    mul-int/lit8 v1, p3, 0x8

    .line 58
    .line 59
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 60
    .line 61
    array-length v5, v5

    .line 62
    invoke-static {v2, v1, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    iget-object v5, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->engine:Lorg/spongycastle/crypto/BlockCipher;

    .line 66
    .line 67
    invoke-interface {v5, v3, v6, v3, v6}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 68
    .line 69
    .line 70
    mul-int v5, v0, p1

    .line 71
    .line 72
    add-int/2addr v5, p3

    .line 73
    move v7, p2

    .line 74
    :goto_2
    if-eqz v5, :cond_0

    .line 75
    .line 76
    int-to-byte v8, v5

    .line 77
    iget-object v9, p0, Lorg/spongycastle/crypto/engines/RFC3394WrapEngine;->iv:[B

    .line 78
    .line 79
    array-length v9, v9

    .line 80
    sub-int/2addr v9, v7

    .line 81
    aget-byte v10, v3, v9

    .line 82
    .line 83
    xor-int/2addr v8, v10

    .line 84
    int-to-byte v8, v8

    .line 85
    aput-byte v8, v3, v9

    .line 86
    .line 87
    ushr-int/lit8 v5, v5, 0x8

    .line 88
    .line 89
    add-int/2addr v7, p2

    .line 90
    goto :goto_2

    .line 91
    :cond_0
    invoke-static {v3, v6, v2, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    .line 93
    .line 94
    invoke-static {v3, v4, v2, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 95
    .line 96
    .line 97
    add-int/lit8 p3, p3, 0x1

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    return-object v2

    .line 104
    :cond_3
    const-string p0, "wrap data must be a multiple of 8 bytes"

    .line 105
    .line 106
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :goto_3
    const/4 p0, 0x0

    .line 110
    return-object p0

    .line 111
    :cond_4
    const-string p0, "not set for wrapping"

    .line 112
    .line 113
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    goto :goto_3
.end method

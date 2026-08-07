.class public Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# instance fields
.field private buf:[B

.field private bufOff:I

.field private cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private lastKey2:Lorg/spongycastle/crypto/params/KeyParameter;

.field private lastKey3:Lorg/spongycastle/crypto/params/KeyParameter;

.field private mac:[B

.field private macSize:I

.field private padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .locals 2

    .line 60
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;-><init>(Lorg/spongycastle/crypto/BlockCipher;ILorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;I)V
    .locals 1

    const/4 v0, 0x0

    .line 59
    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;-><init>(Lorg/spongycastle/crypto/BlockCipher;ILorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;ILorg/spongycastle/crypto/paddings/BlockCipherPadding;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    rem-int/lit8 v0, p2, 0x8

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    instance-of v0, p1, Lorg/spongycastle/crypto/engines/DESEngine;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 19
    .line 20
    iput-object p3, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    .line 21
    .line 22
    div-int/lit8 p2, p2, 0x8

    .line 23
    .line 24
    iput p2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->macSize:I

    .line 25
    .line 26
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    new-array p2, p2, [B

    .line 31
    .line 32
    iput-object p2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    .line 33
    .line 34
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    new-array p1, p1, [B

    .line 39
    .line 40
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput p1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    const-string p0, "cipher must be instance of DESEngine"

    .line 47
    .line 48
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw v1

    .line 52
    :cond_1
    const-string p0, "MAC size must be multiple of 8"

    .line 53
    .line 54
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw v1
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/paddings/BlockCipherPadding;)V
    .locals 1

    .line 58
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    mul-int/lit8 v0, v0, 0x8

    invoke-direct {p0, p1, v0, p2}, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;-><init>(Lorg/spongycastle/crypto/BlockCipher;ILorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    :goto_0
    iget v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 13
    .line 14
    if-ge v1, v0, :cond_2

    .line 15
    .line 16
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 17
    .line 18
    aput-byte v2, v3, v1

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    iput v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 26
    .line 27
    if-ne v1, v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 30
    .line 31
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 32
    .line 33
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    .line 34
    .line 35
    invoke-interface {v0, v1, v2, v3, v2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 36
    .line 37
    .line 38
    iput v2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 39
    .line 40
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->padding:Lorg/spongycastle/crypto/paddings/BlockCipherPadding;

    .line 41
    .line 42
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 43
    .line 44
    iget v3, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 45
    .line 46
    invoke-interface {v0, v1, v3}, Lorg/spongycastle/crypto/paddings/BlockCipherPadding;->addPadding([BI)I

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 50
    .line 51
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 52
    .line 53
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    .line 54
    .line 55
    invoke-interface {v0, v1, v2, v3, v2}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 56
    .line 57
    .line 58
    new-instance v0, Lorg/spongycastle/crypto/engines/DESEngine;

    .line 59
    .line 60
    invoke-direct {v0}, Lorg/spongycastle/crypto/engines/DESEngine;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->lastKey2:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 64
    .line 65
    invoke-virtual {v0, v2, v1}, Lorg/spongycastle/crypto/engines/DESEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2, v1, v2}, Lorg/spongycastle/crypto/engines/DESEngine;->processBlock([BI[BI)I

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->lastKey3:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 74
    .line 75
    const/4 v3, 0x1

    .line 76
    invoke-virtual {v0, v3, v1}, Lorg/spongycastle/crypto/engines/DESEngine;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    .line 80
    .line 81
    invoke-virtual {v0, v1, v2, v1, v2}, Lorg/spongycastle/crypto/engines/DESEngine;->processBlock([BI[BI)I

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    .line 85
    .line 86
    iget v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->macSize:I

    .line 87
    .line 88
    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->reset()V

    .line 92
    .line 93
    .line 94
    iget p0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->macSize:I

    .line 95
    .line 96
    return p0
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "ISO9797Alg3"

    .line 2
    .line 3
    return-object p0
.end method

.method public getMacSize()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->macSize:I

    .line 2
    .line 3
    return p0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->reset()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    instance-of v1, p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string p0, "params must be an instance of KeyParameter or ParametersWithIV"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 20
    .line 21
    move-object v0, p1

    .line 22
    check-cast v0, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_2
    move-object v0, p1

    .line 26
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 27
    .line 28
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 33
    .line 34
    :goto_1
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    array-length v1, v0

    .line 39
    const/4 v2, 0x0

    .line 40
    const/16 v3, 0x10

    .line 41
    .line 42
    const/16 v4, 0x8

    .line 43
    .line 44
    if-ne v1, v3, :cond_3

    .line 45
    .line 46
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 47
    .line 48
    invoke-direct {v1, v0, v2, v4}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 52
    .line 53
    invoke-direct {v2, v0, v4, v4}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->lastKey2:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 57
    .line 58
    iput-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->lastKey3:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    array-length v1, v0

    .line 62
    const/16 v5, 0x18

    .line 63
    .line 64
    if-ne v1, v5, :cond_5

    .line 65
    .line 66
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 67
    .line 68
    invoke-direct {v1, v0, v2, v4}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 72
    .line 73
    invoke-direct {v2, v0, v4, v4}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 74
    .line 75
    .line 76
    iput-object v2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->lastKey2:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 77
    .line 78
    new-instance v2, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 79
    .line 80
    invoke-direct {v2, v0, v3, v4}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 81
    .line 82
    .line 83
    iput-object v2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->lastKey3:Lorg/spongycastle/crypto/params/KeyParameter;

    .line 84
    .line 85
    :goto_2
    instance-of v0, p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 86
    .line 87
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 88
    .line 89
    const/4 v2, 0x1

    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    new-instance v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 93
    .line 94
    check-cast p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 95
    .line 96
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-direct {v0, v1, p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 101
    .line 102
    .line 103
    invoke-interface {p0, v2, v0}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_4
    invoke-interface {p0, v2, v1}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_5
    const-string p0, "Key must be either 112 or 168 bit long"

    .line 112
    .line 113
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_0

    .line 7
    .line 8
    aput-byte v0, v2, v1

    .line 9
    .line 10
    add-int/lit8 v1, v1, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iput v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 14
    .line 15
    iget-object p0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 16
    .line 17
    invoke-interface {p0}, Lorg/spongycastle/crypto/BlockCipher;->reset()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public update(B)V
    .locals 4

    .line 65
    iget v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    array-length v2, v1

    if-ne v0, v2, :cond_0

    .line 66
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3, v2, v3}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 67
    iput v3, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 68
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    iget v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    aput-byte p1, v0, v1

    return-void
.end method

.method public update([BII)V
    .locals 6

    .line 1
    if-ltz p3, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 4
    .line 5
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 10
    .line 11
    sub-int v2, v0, v1

    .line 12
    .line 13
    if-le p3, v2, :cond_0

    .line 14
    .line 15
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 16
    .line 17
    invoke-static {p1, p2, v3, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 21
    .line 22
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 23
    .line 24
    iget-object v4, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    invoke-interface {v1, v3, v5, v4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 28
    .line 29
    .line 30
    iput v5, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 31
    .line 32
    sub-int/2addr p3, v2

    .line 33
    add-int/2addr p2, v2

    .line 34
    :goto_0
    if-le p3, v0, :cond_0

    .line 35
    .line 36
    iget-object v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 37
    .line 38
    iget-object v2, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->mac:[B

    .line 39
    .line 40
    invoke-interface {v1, p1, p2, v2, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 41
    .line 42
    .line 43
    sub-int/2addr p3, v0

    .line 44
    add-int/2addr p2, v0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->buf:[B

    .line 47
    .line 48
    iget v1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 49
    .line 50
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    iget p1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 54
    .line 55
    add-int/2addr p1, p3

    .line 56
    iput p1, p0, Lorg/spongycastle/crypto/macs/ISO9797Alg3Mac;->bufOff:I

    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    const-string p0, "Can\'t have a negative input length!"

    .line 60
    .line 61
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method
